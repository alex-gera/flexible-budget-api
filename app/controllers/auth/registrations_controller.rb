module Auth
  class RegistrationsController < BaseController
    skip_before_action :authenticate_user
  
    def create
      register_ip(@user)
      if @user.save
        @user.set_new_token
        render 'registrations/show', status: :created
      else
        respond_with_errors(@user)
      end
    end
  
    private
  
    def register_ip(user)
      user.registration_ip =
        if Rails.env.staging? || Rails.env.production?
          request.remote_ip
        else
          Net::HTTP.get(URI.parse('http://checkip.amazonaws.com/')).squish
        end
    end
  end  
end
