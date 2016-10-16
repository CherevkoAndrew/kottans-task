require_relative '../lib/storage'

describe Storage do
	s = Storage.new
	key = s.push Message.new "message1", {:number_of_visits => 1}
	key_t = s.push Message.new "message1", {:life_time => 0}
	it "should accept message and return key to message" do
		expect(s.get(key).read).to eq("message1")
	end
	
	it "should destroy overdue messages" do
		expect(s.get(key_t)).to eq(nil)	
	end

	it "should delete messages when \'number of visits\' condition fulfills" do
		expect(s.get(key)).to eq(nil)	
	end

	it "should return nil for nonexistent messages" do
		expect(s.get('nonexistentkey')).to eq(nil)	
	end
end 
