module Swagger::ApiDocs
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_root do
      key :swagger, '2.0'
      info do
        key :version, '1.0.0'
        key :title, 'API Sample App'
        key :description, 'API Sample App'
        contact name: '@kymmt90'
        license name: 'MIT'
      end
      key :basePath, '/'
      key :consumes, ['application/json']
      key :produces, ['application/json']

      extend Swagger::Parameters
    end

    SWAGGERED_CLASSES = [
      User,
      UsersController,
      self
    ].freeze
  end

  def root_json
    Swagger::Blocks.build_root_json(SWAGGERED_CLASSES)
  end
end
