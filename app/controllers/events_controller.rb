class EventsController < ApplicationController
    def index
        @events = Event.where(private: false)
        @private_events = Event.where(private: true)
    end

    def show
        @event = Event.find(params[:id])
        @attendees = @event.attendees
        @attendee = current_attendee?(@event)
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

    def cancel_rsvp
        @attendee = Attendee.find(params[:id])
        @event = Event.find(@attendee.event_id)
        @attendee.destroy
        redirect_to event_path(@event)
    end

    private
        def event_params
            params.require(:event).permit(:title, :location, :description, :date, :private)
        end

        def current_attendee?(event)
            if event.user_attendees.exists?(current_user.id)
                event.attendees.find_by(user_id: current_user.id)
            else
                nil
            end
        end
end
