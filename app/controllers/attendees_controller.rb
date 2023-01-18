class AttendeesController < ApplicationController
  before_action :set_attendee, only: %i[ show edit update destroy ]

  # GET /attendees or /attendees.json
  def index
    @attendees = Attendee.all
  end

  # GET /attendees/1 or /attendees/1.json
  def show
  end

  # GET /attendees/new
  def new
    @event = Event.find(params[:event_id])
    @attendee = @event.attendees.new
  end

  # GET /attendees/1/edit
  def edit
  end


  # POST /attendees or /attendees.json
  def create
    @event = Event.find(params[:event_id])
    @attendee = @event.attendees.build(attendee_params)
    @attendee.user_id = current_user.id
    respond_to do |format|
      if @attendee.save
        format.html { redirect_to event_path(@event), notice: "Attendee was successfully created." }
        format.json { render :show, status: :created, location: @attendee }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @attendee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attendees/1 or /attendees/1.json
  def update
    respond_to do |format|
      if @attendee.update(attendee_params)
        format.html { redirect_to attendee_url(@attendee), notice: "Attendee was successfully updated." }
        format.json { render :show, status: :ok, location: @attendee }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @attendee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attendees/1 or /attendees/1.json
  def destroy
    @attendee = Attendee.find(params[:user_id])
    @attendee.destroy

    respond_to do |format|
      format.html { redirect_to root_path, notice: "Attendee was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendee
      @attendee = Attendee.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def attendee_params
      params.require(:attendee).permit(:name, :event_id)
    end
end
