class Exporter
  module QueryObj
    class Servers
      attr_reader :query
      def initialize
        @query = CLIENT.query("show servers")
      end
    end
  end
end
