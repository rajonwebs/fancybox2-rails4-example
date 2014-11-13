class AddressesController < ApplicationController

  def index
    @addresses = Address.all
  end

  def new
    @address = Address.new
    render layout: 'fancybox'
  end

  def create
    @address = Address.new(address_params)

    if @address.save
      @addresses = Address.all
    else
      @error_message = error_messages(@address)
      @error_message ||= 'Unable to create new address.'
    end
    respond_to do |format|
      format.js { render layout: false }
    end
  end

  private

  def address_params
    params.require(:address).permit(:name, :street, :city, :state, :zip)
  end

  def error_messages(record)
    return nil unless record.errors
    record.errors.full_messages.map { |msg| msg }.join('<br />')
  end
end
