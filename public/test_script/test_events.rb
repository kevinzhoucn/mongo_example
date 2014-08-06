MetaProg::RedFlag.new.event "an event that always happens" do
  true
end

MetaProg::RedFlag.new.event "an event that never happens" do
  false
end