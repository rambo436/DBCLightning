class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.belongs_to :user
      t.belongs_to :talk
      t.boolean :attending?, default: false

      t.timestamps
    end
  end
end
