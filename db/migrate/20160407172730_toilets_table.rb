class ToiletsTable < ActiveRecord::Migration
  def change
    create_table :toilets do |t|


      t.timestamps null: false
    end
  end
end
