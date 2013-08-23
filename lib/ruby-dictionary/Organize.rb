
#for length of tracks fill tracks
#fill morning and fill afternoon if reqd

class Organize

	def initialize()
		@obj = Conference.new()
		@eventshash = @obj.read_input
		@tracks = 0
	end
	
	def organize
		$i=0
		
		while $i < @tracks do
		   fill_track
	   
		   $i +=1
		end
	end


	def fill_track
	
		fill_morning
		
		fill_afternoon
	
	end

	def fill_morning
		#timeslot("60")
	end

	def fill_afternoon
	
	end

	def meetings

	end	
end
