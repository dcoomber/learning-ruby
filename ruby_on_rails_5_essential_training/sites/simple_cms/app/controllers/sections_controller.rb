class SectionsController < ApplicationController

  layout 'admin'

  def index
    @sections = Section.sorted
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new
  end

  def create
    # Instantiate a new object using form parameters
    @section = Section.new(section_params)
    # Save the object
    if @section.save
      # If save succeeds, redirect to the index action
      flash[:notice] = 'Section created successfully.'
      redirect_to(sections_path)
    else
      # If save fails, redisplay the form so user can fix problems
      render('new')
    end
  end

  def edit
    @section = Section.find(params[:id])
  end

  def update
    # Instantiate a new object using form parameters
    @section = Section.find(params[:id])
    # Save the object
    if @section.update(section_params)
      # If save succeeds, redirect to the show action
      flash[:notice] = 'Section updated successfully.'
      redirect_to(section_path(@section))
    else
      # If save fails, redisplay the form so user can fix problems
      render('edit')
    end
  end

  def delete
    @section = Section.find(params[:id])
  end

  def destroy
    @section = Section.find(params[:id])
    @section.destroy
    flash[:notice] = "Section '#{@section.name}' destroyed successfully."
    redirect_to(sections_path)
  end

  private

  def section_params
    params.require(:section).permit(:page_id, :name, :position, :visible, :content_type, :content)
  end

end
