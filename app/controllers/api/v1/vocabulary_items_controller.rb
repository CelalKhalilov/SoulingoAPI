# frozen_string_literal: true

module API
  module V1
    class VocabularyItemsController < API::V1::APIController
      def index
        lesson = Lesson.find(params[:lesson_id])
        @vocabulary_items = lesson.vocabulary_items

        render :index
      end

      def create
        @vocabulary_item = VocabularyItem.new(vocabulary_item_params)

        if @vocabulary_item.save
          render :show, status: :created
        else
          render json: { errors: @vocabulary_item.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def vocabulary_item_params
        params.require(:vocabulary_item).permit(:lesson_id, :word, :meaning, :example_sentence, :part_of_speech)
      end
    end
  end
end

