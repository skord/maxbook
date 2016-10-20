class Exporter
  module Decorator
    class Services
      attr_accessor :query_obj
      def initialize(query_obj)
        @query_obj = query_obj
      end
      def to_gauges
        type_text = ["#TYPE maxscale_services_sessions gauge"]
        help_text = ["#HELP maxscale_services_sessions Service Sessions"]
        services = @query_obj.query.to_a.collect {|service|
          %Q[maxscale_services_sessions{name="#{service["Service Name"]}", router="#{service["Router Module"]}"} #{service["No. Sessions"].to_i}]
        }
        (type_text + help_text + services).join("\n") + "\n"
      end
    end
  end
end
