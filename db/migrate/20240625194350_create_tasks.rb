# frozen_string_literal: true

class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.integer :position
      t.boolean :completed, default: false, null: false

      t.timestamps
    end
  end
end
