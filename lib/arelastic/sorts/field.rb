module Arelastic
  module Sorts
    class Field < Arelastic::Sorts::Sort
      attr_reader :field, :options

      # Field.new('price').as_elastic
      #  => 'price'
      #
      # Field.new('price' => 'asc').as_elastic
      #  => {'price' => 'asc'}
      #
      # Field.new('price', 'order' => 'asc').as_elastic
      #  => {'price' => {'order', 'asc'}}
      #
      # Field.new({'price' => 'asc'}, {'missing' => '_last'}).as_elastic
      #  => {'price' => {'order' => 'asc', 'missing' => '_last'}}
      #
      def initialize(field, extra_options = nil)
        if field.is_a?(Hash)
          @field, @options = field.first.to_a
          if extra_options
            @options = (@options.is_a?(Hash) ? @options : {'order' => @options}).update(extra_options)
          end
        else
          @field = field
          @options = extra_options
        end
      end

      def reverse
        reverse_order = ordering == 'desc' ? 'asc' : 'desc'

        if options.is_a?(Hash)
          Arelastic::Sorts::Field.new(field, options.merge('order' => reverse_order))
        else
          Arelastic::Sorts::Field.new(field => reverse_order)
        end
      end

      def ordering
        (options.is_a?(Hash) ? options['order'] : options).to_s
      end

      def as_elastic
        if options
          {field => options}
        else
          field
        end
      end
    end
  end
end
