class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.date :date
      t.integer :participant
      t.integer :duration

      t.timestamps
    end
  end
end
