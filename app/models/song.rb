class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  # def genre_id=(id)
  #   self.genre = Genre.find_or_create_by(id: id)
  # end
  # 
  # def genre_id
  #   self.genre ? self.genre.id : nil
  # end

  def note_contents=(note_contents)
     note_contents.each do |content|
       note = Note.create(content: content)
       self.notes << note
     end
  end

end
