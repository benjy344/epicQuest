class DonjonsController < ApplicationController
  before_action :set_donjon, only: [:show, :edit, :update, :destroy]

  # GET /donjons
  # GET /donjons.json
  def index
    @donjons = Donjon.all
    @user    = current_user
    @avatar  = @user.avatar
  end

  # GET /donjons/1
  # GET /donjons/1.json
  def show
    @user          = current_user
    @avatar        = @user.avatar
    @count_chest   = 0
    @count_monster = 0
    @monsters      = []
    @avatarItems   = @avatar.inventory.items

    @donjon.rooms.each do |r|
      @count_chest += r.chests.count
      @count_monster += r.monsters.count
      r.monsters.each do |monster|
        @monsters << monster
      end
    end
    respond_to do |format|
      format.html
      format.json { render :json => {donjon: @donjon, rooms: @donjon.rooms, monsters: @monsters, avatar: @avatar, avatarItems: @avatarItems} }
    end
  end

  # GET /donjons/new
  def new
    @donjon = Donjon.new
  end

  # GET /donjons/1/edit
  def edit
  end

  # POST /donjons
  # POST /donjons.json
  def create
    @donjon = Donjon.new(donjon_params)

    respond_to do |format|
      if @donjon.save
        format.html { redirect_to @donjon, notice: 'Donjon was successfully created.' }
        format.json { render :show, status: :created, location: @donjon }
      else
        format.html { render :new }
        format.json { render json: @donjon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /donjons/1
  # PATCH/PUT /donjons/1.json
  def update
    respond_to do |format|
      if @donjon.update(donjon_params)
        format.html { redirect_to @donjon, notice: 'Donjon was successfully updated.' }
        format.json { render :show, status: :ok, location: @donjon }
      else
        format.html { render :edit }
        format.json { render json: @donjon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /donjons/1
  # DELETE /donjons/1.json
  def destroy
    @donjon.destroy
    respond_to do |format|
      format.html { redirect_to donjons_url, notice: 'Donjon was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_donjon
      @donjon = Donjon.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def donjon_params
      params.require(:donjon).permit(:name, :level)
    end
end
