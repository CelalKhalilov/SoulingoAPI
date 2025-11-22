# frozen_string_literal: true

json.quizzes @quizzes do |quiz|
  json.id quiz.id
  json.question quiz.question
  json.options quiz.options
  # Don't expose correct_index for security
end

