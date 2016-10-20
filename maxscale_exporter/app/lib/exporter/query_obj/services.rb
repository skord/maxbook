class Exporter
  module QueryObj
    class Services
      attr_reader :query
      def initialize
        @query = CLIENT.query("show services")
      end
    end
  end
end
