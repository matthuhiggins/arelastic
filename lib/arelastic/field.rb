module Arelastic
  class Field < Struct.new :name
    
    def eq other
      Arelastic::Filters::Term.new name, other
    end

    def not_eq other
      Arelastic::Filters::Not.new Arelastic::Filters::Term.new name, other
    end

    def in other
      Arelastic::Filters::Terms.new name, other
    end

    def prefix other
      Arelastic::Filters::Prefix.new name, other
    end

    def exists
      Arelastic::Filters::Exists.new name
    end

    def missing(options = {})
      Arelastic::Filters::Missing.new name, options
    end

    def gteq other
      range 'gte' => other
    end

    def gt other
      range 'gt' => other
    end

    def lteq other
      range 'lte' => other
    end

    def lt other
      range 'lt' => other
    end

    private
      def range options
        Arelastic::Filters::Range.new name, options
      end
  end
end