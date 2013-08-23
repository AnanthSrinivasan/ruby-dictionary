require 'C:\git\ruby-dictionary\lib\ruby-dictionary\Conference.rb'

MORNING = 180
AFTERNOON = 240
class HelperUtil
	
	def initialize()
		@obj = Conference.new()
		@eventshash = @obj.read_input
		@sixty, @fortyfive, @thirty, @lightning = @obj.bucketize_time(@eventshash) 
		@tracks = 0
	end

	def tracks_required
		@tracks = (total_minutes%AVAILABLE_MINUTES == 0) ? 
		total_minutes/AVAILABLE_MINUTES : total_minutes/AVAILABLE_MINUTES + 1
	end

	#check for empty hash and convert to int, empty hash will add 0 mins
	def total_minutes
		minutes = (@sixty.size * 60 unless @sixty.empty?).to_i + 
			(@fortyfive.size * 45 unless @fortyfive.empty?).to_i +
			(@thirty.size * 30 unless @thirty.empty?).to_i +
			(@lightning.size * 5 unless @lightning.empty?).to_i
	end
	
	def remaining_mins(sixty, fortyfive, thirty, lightning)
		minutes = (sixty.size * 60 unless sixty.empty?).to_i + 
			(fortyfive.size * 45 unless fortyfive.empty?).to_i +
			(thirty.size * 30 unless thirty.empty?).to_i +
			(lightning.size * 5 unless lightning.empty?).to_i
	end
	
	def timeslot(slot)
		case slot
		when "60"
			unless @sixty.empty? 
				puts "#{@sixty.first[0]} #{@sixty.first[1]}"
				@sixty.delete(@sixty.first[0])
			end
		when "45"
			unless @fortyfive.empty? 
				puts "#{@fortyfive.first[0]} #{@fortyfive.first[1]}"
				@fortyfive.delete(@fortyfive.first[0])	
			end
		when "30"
			unless @thirty.empty?
				puts "#{@thirty.first[0]} #{@thirty.first[1]}"
				@thirty.delete(@thirty.first[0])	
			end
		when "lightning"
			unless @lightning.empty?
				puts "#{@lightning.first[0]} #{@lightning.first[1]}"
				@lightning.delete(@lightning.first[0])	
			end
		else
			puts 'else'
		end
	end
	
	def sixty(sixty)
		minutes = (sixty.size * 60 unless sixty.empty?).to_i 
	end

	def fortyfive(fortyfive)
		minutes = (fortyfive.size * 45 unless fortyfive.empty?).to_i 
	end

	def thirty(thirty)
		minutes = (thirty.size * 30 unless thirty.empty?).to_i 
	end

	def lightning(lightning)
		minutes = (lightning.size * 5 unless lightning.empty?).to_i 
	end

end

obj = Conference.new
eventshash = obj.read_input
sixty, fortyfive, thirty, lightning = obj.bucketize_time(eventshash) 
obje = HelperUtil.new

obje.timeslot("60")
obje.timeslot("lightning")
obje.timeslot("45")
obje.timeslot("lightning")

puts obje.sixty(sixty)
puts obje.fortyfive(fortyfive)
puts obje.thirty(thirty)
puts obje.lightning(lightning)
