module Arelastic
  module Mappings
    class Object < Arelastic::Mappings::Type
      for_type 'object'
    end
  end
end
# {
#     "tweet" : {
#         "properties" : {
#             "person" : {
#                 "type" : "object",
#                 "properties" : {
#                     "name" : {
#                         "properties" : {
#                             "first_name" : {"type" : "string"},
#                             "last_name" : {"type" : "string"}
#                         }
#                     },
#                     "sid" : {"type" : "string", "index" : "not_analyzed"}
#                 }
#             }
#             "message" : {"type" : "string"}
#         }
#     }
# }