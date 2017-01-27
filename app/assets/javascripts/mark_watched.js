$(document).ready(function(){

  $('#movies-list').on('click', 'button.mark-watched', markWatched);
  $('#movies-list').on('click', 'button.mark-unwatched', markUnwatched);
  
  $('#movies-list').children().each(function() {
    watchStatus = $(this).find('.movie-watched').text()
    watched = watchStatus.split(': ')[1]
    
    if (watched == 'true') {
      $(this).addClass('watched')
      var watchButton = $(this).find('.mark-watched')
      watchButton.removeClass('mark-watched')
      watchButton.addClass('mark-unwatched')
      watchButton.html("Mark Unwatched")
    }
  })
})

function markWatched(event) {
  event.preventDefault();
  
  var $this = $(this);
  var movieId = $this.parents('.movie').data('id');
  
  $.ajax({
    url: '/api/v1/movies/' + movieId,
    method: 'PATCH',
    data: {watched: true}
  })
  .then(changeStatusToWatched.bind(movieId)())
}

function changeStatusToWatched() {
  $('#movie-' + this).addClass('watched')

  var button = $('#movie-' + this).find('.mark-watched');
  button.removeClass('mark-watched')
  button.addClass('mark-unwatched')
  button.html("Mark Unwatched")
  button.parent().parent().find('.movie-watched').text('Watched?: true')
}

function markUnwatched(event) {
  event.preventDefault();
  
  var $this = $(this);
  var movieId = $this.parents('.movie').data('id');
  
  $.ajax({
    url: '/api/v1/movies/' + movieId,
    method: 'PATCH',
    data: {watched: false}
  })
  .then(changeStatusToUnwatched.bind(movieId)())
}

function changeStatusToUnwatched() {
  $('#movie-' + this).removeClass('watched')

  var button = $('#movie-' + this).find('.mark-unwatched');
  button.removeClass('mark-unwatched')
  button.addClass('mark-watched')
  button.html("Mark as Watched")
  button.parent().parent().find('.movie-watched').text('Watched?: false')
}

