require 'json'
require_relative "playlists"
# require 'pry'

include Playlists

# Import Spotify JSON
spotify_file = File.read(ARGV[0])
# Import Changes JSON
changes_file = File.read(ARGV[1])

# Create JSON objects from the file contents
@spotify = JSON.parse(spotify_file)
@changes = JSON.parse(changes_file)

def process_change(object)
  case object["type"]
  when "playlist"
    @spotify["playlists"] = Playlists.process(object, @spotify["playlists"])
  when "song"
    puts "song"
  when "user"
    puts "user"
  else
    raise alert: "Invalid object type #{object}"
  end
end

@changes["changes"].each do |change|
  process_change(change)
end

puts JSON.pretty_generate(@spotify)

File.write(ARGV[2], JSON.dump(@spotify))
