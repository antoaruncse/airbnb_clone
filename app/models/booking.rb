class Booking < ActiveRecord::Base
    belongs_to :property,foreign_key: "property_id" 
    belongs_to :user,foreign_key: "user_id" 
    
    validates :check_in_date,presence: true
    validates :check_out_date,presence: true
   

    scope  :booked_property, lambda{ |check_in_date,check_out_date | {:conditions => ["check_in_date between  ? AND  ? ",check_in_date,check_out_date]}}
    scope :history_by_property, lambda{|property_id| {:conditions => ["property_id =? ",property_id]}}
   
  
end
