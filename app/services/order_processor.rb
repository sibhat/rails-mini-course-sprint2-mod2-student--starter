class OrderProcessor
    attr_reader :order, :products
    def initialize(order)
        @order = order
        @products = @order.products
    end

    def ship
        if products_available?
            products.each do |product|
                product.reduce_inventory
            end
            order.ship
        else
            return false
        end
    end
    private 
    def products_available?
        is_available = true
        products.each do |product|
            if(!product.available?)
                is_available = false
            end
        end
        is_available
    end
end