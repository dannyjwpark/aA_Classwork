class ReviseBands < ActiveRecord::Migration[6.1]
  def change
    add_index :bands, :name, unique: true
  end
end
