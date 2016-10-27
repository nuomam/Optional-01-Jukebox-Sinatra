require "sinatra"
require "sinatra/reloader" if development?
require "sqlite3"

DB = SQLite3::Database.new(File.join(File.dirname(__FILE__), 'db/jukebox.sqlite'))

get '/' do
  @artists_sorted = DB.execute("SELECT * FROM artists ORDER BY name ASC;")
  erb :index
end

get '/artists/:id' do
  # id = params['id']
  @albums_sorted = DB.execute("SELECT * FROM albums WHERE artist_id = #{params['id']};")
  erb :artists
end

# get '/artists' do
#   puts params[:username]
#   "The username is #{params[:username]}"
#   erb :artists
# end

# get '/albums' do
#   erb :albums
# end

get '/albums/:id' do
  # id = params['id']
  @tracks = DB.execute("SELECT * FROM tracks WHERE album_id = #{params['id']};")


  erb :albums
end




# get '/tracks' do
#   erb :tracks
# end



get '/tracks/:id' do
  # id = params['id']
  @tracks = DB.execute("SELECT * FROM tracks WHERE id = #{params['id']};")
  erb :tracks
end
