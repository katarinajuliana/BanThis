class CreateFamilyMembers < ActiveRecord::Migration
  def change
    create_table :family_members do |t|
    end
    
    add_reference :family_members, :family, index: true, foreign_key: true
    add_reference :family_members, :person, index: true, foreign_key: true
  end
end
