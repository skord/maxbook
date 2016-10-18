class Exporter
  module Helper
    module Gauge
      def gauge(metric_name, metric_desc, metric)
        ["# TYPE #{metric_name} gauge",
        "# HELP #{metric_name} #{metric_desc}",
        "#{metric_name} #{metric}"].join("\n")
      end
    end
  end
end
