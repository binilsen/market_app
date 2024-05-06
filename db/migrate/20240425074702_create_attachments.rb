# frozen_string_literal: true

class CreateAttachments < ActiveRecord::Migration[7.1]
  def change
    create_table :attachments do |t|
      t.belongs_to :attachable, polymorphic: true
      t.text :image_data
      t.timestamps
    end
  end
end
