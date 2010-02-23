class CreateSites < ActiveRecord::Migration
  def self.up
    create_table :sites, :id => false do |t|
      t.string :site_id, :limit => 3, :null => false
      t.string :locale, :null => false, :limit => 2
      
      t.timestamps
    end

#    add_index :sites, :site_id, :unique => true, :name => "primary_key"
    execute "ALTER TABLE sites ADD PRIMARY KEY (site_id)"
  end

  def self.down
    drop_table :sites
  end
end
