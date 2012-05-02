PicasaWebAlbums
===============

Gem for accessing photos and albums from Picasa Web Albums

Installation
------------

	gem install picasawebalbums
	
Rails/Application Integration
-----------------------------

Add one of the below lines to the Gemfile:

- `gem 'picasawebalbums, :require => 'PicasaWebAlbums'`
- `gem 'picasawebalbums', :require => 'PicasaWebAlbums', :git => 'git@github.com:mkraft/PicasaWebAlbums.git'`

Then run `bundle install`

Usage
-----

Print the title of all albums

	repo = PicasaWebAlbums.get_repository('someperson@gmail.com', 'somepassword')
	albums = repo.get_all_albums
	albums.each { |album| puts album.title }

Print the URL of each photo in the album titled "Big Boy"

	repo = PicasaWebAlbums.get_repository('someperson@gmail.com', 'somepassword')
	album = repo.get_album_by_title("Big Boy")
	photos = repo.get_photos_by_album_id(album.id)
	photos.each { |photo| puts photo.url }

Get photos with specific tags

	repo = PicasaWebAlbums.get_repository('someperson@gmail.com', 'somepassword')
	photos = repo.get_photos_by_tags(['cat', 'dog'])
	# returns photos tagged with 'cat' AND 'dog'

Testing
-------

To run integration tests, replace the values in `/test/config/test_account.yml` with known values from a real Picasa Web Albums account. The `album` can be any album in the account (no changes will be made to it). The `photo` must be from the chosen `album`. Run:

	ruby test/tests.rb

Methods
-------

### Album(s)

- `get_all_albums`
- `get_album_by_id(id)`
- `get_album_by_title(title)`
- `get_album_by_slug(slug)`
- `create_album(album)`
- `delete_album_by_id(album_id)`

### Photo(s)

- `get_photos_by_album_id(album_id)`
- `get_photo_by_album_id_and_photo_id(album_id, photo_id)`
- `get_photos_by_tags(tags_array)`

### Tags

- `get_all_tags`
- `get_tags_by_album_id(album_id)`
- `get_tags_by_album_id_and_photo_id(album_id, photo_id)`

Domain Object Properties
------------------------

### Photo

- `id`
- `url`
- `caption`
- `width`
- `height`
- `file_name`
- `thumb`

### Album

- `id`
- `photos`
- `title`
- `slug`
- `date_created`
- `date_updated`
- `cover_photo_url`
- `description`
- `access`
- `number_of_photos`
- `number_of_comments`
- `number_of_photos_remaining`
- `total_bytes`

### Tag

- `text`

Additional Documentation
------------------------

Additional documentation can be found on the [rubydoc pages](http://rubydoc.info/gems/picasawebalbums)

Feature Requests and Bugs
-------------------------

Please feel free to log any bugs or feature requests in the [Issues tab on Github](https://github.com/mkraft/PicasaWebAlbums/issues).

Coming Down the Pike
--------------------

The goal is to completely mirror all of the Picasa Web Albums API features including

- Update albums
- Create, Update, Delete photos
- Create, Update, Delete tags
- CRUD comments
- CRUD geolocation data

License
-------

Copyright (C) 2011 Martin Kraft

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
