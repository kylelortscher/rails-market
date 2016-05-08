class RenamimingAlogliaId < ActiveRecord::Migration
  def change
    remove_column :services, :aglolia_id
    add_column :services, :algolia_id, :string
  end
end
