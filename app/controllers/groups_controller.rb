class GroupsController < ApplicationController
    before_action :set_user
    before_action :set_categorie, only: [:show]

  def index
    @categories = @user.groups.includes(:entities)
    @title = 'Categories'
  end



  def new
    @categorie = Group.new
  end

  def create
    @categorie = Group.new(categorie_params)
    @categorie.user = @user
    if @categorie.save
      redirect_to groups_path, notice: ' Catergorie successfully added.'
    else
      flash[:alert] = 'Food adding Failed. Please try again.'
      render :new
    end 
  end

  private

  def set_user
    @user = current_user
  end 

  def set_categorie
    @categorie = Group.find(params[:id])
  end 
    
  def categorie_params
    params.require(:group).permit(:name, :icon)
  end   
end
