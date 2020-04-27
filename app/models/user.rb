class User < ApplicationRecord
    has_secure_password
    # Rails has authentication already built in. Calling this method within a model will initialize the authentication logic for the model
    # It does the following:
    # Provides authentication
    # Adds two attr_accessors :password & :password_confirmation
    # Adds a presence validation for :password
    # It will hash passwords automatically for us and store them in a column called password_digest
    # This method requires:
    # 1) the bcrypt library/gem
    # 2) a column in the table(model) called password_digest
end
