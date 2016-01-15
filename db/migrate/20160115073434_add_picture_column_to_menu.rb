class AddPictureColumnToMenu < ActiveRecord::Migration
  def up
    add_attachment :menus, :picture
  end

  def down
    remove_attachment :menus, :picture
  end
end
