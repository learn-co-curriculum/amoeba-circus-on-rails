class CreateAmoebaActs < ActiveRecord::Migration
  def change
    create_table :amoeba_acts do |t|
      t.integer :amoeba_id
      t.integer :act_id

      t.timestamps
    end
  end
end
