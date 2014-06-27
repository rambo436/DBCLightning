class CreateTalks < ActiveRecord::Migration
  # Will add validations.
  def change
    create_table :talks do |t|
      t.belongs_to :speaker
      t.belongs_to :tag
      t.string     :title
      t.string     :description
      t.date       :scheduled_date
      t.time       :scheduled_time
      t.integer    :vote, default: 0
      t.integer    :min_vote
      t.integer    :max_capacity

      t.timestamps
    end
  end
end
