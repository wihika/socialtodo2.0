class Renamecolumn < ActiveRecord::Migration
  def change
    rename_column :users, :name, :fl_name
  end
end