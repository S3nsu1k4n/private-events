class EventAttendeesController < ApplicationController
  def new
    @event = Event.find(params[:event_id])
    @event_attendee = EventAttendee.new
  end

  def create
    @event_attendee = EventAttendee.new(event_attendee_id: current_user.id, attended_event_id: params[:event_id])
    if already_attends?
      flash[:notice] = 'Already attending'
      redirect_to root_path
    elsif @event_attendee.save
      flash[:notice] = 'Succesfully attending event'
      redirect_to root_path
    else
      flash[:notice] = "Can't attend this event"
      redirect_to root_path
    end
  end

  def destroy
    @event_attendee = EventAttendee.find_by(event_attendee_id: current_user.id, attended_event_id: params[:event_id])
    @event_attendee.destroy

    redirect_to root_path, status: :see_other
  end

  def already_attends?
    !EventAttendee.find_by(event_attendee_id: current_user.id, attended_event_id: params[:event_id]).nil?
  end

end
