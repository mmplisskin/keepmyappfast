class AddLastEmailedToSite < ActiveRecord::Migration
  def change
    add_column :sites, :last_emailed, :string
  end
end
