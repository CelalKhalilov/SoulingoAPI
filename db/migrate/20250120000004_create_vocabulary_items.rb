# frozen_string_literal: true

class CreateVocabularyItems < ActiveRecord::Migration[8.0]
  def change
    create_table :vocabulary_items do |t|
      t.string :word, null: false
      t.string :meaning, null: false
      t.text :example_sentence
      t.string :part_of_speech
      t.references :lesson, null: false, foreign_key: true

      t.timestamps
    end

    add_index :vocabulary_items, :word
  end
end

