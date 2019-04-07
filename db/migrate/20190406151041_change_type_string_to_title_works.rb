class ChangeTypeStringToTitleWorks < ActiveRecord::Migration
  def up
    change_column :works, :content, :text
  end

  def down
    change_column :works, :content, :string
  end
end
