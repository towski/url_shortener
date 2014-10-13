class CreateTinyUrls < ActiveRecord::Migration
  def change
    create_table :tiny_urls do |t|
      t.string :url
      t.string :tiny_path

      t.timestamps
    end

    add_index :tiny_urls, :tiny_path, :unique => true
  end
end
