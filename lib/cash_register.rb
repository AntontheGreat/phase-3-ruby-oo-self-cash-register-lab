require 'pry'
class CashRegister
    # attr_accessor gets both getter "attr_reader" and setter "attr_writer" in one macro
    attr_accessor :discount, :total, :items, :last_item_price

    def initialize(discount=0) #(discount=nil) passes the test too.
        @discount = discount
        @total = 0
        @items = []
    end

    def add_item(title, price, quantity=1)
        self.total += price * quantity
        quantity.times { items << title }
        self.last_item_price = price * quantity
    end

    def apply_discount
        if discount > 0 && total
            self.total = (self.total * (1 - discount/100.0)).to_i
            "After the discount, the total comes to $#{self.total}."
        else 
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        
        self.total -= self.last_item_price
    end
end