class AddingAlgoliaIdToService < ActiveRecord::Migration
  def change
    add_column :services, :aglolia_id, :string
  end
end
