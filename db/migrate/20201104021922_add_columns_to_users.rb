class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_index :users, [:uid, :provider], unique: true
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :remember_token, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :username, :string
    add_column :users, :profile_img_url, :string
  end
end
