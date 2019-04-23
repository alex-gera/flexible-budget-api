module AuthInteractions
  class RegisterUser < BaseInteraction
    hash :params do
      string :email
      string :password
      string :password_confirmation
    end

    def execute
      # Create user
      ActiveRecord::Base.transaction do
        user = User.create(params)
        return errors_merge!(user.errors) unless user.valid?

        user
      end
    end
  end
end
