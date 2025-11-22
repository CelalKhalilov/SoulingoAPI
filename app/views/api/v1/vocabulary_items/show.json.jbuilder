# frozen_string_literal: true

json.vocabulary do
  json.id @vocabulary_item.id
  json.lesson_id @vocabulary_item.lesson_id
  json.word @vocabulary_item.word
  json.meaning @vocabulary_item.meaning
  json.example_sentence @vocabulary_item.example_sentence
  json.part_of_speech @vocabulary_item.part_of_speech
  json.created_at @vocabulary_item.created_at
end

