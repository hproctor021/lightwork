class ApplicationController < ActionController::API
    before_action :authorized

    def encode_token(payload)
      JWT.encode(payload, 's3cr3t')
    end
  

    def auth_header
      # { Authorization: 'Bearer <token>' }
      request.headers['Authorization']
    end
  

    def decoded_token
      if auth_header
        token = auth_header.split(' ')[1]
        # header: { 'Authorization': 'Bearer <token>' }
        begin
          JWT.decode(token, 's3cr3t', true, algorithm: 'HS256')
        rescue JWT::DecodeError
          nil
        end
      end
    end
  

    def current_user
      # Checks that the decoded_token method has provided us the authorized token
      if decoded_token
        user_id = decoded_token[0]['user_id']
        @user = User.find_by(id: user_id)
        return @user
      end
    end
  

    def logged_in?
      !!current_user
      # Checks to see that the user is logged in with logged_in_user
    end
  
    
    def authorized
      render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
      # the user is unauthorized to do any acitons UNTIL they are logged in
    end  
end
