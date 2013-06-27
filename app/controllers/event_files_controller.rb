class EventFilesController < ApplicationController
  before_filter :authorize_signed_in, except: :show
  before_filter :load_parent
  before_filter :is_parent_owner?, only: [:new, :create, :update]

  def new
    @event_file = EventFile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event_file }
    end
  end

  def create
    @event_file = EventFile.new(params[:event_file])
    @event_file.config_pack = @config_pack

    respond_to do |format|
      if @event_file.save
        format.html { redirect_to @config_pack, notice: 'Event file was successfully created.' }
        format.json { render json: @config_pack, status: :created, location: @config_pack }
      else
        format.html { render action: "new" }
        format.json { render json: @event_file.errors, status: :unprocessable_entity }
      end
    end
  end

  def update

  end

  def load_parent
    @config_pack = ConfigPack.find(params[:config_pack_id])
  end

  def is_parent_owner?
    unless current_user && @config_pack.is_owned_by?(current_user)
      flash[:alert] = "You do not have access to that resource."
      redirect_to root_url
    end
  end
end
