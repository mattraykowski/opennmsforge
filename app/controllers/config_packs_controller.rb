class ConfigPacksController < ApplicationController
  before_filter :authorize_signed_in, :except => [:index, :show]
  before_filter :require_owner, :only => [:edit, :update, :destroy]
  before_filter :get_config_pack, :only => [:show, :edit, :update, :destroy]


  # GET /config_packs
  # GET /config_packs.json
  def index
    @config_packs = ConfigPack.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @config_packs }
    end
  end

  # GET /config_packs/1
  # GET /config_packs/1.json
  def show
    @config_pack = ConfigPack.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @config_pack }
    end
  end

  # GET /config_packs/new
  # GET /config_packs/new.json
  def new
    @config_pack = ConfigPack.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @config_pack }
    end
  end

  # GET /config_packs/1/edit
  def edit
    @config_pack = ConfigPack.find(params[:id])
  end

  # POST /config_packs
  # POST /config_packs.json
  def create
    @config_pack = ConfigPack.new(params[:config_pack])
    @config_pack.user = current_user

    respond_to do |format|
      if @config_pack.save
        format.html { redirect_to @config_pack, notice: 'Config pack was successfully created.' }
        format.json { render json: @config_pack, status: :created, location: @config_pack }
      else
        format.html { render action: "new" }
        format.json { render json: @config_pack.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /config_packs/1
  # PUT /config_packs/1.json
  def update
    @config_pack = ConfigPack.find(params[:id])

    respond_to do |format|
      if @config_pack.update_attributes(params[:config_pack])
        format.html { redirect_to @config_pack, notice: 'Config pack was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @config_pack.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /config_packs/1
  # DELETE /config_packs/1.json
  def destroy
    @config_pack = ConfigPack.find(params[:id])
    @config_pack.destroy

    respond_to do |format|
      format.html { redirect_to config_packs_url }
      format.json { head :no_content }
    end
  end

  def get_config_pack
    @config_pack = ConfigPack.find(params[:id])
  end
end
