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
  end

  def index
    @lists = List.all
    @lists.each do |list|
      if list.list_url.nil?
        list.list_url = "https://images.unsplash.com/photo-1575919220112-0d5a2dc6a4b6?w=1200&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8YWN0aW9uJTIwbW92aWV8ZW58MHx8MHx8fDA%3D"
      end
    end
  end

  private
  def list_params
    params.require(:list).permit(:name, :list_url)
  end
end
