# frozen_string_literal: true

json.progress @user_progresses do |progress|
  json.id progress.id
  json.lesson_id progress.lesson_id
  json.lesson_title progress.lesson.title
  json.lesson_level progress.lesson.level
  json.completion_percent progress.completion_percent
  json.correct_answers progress.correct_answers
  json.total_questions progress.total_questions
  json.score progress.calculate_score
  json.completed progress.completed?
  json.updated_at progress.updated_at
end

