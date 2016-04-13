class PalletController < ApplicationController
  def index

  end

  def show
    pallets =  Item.where("pallet_id = ?",params[:id])
    @total = Money.new(0,'USD')
    pallets.each do  |p|
      if !p.retail_price.nil?
        s = p.retail_price[1..p.retail_price.size]
        s = s.to_f
        s = Money.new(s,'USD')
        @total += s
      end
    end
  end

end
