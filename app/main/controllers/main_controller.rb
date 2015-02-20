# By default Volt generates this controller for your Main component
class MainController < Volt::ModelController

  
  def index
   
  end
 
 
  
  
  def about
    # Add code for when the about view is loaded
  end
	
	
	
	def sample_text
		"In Volt, to simplify managing application state, all application state is kept in models that can optionally be persisted in different locations. By centralizing the application state, we reduce the amount of complex code needed to update a page. We can then build our page's html declaratively. The relationships between the page and it's models are bound using function and method calls."
	end
	
	
	def set_sample_text_array
	
		@splits = sample_text.split(" ")
		
		@splits 
	end
	
	
	
	
  def user_array
 		 page._new_player.split(' ') 
	end	
	
	
	def check_mistakes
		
		popped_array = user_array
		popped_array.pop
		@mistakes = popped_array - set_sample_text_array

	end
	
	
	def set_accuracy(full_array, mistakes_array)
			correct_words_length = (full_array.length - mistakes_array.length)
			fraction = correct_words_length / full_array.length
			percentage = (fraction * 100).round
	end
	
	  
	def accuracy
		return set_accuracy(user_array, check_mistakes)# I can also use the equation to the right, but its not as accuarate (net_wpm/gross_wpm * 100).round
	end
	
	def accuracy_rounded #nearest multiple of 5
			((((accuracy / 10) * 2).round) / 2) * 10   
			
	end
	
	
	def difference
		local_store._time_elapsed = (Time.now - page._start_time).round
		page._seconds_elapsed = local_store._time_elapsed
	end
	
	
 def minute_conversion           
   time = page._seconds_elapsed / 60
 	
 end 
	


	def find_character_length
			string = page._new_player
			string.length 	
	end
	
	def find_word_num
	   words =	find_character_length / 5
		 page._words = words	
		return words	
		end
	
  def start_time
		page._start_time = Time.new
		
	end

	
	def play
		if find_character_length == 1
			start_time   #this actually does a good job on restarting the countdown, might need to put it in its own method

		else
			nil
		end
		difference
		
		
	end
	
	
	
	
	def gross_wpm
		(page._words / minute_conversion).round
	end
	
	def net_wpm 
     errors_per_min =  (check_mistakes.count / minute_conversion).round
		 net_wpm = gross_wpm - errors_per_min
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
