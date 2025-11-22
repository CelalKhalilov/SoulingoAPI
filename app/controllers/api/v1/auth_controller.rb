# frozen_string_literal: true

module API
  module V1
    class AuthController < API::V1::APIController
      # Simple authentication without tokens
      
      def register
        @user = User.new(user_params)
        
        if @user.save
          render json: {
            data: {
              id: @user.id,
              email: @user.email,
              display_name: @user.display_name,
              level: @user.level,
              created_at: @user.created_at
            }
          }, status: :created
        else
          render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def login
        @user = User.find_by(email: params[:email])
        
        if @user&.valid_password?(params[:password])
          render json: {
            data: {
              id: @user.id,
              email: @user.email,
              display_name: @user.display_name,
              level: @user.level,
              created_at: @user.created_at
            }
          }
        else
          render json: { errors: ['Invalid email or password'] }, status: :unauthorized
        end
      end

      def logout
        render json: { message: 'Logged out successfully' }
      end

      private

      def user_params
        params.permit(:email, :password, :password_confirmation, :display_name, :level)
      end
    end
  end
end

