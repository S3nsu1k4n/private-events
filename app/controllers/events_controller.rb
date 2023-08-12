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

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      redirect_to User.find(@event.creator_id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event = find_event_by_id
    @creator = User.find(@event.creator_id)
    @event.destroy
    redirect_to @creator, status: :see_other
  end

  def find_event_by_id
    Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:name, :location, :date)
  end
end
