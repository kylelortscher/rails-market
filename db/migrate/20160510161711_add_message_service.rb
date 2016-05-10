class AddMessageService < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :sender_user_id
      t.integer :receiver_user_id
      t.text :body
      t.timestamps null: false
    end
  end
end
