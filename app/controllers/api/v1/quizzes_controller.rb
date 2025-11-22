# frozen_string_literal: true

module API
  module V1
    class QuizzesController < API::V1::APIController
      def index
        lesson = Lesson.find(params[:lesson_id])
        @quizzes = lesson.quizzes

        render :index
      end

      def submit
        quiz = Quiz.find(params[:id])

        answer_index = params[:answer_index].to_i
        is_correct = quiz.check_answer(answer_index)

        render json: {
          correct: is_correct,
          correct_index: quiz.correct_index,
          message: is_correct ? 'Correct answer!' : 'Wrong answer. Try again!'
        }
      end

      private

      def quiz_params
        params.require(:quiz).permit(:lesson_id, :question, :correct_index, options: [])
      end
    end
  end
end

