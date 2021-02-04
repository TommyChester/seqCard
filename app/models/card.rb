class Card < ApplicationRecord
    has_many :charges

    def all_charges
        self.charges
    end
end
