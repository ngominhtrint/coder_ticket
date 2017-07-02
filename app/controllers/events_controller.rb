class EventsController < ApplicationController
  before_action :event_edit_permission?, only: [:edit]
  
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

  def have_enough_ticket_types?
    @event = Event.find(params[:id])

    if @event.ticket_types.count > 0
      @event.published_at = Time.now
      if @event.save
        flash[:success] = "Event has been published successfully."
        redirect_to root_path
      else
        flash.now[:error] = "Fail to published event."
        render 'show'
      end
    else
      flash.now[:error] = "Event need at least one ticket type."
      render 'show'
    end
  end

  def my_events
    @events = Event.where(owner_id: current_user.id)
  end

  def edit
    @categories = Category.all
    @venues = Venue.all
  end

  def update
    @event = Event.find(params[:id].to_param)
    @categories = Category.all
    @venues = Venue.all

    if @event.update(event_params)
      flash[:success] = "Event has been updated successfully."
      redirect_to "/events/#{@event.to_param}"
    else
      render 'edit'
    end
  end

  private
    def event_params
      params.require(:event).permit(:starts_at, :ends_at, :venue_id, :hero_image_url, :extended_html_description,:category_id, :name)
    end
end
