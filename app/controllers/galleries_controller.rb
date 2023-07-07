class GalleriesController < ApplicationController
  def index
    @galleries = Gallery.all
  end

  def show
    @gallery = Gallery.find(params[:id])
  end

  def create
    gallery = Gallery.new({
      museum_id: params[:gallery][:museum_id].to_i,
      name: params[:gallery][:name],
      item_name: params[:gallery][:item_name],
      year: params[:gallery][:year].to_i,
      on_loan: !!params[:gallery][:on_loan],
      })

    if gallery.save
      format.html { redirect_to(galleries_page_path(gallery), :notice => 'Gallery was successfully created.') }
    else
      format.html { render :action => "new" }
    end
  end
end
