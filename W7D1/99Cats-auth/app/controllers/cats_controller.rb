class CatsController < ApplicationController

  before_action :check_owner, only: [:edit,:update]

  def check_owner
    @cat = Cat.find(params[:id])
    if current_user == nil || @cat.user_id != current_user.id
      redirect_to cats_url
    end
  end

  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.find(params[:id])
    render :show
  end

  def new
    @cat = Cat.new
    @current_user = current_user
    render :new
  end

  def create
    @cat = Cat.new(cat_params)
    @cat[:user_id] = current_user.id
    if @cat.save
      redirect_to cat_url(@cat)
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :new
    end
  end

  def edit
    @cat = Cat.find(params[:id])
   
    render :edit

  end


  def update
    @cat = Cat.find(params[:id])
    if @cat.update_attributes(cat_params)
      redirect_to cat_url(@cat)
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :edit
    end
  end

  private

  def cat_params
    params.require(:cat).permit(:age,:birth_date, :color, :description, :name, :sex)
  end
end
