class Card < ApplicationRecord
    has_many :charges

    null_to_zero_balance
    #just allow for all charges rather than 
    def all_charge_value
        self.charges.sum(:value)
    end

    def null_to_zero_balance
        self.balance == 0 ? 0.0 : null
    end

    null_to_zero_balance
end
