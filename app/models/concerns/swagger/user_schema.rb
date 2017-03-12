module Swagger::UserSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :UserInput do
      key :required, [:name, :email]
      property :name do
        key :type, :string
      end
      property :email do
        key :type, :string
      end
    end

    swagger_schema :UserOutput do
      key :required, [:id, :name, :email]
      property :id do
        key :type, :integer
        key :format, :int64
      end
      property :name do
        key :type, :string
      end
      property :email do
        key :type, :string
      end
    end
  end
end
