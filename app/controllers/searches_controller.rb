class SearchesController < ApplicationController
  def show
  end

  def create
    @trains = Search.trains(params[:stations][:first_station_id], params[:stations][:last_station_id])
    @first_station = RailwayStation.find(params[:stations][:first_station_id])
    @last_station = RailwayStation.find(params[:stations][:last_station_id])
    render :show
  end
end