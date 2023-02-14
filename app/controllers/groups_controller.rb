class GroupsController < ApplicationController
  before_action :set_group, only: %i[show edit update destroy]

  # GET /groups or /groups.json
  def index
    @groups = Group.all
    # @category = Entity.where(:group_id, @group.id)
  end

  # GET /groups/1 or /groups/1.json
  def show; end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # POST /groups or /groups.json
  def create
    @group = Group.new(author_id: current_user.id, **group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to user_group_url(current_user, @group), notice: 'Group was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1 or /groups/1.json
  def destroy
    @group = Group.find(params[:id])
    puts @group
    if @group.destroy
      respond_to do |format|
        format.html { redirect_to user_groups_url, notice: 'Group was successfully destroyed.' }
      end
    else
      puts 'Not deleted'
      flash.now[:error] = "Oops. Couldn't delete group."
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_group
    @group = Group.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def group_params
    params.require(:group).permit(:name, :icon)
  end

  # def find_group_transactions
  #   @group_id_transactions = params
  # end
end
