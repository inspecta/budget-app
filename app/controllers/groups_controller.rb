class GroupsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_group, only: %i[show edit update destroy]

  # GET /groups
  def index
    @groups = Group.all
  end

  # GET /groups/1
  def show; end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # POST /groups
  def create
    @group = Group.new(author_id: current_user.id, **group_params)

    respond_to do |format|
      if @group.save
        format.html do
          redirect_to user_groups_url(current_user),
                      notice: 'Group was successfully created.'
        end
      else
        format.html { render :new, status: :unprocessable_entity }
      end
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
end
