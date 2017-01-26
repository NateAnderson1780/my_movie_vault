$(document).ready(function(){
  $('#search-movies').on('keyup', searchMovies);
})

function searchMovies(event) {
  
  var searchText = $('#search-movies').val().toUpperCase();
  $('.movie').each(function(index) {
    var movieTitle = $(this).find('.movie-title').text().split(': ')[1].toUpperCase();
    var movieNote = $(this).find('.movie-note').text().split(': ')[1].toUpperCase();
    
    if (movieTitle.includes(searchText) || movieNote.includes(searchText)) {
      $(this).show()
    } else {
      $(this).hide()
    }
  })
}