class Exporter
  module QueryObj
    class EventTimes
      attr_reader :query
      def initialize
        @query = CLIENT.query("show eventtimes").to_a
      end
      def executed
        q= @query.collect {|x| {le: x['Duration'].split.last.to_i / 1000.0, count: x["No. Events Executed"].to_i}}
        sum = 0
        q.map {|x| {le: x[:le], count: sum = x[:count] + sum}}
      end
      def executed_sum
        q= @query.collect {|x| {le: x['Duration'].split.last.to_i / 1000.0, count: x["No. Events Executed"].to_i}}
        q.collect {|x| x[:le] * x[:count]}.sum
      end
      def executed_count
        executed.last[:count]
      end
      def queued
        q = @query.collect {|x| {le: x['Duration'].split.last.to_i / 1000.0, count: x["No. Events Queued"].to_i}}
        sum = 0
        q.map {|x| {le: x[:le], count: sum = x[:count] + sum}}
      end
      def queued_sum
        q = @query.collect {|x| {le: x['Duration'].split.last.to_i / 1000.0, count: x["No. Events Queued"].to_i}}
        q.collect {|x| x[:le] * x[:count]}.sum
      end
      def queued_count
        queued.last[:count]
      end

    end
  end
end
