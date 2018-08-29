class Poi < ApplicationRecord
    validates :name, presence: true, length: {minimum:3 }
    validates :x, presence: true, 
        numericality: { only_integer: true,
                        greater_than: 0 }
    validates :x, presence: true, 
        numericality: { only_integer: true,
        greater_than: 0 }

    scope :elect_pois_by_max_dist, ->(x,y,max_dist) {
        where("sqrt(pow((? - x),2) + pow((? - y),2)) <= ?", x,y, max_dist)
    }
end
