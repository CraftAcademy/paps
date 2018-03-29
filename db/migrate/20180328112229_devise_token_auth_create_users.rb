class DeviseTokenAuthCreateUsers < ActiveRecord::Migration[5.2]
  def change
      ## Required
    add_column :users, :provider,:string, null: false, default: "email"
    add_column :users, :uid, :string, null: false, default: ""

    ## Confirmable
    add_column :users, :confirmation_token, :string
    add_column :users, :confirmed_at, :datetime
    add_column :users, :confirmation_sent_at, :datetime

    ## Tokens
    add_column :users, :tokens, :json

  end
end
