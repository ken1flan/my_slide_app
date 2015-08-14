class CreateIdentities < ActiveRecord::Migration
  def change
    create_table :identities do |t|
      t.integer :user_id
      t.string :provider, null: false, limit: 64
      t.string :uid, null: false, limit: 64

      t.timestamps null: false
    end

    add_index :identities, [:user_id], unique: true
    add_index :identities, [:provider, :uid], unique: true
  end
end
