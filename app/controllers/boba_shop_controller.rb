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
    toppings_string = toppings.join(", ")
    size = params[:sizeInput]
    sugar = params[:sugarInput]
    ice = params[:iceInput]

    map = {
      "flavor" => flavor,
      "size" => size,
      "sugar" => sugar,
      "ice" => ice,
      "toppings" => toppings_string
    }

    newRow = BobaOrder.new(map)

    respond_to do |format|
      if newRow.save
        puts "Success!"
        format.html { redirect_to confirmation_path }
      else
        format.html { redirect_to "/" }
      end
    end
  end

  def confirmation
    @order = BobaOrder.order(created_at: :desc).first
    puts @order.inspect
  end
end
