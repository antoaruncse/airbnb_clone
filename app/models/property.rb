class Property < ActiveRecord::Base
    belongs_to :user,foreign_key: "user_id" 
    has_many :bookings,dependent: :destroy
    validates :accomodates,presence: true
    validates :city,presence: true
    validates :address,presence: true
    validates :price_night,presence: true
    validates :title,presence: true
    scope :search_city , lambda{ |city,user|  {:conditions => ["city = ? and user_id !=?",city,user] }  }

end
