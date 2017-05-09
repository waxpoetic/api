class IntegrateYoutubeWithArtists < ActiveRecord::Migration[5.0]
  def change
    add_column :artists, :youtube_playlist_id, :string
    add_column :artists, :starting_youtube_video_id, :string
  end
end
