class PinsController < ApplicationController
  before_filter :authenticate_user!, except: [:index]
  before_filter :set_pin, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @pins = Pin.all
    respond_with(@pins)
  end

  def show
    respond_with(@pin)
  end

  def new
    @pin = current_user.pins.new 
    respond_with(@pin)
  end

  def edit
    @pin = current_user.pins.find(params[:id])
  end

  def create
    @pin = current_user.pins.new(params[:pin])
    @pin.save
    respond_with(@pin)
  end

  def update
    @current_user.pins.update_attributes(params[:pin])
    respond_with(@pin)
  end

  def destroy
    @current_user.pins.destroy
    respond_with(@pin)
  end

  private
    def set_pin
      @pin = Pin.find(params[:id])
    end
end
