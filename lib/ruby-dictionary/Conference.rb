AVAILABLE_MINUTES = 420 

class Conference
	def initialize()
		@events_hash = {}
	end
	   
	#read the input and put it into eventhash
	def read_input
		events_hash = {}
		File.open('Conference.txt') do |fp|
		   fp.each do |line|
				line.split("\r").each { |ln|
						key, value = ln.reverse.split(" ", 2).map(&:reverse).reverse
						events_hash[key] = value
					}
		   end
		end
		return events_hash
	end

	#bucketize similar timings viz 60, 45, 30 and lightning
	def bucketize_time(events)
		sixty_hash = {}
		fortyfive_hash = {}
		thirty_hash = {}
		lightning_hash = {}
		events.each_pair { |key, val|
			val.split("min").each { |v|
					if v.include? "60"
						sixty_hash[key] = val
					elsif v.include? "45"
						fortyfive_hash[key] = val
					elsif v.include? "30"
						thirty_hash[key] = val
					else
						lightning_hash[key] = val
					end
				}
		}
		return sixty_hash, fortyfive_hash, thirty_hash, lightning_hash
	end
end