class CashRegister
    attr_accessor :total, :discount, :items, :last_transaction
  
    def initialize(discount = 0)
      @total = 0
      @discount = discount
      @items = []
      @last_transaction = nil
    end
  
    def add_item(title, price, quantity = 1)
      quantity.times { @items << title }
      transaction_total = price * quantity
      @total += transaction_total
      @last_transaction = transaction_total
    end
  
    def apply_discount
      if discount > 0
        discount_amount = (@total * @discount) / 100
        @total -= discount_amount
        "After the discount, the total comes to $#{@total}."
      else
        "There is no discount to apply."
      end
    end
  
    def void_last_transaction
      @total -= @last_transaction
      @items.pop
      @last_transaction = nil
      @total = 0 if @items.empty?
    end
  end
  
