module Swagger::UsersApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    include Swagger::ErrorSchema

    swagger_path '/users' do
      operation :get do
        key :description, 'Get all users'
        key :operationId, :get_all_user

        response 200 do
          key :description, 'All users'
          schema type: :array do
            items do
              key :'$ref', :UserOutput
            end
          end
        end
      end

      operation :post do
        key :description, 'Creates a user'
        key :operationId, :create_user

        parameter :user

        response 201 do
          key :description, 'Created user'
          schema do
            key :'$ref', :UserOutput
          end
        end

        extend Swagger::ErrorResponses::InvalidParameterError

      end
    end

    swagger_path '/users/{id}' do
      parameter :user_id do
        key :name, :id
      end

      operation :get do
        key :description, 'Finds the specified user'
        key :operationId, :find_user_by_id

        response 200 do
          key :description, 'User specified by its ID'
          schema do
            key :'$ref', :UserOutput
          end
        end

        extend Swagger::ErrorResponses::NotFoundError
      end

      operation :patch do
        key :description, 'Updates the user'
        key :operationId, :update_user

        parameter :user

        response 200 do
          key :description, 'Updated user'
          schema do
            key :'$ref', :UserOutput
          end
        end

        extend Swagger::ErrorResponses::InvalidParameterError
        extend Swagger::ErrorResponses::NotFoundError
      end

      operation :delete do
        key :description, 'Deletes the user'
        key :operationId, :delete_user

        response 204 do
          key :description, 'The user was deleted'
        end

        extend Swagger::ErrorResponses::NotFoundError
      end
    end
  end
end
