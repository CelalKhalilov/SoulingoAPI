# frozen_string_literal: true

class CreateUserProgresses < ActiveRecord::Migration[8.0]
  def change
    create_table :user_progresses do |t|
      t.references :user, null: false, foreign_key: true
      t.references :lesson, null: false, foreign_key: true
      t.integer :completion_percent, default: 0
      t.integer :correct_answers, default: 0
      t.integer :total_questions, default: 0

      t.timestamps
    end

    add_index :user_progresses, [:user_id, :lesson_id], unique: true
  end
end

