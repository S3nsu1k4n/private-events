class EventsController < ApplicationController
  before_action :authenticate_user!

  def index
    @event = Event.all.order(date: :desc)
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :location, :date)
  end
end
