class ChangeSiteIdColumnFromItems < ActiveRecord::Migration
  def self.up
    remove_index :items, :name => "IDX_ITEM_SITE"
    remove_column :items, :site_id
    add_column :items, :site_id, :integer, :null => false
    add_index :items, [:site_id, :item_id], :name => "IDX_ITEM_SITE", :unique => true
  end

  def self.down
    remove_index :items, :name => "IDX_ITEM_SITE"
    remove_column :items, :site_id
    add_column :items, :site_id, :string, :null => false
    add_index :items, [:site_id, :item_id], :name => "IDX_ITEM_SITE", :unique => true
  end
end
