require 'json'
require 'open-uri'

Movie.delete_all

url = 'http://tmdb.lewagon.com/movie/top_rated'
response_serialized = URI.open(url).read
response = JSON.parse(response_serialized)

puts "\n\n\n A partir de Aca \n\n\n"
base_poster_url = "https://image.tmdb.org/t/p/w500"

response["results"].sample(5).each do |movie|
  movie = Movie.create(
    title: movie["title"], 
    overview: movie["overview"], 
    poster_url: base_poster_url + movie['backdrop_path'],
    rating: movie["vote_average"])
    p movie
end