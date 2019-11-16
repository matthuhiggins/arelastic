require 'arelastic/arities'
require 'arelastic/nodes'
require 'arelastic/aggregations'
require 'arelastic/queries'
require 'arelastic/mappings'
require 'arelastic/searches'
require 'arelastic/sorts'

require 'arelastic/builders'

module Arelastic
  class << self
    def queries
      Arelastic::Builders::Queries
    end

    def [](field)
      Arelastic::Builders::Queries[field]
    end

    def aggregations
      Arelastic::Builders::Aggregations
    end
  end
end
