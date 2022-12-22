class EntitiesController < ApplicationController
  before_action :set_categorie, only: %i[create index new]
  before_action :set_user, only: %i[index new]

  def index
    @transactions = @categorie.entities.order(created_at: :desc)
    @title = 'Transalctions'
  end

  def new
    @categories = @user.groups
    @transaction = Entity.new
  end

  def create
    @transaction = Entity.new(entity_params)
    @transaction.user = current_user
    @categorie.entities << @transaction
    if @transaction.save
      redirect_to groups_path notice: 'Transaction aded succseffully'
    else
      flash[:alert] = 'there was an error adding the transaction please try again'
      render :new
    end
  end

  private

  def entity_params
    params.require(:entity).permit(:name, :amount, :groups)
  end

  def set_categorie
    @categorie = Group.find(params[:group_id])
  end

  def set_user
    @user = current_user
  end
end
