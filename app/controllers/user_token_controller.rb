class UserTokenController < Knock::AuthTokenController
  skip_before_action :verify_authenticity_token

  def create
    response = {
      id: @entity.id,
      email: @entity.email,
      jwt: auth_token.token
    }
    render json: response, status: :created
  end

  private

  def auth_params
    params.permit(:email, :password)
  end

  def entity_name
    'User'
  end
end
