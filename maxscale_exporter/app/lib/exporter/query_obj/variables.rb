class Exporter
  module QueryObj
    class Variables
      attr_reader :query
      def initialize
        @query = CLIENT.query("show variables")
      end

      def maxscale_threads
        find("MAXSCALE_THREADS") #config
      end

      def maxscale_nbpolls
        find("MAXSCALE_NBPOLLS") #config
      end

      def maxscale_pollsleep
        find("MAXSCALE_POLLSLEEP") #config
      end

      def maxscale_uptime
        find("MAXSCALE_UPTIME") #counter
      end

      def maxscale_sessions
        find("MAXSCALE_SESSIONS") #gauge
      end

      protected
      def find(key)
        @query.select {|x| x["Variable_name"] == key}.first["Value"].to_i
      end
    end
  end
end
