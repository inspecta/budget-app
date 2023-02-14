class TransactionsController < ApplicationController
  def index
    @transactions = Entity.all
    @categories = Group.all
  end

  def show
    # Transactions per category
    @group_id = params[:id]
    @transactions_per_group = Entity.where(group_id: @group_id).order(created_at: :desc)
    @category_name = Group.find(@group_id).name
    puts @category_name
    # Sum of amount of transactions in each category
    @sum = Entity.where(group_id: @group_id).sum(:amount)
  end
end
