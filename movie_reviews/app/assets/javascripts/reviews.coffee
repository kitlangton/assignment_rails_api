# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

currentPage = 0
loadMoreReviews = () ->
  currentPage += 1
  $.ajax
    url: "reviews?page=#{currentPage}"
    success: (response) ->
      console.log response
    dataType: 'script'

$(document).on 'page:change', ->

  $(window).scroll ->
    if $(window).scrollTop() == $(document).height() - $(window).height()
      loadMoreReviews()

