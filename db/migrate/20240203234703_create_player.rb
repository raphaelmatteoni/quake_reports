# frozen_string_literal: true

class CreatePlayer < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.string :name

      t.timestamps
    end
  end
end
