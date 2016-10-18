require 'sinatra'
require 'mysql2'
require_relative './lib/array'
require_relative './lib/exporter/helpers/counter'
require_relative './lib/exporter/helpers/gauge'
require_relative './lib/exporter/query_obj/event_times'
require_relative './lib/exporter/query_obj/variables'
require_relative './lib/exporter/query_obj/status'
require_relative './lib/exporter/decorator/event_times'

CLIENT = Mysql2::Client.new(host: ENV['MAXSCALE_HOST'],
                            username: ENV['MAXSCALE_USERNAME'],
                            port: ENV['MAXSCALE_PORT'],
                            password: ENV['MAXSCALE_PASSWORD'])


helpers Exporter::Helper::Counter, Exporter::Helper::Gauge

configure :production do
  $logger = Logger.new(STDOUT)
end



get '/metrics' do
  eventtimes = Exporter::QueryObj::EventTimes.new
  @executed = Exporter::Decorator::EventTimes.new('maxscale_events', eventtimes).executed
  @queued = Exporter::Decorator::EventTimes.new('maxscale_events', eventtimes).queued
  @variables = Exporter::QueryObj::Variables.new
  @status = Exporter::QueryObj::Status.new
  content_type 'text/plain'
  erb :metrics
end
