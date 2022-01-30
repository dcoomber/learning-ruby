class PagesController < ApplicationController

  def index
    @pages = Page.sorted
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
  end

  def create
    # Instantiate a new object using form parameters
    @page = Page.new(page_params)
    # Save the object
    if @page.save
      # If save succeeds, redirect to the index action
      flash[:notice] = 'Page created successfully.'
      redirect_to(pages_path)
    else
      # If save fails, redisplay the form so user can fix problems
      render('new')
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    # Instantiate a new object using form parameters
    @page = Page.find(params[:id])
    # Save the object
    if @page.update(page_params)
      # If save succeeds, redirect to the show action
      flash[:notice] = 'Page updated successfully.'
      redirect_to(page_path(@page))
    else
      # If save fails, redisplay the form so user can fix problems
      render('edit')
    end
  end

  def delete
    @page = Page.find(params[:id])
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    flash[:notice] = "Page '#{@page.name}' destroyed successfully."
    redirect_to(pages_path)
  end

  private

  def page_params
    params.require(:page).permit(:name, :position, :visible)
  end

end
