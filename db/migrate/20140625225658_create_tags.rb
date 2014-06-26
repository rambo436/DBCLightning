class CreateTags < ActiveRecord::Migration
  # Don't worry Nat! We will do validations with you!
  def change
    create_table :tags do |t|
      t.string :name

      t.timestamps
    end
  end
end
