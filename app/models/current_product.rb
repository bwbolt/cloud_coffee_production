class CurrentProduct < ApplicationRecord
  belongs_to :user


def self.names 
    all.map {|current_product| current_product.name}
end
end
