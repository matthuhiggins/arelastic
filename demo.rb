require 'bundler/setup'
Bundler.require

relation = Arelastic::Relation.new
relation = relation.query('field' => {'name' => 'joe'})
        .filter(relation.index[:name].prefix("mat").or(relation.index[:color].in(['green', 'blue'])))
        .filter('status' => 'active')
        .limit(100)
        .offset!(200)

p relation.as_elastic
