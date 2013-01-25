require 'yaml'

class ImportSongRefs < ActiveRecord::Migration
	def up		
		@song_refs = YAML.load_file(File.dirname(__FILE__) + '/../../song_refs.yaml')	
		@song_refs.each do |key, value|
			song_ref = SongRef.new
			song_ref.uuid = value
			song_ref.name = key
			song_ref.save!
		end
	end

	def down
		SongRef.delete_all
	end
end