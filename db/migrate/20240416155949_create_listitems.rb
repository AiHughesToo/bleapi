class CreateListitems < ActiveRecord::Migration[6.1]
  def change
    create_table :listitems do |t|
      t.string :item
      t.string :snumber
      t.string :name

      t.timestamps
    end
  end
end
