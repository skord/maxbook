class Exporter
  module Decorator
    class EventTimes
      attr_accessor :query_obj, :metric_name
      def initialize(metric_name, query_obj)
        @metric_name = metric_name
        @query_obj = query_obj
      end
      def executed
        buckets = @query_obj.executed.collect {|x| %Q[#{@metric_name}_executed_seconds_bucket{le="#{x[:le]}"} #{x[:count]}]}
        inf = [%Q[#{@metric_name}_executed_seconds_bucket{le="+Inf"} #{@query_obj.executed_count}]]
        sum = [%Q[#{@metric_name}_executed_seconds_sum #{@query_obj.executed_sum}]]
        count = [%Q[#{@metric_name}_executed_seconds_count #{@query_obj.executed_count}]]
        (buckets + inf + sum + count).join("\n")
      end
      def queued
        buckets = @query_obj.queued.collect {|x| %Q[#{@metric_name}_queued_seconds_bucket{le="#{x[:le]}"} #{x[:count]}]}
        inf = [%Q[#{@metric_name}_queued_seconds_bucket{le="+Inf"} #{@query_obj.queued_count}]]
        sum = [%Q[#{@metric_name}_queued_seconds_sum #{@query_obj.queued_sum}]]
        count = [%Q[#{@metric_name}_queued_seconds_count #{@query_obj.queued_count}]]
        (buckets + inf + sum + count).join("\n")
      end
    end
  end
end
