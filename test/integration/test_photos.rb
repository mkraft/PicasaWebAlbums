require 'test/unit'
require 'yaml'
require_relative '../../lib/picasawebalbums'

module PicasaWebAlbums
  class TestPhotos < Test::Unit::TestCase
  
    def setup
      @test_account = YAML::load(File.open(File.expand_path('test/config/test_account.yml')))
      @repo = PicasaWebAlbums.get_repository(@test_account["email"], @test_account["password"])
    end
  
    def test_get_photos_from_album
      album = @repo.get_album_by_id(@test_account["album"]["id"])
      photos = @repo.get_photos_by_album_id(album.id)
      assert_equal photos.count, @test_account["album"]["number_of_photos"]
    end
  
    def test_get_photo_by_album_and_id
      album = @repo.get_album_by_slug(@test_account["album"]["slug"])
      photo = @repo.get_photo_by_album_id_and_photo_id(album.id, @test_account["album"]["photo"]["id"])
      assert_equal @test_account["album"]["photo"]["caption"], photo.caption
    end
  
    def test_get_photos_by_tags
      tags_array = Array.new(1, @test_account["album"]["photo"]["tag"])
      photos = @repo.get_photos_by_tags(tags_array)
      assert_equal photos.count, @test_account["album"]["number_of_tagged_photos"]
    end

    def test_photo_has_thumbnail
      album = @repo.get_album_by_id(@test_account["album"]["id"])
      photos = @repo.get_photos_by_album_id(album.id)
      photo = photos.first
      assert_block { photo.thumb =~ /^http:\/\/.*.png$/i }
    end
  
  end
end