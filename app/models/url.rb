class Url < ActiveRecord::Base
	before_create :shorten
	validates :long_url, presence: true, format: {:with /^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$/}
	validates :short_url, uniqeness: true, presence: true, length: {is: 8}


	def shorten
		self.short_url = SecureRandom.urlsafe_base64(8)
	end

end

#
# 	def shorten
#     self.short_url = ([*('A'..'Z'),*('0'..'9')]-%w(0 1 I O)).sample(8).join
#   end
# end
