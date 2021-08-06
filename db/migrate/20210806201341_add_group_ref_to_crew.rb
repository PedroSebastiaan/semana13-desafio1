class AddGroupRefToCrew < ActiveRecord::Migration[5.2]
  def change
    add_reference :crews, :group, foreign_key: true
  end
end
