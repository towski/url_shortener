class CreateTinyUrls < ActiveRecord::Migration
  def change
    create_table :tiny_urls do |t|
      t.string :url
      t.string :tiny_path
      t.string :protocol

      t.timestamps
    end
  end
end
