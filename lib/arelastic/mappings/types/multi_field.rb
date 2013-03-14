module Arelastic
  module Mappings
    class MultiField < Arelastic::Mappings::Type
      for_type 'multi_field'
    end
  end
end
#   "name" : {
#     "type" : "multi_field",
#     "fields" : {
#         "name" : {"type" : "string", "index" : "analyzed"},
#         "untouched" : {"type" : "string", "index" : "not_analyzed"}
#     }
# }