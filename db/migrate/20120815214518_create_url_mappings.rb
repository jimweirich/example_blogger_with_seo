class CreateUrlMappings < ActiveRecord::Migration
  def change
    create_table :url_mappings do |t|
      t.string :url
      t.string :seo

      t.timestamps
    end
  end
end
