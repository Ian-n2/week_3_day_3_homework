require('pg')


class Album

  attr_reader :id, :name, :artist_id

  def initialize(options)
  @id = options['id'].to_i if options['id']
  @name = options['name']
  @artist_id = options['artist_id'].to_i
end

def save()
  sql = 'INSERT INTO albums
  (name, artist_id) VALUES
($1, $2)
RETURNING id'
values = [@name, @artist_id]
album = SqlRunner.run(sql, values)
@id = album[0]['id'].to_i
end

def self.delete_all()
  sql = "DELETE FROM albums"
  album = SqlRunner.run(sql)
end

def delete()
  sql = 'DELETE * FROM albums WHERE id = $1'
  values = [@id]
  album = SqlRunner.run(sql, values)
end

def self.all()
  sql = 'SELECT * FROM albums'
  albums = SqlRunner.run(sql)
  return albums.map{|lp| Album.new(lp)}
end


def artist()
  sql = "SELECT * FROM artist WHERE id = $1"
  values = [@id]
  results = SqlRunner.run(sql, values)
  artist = results.map{|artist| Artist.new(artist)}
  return artist
end


end
