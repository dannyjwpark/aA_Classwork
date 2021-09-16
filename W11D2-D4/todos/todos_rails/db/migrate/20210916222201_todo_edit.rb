class TodoEdit < ActiveRecord::Migration[5.2]
  def change
    change_column :todos, :done, :boolean, default: nil
  end
end
