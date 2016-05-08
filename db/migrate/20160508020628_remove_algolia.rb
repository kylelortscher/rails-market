class RemoveAlgolia < ActiveRecord::Migration
  def change
    remove_column :services, :aglolia_id
  end
end
