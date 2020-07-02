class ProductsController < ApplicationController
  def index
    def index
      @products = Product.all
    end
  end
  def show
  end

  # 商品出品
  def new
  end
end
