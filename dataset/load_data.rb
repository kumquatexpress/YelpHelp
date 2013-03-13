##!/bin/ruby

#require 'mysql2'
#require 'json'

#HOST = "174.129.210.6"
#USERNAME = "root"
#PASSWORD = ""
#PORT = "3307"
#DATABASE = "yelp"

#begin
	#c = Mysql2::Client.new(
		#:host => HOST, 
		#:username => USERNAME, 
		#:password => PASSWORD,
		#:port => PORT,
		#:database => DATABASE,
		#)
	#print "name of file?\n"
	#filename = gets.chomp
	#JSON.parse(open(filename).read).each do |obj|
		#obj.each_key do |k|
			#puts k
		#end
	#end
#rescue (Mysql2::Error e)
	#puts "Error occured"
#ensure
	#c.close if c
#end

def find_all_types(file)
	types = {}
	JSON.parse(file.read).each do |obj|
		unless types[obj['type']]
			types[obj['type']] = obj.keys.zip(obj.values.map{|x| x.class})
		end
	end
	f = File.open("types.txt", 'w')
	f.write(types)
	f.close
end