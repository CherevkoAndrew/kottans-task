require_relative '../lib/message' 

describe Message do
	s = 'Hello, kottans!!!'
	m_time = Message.new '1:'+s, {:life_time => 60*60}
	m_visits = Message.new '2:'+s, {:number_of_visits => 2}
	m_both = Message.new '3:'+s, {:life_time => 2*60*60, :number_of_visits => 1}
	m_t0 = Message.new '4'+s, {:life_time => 0}
	m_v0 = Message.new '5'+s, {:number_of_visits => 0}

	it "should accept destruction option" do
		expect(m_t0).to_not be_alive
		expect(m_v0).to_not be_alive
		expect(m_time).to be_alive
		expect(m_visits).to be_alive
		expect(m_both).to be_alive
	end
	
	it "should store message" do
		expect(m_time.read).to eq('1:'+s)
		expect(m_visits.read).to eq('2:'+s)
	end

	it "should use \'number of visits\' option" do
		expect(m_visits.read).to eq('2:'+s)
		expect(m_visits).to_not be_alive
	end
end
