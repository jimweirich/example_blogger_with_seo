class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :article
      t.string :author_name
      t.text :body

      t.timestamps
    end
    add_index :comments, [:article_id], :unique => false
  end
end
