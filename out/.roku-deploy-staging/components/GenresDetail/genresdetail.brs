sub init()
  m.movieslist = m.top.findNode("movieslist")
  m.toptitle = m.top.findNode("toptitle")

  m.top.observeField("genreid", "makeCall")
end sub

sub makeCall()
  m.toptitle.text = "Genre: " + m.top.detailTitle
  m.request = HTTPApiClient()
  m.request.componentPointer = m
	m.request.URL = "https://api.themoviedb.org/3/discover/movie?api_key=0b1a18e2b899d214aba36f03889b819e&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&with_watch_monetization_types=flatrate&with_genres="+m.top.genreid
	m.request.callback = loadMovies
	m.request.executeTask()
end sub

sub loadMovies(event as object)
  result = event.results
  content = createObject("roSGNode", "ContentNode")
    for each item in result
      charListItem = content.createChild("ContentNode")
      charListItem.hdgridposterurl = "https://image.tmdb.org/t/p/w220_and_h330_face" + item.poster_path
      charListItem.hdposterurl = "https://image.tmdb.org/t/p/w220_and_h330_face" + item.poster_path
      charListItem.sdgridposterurl = "https://image.tmdb.org/t/p/w220_and_h330_face" + item.poster_path
      charListItem.sdposterurl = "https://image.tmdb.org/t/p/w220_and_h330_face" + item.poster_path
      charListItem.shortdescriptionline1 = item.original_title
      charListItem.shortdescriptionline2 = item.vote_average
    end for
  m.componentPointer.movieslist.content = content
  ' ? "RESULTS: " result[0]
end sub