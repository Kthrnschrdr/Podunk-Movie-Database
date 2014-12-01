require "pry"

require "sinatra"
require "sinatra/reloader"

require "themoviedb"

Tmdb::Api.key("4d2fecc14f3b64ddef403c6183c639b2")

#Display some cool movies(NOT ESSENTIAL AT THE MOMENT!)
#Provide a search box to search by title of a movie
#Hit "Search" and it will redirect you to a search page displaying an Array of results

get "/" do
  erb :home
end  

#This is the search results page-it should return an Array of titles that correspond with the user's search
#Each one should be a clickable link that redirects the user to that movie's page 
#The user can choose which one most closely matches the search
  
get "/search?" do
  @query = params["query"]
  @results = Tmdb::Movie.find(params["query"])
  erb :search?
end 

#This page is the referential page for the chosen movie
#This page contains tons of data hardcoded in, like the synopsis n'stuff
#This page also has clickable links to get to the director's page, the various actresses/actors, and similar movies

get "/movie/:id" do
  @movie = Tmdb::Movie.detail(params[:id])
  @trailers = Tmdb::Movie.trailers
  erb :movie
end
