require('pry')
require_relative('../models/album.rb')
require_relative('../models/artist.rb')

Artist.delete_all()
Album.delete_all()

artist1 = Artist.new({"first_name" => 'Alice', 'last_name' => "Cooper"})
artist1.save()

artist2 = Artist.new({"first_name" => "Dean", 'last_name' => "Friedman"})
artist2.save()


album1 = Album.new({
  'artist_id' => artist1.id,
  'name' => 'Trash'
  })
  album1.save()

  album2 = Album.new({
    'artist_id' => artist2.id,
    'name' => 'Rumpled Romeo'
})
  album2.save()

album3 = Album.new({
  'artist_id' => artist2.id,
  'name' => "Submarine Races"
  })
  album3.save()

album4 = Album.new({
  'artist_id' => artist1.id,
  'name' => 'From The Inside'
    })
    album4.save()
  binding.pry
  nil
