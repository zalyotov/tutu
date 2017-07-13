class Admin::RailwayStationsController < Admin::BaseController
  before_action :set_railway_station, only: [:show, :edit, :update, :destroy, :update_position, :update_time]
  before_action :set_route, only: [:update_time, :update_position]

  # GET /railway_stations
  def index
    @railway_stations = RailwayStation.all
  end

  # GET /railway_stations/1
  def show
  end

  # GET /railway_stations/new
  def new
    @railway_station = RailwayStation.new
  end

  # GET /railway_stations/1/edit
  def edit
  end

  # POST /railway_stations
  # POST /railway_stations.json
  def create
    @railway_station = RailwayStation.new(railway_station_params)

    if @railway_station.save
      redirect_to admin_railway_station_path(@railway_station), notice: 'Railway station was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /railway_stations/1
  def update
    if @railway_station.update(railway_station_params)
     redirect_to admin_railway_stations_path, notice: 'Railway station was successfully updated.'
    else
     render :edit
    end
  end

  def update_position
    @railway_station.update_position(@route, params[:position])
    redirect_to admin_route_path(@route)
  end

  def update_time
    @railway_station.update_time(@route, arrival_time: params[:arrival_time], departure_time: params[:departure_time])
    redirect_to admin_route_path(@route)
  end

  # DELETE /railway_stations/1
  def destroy
    if @railway_station.destroy
      redirect_to admin_railway_stations_url, notice: 'Railway station was successfully destroyed.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_railway_station
      @railway_station = RailwayStation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def railway_station_params
      params.require(:railway_station).permit(:title)
    end

    def set_route
      @route = Route.find(params[:route_id])
    end
end
