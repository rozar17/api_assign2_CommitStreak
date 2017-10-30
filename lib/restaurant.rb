require 'support/number_helper'

class Restaurant
  
  include NumberHelper

  #class for filepath.
  # this is only used within this class
  @@filepath = nil

  # So filepath can be called outside of this class
  def self.filepath=(path=nil)
  	@@filepath = File.join(APP_ROOT, path)
  end



  #attr_accessor, so can read and write
  attr_accessor :name, :cuisine, :price




  #class method as it has 'self' at the start
  def self.file_exists?
  	# class should know if the restaurant file exists
  	if @@filepath && File.exists?(@@filepath)
	  return true
	else
	  return false
  	end
  end


  def self.file_usable?
    return false unless @@filepath
    return false unless File.exists?(@@filepath)
    return false unless File.readable?(@@filepath)
    return false unless File.writable?(@@filepath)
    return true
  end

  #class method as it has 'self' at the start
  def self.create_file
    # create the restuarant file
    File.open(@@filepath, 'w') unless file_exists?
    return file_usable?
   end



  #class method as it has 'self' at the start
  def self.save_restaurants
    # read the restaurant file
    restaurants = [] #read file each time
    if file_usable?
      file = File.new(@@filepath, 'r') #'r' for reading
      file.each_line do |line|
        restaurants << Restaurant.new.import_line(line.chomp)
      end
      file.close
    end
    # return instances of restaurant
    return restaurants
  end




 #class method
 def self.build_using_questions
    args = {}

    print "Restaurant name: "
    args[:name] = gets.chomp.strip

    print "Cuisine type: " 
    args[:cuisine] = gets.chomp.strip

    print "Average price: "
    args[:price] = gets.chomp.strip
  
    return self.new(args)  
 end




  def initialize(args={})
    @name    = args[:name]    || ""
    @cuisine = args[:cuisine] || ""
    @price   = args[:price]   || ""
  end
  




  def import_line(line)
    line_array = line.split("\t")
    @name, @cuisine, @price = line_array
    return self
  end




  #instance method
  def save #open file and write to it
    return false unless Restaurant.file_usable?
    File.open(@@filepath, 'a') do |file| #'a' means append
      file.puts "#{[@name, @cuisine, @price].join("\t")}\n"
    end
    return true
  end



  def formatted_price
    number_to_currency(@price)
  end

end