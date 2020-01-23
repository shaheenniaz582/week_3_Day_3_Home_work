require('pry')
require_relative('../models/artist.rb')
require_relative('../models/album.rb')

Artist.delete_all()
Album.delete_all()

artist1 = Artist.new({'name' => 'ABC'})
artist2 = Artist.new({'name' => 'XYZ'})
artist1.save()
artist2.save()

album1 = Album.new({
  'artist_id'=> artist1.id,
  'title' => 'aassdsddf',
  'genere' => 'Rock'
  })

  album1.save()
  binding.pry
  nil
