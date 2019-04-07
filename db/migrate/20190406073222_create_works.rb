class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.string :client
      t.string :content
      t.string :skill

      t.timestamps null: false
    end
  end
end
