class EntitiesController < ApplicationController
  before_action :set_entity, only: %i[ show edit update destroy ]

  # GET /entities or /entities.json
  def index
    @entities = Entity.all
  end

  # GET /entities/1 or /entities/1.json
  def show
  end

  # GET /entities/new
  def new
    @entity = Entity.new
  end

  # POST /entities or /entities.json
  def create
    @entity = Entity.new(author_id: current_user.id, **entity_params)

    respond_to do |format|
      if @entity.save
        format.html { redirect_to user_entities_url, notice: "Entity was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entities/1 or /entities/1.json
  def destroy
    if @entity.destroy
      respond_to do |format|
        format.html { redirect_to user_entities_url, notice: "Entity was successfully destroyed." }
      end
    else
      puts "Not deleted"
      flash.now[:error] = "Oops. Couldn't delete entity."
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entity
      @entity = Entity.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def entity_params
      params.require(:entity).permit(:name, :amount, :group_id)
    end
end
