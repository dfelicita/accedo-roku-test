sub init()
  m.genresList = m.top.findNode("genresList")
  m.genresList.numRows = 10
  m.genresList.setFocus(true)

  m.request = HTTPApiClient()
  m.request.componentPointer = m
	m.request.URL = "https://api.themoviedb.org/3/genre/movie/list?api_key=0b1a18e2b899d214aba36f03889b819e"
	m.request.callback = loadList
	m.request.executeTask()
end sub

sub loadList(event as object)
  result = event.genres
    content = createObject("roSGNode", "ContentNode")
    for each item in result
      charListItem = content.createChild("ContentNode")
      charListItem.title = item.name
      charListItem.id = item.id
    end for
  m.componentPointer.genresList.content = content
end sub