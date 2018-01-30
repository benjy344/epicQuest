class ChestsController < ApplicationController
  before_action :set_chest, only: [:show, :edit, :update, :destroy]

  # GET /chests
  # GET /chests.json
  def index
    @chests = Chest.all
  end

  # GET /chests/1
  # GET /chests/1.json
  def show
  end

  # GET /chests/new
  def new
    @chest = Chest.new
  end

  # GET /chests/1/edit
  def edit
  end

  # POST /chests
  # POST /chests.json
  def create
    @chest = Chest.new(chest_params)

    respond_to do |format|
      if @chest.save
        format.html { redirect_to @chest, notice: 'Chest was successfully created.' }
        format.json { render :show, status: :created, location: @chest }
      else
        format.html { render :new }
        format.json { render json: @chest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chests/1
  # PATCH/PUT /chests/1.json
  def update
    respond_to do |format|
      if @chest.update(chest_params)
        format.html { redirect_to @chest, notice: 'Chest was successfully updated.' }
        format.json { render :show, status: :ok, location: @chest }
      else
        format.html { render :edit }
        format.json { render json: @chest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chests/1
  # DELETE /chests/1.json
  def destroy
    @chest.destroy
    respond_to do |format|
      format.html { redirect_to chests_url, notice: 'Chest was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chest
      @chest = Chest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chest_params
      params.fetch(:chest, {})
    end
end
