class Admin::WagonsController < Admin::BaseController
  before_action :set_wagon, only: [:show, :edit, :update, :destroy]
  before_action :set_train, only: [:new, :create]

  def index
    @wagons = Wagon.all
  end

  def show
  end

  def new
    @wagon = Wagon.new
  end

  def edit
  end

  def create
    @wagon = @train.wagons.new(wagon_params)

    respond_to do |format|
      if @wagon.save
        format.html { redirect_to [:admin, @train], notice: 'Wagon was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @wagon.update(wagon_params)
        format.html { redirect_to admin_train_path(@wagon.train), notice: 'Wagon was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @wagon.destroy
    respond_to do |format|
      format.html { redirect_to admin_train_path(@wagon.train), notice: 'Wagon was successfully destroyed.' }
    end
  end

  private
    def set_train
      @train = Train.find(params[:train_id])
    end
    def set_wagon
      @wagon = Wagon.find(params[:id])
    end

    def wagon_params
      params.require(:wagon).permit(:type, :number, :up_places, :down_places, :side_up_places, :side_down_places, :seat_places, :places, :train_id)
    end
end
