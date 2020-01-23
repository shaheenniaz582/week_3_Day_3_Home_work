require('pg')

class Album

  attr_accessor :title, :genere
  attr_reader :id, :artist_id

  def initialize( options )

    @title = options['title']
    @genere = options['genere']
    @id = options['id'].to_i if options['id']
    @artist_id = options['artist_id'].to_i

  end

  def save()

    sql = "INSERT INTO albums
    (

      title,
      genere,
      artist_id
      )
      VALUES
      (
        $1,$2,$3
        )
        RETURNING id"
      values = [@title, @genere, @artist_id]
      @id = SqlRunner.run(sql, values)

  end

  def update()
    sql = "UPDATE albums
    SELECT
    (
      name,
      title,
      genere
      )=
      (
        $1, $2, $3
        )
        WHERE id =$3"
        values = [@title, @genere,@artist_id, @id]
        SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM albums
          WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql , values)
  end

  def Album.delete_all()

    sql = "DELETE FROM albums"
    SqlRunner.run(sql)

  end

def Album.all()

  sql = "SLECT * FROM albums"
  albums = SqlRunner.run(sql)
  return albums.map { |album_hsh| Album.new( album_hsh ) }

end

def artists()

  sql = "SELECT * FROM artists WHERE album_id = $1"
  values=[@id]
  result= SqlRunner.run(sql, values)
  artists=result.map { |artist| Artist.new(artist) }

end

def Album.find_by_id(id_to_find)
  sql = "SLECT * FROM albums WHERE id = $1"
  values = [id_to_find]
  album = SqlRunner.run(sql, values)
end



end
