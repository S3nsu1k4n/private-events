class CreateEventAttendees < ActiveRecord::Migration[7.0]
  def change
    create_table :event_attendees do |t|
      t.integer :event_attendee_id
      t.integer :attended_event_id

      t.timestamps
    end
  end
end
