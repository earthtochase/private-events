class EventsController < ApplicationController

    def index
        @event = Event.all
    end

    def new
        @event = current_user.events.build
    end

    def create
        @event = current_user.events.build(event_params)
        if @event.save
            flash[:notice] = 'Success'
            redirect_to current_user
        else
            render 'new'
        end
    end

    def show
        @event = Event.find(params[:id])
    end
    

    private


    def event_params
        params.require(:event).permit(:title, :date)
    end

end
