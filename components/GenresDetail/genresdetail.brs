sub init()
  m.movieslist = m.top.findNode("movieslist")
  m.toptitle = m.top.findNode("toptitle")

  m.request = HTTPApiClient()
  m.request.componentPointer = m
	m.request.URL = "https://api.themoviedb.org/3/discover/movie?api_key=0b1a18e2b899d214aba36f03889b819e&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&with_watch_monetization_types=flatrate&with_genres="+m.top.genreid
	m.request.callback = loadMovies
	m.request.executeTask()
end sub

sub loadMovies(event as object)

end sub