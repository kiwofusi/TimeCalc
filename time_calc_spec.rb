require 'time_calc.rb'

describe TimeCalc, "について" do
	before do
		@tc = TimeCalc.new
	end
	it "newできる" do
		@tc.should_not be_nil
	end
end

describe TimeCalc, "を'2h30m'でnewしたとき" do
	before do
		@tc = TimeCalc.new("2h30m")
	end
	it "#hour は2である" do
		@tc.hour.should == 2
	end
	it "#min は30である" do
		@tc.min.should == 30
	end
	it "#to_s は'2h30m'である" do
		@tc.to_s.should == "2h30m"
	end
	it "#to_min は '150m'である" do
		@tc.to_min.should == "150m"
	end
end

describe TimeCalc, "を'4h50m'でnewしたとき" do
	before do
		@tc = TimeCalc.new("4h50m")
	end
	it "#hour は4である" do
		@tc.hour.should == 4
	end
	it "#min は50である" do
		@tc.min.should == 50
	end
	it "#to_s は'4h50m'である" do
		@tc.to_s.should == "4h50m"
	end
end

describe TimeCalc, "で時間の足し算：" do	
	it "足し算ができる" do
		exp = "1h0m+1h30m"
		TimeCalc.sum(exp).hour.should == 2
		TimeCalc.sum(exp).min.should == 30
		TimeCalc.sum(exp).to_s.should == "2h30m"
		exp = "1h0m + 1h30m"
		TimeCalc.sum(exp).hour.should == 2
		TimeCalc.sum(exp).min.should == 30
		TimeCalc.sum(exp).to_s.should == "2h30m"
	end
	it "繰り上がりのある足し算ができる" do
		exp = "1h55m+1h30m"
		TimeCalc.sum(exp).hour.should == 3
		TimeCalc.sum(exp).min.should == 25
		TimeCalc.sum(exp).to_s.should == "3h25m"
	end
	it "3項以上の足し算ができる" do
		exp = "1h55m+1h30m+5h40m"
		TimeCalc.sum(exp).hour.should == 9
		TimeCalc.sum(exp).min.should == 5
		TimeCalc.sum(exp).to_s.should == "9h5m"
	end
	it "一つの項だけでも読み込める" do
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