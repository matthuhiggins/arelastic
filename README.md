[![Build Status](https://travis-ci.org/matthuhiggins/arelastic.svg?branch=master)](https://travis-ci.org/matthuhiggins/arelastic) [![Code Climate](https://codeclimate.com/github/matthuhiggins/arelastic/badges/gpa.svg)](https://codeclimate.com/github/matthuhiggins/arelastic)
# Arelastic

Arelastic is a ElasticSearch AST manager for Ruby. It simplifies the generation complex of Elasticsearch queries.

It was extracted from my [Elastic Record](https://github.com/data-axle/elastic_record) project.

## Usage

### Search
```ruby
search = Arelastic::Builders::Search['name']

# Name equals red
search.eq('red').as_elastic
# => {"term"=>{"name"=>"red"}}

# Negation
search.eq("red").negate.as_elastic
# => {"bool"=>{"must_not"=>{"term"=>{:name=>"red"}}}}
```

### Limit & Offset
```ruby
# Limit
Arelastic::Searches::Size.new(20).as_elastic
# => {"size"=>20}

# Offset
Arelastic::Searches::From.new(20).as_elastic
# => {"from"=>20}
```

### Ordering
```ruby
sort_field = Arelastic::Sorts::Field.new('price' => 'asc')
sort_field.as_elastic
#  => {'price' => 'asc'}

sort = Arelastic::Searches::Sort.new([sort_field])
sort.as_elastic
# => {"sort"=>[{"price"=>"asc"}]}
```

### Putting It All Together
```ruby
search = [
 Arelastic::Searches::Query.new(Arelastic::Builders::Search['name'].eq('Fun')),
 Arelastic::Searches::Size.new(20),
 Arelastic::Searches::From.new(20),
 Arelastic::Searches::Sort.new([Arelastic::Sorts::Field.new('price' => 'asc')])
]
Arelastic::Nodes::HashGroup.new(search).as_elastic
# => {"query"=>{"term"=>{"name"=>"Fun"}}, "size"=>20, "from"=>20, "sort"=>[{"price"=>"asc"}]}
```

Some helpful Arel builders can be found [here](/lib/arelastic/builders/filter.rb).
