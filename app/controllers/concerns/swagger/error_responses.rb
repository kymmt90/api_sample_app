module Swagger::ErrorResponses
  module InvalidParameterError
    def self.extended(base)
      base.response 400 do
        key :description, 'Invalid parameters'
        schema do
          key :'$ref', :ErrorOutput
        end
      end
    end
  end

  module NotFoundError
    def self.extended(base)
      base.response 404 do
        key :description, 'Resource not found'
        schema do
          key :'$ref', :ErrorOutput
        end
      end
    end
  end
end
