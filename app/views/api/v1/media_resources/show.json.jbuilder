# frozen_string_literal: true

json.media do
  json.id @media_resource.id
  json.lesson_id @media_resource.lesson_id
  json.url @media_resource.url
  json.media_type @media_resource.media_type
  json.mime_type @media_resource.mime_type
  json.created_at @media_resource.created_at
end

