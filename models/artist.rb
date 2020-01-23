require('pg')
require_relative('../db/sql_runner.rb')

class Artist

  attr_reader :id, :name

  def initialize( options )
    @id = otions['id'].to_i if options['id']
    @name = options['name']
  end

  def save

    sql = "INSERT INTO artists
    (name) values
    ($1)
    RETURNING id"
    values =[@name]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i

  end

  def self.delete_all()
    sql = "DELETE FROM artists"
    result = SqlRunner.run(sql)
  end

  def self.all()

    sql = "SELECT * FROM artists"
    artists = SqlRunner.run(sql)
    return artists.map{|person| Artist.new(person)}

  end

  def album()

    sql = "SELECT * FROM albums WHERE id = $1"
    values = [@album_id]
    result = SqlRunner.run(sql, values)
    album_data = result.first
    album = Album.new(album_data)
    return album

  end

  def Artist.find_by_id(id_to_find)
    sql = "SLECT * FROM artists WHERE id = $1"
    values = [id_to_find]
    artist = SqlRunner.run(sql, values)
  end

end
