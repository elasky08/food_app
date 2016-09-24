class AddUserToMenuItems < ActiveRecord::Migration[5.0]
  def change
    add_reference :menu_items, :user, foreign_key: true
  end
end
