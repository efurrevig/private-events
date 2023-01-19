class PrivateInvitesController < ApplicationController
  before_action :set_private_invite, only: %i[ show edit update destroy ]

  # GET /private_invites or /private_invites.json
  def index
    @private_invites = PrivateInvite.all
  end

  # GET /private_invites/1 or /private_invites/1.json
  def show
  end

  # GET /private_invites/new
  def new
    @event = Event.find(params[:event_id])
    @private_invite = @event.private_invites.new
  end

  # GET /private_invites/1/edit
  def edit
  end

  # POST /private_invites or /private_invites.json
  def create
    @event = Event.find(params[:event_id])
    @invitee = User.find(params[:user_id])
    @private_invite = @event.private_invites.build
    @private_invite.user_id = @invitee.id

    respond_to do |format|
      if @private_invite.save
        format.html { redirect_to private_invite_url(@private_invite), notice: "Private invite was successfully created." }
        format.json { render :show, status: :created, location: @private_invite }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @private_invite.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /private_invites/1 or /private_invites/1.json
  def update
    respond_to do |format|
      if @private_invite.update(private_invite_params)
        format.html { redirect_to private_invite_url(@private_invite), notice: "Private invite was successfully updated." }
        format.json { render :show, status: :ok, location: @private_invite }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @private_invite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /private_invites/1 or /private_invites/1.json
  def destroy
    @private_invite.destroy

    respond_to do |format|
      format.html { redirect_to private_invites_url, notice: "Private invite was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_private_invite
      @private_invite = PrivateInvite.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def private_invite_params
      params.fetch(:private_invite, {})
    end
end
