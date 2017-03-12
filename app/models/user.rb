class User < ApplicationRecord
  include Swagger::UserSchema
end
