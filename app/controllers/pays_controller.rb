class PaysController < ApplicationController

  def index
    @pay_address = PayAddress.new
  end
end
