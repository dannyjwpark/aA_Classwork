class CatsController < ApplicationController

  def index
    @cats = Cat.all 
    render :index
  end

  def show 
    @cat = Cat.find_by(id: params[:id])
    if @cat
      render :show
    else
      render json: {error: "Cat with that id does not exist"}
    end
  end

  def new
    @cat = Cat.new
    render :new
  end

  def create
    @cat = Cat.new(cat_params)
    # params = { cats: {name: ''}}
    # params = {}
    if @cat.save
      # show user the cat list page
      redirect_to cat_url(@cat)
    else
      render :new
      # show user the new cat form
    end
  end

  def edit
    #  find: returns exception if nothing is found & causes error
    #  find_by : returns nil if nothing is found
    @cat = Cat.find_by(id: params[:id])
    render :edit
  end

  def update
    @cat = Cat.find_by(id: params[:id])

    if @cat.update_attributes(cat_params)
      redirect_to cats_url(@cat)
    else
      render :edit
    end
  end

  private
  def cat_params
    params.require(:cat).permit(:name, :sex, :color, :birth_date, :description)
  end
end
