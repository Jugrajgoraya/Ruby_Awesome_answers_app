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

    has_many :likes
    has_many :liked_questions, through: :likes, source: :question

    # has_and_belongs_to_many(
    # :liked_questions,#for user table to add likes
    # class_name: 'Question',
    # join_table: 'likes',#for likes table to add user
    # association_foreign_key: 'question_id',
    # foreign_key: 'user_id'
    # )
    # Docs:
    # has_and_belongs_to_many(name, scope=nil, {options}, &extension)
    # the options are as follows:
    # :class_name -> the Model that the association points to
    # :join_table -> the join table used to create this association
    # :foreign_key -> on the join table, which foreign key points to this current model
    # :association_foreign_key -> on the join table, which foreign key points to the associated table

    has_many :questions
    # u = User.find(15)
    # u.questions -> because of the has_many relationship will return all the questions that belong to user
    has_many :answers
end
