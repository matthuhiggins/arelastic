SimpleCov.start 'test_frameworks' do
  enable_coverage :branch
  add_group "Aggregations", "lib/arelastic/aggregations"
  add_group "Arities", "lib/arelastic/arities"
  add_group "Builders", "lib/arelastic/builders"
  add_group "Mappings", "lib/arelastic/mappings"
  add_group "Nodes", "lib/arelastic/nodes"
  add_group "Queries", "lib/arelastic/queries"
  add_group "Searches", "lib/arelastic/searches"
  add_group "Sorts", "lib/arelastic/sorts"
end

SimpleCov.minimum_coverage line: 97.9, branch: 97.5
SimpleCov.minimum_coverage_by_file line: 71.4, branch: 92.8
