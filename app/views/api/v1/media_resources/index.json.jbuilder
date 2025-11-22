# frozen_string_literal: true

json.media @media_resources do |media|
  json.id media.id
  json.url media.url
  json.media_type media.media_type
  json.mime_type media.mime_type
  json.created_at media.created_at
end

