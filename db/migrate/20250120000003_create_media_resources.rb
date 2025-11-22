# frozen_string_literal: true

class CreateMediaResources < ActiveRecord::Migration[8.0]
  def change
    create_table :media_resources do |t|
      t.string :url, null: false
      t.string :media_type, null: false
      t.string :mime_type
      t.references :lesson, null: false, foreign_key: true

      t.timestamps
    end

    add_index :media_resources, :media_type
  end
end

