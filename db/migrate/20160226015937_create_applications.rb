class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.text :description
      t.text :APIkey
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :applications, [:user_id, :created_at]
  end
end
