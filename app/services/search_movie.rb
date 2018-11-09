class SearchMovie

Tmdb::Api.key(Rails.application.credentials.dig(:ma_cle_api))
configuration = Tmdb::Configuration.new
configuration.base_url
configuration.secure_base_url
configuration.poster_sizes
configuration.backdrop_sizes
configuration.profile_sizes
configuration.logo_sizes
@image = configuration.base_url + configuration.poster_sizes[3]

puts @image
puts @image.class

  def test(movie_name)
#    puts Tmdb::Movie.latest
    @search = Tmdb::Search.new
    @search = Tmdb::Movie.find(movie_name)

  #  puts @search.credits(268)
    tab_id = Array.new
    tab_title = Array.new
    tab_release = Array.new
    tab_pictures = Array.new
    tab_director = Array.new

    i = 0
    @search.each do |movie|
    tab_title[i] = movie.original_title
    tab_release[i] = movie.release_date
    tab_id[i] =  movie.id
    i += 1
  end

  puts tab_id.size
  puts tab_release.size
  puts tab_title.size
  i = 0
  hash = Hash.new


  while i < tab_id.size
    hash = Tmdb::Movie.credits(tab_id[i])
    tab_director[i] = hash["crew"][0]["name"]
    hash_pictures = Tmdb::Movie.images(tab_id[i])
    tab_pictures[i] = "http://image.tmdb.org/t/p/w342" + hash_pictures["posters"][0]["file_path"]
    puts tab_pictures[i]

    i += 1
  end

  i = 0
  while i < tab_id.size

    i += 1
  end

  puts "table id #{tab_id}"
  puts "table title #{tab_title}"
  puts "table release #{tab_release}"
  puts "table director #{tab_director}"
  puts "table pictures #{tab_pictures}"

  tab_global = Array.new
  i = 0
  while i < tab_id.size
    tab_global[i] = "#{tab_title[i]},#{tab_release[i]},#{tab_director[i]},#{tab_pictures[i]}"
    i += 1
  end

  puts tab_global
  return tab_global

  end
end
