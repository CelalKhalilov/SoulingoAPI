# frozen_string_literal: true

json.lesson do
  json.id @lesson.id
  json.title @lesson.title
  json.description @lesson.description
  json.level @lesson.level
  json.lesson_type @lesson.lesson_type
  json.created_at @lesson.created_at
  json.updated_at @lesson.updated_at

  json.media @lesson.media_resources do |media|
    json.id media.id
    json.url media.url
    json.media_type media.media_type
    json.mime_type media.mime_type
  end

  json.vocabulary @lesson.vocabulary_items do |vocab|
    json.id vocab.id
    json.word vocab.word
    json.meaning vocab.meaning
    json.example_sentence vocab.example_sentence
    json.part_of_speech vocab.part_of_speech
  end

  json.quizzes @lesson.quizzes do |quiz|
    json.id quiz.id
    json.question quiz.question
    json.options quiz.options
    # Don't expose correct_index in the response for security
  end
end

