class Exporter
  module QueryObj
    class Status
      attr_reader :query
      def initialize
        @query = CLIENT.query("show variables")
      end

      def find_by_method_name
        find(__callee__.to_s.capitalize)
      end

      alias uptime find_by_method_name
      alias uptime_since_flush_status find_by_method_name
      alias threads_created find_by_method_name
      alias threads_running find_by_method_name
      alias threadpool_threads find_by_method_name
      alias threads_connected find_by_method_name
      alias connections find_by_method_name
      alias client_connections find_by_method_name
      alias backend_connections find_by_method_name
      alias listeners find_by_method_name
      alias zombie_connections find_by_method_name
      alias internal_descriptors find_by_method_name
      alias read_events find_by_method_name
      alias write_events find_by_method_name
      alias hangup_events find_by_method_name
      alias error_events find_by_method_name
      alias accept_events find_by_method_name
      alias event_queue_length find_by_method_name
      alias pending_events find_by_method_name
      alias max_event_queue_length find_by_method_name
      alias max_event_queue_time find_by_method_name
      alias max_event_execution_time find_by_method_name

      protected
      def find(key)
        CLIENT.query("show status").select {|x| x["Variable_name"] == key}.first["Value"].to_i
      end
    end
  end
end
