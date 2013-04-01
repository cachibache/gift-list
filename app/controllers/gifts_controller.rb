class GiftsController < ApplicationController

  before_filter :authenticate

  def index
    @gifts = Gift.all
  end

  def new
    @list = List.find(params[:list_id])
    @gift = Gift.new
  end

  def create
    @list = List.find(params[:list_id])
    @gift = @list.gifts.build(params[:gift])
    @gift.save
    redirect_to list_path(@list)
  end

  def show
  end

  def edit
    @list = List.find(params[:list_id])
    @gift = @list.gifts.find(params[:id])
  end

  def update
    @list = List.find(params[:list_id])
    @gift = @list.gifts.find(params[:id])
    if @gift.update_attributes(params[:gift])
      flash[:notice] = "Your changes have been saved."
      redirect_to list_path(@list)
    else
      render :edit
    end
  end

  def destroy
    @list = List.find(params[:list_id])
    @gift = @list.gifts.find(params[:id])
    if @gift.delete
      flash[:notice] = 'Your gift has been deleted.'
      redirect_to list_path(@list)
    else
      flash[:notice] = 'You have a problem.  Try again!'
      redirect_to list_path(@list)
    end
  end
end
