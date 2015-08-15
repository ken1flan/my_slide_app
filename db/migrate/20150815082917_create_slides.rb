class CreateSlides < ActiveRecord::Migration
  def change
    create_table :slides do |t|
      t.string :title, null: false, limit: 64
      t.string :image_url
      t.string :description, null: false
      t.text :body
      t.integer :user_id, null: false
      t.boolean :published, null: false, default: false

      t.timestamps null: false
    end

    add_index :slides, [:user_id]
  end
end
