class InstrumentsController < ApplicationController
  def index
    @instruments = Instrument.all
  end

  def show
    set_instrument
  end

  private

  def set_instrument
    @instrument = Instrument.find(params[:id])
  end
end
