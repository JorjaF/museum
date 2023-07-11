class MuseumsController < ApplicationController
  def index
    @museums = Museum.all
    @museums = @museums.order(:created_at => :desc)
  end

  def new
  end

  def create
    museum = Museum.new({
      name: params[:museum][:name],
      number_of_galleries: params[:museum][:number_of_galleries].to_i,
      open_to_public: !!params[:museum][:open_to_public]
    })

    museum.save
    redirect_to "/museums"
  end

  def show
    @museum = Museum.find(params[:id])
  end

  def show_galleries
    @museum = Museum.find(params[:id])
    @galleries = @museum.galleries
  end

#   As a visitor
# When I visit the parent index,
# I see that records are ordered by most recently created first
# And next to each of the records I see when it was created

  def most_recently_created
    @museums = Museum.all
    @museums = @museums.order(:created_at => :desc)
  end

  end
