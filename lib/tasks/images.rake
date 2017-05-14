namespace :copy do
  desc 'Copy artist images'
  task images: :environment do
    artist = Artist.first

    Dir['/Users/tscott/Pictures/wonder bars live at kfn/*.jpg'].map do |path|
      File.open path
    end.each do |file|
      artist.images.create! file: file, imageable: artist
    end
  end

  desc 'Copy release data'
  task tracks: :environment do
    artist = Artist.first
    release = artist.releases.first

    Dir['/Users/tscott/Downloads/Masters/*.mp3'].each do |path|
      if File.basename(path) =~ /(\d+) (\D+).mp3/
        number = $1
        name = $2
        file = File.open path

        release.tracks.create!(
          name: name,
          preview: file,
          number: number.to_i
        )
      end
    end

    puts release.tracks
  end
end
