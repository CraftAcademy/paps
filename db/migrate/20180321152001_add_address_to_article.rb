class AddAddressToArticle < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :address, :string
  end
end
