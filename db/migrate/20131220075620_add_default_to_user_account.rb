class AddDefaultToUserAccount < ActiveRecord::Migration
  def change
    change_column :users, :account, :string, default: "member"
  end
end
