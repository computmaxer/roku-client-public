Function getRottenTomatoesData(movieTitle)
    movieTitle = HttpEncode(movieTitle)
    url = "http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=tk9u9ybr6mnjx9jfvxbumqjy&page_limit=1&q=" + movieTitle
	Debug("Calling Rotten Tomatoes API for " + movieTitle)

    httpRequest = NewHttp(url)
    data = httpRequest.GetToStringWithTimeout(60)

    ' Note: in the future consider asking for 2-3 results from the API and running the titles through an algorithm
    ' to determine which movie result matches the best.
	data = data.Trim()
	json = ParseJSON(data)
	movie = json.movies[0]
    if movie <> invalid AND movie.ratings <> invalid AND movie.ratings.critics_score <> invalid then
        return movie
    endif
End Function