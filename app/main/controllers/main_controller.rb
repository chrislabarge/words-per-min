# By default Volt generates this controller for your Main component
class MainController < Volt::ModelController

  
  def index
   
  end
 
 
  
  
  def about
    # Add code for when the about view is loaded
  end
	
	
	
	def stop_time
		page._new_time = 0
	end
	
	  
	def difference
		local_store._time_diff = (Time.now - page._start_time).round
	end
	
	
 #def minute_conversion           <-----this totally killed the app
 #	local_store.time_diff/ 60
 #end 
	
	def start_time
		page._start_time = Time.new
		
	end
	
	 

	
	
	
	def find_character_length
			string = page._new_player
			string.length 	
	end
	
	def find_word_num
	   words =	find_character_length / 5
	end
	
	
	def find_gross_wpm
		if find_character_length == 1
			start_time
		else
			nil
		end
		yolo = difference
		return find_word_num.to_i / yolo
		
	end
	
  private

  # The main template contains a #template binding that shows another
  # template.  This is the path to that template.  It may change based
  # on the params._controller and params._action values.
  def main_path
    params._controller.or('main') + '/' + params._action.or('index')
  end

  # Determine if the current nav component is the active one by looking
  # at the first part of the url against the href attribute.
  def active_tab?
    url.path.split('/')[1] == attrs.href.split('/')[1]
  end
end
