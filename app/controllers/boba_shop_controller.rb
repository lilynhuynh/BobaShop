class BobaShopController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    puts "----------------- In Index -----------------"
    @allOrders = BobaOrder.all
    @slideshowImages = Dir.glob("app/assets/images/slideshow/*.png").map { |path| File.basename(path) } # Returns all image names in slideshow
    puts "# of orders = #{@allOrders.size}"
  end

  def menu
  end

  def order
  end

  def orderBoba
    puts "----------------- In Order Boba -----------------"

    flavor = params[:flavorInput]
    toppings = params[:toppingsInput] || []
    size = params[:sizeInput]
    sugar = params[:sugarInput]
    ice = params[:iceInput]

    map = {
      "flavor" => flavor,
      "size" => size,
      "sugar" => sugar,
      "ice" => ice,
      "toppings" => toppings
    }

    newRow = BobaOrder.new(map)

    respond_to do |format|
      if newRow.save
        puts "Success!"
      else
        format.html { redirect_to "/" }
      end
    end
  end
end
