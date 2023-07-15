class OrderRequest < ApplicationRecord
    belongs_to :user
    has_many :order_pieces, dependent: :delete_all



    # all with status code of 0
    def self.pending
        where(status: 0)
    end

    def self.completed
        where(status: 1)
    end

    def self.paid 
        where(status: 2)
    end

end
