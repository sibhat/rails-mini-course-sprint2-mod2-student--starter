class Order < ApplicationRecord
    attr_reader :products, :order
    def products
        @product_ids = OrderProduct.where(order_id: id).pluck(:product_id)
        @products = Product.find(@product_ids)
    end

    def shippable?
        products
        products.length >= 1 && status != "shipped"
    end
    def ship
        unless shippable?
            return false
        end
        if update(status: "shipped")
            return true
        else
            return false
        end
    end

end

