class Relation
  attr_accessor :query_values,
                :filter_values,
                :limit_value,
                :offset_value,
                :facet_values

  def initialize
    @filter_values = []
    @query_values = []
    @limit_value = nil
    @offset_value = nil
  end

  def query!(*args)
    self.query_values += args.flatten
  end

  def query(*args)
    clone.query!(*args)
  end

  def filter!(*args)
    self.filter_values += args.flatten
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

  def facet!(*args)
    self.facet_values = args.flatten
  end

  def facet(*args)
    clone.facet!(*args)
  end

  def build_query
    # build_facets facet_values
    build_filters filter_values
  end

  private
    def build_facets(facets)
      nodes = []
      facets.each do |yay|
        nodes << 'x'
      end

      Arelastic::Searches::Facets.new(nodes) unless nodes.empty?
    end

    def build_filters(filters)
      nodes = filters.grep(Arelastic::Filters::Filter)

      (filters - nodes).each do |filter_hash|
        filter_hash.each do |field, terms|
          nodes << (terms.is_a?(Array) ? Arelastic::Filters::Terms : Arelastic::Filters::Term).new(field, terms)
        end
      end

      Arelastic::Filters::And.new(nodes) unless nodes.empty?
    end
end

require 'helper'

class Arelastic::RelatonTest < MiniTest::Spec
  def test_relation
    relation = Relation.new
    relation.filter!('foo' => 'bar')
    relation.filter!('faz' => ['baz', 'fum'])
    
    expected = {"and"=>[{"term"=>{"foo"=>"bar"}}, {"terms"=>{"faz"=>["baz", "fum"]}}]}
    assert_equal expected, relation.build_query.as_elastic
  end
end