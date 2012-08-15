class AddUniqueConstraintToUrlMapping < ActiveRecord::Migration
  def change
    add_index :url_mappings, [:seo], :unique => true
    add_index :url_mappings, [:url], :unique => true
  end
end
