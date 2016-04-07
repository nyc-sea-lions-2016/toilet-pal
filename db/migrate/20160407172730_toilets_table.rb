class ToiletsTable < ActiveRecord::Migration
  def change
    create_table :toilets do |t|
    	t.string :name, null: false
    	t.string :location, null: false
    	t.string :type, null: false

      t.timestamps null: false
    end
  end
end
