class Relation
  attr_accessor :filter_values, :query_values

  def initialize
    @filter_values = []
    @query_values = []
    @limit_value = nil
    @offset_value = nil
  end

  def query(*args)
    self.query_values += args.flatten
  end

  def query(*args)
    clone.query!(*args)
  end

  def filter!(*args)
    self.filter_values = args.flatten
  end

  def filter(*args)
    clone.filter!(*args)
  end

  def limit!(value)
    self.limit_value = value
    self
  end

  def limit(value)
    clone.limit!(value)
  end

  def offset!(value)
    self.offset_value = value
    self
  end

  def offset(value)
    clone.offset!(value)
  end

  def do_it
    build_filters filter_values
  end

  private
    def build_filters(filters)
      nodes = filters.grep(Arelastic::Filters::Filter)
      # arelastic.filter(Arelastic::Filters::And.new(nodes)) unless nodes.empty?

      (filters - nodes).each do |filter_hash|
        filter_hash.each do |field, terms|
          nodes << (terms.is_a?(Array) ? Arelastic::Filters::Terms : Arelastic::Filters::Term).new(field, terms)
        end
      end

      nodes
    end
end