class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.integer :member
      t.date :debut_date
      t.integer :gender

      t.timestamps
    end
  end
end
