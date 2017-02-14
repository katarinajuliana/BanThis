class AddPhotographerToPeople < ActiveRecord::Migration
  def change
    add_column :people, :photographer, :string
  end
end
