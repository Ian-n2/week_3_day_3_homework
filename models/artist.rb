require('pg')
require_relative('../db/sql.rb')


class Artist
  attr_reader :id, :first_name, :last_name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
  end

  def save()
    sql = "INSERT INTO artists
    (first_name, last_name) values
    ($1, $2)
    RETURNING id"
    values = [@first_name, @last_name]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM artists"
    artist = SqlRunner.run(sql)
  end

  def self.all()
    sql = 'SELECT * FROM artists;'
    artist = SqlRunner.run(sql)
    return artist.map{|person| Artist.new(person)}
  end

def albums()
  sql = "SELECT * FROM albums WHERE artist_id = $1"
  values = [@id]
  results = SqlRunner.run(sql, values)
  albums = results.map{|album| Album.new(album)}
  return albums
end

def list
  sql = "SELECT * FROM albums WHERE artist.name = $1"
  values =[id]
  album = SqlRunner.run(sql, values)
end



end
