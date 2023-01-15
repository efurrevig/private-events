class EventsController < ApplicationController
    def index
        @events = Event.all
    end

    def new
        @event = current_user.events.new
    end

    def create
        @event = current_user.events.build(event_params)
        if @event.save
            redirect_to root_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    private
        def event_params
            params.require(:event).permit(:title, :location, :description, :date)
        end
end
