class CreateHashtags < ActiveRecord::Migration
  def change
    create_table :hashtags do |t|
      t.belongs_to :talk
      t.belongs_to :tag

      t.timestamps
    end
  end
end
