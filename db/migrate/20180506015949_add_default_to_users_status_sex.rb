class AddDefaultToUsersStatusSex < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :status, :boolean, default: false
    change_column :users, :sex, :boolean, default: false
  end
end
