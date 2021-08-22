class CreateDrafts < ActiveRecord::Migration[5.2]
  def change
    create_table :drafts do |t|
      t.string :name
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
      t.string :select, null: false, default: "0"
      t.string :comment, default: "ご投稿ありがとうございます！"
      t.string :draft_approver_id, default: ""
      t.string :draft_status, default: "申請中です"
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
