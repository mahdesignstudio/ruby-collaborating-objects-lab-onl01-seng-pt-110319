require 'pry'

class Artist 
 #setter/getter 
 attr_accessor :name
 @@all = [] 
 #assigning a class variable to an empty Array

 
 #accepts a name for the artist
  def initialize(name)
    @name = name #sets the artist name 
    @@all << self 
  end 
    
  def self.all 
    @@all 
  end 
  
  #list all songs that belong to Artist 
  def songs 
    Song.all.select {|s|s.artist == self} 
  end 
  
  #add_song will keep track of an artist's song. 
  
  def add_song(song)
    song.artist = self 
  end 
  
  #find_or_create_by_name will always return an Artist instance 
  
  def self.find_or_create_by_name(name)
    self.all.find {|artist| artist.name == name} || self.new(name)
  end 
  
  #print_songs will list all of the artist's songs
  
  def print_songs
    self.songs.each{|s| puts s.name} 
 end
end  
 