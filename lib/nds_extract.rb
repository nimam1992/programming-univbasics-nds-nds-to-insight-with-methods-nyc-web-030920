$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'directors_database'

directors_database
# Find a way to accumulate the :worldwide_grosses and return that Integer
# using director_data as input
def gross_for_director(director_data)
total = 0
movie_index = 0
  while movie_index<director_data[:movies].length do
    total+=director_data[:movies][movie_index][:worldwide_gross]
    movie_index+=1
  end
total
end

# Write a method that, given an NDS creates a new Hash
# The return value should be like:
#
# { directorOne => allTheMoneyTheyMade, ... }
def directors_totals(nds)
  def gross_for_director(array,key,value)
    director_total = 0
    while value < array[key][:movies].length do
      director_total+=array[key][:movies][value][:worldwide_gross]
      value+=1
    end
    director_total
  end

result = {}

director_index = 0

while director_index < nds.length do
  d_name=nds[director_index][:name]
  result[d_name] = 0
    result[d_name] += gross_for_director(nds,director_index,movie_index)
    director_index+=1
  end
result
end

pp directors_database
