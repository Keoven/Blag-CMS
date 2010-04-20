class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end

  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
  end

  def edit
    @author = Author.find(params[:id])
  end

  def create
    @author = Author.new(params[:author])
    if @author.save
      redirect_to @author
    else
      render :action => 'new'
    end
  end

  def update
    @author = Author.find(params[:id])
    if @author.update_attributes(params[:author])
      redirect_to @author
    else
      render :action => "edit"
    end
  end

  def destroy
    @author = Author.find(params[:id])
    @author.destroy
    redirect_to(authors_url)
  end

end
