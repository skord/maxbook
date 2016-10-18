class Exporter
  module Helper
    module Counter
      def counter(metric_name, metric_desc, metric)
        ["# TYPE #{metric_name} counter",
        "# HELP #{metric_name} #{metric_desc}",
        "#{metric_name} #{metric}"].join("\n")
      end
    end
  end
end
