class PoiValidator
    include ActiveModel::Model
    attr_accessor :x, :y, :max_dist
    validates :max_dist, presence: true, 
            numericality: { only_integer: true,
            greater_than: 0 }
    validates :x, presence: true, 
        numericality: { only_integer: true,
            greater_than: 0 }
    validates :y, presence: true, 
        numericality: { only_integer: true,
            greater_than: 0 }
end