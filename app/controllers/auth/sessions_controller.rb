module Auth
  class SessionsController < Knock::AuthTokenController
    def create
      resp = {
        id: @entity.id,
        role: @entity.role,
        email: @entity.email,
        jwt: auth_token.token,
        franchiseOwner: @entity.franchise_owner?
      }
      render json: resp, status: :created
    end

    private

    def auth_params
      params.permit(:email, :password)
    end

    def entity_name
      'User'
    end
  end
end
