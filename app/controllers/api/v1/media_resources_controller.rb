# frozen_string_literal: true

module API
  module V1
    class MediaResourcesController < API::V1::APIController
      def index
        lesson = Lesson.find(params[:lesson_id])
        @media_resources = lesson.media_resources

        render :index
      end

      def create
        @media_resource = MediaResource.new(media_resource_params)

        if @media_resource.save
          render :show, status: :created
        else
          render json: { errors: @media_resource.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def upload
        @media_resource = MediaResource.new(media_resource_params)

        if @media_resource.save
          render :show, status: :created
        else
          render json: { errors: @media_resource.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def media_resource_params
        params.require(:media_resource).permit(:lesson_id, :url, :media_type, :mime_type)
      end
    end
  end
end

