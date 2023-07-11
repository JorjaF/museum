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
      gallery.save

      redirect_to "/galleries"
  end
end
