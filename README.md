# Buildbook Exercise for Leah Armstrong 5/11/23

## The Task:

Create a tool that will:
* Delete an existing playlist
* Add songs to an existing playlist
* Create a new playlist

The tool should run with the following arguments:
`service_file.rb spotify_file.json changes_file.json output_file.json`

## The Solution:
* Create a ruby executable (`spotify_service.rb`) that will process the changes
* Create a `changes.json` file that will contain JSON indicating what the task is and what data to change
* Create a Playlist module to house all of the methods associated with playlist functionality
* Output the new spotify data to a file determined by an arugment (`output-file.json`)

The command to run:
`ruby spotify_service.rb spotify.json changes.json output-file.json`

## Validating the changes

I've created an additional executable (`spotify_changes_validator.rb`) that will allow you to compare the output of the changes file.

To run:
* Install json-parser - `gem install json-parser`
* Run the executable - `ruby spotify_changes_validator.rb spotify.json output-file.json`
* Changes will be output to the command line

## Scalability

While this would be better handled with CRUD logic handled by rails or another application, scalability can be maintained through modules which separate concerns. 

Priorities would include the following:
* Song, and user functionality
* Ability to remove songs from playlists
* Shared validation logic between modules
* Ability to digest data through an API endpoint

## Thoughts

The structure I've created keeps concerns separated and logic contained, but leaves some room for improvement in terms of handling errors and providing better validation. The logic does prevent unassigned or misassigned updates but doesn't properly display errors efficiently. The changes file does a reasonable job of allowing different actions but doesn't account for a way to handle removing songs from playlists. I'd likely integrate this by passing negative integers for records to be remove and strip those from the records rather than append.

## Time Spent

The task took me about an hour and a half, but that was mostly spent optimizing the data froma a single file into modules. I felt as though the organization helped make the code more legible and expandable, along with keeping files shorter.

Overall this was a fun challenege and I appreciate your time looking over my work. 

Thanks!
Leah Armstrong
