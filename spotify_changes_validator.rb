require 'json'
require 'json-compare'

# Load original and changes files
spotify_file = File.read(ARGV[0])
spotify_changes_file = File.read(ARGV[1])

# Parse json and assign variablese
old, new = JSON.parse(spotify_file), JSON.parse(spotify_changes_file)

# Get the diff result
result = JsonCompare.get_diff(old, new)

# Print the changes
puts result
