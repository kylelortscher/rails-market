class CreateSpamTable < ActiveRecord::Migration
  def change
    create_table :spam do |t|
      t.integer :user_id
      t.integer :service_id

      t.timestamps null: false
    end
  end
end
