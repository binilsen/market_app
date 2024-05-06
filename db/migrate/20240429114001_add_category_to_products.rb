# frozen_string_literal: true

class AddCategoryToProducts < ActiveRecord::Migration[7.1]
  def change
    add_reference :products, :category
  end
end
