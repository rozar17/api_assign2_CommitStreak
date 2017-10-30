require 'restaurant' # to use for Restaurant class below
require 'support/string_extend'

class Guide
	
	class Config #you can have a class within a class
	  @@actions = ['list', 'find', 'add', 'quit'] #what users are allowed to do
	  def self.actions; @@actions; end #Ruby uses ; if coding on same line
	end


  #get things started.
  # Finds a path located here
  def initialize(path=nil)
  	# locate the restaurant text file at path
  	
  	# Calling Restaurant class
  	Restaurant.filepath = path
  	#if Restaurant.file_exists?
  	if Restaurant.file_usable?
  	  puts "Found restaurant file."

  	# or create a new file
  	elsif Restaurant.create_file
  	  puts "Created restaurant file."

  	# exit if create fails
    else
      puts "Exiting. \n\n"
      exit! #abort the script
    end
  	
  	

  end



  # the ! means its turbo charge.
  # ! means its a strong and powerful method
  def launch!
  	introduction
  	# action loop
  	#loop do
  	# below is better than 'loop do'
  	result = nil
  	until result == :quit

  		action, args = get_action #make sure the input is valid before continuing on
	  	#  do that action
	  	result = do_action(action, args)
	  	# repeat until user quits
	  	#break if result == :quit #remove this... only use for 'loop do'

  	end
  	conclusion
  end


  def get_action
    action = nil #initialise action

    # Keep asking for user input until we get a valid action
    until Guide::Config.actions.include?(action)
      puts "Actions: " + Guide::Config.actions.join(", ") if action
  		#  what do you want to do? (list, find, add, quit)
  		# user prompt
  		print "> "
  	  user_response = gets.chomp
  	  args = user_response.downcase.strip.split(' ') #eg. if user types LIST instead of list, the program will still work, including spaces, etc
  	  action = args.shift #shift moves it out of the args
    end
    return action, args #args used for Finding Restaurant
  end




  def do_action(action, args=[])
    case action
    when 'list'
      #puts "Listing..."
      #Option1 code
      #list

      #Option2 code - for sorting the restaurant list
      list(args)
    when 'find'
      #puts "Finding..."
      keyword = args.shift #remove the fist args
      find(keyword)
    when 'add'
      #puts "Adding..."
      add # method
    when 'quit'
      return :quit
    else
  	  puts "\nI don't understand that command. \n"
    end

  end



  def list(args=[])
  	# Sorting code
  	sort_order = args.shift
  	sort_order = args.shift if sort_order =='by'
  	sort_order ||= "name"
  	sort_order = "name" unless ['name', 'cuisine', 'price'].include?(sort_order)
  		

    #puts "\nListing restaurants\n\n".upcase

    output_action_header("Listing restaurants")

    restaurants = Restaurant.save_restaurants #Get restaurants records

    #Sort restaurant list
    restaurants.sort! do |r1, r2| #r1 and r2 are comparison
    	case sort_order
    	when 'name' #when its equal to name
    		r1.name.downcase <=> r2.name.downcase
    	when 'cuisine'
    		r1.cuisine.downcase <=> r2.cuisine.downcase
    	when 'price'
    		r1.price.to_i <=> r2.price.to_i
    	end
      
    end

    #Coding option 1
    #restaurants.each do |rest|
    #  puts rest.name + " | " + rest.cuisine + " | " + rest.formatted_price 
    #end
    
    #Coding option 2
    output_restaurant_table(restaurants) #OUtput restaurants records
    #Sort restaurant list message to user
    puts "Sort using: 'list cuisine' or 'list by cuisine'\n\n"
  end




  def find(keyword="") #keyword is getting info from get_action method
    output_action_header("Find a restaurant")
    if keyword
        #search
        #restaurants below is an array
        restaurants = Restaurant.save_restaurants
        found = restaurants.select do |rest|
		       rest.name.downcase.include?(keyword.downcase) ||
		       rest.cuisine.downcase.include?(keyword.downcase) ||
		       rest.price.to_i <= keyword.to_i
        end
        output_restaurant_table(found)
    else
	  	puts "Find using a key phrase to search the restaurant list."
	  	puts "Examples: 'find tamale', 'find Mexican', 'find mex'\n\n"
    end
  end





  def add
    #Old code
    #puts "\nAdd a restaurant\n\n".upcase

    #New code
    output_restaurant_table("Add a restaurant")

    ## Coding Option 1
    #restaurant = Restaurant.new # create a new restaurant. This is a new instance of Restaurant
    #print "Restaurant name: "
    #restaurant.name = gets.chomp.strip #eg. if user types LIST instead of list, the program will still work, including spaces, etc

    #print "Cuisine type: " 
    #restaurant.cuisine =  gets.chomp.strip #eg. if user types LIST instead of list, the program will still work, including spaces, etc

    #print "Average price: "
    #restaurant.price =  gets.chomp.strip #eg. if user types LIST instead of list, the program will still work, including spaces, etc




    ## Coding Option 2
    #args = {}

    #print "Restaurant name: "
    #args[:name] = gets.chomp.strip

    #print "Cuisine type: " 
    #args[:cuisine] = gets.chomp.strip

    #print "Average price: "
    #args[:price] = gets.chomp.strip
  
    #restaurant = Restaurant.new(args)




    ## Coding Option 3
    restaurant = Restaurant.build_using_questions


    #append to file
    if restaurant.save
      puts "\nRestuarant Added\n\n"
    else
      puts "\nSave Error: Restuarant not added\n\n"
    end

  end




  def introduction
  	puts "\n\n<<< Welcome to the Food Finder >>>\n\n"
  	puts "This is an interactive guide to help you find the food you crave. \n\n"
  end




  def conclusion
  	puts "\n<<< Goodbye and Bon Appetit! >>>\n\n\n"
  end


  private

  def output_action_header(text)
    puts "\n#{text.upcase.center(60)}\n\n" #60 character space
  end


  def output_restaurant_table(restaurants=[])
    print " " + "Name".ljust(30) #left justified 30 characters
    print " " + "Cuisine".ljust(30) #left justified 30 characters
    print " " + "Price".ljust(6) + "\n" #left justified 30 characters
    puts "-" * 60 #add 60 dashes

    restaurants.each do |rest|
      line = " " << rest.name.titleize.ljust(30)
      line << " " + rest.cuisine.titleize.ljust(20)
      line << " " + rest.formatted_price.ljust(6)
      puts line
    end

    puts "No listings found" if restaurants.empty?
    puts "-" * 60

  end
end