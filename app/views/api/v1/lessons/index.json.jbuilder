# frozen_string_literal: true

json.lessons @lessons do |lesson|
  json.id lesson.id
  json.title lesson.title
  json.description lesson.description
  json.level lesson.level
  json.lesson_type lesson.lesson_type
  json.created_at lesson.created_at
  json.updated_at lesson.updated_at
end

