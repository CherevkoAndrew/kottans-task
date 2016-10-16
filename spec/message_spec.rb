require_relative '../lib/message' 

describe Message do
	s = 'Hello, kottans!!!'
	m_time = Message.new s, {:life_time => 60*60}
	m_visits = Message.new s, {:number_of_visits => 2}
	m_both = Message.new s, {:life_time => 2*60*60, :number_of_visits => 1}
	it "should have destruction option" do
		expect(!!m_time.destruction_time).to eq(true)
		expect(m_visits.number_of_visits).to eq(2)
		expect(m_both.number_of_visits).to eq(1)
		expect(!!m_both.destruction_time).to eq(true)
		p m_time.destruction_time
	end
end
