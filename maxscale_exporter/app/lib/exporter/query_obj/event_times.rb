class Exporter
  module QueryObj
    class EventTimes
      attr_reader :query
      def initialize
        @query = CLIENT.query("show eventtimes").to_a
      end
      def executed
        @query.collect {|x| {quantile: x['Duration'].split.last.to_i, count: x["No. Events Executed"].to_i}}
      end
      def executed_sum
        executed.collect {|x| x[:quantile] * x[:count]}.sum
      end
      def executed_count
        executed.collect {|x| x[:count]}.sum
      end
      def queued
        @query.collect {|x| {quantile: x['Duration'].split.last.to_i, count: x["No. Events Executed"].to_i}}
      end
      def queued_sum
        queued.collect {|x| x[:quantile] * x[:count]}.sum
      end
      def queued_count
        queued.collect {|x| x[:count]}.sum
      end
    end
  end
end
