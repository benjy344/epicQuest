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

  def craft
    @items          = params[:items].split(',')
    @recipes        = Recipe.all
    @goodIngredient = []

    @recipes.each do |recipe|
      temp = recipe.ingredients.where(item_id: @items.first)
      if recipe.ingredients.count == @items.count && temp.count>0
        @goodIngredient << recipe
      end
    end

    @goodIngredient.each do |recipe|
      counter = 0
      recipe.ingredients.each do |ing|
        @items.each do |item|

          if (ing.item_id.to_i == item.to_i)
            counter = counter+1
            puts 'counter ++'
          end
        end
        puts "===================>>>>"
        puts counter
        puts @items.count
        puts counter == @items.count
        puts "===================>>>>"
        if counter == @items.count
          @item = Item.find(recipe.item.id)
          puts "==================="
          puts @item.inspect
          puts "==================="
          puts "==================="
        end
      end

      if counter == @items.count
        @item = Item.find(recipe.item.id)
        puts "==================="
        puts @item.inspect
        puts "==================="
        puts "==================="
      end
    end
  end

  def sitItem
    @avatar = current_user.avatar
    @itemCategory = @avatar.inventory.items.where(id: params[:item_id]).first.category

    if @itemCategory === "sword"
      @avatar.update(id_sword: params[:item_id])
    elsif @itemCategory === "armor"
      @avatar.update(id_armor: params[:item_id])
    elsif @itemCategory === "shield"
      @avatar.update(id_shield: params[:item_id])
    end

  end

  def unsitItem
    @avatar = current_user.avatar
    @itemCategory = @avatar.inventory.items.where(id: params[:item_id]).first.category

    if @itemCategory === "sword"
      @avatar.update(id_sword: nil)
    elsif @itemCategory === "armor"
      @avatar.update(id_armor: nil)
    elsif @itemCategory === "shield"
      @avatar.update(id_shield: nil)
    end

  end

  def majAvatar
    @avatar = current_user.avatar
    @avatar.update(MaxHealth: params[:MaxHealth], hp: params[:hp], level: params[:level], nextLevel: params[:nextLevel],defence: params[:defence], agility: params[:agility], force: params[:force], inteligence: params[:inteligence], exp: params[:exp])
  end

  def addGold
    @avatar = current_user.avatar
    @currentGold = @avatar.gold.to_i
    @newGold = @currentGold + params[:gold].to_i
    @avatar.update(gold: @newGold)
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
