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
  end

  def update
  end

  def destroy
  end
end
