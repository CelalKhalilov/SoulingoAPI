# frozen_string_literal: true

json.progress do
  json.id @user_progress.id
  json.user_id @user_progress.user_id
  json.lesson_id @user_progress.lesson_id
  json.completion_percent @user_progress.completion_percent
  json.correct_answers @user_progress.correct_answers
  json.total_questions @user_progress.total_questions
  json.score @user_progress.calculate_score
  json.completed @user_progress.completed?
  json.updated_at @user_progress.updated_at
end

