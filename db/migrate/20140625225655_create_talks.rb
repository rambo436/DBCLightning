class CreateTalks < ActiveRecord::Migration
  # Will add validations.
  def change
    create_table :talks do |t|
      t.belongs_to :speaker
      t.belongs_to :tag
      t.string     :title
      t.string     :description
      t.datetime   :event_time
      t.integer    :min_rsvp, default: 0
      t.integer    :current_votes, default: 0

      t.timestamps
    end
  end
end
