require 'time_calc.rb'

describe TimeCalc, "‚É‚Â‚¢‚Ä" do
	before do
		@tc = TimeCalc.new
	end
	it "new‚Å‚«‚é" do
		@tc.should_not be_nil
	end
end

describe TimeCalc, "‚ğ'2h30m'‚Ånew‚µ‚½‚Æ‚«" do
	before do
		@tc = TimeCalc.new("2h30m")
	end
	it "#hour ‚Í2‚Å‚ ‚é" do
		@tc.hour.should == 2
	end
	it "#min ‚Í30‚Å‚ ‚é" do
		@tc.min.should == 30
	end
	it "#to_s ‚Í'2h30m'‚Å‚ ‚é" do
		@tc.to_s.should == "2h30m"
	end
	it "#to_min ‚Í '150m'‚Å‚ ‚é" do
		@tc.to_min.should == "150m"
	end
end

describe TimeCalc, "‚ğ'4h50m'‚Ånew‚µ‚½‚Æ‚«" do
	before do
		@tc = TimeCalc.new("4h50m")
	end
	it "#hour ‚Í4‚Å‚ ‚é" do
		@tc.hour.should == 4
	end
	it "#min ‚Í50‚Å‚ ‚é" do
		@tc.min.should == 50
	end
	it "#to_s ‚Í'4h50m'‚Å‚ ‚é" do
		@tc.to_s.should == "4h50m"
	end
end

describe TimeCalc, "‚ÅŠÔ‚Ì‘«‚µZF" do	
	it "‘«‚µZ‚ª‚Å‚«‚é" do
		exp = "1h0m+1h30m"
		TimeCalc.sum(exp).hour.should == 2
		TimeCalc.sum(exp).min.should == 30
		TimeCalc.sum(exp).to_s.should == "2h30m"
		exp = "1h0m + 1h30m"
		TimeCalc.sum(exp).hour.should == 2
		TimeCalc.sum(exp).min.should == 30
		TimeCalc.sum(exp).to_s.should == "2h30m"
	end
	it "ŒJ‚èã‚ª‚è‚Ì‚ ‚é‘«‚µZ‚ª‚Å‚«‚é" do
		exp = "1h55m+1h30m"
		TimeCalc.sum(exp).hour.should == 3
		TimeCalc.sum(exp).min.should == 25
		TimeCalc.sum(exp).to_s.should == "3h25m"
	end
	it "3€ˆÈã‚Ì‘«‚µZ‚ª‚Å‚«‚é" do
		exp = "1h55m+1h30m+5h40m"
		TimeCalc.sum(exp).hour.should == 9
		TimeCalc.sum(exp).min.should == 5
		TimeCalc.sum(exp).to_s.should == "9h5m"
	end
	it "ˆê‚Â‚Ì€‚¾‚¯‚Å‚à“Ç‚İ‚ß‚é" do
		exp = "1h55m"
		TimeCalc.sum(exp).hour.should == 1
		TimeCalc.sum(exp).min.should == 55
		TimeCalc.sum(exp).to_s.should == "1h55m"
		
		exp = "99m"
		TimeCalc.sum(exp).hour.should == 1
		TimeCalc.sum(exp).min.should == 39
		TimeCalc.sum(exp).to_s.should == "1h39m"
	end
end