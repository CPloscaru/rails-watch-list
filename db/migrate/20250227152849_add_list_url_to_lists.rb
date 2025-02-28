class AddListUrlToLists < ActiveRecord::Migration[7.1]
  def change
    add_column :lists, :list_url, :string
  end
end
