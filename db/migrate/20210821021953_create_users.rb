class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, null: false, default: ""
      t.string :email, null: false, unique: true, default: ""
      t.string :password_digest
      t.string :remember_digest
      t.boolean :admin, null: false, default: false
      t.boolean :editor, null: false, default: true

      t.timestamps
    end
  end
end
