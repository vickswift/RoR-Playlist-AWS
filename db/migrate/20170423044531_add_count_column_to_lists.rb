class AddCountColumnToLists < ActiveRecord::Migration
  def change
    add_column :lists, :count, :integer
  end
end
