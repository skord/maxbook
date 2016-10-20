class Exporter
  module Decorator
    class Servers
      attr_accessor :query_obj
      def initialize(query_obj)
        @query_obj = query_obj
      end
      def to_gauges
        type_text = ["#TYPE maxscale_servers_connections gauge"]
        help_text = ["#HELP maxscale_servers_connections Server connections"]
        servers = @query_obj.query.to_a.collect {|server|
          %Q[maxscale_servers_connections{server="#{server["Server"]}", address="#{server["Address"]}", port="#{server["Port"]}"} #{server["Connections"].to_i}]
        }
        (type_text + help_text + servers).join("\n") + "\n"
      end
    end
  end
end
