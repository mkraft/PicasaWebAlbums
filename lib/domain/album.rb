module PicasaWebAlbums
  class Album
    attr_accessor :id, :photos, :title, :slug, :date_created, :date_updated, 
                  :cover_photo_url, :description, :access, :number_of_photos, 
                  :number_of_comments, :number_of_photos_remaining, 
                  :total_bytes, :edit_url
    
    def initialize
      @photos = []
    end
  end
end