class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.string :name
      t.references :site
      t.string :target_url
      t.string :target
      t.integer :showed, default: 0
      t.integer :clicks, default: 0
      t.integer :max_showing

      t.timestamps null: false
    end
  end
end
