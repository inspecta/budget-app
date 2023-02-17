class EntitiesController < ApplicationController
  before_action :authenticate_user!

  # GET /entities or /entities.json
  def index
    @transactions = Entity.all
    @categories = Group.all
  end

  # GET /entities/1 or /entities/1.json
  def show
    # Transactions per category
    @group_id = params[:id]
    @transactions_per_group = Entity.where(group_id: @group_id).order(created_at: :desc)
    @category_name = Group.find(@group_id).name

    # Sum of amount of transactions in each category
    @sum = Entity.where(group_id: @group_id).sum(:amount)
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
        format.html { redirect_to user_groups_url, notice: 'Transaction was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entities/1 or /entities/1.json
  def destroy
    if @entity.destroy
      respond_to do |format|
        format.html { redirect_to user_entities_url, notice: 'Entity was successfully destroyed.' }
      end
    else
      puts 'Not deleted'
      flash.now[:error] = "Oops. Couldn't delete entity."
    end
  end

  # Only allow a list of trusted parameters through.
  def entity_params
    params.require(:entity).permit(:name, :amount, :group_id)
  end
end
