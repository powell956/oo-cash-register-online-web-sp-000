class CashRegister
    attr_accessor :total, :discount, :last_transaction

    def initialize(discount = nil)
        @total = 0
        @discount = discount
        @items = []
        @last_transaction = {}
    end 

    def total
        @total
    end

    def add_item(item, price, quantity = 1)
        added = 0
        until added == quantity
            @items << item
            @total += price
            added += 1
        end
        @last_transaction = price * quantity
    end

    def apply_discount
        if @discount
            discount_percent = @discount.to_f / 100
            amount_saved = @total * discount_percent
            @total = @total - amount_saved
            @total = @total.to_i
            "After the discount, the total comes to $#{@total}."
        else
            "There is no discount to apply."
        end
    end

    def items
        @items 
    end

    def void_last_transaction
        @total = @total - @last_transaction
    end 
end
