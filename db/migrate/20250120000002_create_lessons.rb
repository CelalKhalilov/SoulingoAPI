# frozen_string_literal: true

class CreateLessons < ActiveRecord::Migration[8.0]
  def change
    create_table :lessons do |t|
      t.string :title, null: false
      t.text :description
      t.string :level, null: false
      t.string :lesson_type, null: false

      t.timestamps
    end

    add_index :lessons, :level
    add_index :lessons, :lesson_type
    add_index :lessons, :created_at
  end
end

