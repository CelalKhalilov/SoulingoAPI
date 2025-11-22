# frozen_string_literal: true

json.vocabulary @vocabulary_items do |vocab|
  json.id vocab.id
  json.word vocab.word
  json.meaning vocab.meaning
  json.example_sentence vocab.example_sentence
  json.part_of_speech vocab.part_of_speech
  json.created_at vocab.created_at
end

