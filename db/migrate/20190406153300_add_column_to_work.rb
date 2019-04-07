class AddColumnToWork < ActiveRecord::Migration
  def change
    add_column :works, :url, :string
  end
end
