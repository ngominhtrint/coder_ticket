class EventsController < ApplicationController
  def index
    if params[:search].present?
      @events = Event.upcoming.search(params[:search])
    else 
      @events = Event.upcoming.all
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
    @categories = Category.all
    @venues = Venue.all
  end

  def create
    @event = Event.new event_params
    @categories = Category.all
    @venues = Venue.all
    @event.owner = current_user

    if @event.save
      flash[:success] = "Event has been created successfully."
      redirect_to root_path
    else
      render 'new'
    end
  end

  private
    def event_params
      params.require(:event).permit(:starts_at, :ends_at, :venue_id, :hero_image_url, :extended_html_description,:category_id, :name)
    end
end
