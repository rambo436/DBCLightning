class CreateHashtags < ActiveRecord::Migration
  def change
    create_table :hashtags do |t|
      t.boolean :presenting?
      t.boolean :attending?
      t.timestamps
    end
  end
end
