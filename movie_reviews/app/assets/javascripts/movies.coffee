# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

addMovieToTable = (title, release_date) ->
  movie = $("<tr><td>#{title}</td><td>#{release_date}</td></tr>")
  $('#movie-list').prepend movie

$(document).on 'page:change', ->
  if $('.movies-controller').length
    $.get 'movies.json', (response) ->
      for movie in response
        addMovieToTable movie.title, movie.release_date

    $('form').submit (e) ->
      e.preventDefault()
      title = $(@).find('#movie_title').val()
      $.post 'movies.json', {movie: {title: title} }, (response) ->
        addMovieToTable response.title, response.release_date
        console.log response
