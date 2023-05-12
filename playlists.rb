module Playlists
  # Find a playlist by it's ID from the Spotify records
  def get_by_id_and_owner_id(id, owner_id)
    @playlists.find { |playlist| playlist["id"] == id && playlist["owner_id"] == owner_id }
  end

  # Create a playlist
  def create(playlist)
    new_playlist = {
      "id" => "#{@playlists.last["id"].to_i + 1}", # Needs optimized to largest ID
      "owner_id"  => playlist["owner_id"],
      "song_ids"  => playlist["song_ids"]
    }
    @playlists.append(new_playlist)
  end

  # Update a playlist
  def update(playlist, object)
    if playlist["song_ids"].any?
      playlist["song_ids"].concat(object["song_ids"])
    end
  end

  # Destroy a playlist
  def destroy(playlist)
    @playlists.delete(playlist)
  end

  # Determine status change and apply
  def self.process(object, playlists)
    @playlists = playlists
    playlist = get_by_id_and_owner_id(object["id"], object["owner_id"]) if object["id"]
    case object["action"]
    when "create"
      puts "### Creating Playlist"
      puts "### Playlist Created" if create(object)
    when "update"
      puts "### Updating Playlist"
      puts "### Playlist Updated" if update(playlist, object)
    when "destroy"
      puts "### Playlist Destroyed" if destroy(playlist)
    else
      raise alert: "Invalid object type #{object}"
    end
    @playlists
  end
end
