# frozen_string_literal: true

module API
  module V1
    class UserProgressesController < API::V1::APIController
      def index
        user = User.find(params[:user_id])

        @user_progresses = user.user_progresses.includes(:lesson)

        render :index
      end

      def update
        @user_progress = UserProgress.find_or_initialize_by(
          user_id: params[:user_id],
          lesson_id: params[:lesson_id]
        )

        if @user_progress.update(user_progress_params)
          render :show
        else
          render json: { errors: @user_progress.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def user_progress_params
        params.require(:user_progress).permit(:completion_percent, :correct_answers, :total_questions)
      end
    end
  end
end

