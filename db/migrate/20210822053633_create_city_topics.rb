class CreateCityTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :city_topics do |t|
      t.string :title
      t.string :period
      t.string :content
      t.string :target
      t.string :counter
      t.string :link
      t.boolean :emergency, null: false, default: false
      t.boolean :primary_sector, null: false, default: false
      t.boolean :other_sector, null: false, default: false
      t.boolean :emigration, null: false, default: false
      t.boolean :senior, null: false, default: false
      t.boolean :parenting, null: false, default: false
      t.boolean :other, null: false, default: true
      t.references :city, foreign_key: true

      t.timestamps
    end
  end
end
