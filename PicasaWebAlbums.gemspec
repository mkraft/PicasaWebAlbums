# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "PicasaWebAlbums/version"

Gem::Specification.new do |s|
  s.name        = "picasawebalbums"
  s.version     = PicasaWebAlbums::VERSION
  s.authors     = ["Martin Kraft"]
  s.email       = ["martinkraft@gmail.com"]
  s.homepage    = "https://github.com/mkraft/PicasaWebAlbums"
  s.summary     = %q{Provides programmatic access to Picasa Web Albums data.}
  s.description = %q{A simple way to retrieve albums, photos, tags, etc. from 
                    Picasa Web Albums.}
  s.license     = 'MIT'
  s.rubyforge_project = "picasawebalbums"
  s.required_ruby_version = '>= 1.9.3'
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.add_development_dependency "pry"
end
