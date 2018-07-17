class Contact < ApplicationRecord

	validates_presence_of :first_name, :last_name, :email
	validates :email, uniqueness: true

	# def Contact
	# 	Contact.order("contacts.id ASC")
	# end

end
