class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.integer :user_id
      t.string :title
      t.string :title_seo
      t.integer :price
      t.integer :due_date
      t.string :youtube_url
      t.string :category
      t.string :sub_category
      t.text :description
      t.integer :refund
      t.boolean :status

      t.timestamps null: false
    end
  end
end
