class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :is_event_owner?, :is_not_published?

  def is_event_owner?
    @event = Event.find(Event.find(params[:id]))

    if @event.owner == current_user
      true
    else
      false
    end
  end

  def is_not_published?
    @event = Event.find(Event.find(params[:id]))

    if @event.published_at == nil
      true
    else
      false
    end
  end
end
