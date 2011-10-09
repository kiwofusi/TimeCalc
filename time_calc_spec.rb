require 'time_calc.rb'

describe TimeCalc, "�ɂ���" do
	before do
		@tc = TimeCalc.new
	end
	it "new�ł���" do
		@tc.should_not be_nil
	end
end

describe TimeCalc, "��'2h30m'��new�����Ƃ�" do
	before do
		@tc = TimeCalc.new("2h30m")
	end
	it "#hour ��2�ł���" do
		@tc.hour.should == 2
	end
	it "#min ��30�ł���" do
		@tc.min.should == 30
	end
	it "#to_s ��'2h30m'�ł���" do
		@tc.to_s.should == "2h30m"
	end
	it "#to_min �� '150m'�ł���" do
		@tc.to_min.should == "150m"
	end
end

describe TimeCalc, "��'4h50m'��new�����Ƃ�" do
	before do
		@tc = TimeCalc.new("4h50m")
	end
	it "#hour ��4�ł���" do
		@tc.hour.should == 4
	end
	it "#min ��50�ł���" do
		@tc.min.should == 50
	end
	it "#to_s ��'4h50m'�ł���" do
		@tc.to_s.should == "4h50m"
	end
end

describe TimeCalc, "�Ŏ��Ԃ̑����Z�F" do	
	it "�����Z���ł���" do
		exp = "1h0m+1h30m"
		TimeCalc.sum(exp).hour.should == 2
		TimeCalc.sum(exp).min.should == 30
		TimeCalc.sum(exp).to_s.should == "2h30m"
		exp = "1h0m + 1h30m"
		TimeCalc.sum(exp).hour.should == 2
		TimeCalc.sum(exp).min.should == 30
		TimeCalc.sum(exp).to_s.should == "2h30m"
	end
	it "�J��オ��̂��鑫���Z���ł���" do
		exp = "1h55m+1h30m"
		TimeCalc.sum(exp).hour.should == 3
		TimeCalc.sum(exp).min.should == 25
		TimeCalc.sum(exp).to_s.should == "3h25m"
	end
	it "3���ȏ�̑����Z���ł���" do
		exp = "1h55m+1h30m+5h40m"
		TimeCalc.sum(exp).hour.should == 9
		TimeCalc.sum(exp).min.should == 5
		TimeCalc.sum(exp).to_s.should == "9h5m"
	end
	it "��̍������ł��ǂݍ��߂�" do
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