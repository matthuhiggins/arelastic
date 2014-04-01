module Arelastic
  module Filters
    class Script < Arelastic::Filters::Filter
      attr_reader :script, :options

      def initialize script, options = {}
        @script = script
        @options = options
      end

      def as_elastic
        params = {"script" => script}.update(options)
        {"script" => params}
      end
    end
  end
end