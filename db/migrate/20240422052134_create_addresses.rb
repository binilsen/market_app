# frozen_string_literal: true

class CreateAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :addresses do |t|
      t.text :content, null: false
      t.integer :type
      t.string :phone
      t.timestamps
    end
  end
end
