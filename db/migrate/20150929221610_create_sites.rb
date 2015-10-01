class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :name
      t.string :url
      t.string :status, :default => "Pending Check"
      t.datetime :last_checked
      t.datetime :last_emailed
      t.references :user, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
