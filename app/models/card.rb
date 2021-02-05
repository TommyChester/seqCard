class Card < ApplicationRecord
    has_many :charges

    #just allow for all charges rather than 
    def all_charge_value
        self.charges.sum(:value)
    end

    #If the date of any charges are older than the updated_at then 
    #we update the balance, however I could image updating balance 
    #for a number of things so I am going to just look to see charges
    #are older first.
    def charges_are_older?
        self.charges.where("updated_at > ?", self.updated_at).present?
    end

    #update balance
    def update_balance
        return unless charges_are_older?
        self.balance += self.charges.where("updated_at > ?", self.updated_at).sum(:value)
        self.save!
    end

    #Now I really struggle with whether to update the balance before
    #checking, but I know that I can on my card run transactions over
    #limit in a short period of time (i've done it). So for realism I
    #did not. 
    def limit_reached?
        return false unless self.balance >= self.limit
        true
    end

    def available_balance
        update_balance if charges_are_older?
        self.limit - self.balance
    end

end
