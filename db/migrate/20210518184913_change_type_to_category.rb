class ChangeTypeToCategory < ActiveRecord::Migration[6.0]
  def change
    rename_column :instruments, :type, :category
  end
end
