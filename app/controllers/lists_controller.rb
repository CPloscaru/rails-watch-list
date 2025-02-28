class ListsController < ApplicationController
  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @list = List.find(params[:id])
    @image_url = @list.list_url
    if @image_url.nil?
      @image_url = @list.photo.url
    end
  end

  def index
    @lists = List.all
    @lists.each do |list|
      if list.list_url.nil?
        if list.photo.url.nil?
          list.list_url = "https://images.unsplash.com/photo-1575919220112-0d5a2dc6a4b6?w=1200&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8YWN0aW9uJTIwbW92aWV8ZW58MHx8MHx8fDA%3D"
        else
          list.list_url = list.photo.url
        end
      end
    end
  end

  def update
    @list = List.find(params[:id])
    @list.update(list_params)
    redirect_to list_path(@list)
  end

  private
  def list_params
    params.require(:list).permit(:name, :list_url, :photo)
  end
end
