class HoodsController < ApplicationController
  def index
    @boroughs = {}
    @boroughs[:manhattan] = Neighborhood.where(borough: "Manhattan").order("name")
    @boroughs[:brooklyn] = Neighborhood.where(borough: "Brooklyn").order("name")
    @boroughs[:bronx] = Neighborhood.where(borough: "Bronx").order("name")
    @boroughs[:queens] = Neighborhood.where(borough: "Queens").order("name")
    @boroughs[:statenisland] = Neighborhood.where(borough: "Staten Island").order("name")

    @length = @boroughs.values.map(&:size).max
  end

  def show
    @neighborhood = Neighborhood.find_by_slug!(params[:id])
    @tweets = @neighborhood.tweets.order("created_at DESC").first(40)
  end
end
