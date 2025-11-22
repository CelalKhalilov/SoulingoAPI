# frozen_string_literal: true

class CreateQuizzes < ActiveRecord::Migration[8.0]
  def change
    create_table :quizzes do |t|
      t.text :question, null: false
      t.json :options, null: false, default: []
      t.integer :correct_index, null: false
      t.references :lesson, null: false, foreign_key: true

      t.timestamps
    end
  end
end

