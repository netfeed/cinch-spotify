#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
# Copyright (c) 2010 Victor Bergöö
# This program is made available under the terms of the MIT License.

require 'cinch'
require 'nokogiri'
require 'httpclient'

module Cinch
  module Plugins
    module Netfeed
      class Spotify
        include Cinch::Plugin
        
        match /(spotify:(album|track|artist):[a-zA-Z0-9]+)/, :use_prefix => false
        match /(http:\/\/open.spotify.com\/(album|track|artist)\/[a-zA-Z0-9]+)/, :use_prefix => false
        
        def execute m, uri, type
          msg = case type
          when /artist/ then _artist uri
          when /album/ then _album uri
          when /track/ then _track uri
          else 'something went wrong'
          end
	        
          m.reply("Spotify: #{msg}")
        end

        def _artist uri
          p = Nokogiri::XML _data(uri)
          artist = p.xpath("//xmlns:artist/xmlns:name").first.content
          "Artist: #{artist}"
        end

        def _album uri
          p = Nokogiri::XML _data(uri)
          artist = p.xpath("//xmlns:artist/xmlns:name").first.content
          album = p.xpath("//xmlns:album/xmlns:name").first.content
          "Album: #{album} by #{artist}"
        end

        def _track uri
          p = Nokogiri::XML _data(uri)
          artist = p.xpath("//xmlns:artist/xmlns:name").first.content
          album = p.xpath("//xmlns:album/xmlns:name").first.content
          track = p.xpath("//xmlns:track/xmlns:name").first.content
          "Track: #{track} by #{artist} (#{album})"
        end

        def _data spotify_uri
          client = HTTPClient.new
          resp = client.get("http://ws.spotify.com/lookup/1/", { :uri => spotify_uri })
          puts resp.content
          resp.content
        end
      end
    end
  end
end
