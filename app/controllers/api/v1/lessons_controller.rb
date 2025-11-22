# frozen_string_literal: true

module API
  module V1
    class LessonsController < API::V1::APIController
      def index
        @lessons = Lesson.all
        @lessons = @lessons.by_level(params[:level]) if params[:level].present?
        @lessons = @lessons.recent

        render :index
      end

      def show
        @lesson = Lesson.find(params[:id])
        render :show
      end

      def create
        @lesson = Lesson.new(lesson_params)

        if @lesson.save
          render :show, status: :created
        else
          render json: { errors: @lesson.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        @lesson = Lesson.find(params[:id])

        if @lesson.update(lesson_params)
          render :show
        else
          render json: { errors: @lesson.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        @lesson = Lesson.find(params[:id])

        @lesson.destroy
        head :no_content
      end

      private

      def lesson_params
        params.require(:lesson).permit(:title, :description, :level, :lesson_type)
      end
    end
  end
end

