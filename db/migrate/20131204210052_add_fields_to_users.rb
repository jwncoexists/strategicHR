class AddFieldsToUsers < ActiveRecord::Migration
  def change
    rename_column :users, :name, :last_name
    add_column :users, :first_name, :string, default: ""
    add_column :users, :title, :string, default: ""
    add_column :users, :company, :string, default: ""
    add_column :users, :address1, :string, default: ""
    add_column :users, :address2, :string, default: ""
    add_column :users, :city, :string, default: ""
    add_column :users, :state, :string, default: ""
    add_column :users, :postal_code, :string, default: ""
    add_column :users, :country, :string, default: ""
    add_column :users, :phone, :string, default: ""
  end
end
