class AvatarsController < ApplicationController
  before_action :authenticate_user!

  def new
    @avatar = Avatar.new
  end

  def create
    @avatar = Avatar.new(avatar_params)
    if @avatar.name == ""
      @avatar.update(name: current_user.username)
    end

    @user           = current_user
    @user.avatar    = @avatar
    @user.avatar_id = @avatar.id
    respond_to do |format|
      if @avatar.save
        format.html { redirect_to donjon_path(1), notice: 'Avatar was successfully created.' }
        format.json { render :show, status: :created, location: @avatar }
      else
        format.html { render :new }
        format.json { render json: @avatar.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def addItemById
    @avatar = current_user.avatar
    @item   = Item.find(params[:item_id])

    @avatar.inventory.items << @item
  end

  def finishDonjon
    @avatar       = current_user.avatar
    @LevelWin     = Donjon.find(params[:donjon_id]).level + 1
    @currentLevel = @avatar.countUnlockDonjon

    if @LevelWin > @currentLevel
      @currentLevel = @LevelWin
    end

    @avatar.update(countUnlockDonjon: @currentLevel)

    respond_to do |format|
        format.html { redirect_to town_path, notice: 'Avatar was successfully updated.' }
        format.json { render :show, status: :ok, location: @avatar }
    end

  end

  def index
    @avatars = Avatar.includes(:job).all
  end

  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_avatar
      @avatar = Avatar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def avatar_params
      params.require(:avatar).permit(:name, :hp, :level, :job_id, :exp, :id_objet_equipe, objet_ids: [])
    end
end
