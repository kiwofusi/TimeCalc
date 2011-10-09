class TimeCalc
	def self.sum(exp)
		sum_hour = sum_min = 0
		exp.split('+').each do |term|
			hour, min = term.match(/(\d+)h(\d+)m/)[1..2].map {|val| val.to_i }
			sum_hour += hour
			sum_min += min
		end
		TimeCalc.new("#{sum_hour + (sum_min/60).to_i}h#{(sum_min%60).to_i}m") # 60min以上はhourに繰り上げる
	end
	
	attr_reader :hour, :min
	def initialize(str="0h0m")
		@hour, @min = str.match(/(\d+)h(\d+)m/)[1..2].map {|val| val.to_i }
	end
	def to_s()
		"#{@hour}h#{@min}m"
	end
	def to_min()
		"#{@hour*60 + @min}m"
	end
end

