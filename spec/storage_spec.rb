require_relative '../lib/storage'

describe Storage do
	s = Storage.new
	it "should accept message and return key" do
		key = s.push Message.new "message1", {:number_ofvisits => 1}
	end
	
	it "should search message by key" do
		expect(s.get(key).message).to be
	end
	
	it "should destroy overdue messages" do

	end

	it "should delete messages when \'number of visits\' condition fulfills" do
		
	end

	it "shouldn`t return messages with 0-lifetime" do
		
	end

	it "shouldn`t return messages with 0-visits" do

	end
end 
