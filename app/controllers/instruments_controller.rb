class InstrumentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @instruments = Instrument.all
    @instruments = @instruments.search_by_name_model_category(params[:query]) if params[:query].present?
    @instruments = @instruments.where(category: params[:category]) if params[:category].present?

    @markers = @instruments.geocoded.map do |instrument|
      {
        lat: instrument.latitude,
        lng: instrument.longitude,
        info_window: render_to_string(partial: "info_window", locals: { instrument: instrument })
      }
    end
  end

  def show
    set_instrument
    @owner = @instrument.owner
  end

  def new
    @instrument = Instrument.new
  end

  def create
    @instrument = Instrument.new(instrument_params)
    @instrument.owner_id = current_user.id
    if @instrument.save
      redirect_to instrument_path(@instrument)
    else
      render :new
    end
  end

  private

  def set_instrument
    @instrument = Instrument.find(params[:id])
  end

  def instrument_params
    params.require(:instrument).permit(:name, :model, :details, :year, :rate, :category, :photo, :address)
  end
end
