require_relative'../../config/environments/init'

class CreateUrls < ActiveRecord::Migration
	def change
		create_table :urls do |x|
			x.string :long_url
			x.string :short_url
			x.integer :counter
		end
	end
end
