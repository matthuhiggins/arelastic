require 'bundler/setup'
Bundler.require

relation = Arelastic::Relation.new
relation.query!('field' => {'name' => 'joe'})
relation.filter!(relation.index[:name].prefix("mat").or(relation.index[:color].in(['green', 'blue'])))
relation.filter!('status' => 'active')
relation.limit!(100)
relation.offset!(200)

p relation.as_elastic
