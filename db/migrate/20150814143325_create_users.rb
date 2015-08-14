class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nickname, null: false, limit: 64
      t.string :icon_url

      t.timestamps null: false
    end
  end
end
