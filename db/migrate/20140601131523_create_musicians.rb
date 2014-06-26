class CreateMusicians < ActiveRecord::Migration
  def change
  	create_table :musicians do |t|
  		t.string :name
  		t.integer :age
  		t.belongs_to :band #foreign key

  		t.timestamps
  	end
  end
end
