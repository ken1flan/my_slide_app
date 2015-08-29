class AddTokenToSlide < ActiveRecord::Migration
  def change
    add_column :slides, :token, :string, length: 16
  end
end
