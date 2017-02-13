class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :trajectory
      t.integer :age
      t.string :occupation
      t.text :migration_reason
      t.text :value_prop
      t.text :story
      t.string :location
      t.float :weight
      t.integer :group_id
      t.boolean :published

      t.timestamps
    end
  end
end
