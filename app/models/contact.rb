class Contact < ActiveRecord::Base
    validates :enquiry, presence: true
    validates :name, presence: true
    validates :email, presence: true
end
