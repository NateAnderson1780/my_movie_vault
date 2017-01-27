var $newMovieTitle, $newMovieNote;

$(document).ready(function(){
  $newMovieTitle = $("#movie-title");
  $newMovieNote = $("#movie-note");
  
  $("#new-movie").on('submit', createMovie);
})

function createMovie (event) {
  event.preventDefault();
  
  var movie = getMovieData();
  
  $.post("/api/v1/movies", movie)
   .then(renderMovie)
   .fail(showFailure)
}

function getMovieData() {
  return {
    title: $newMovieTitle.val(),
    note: $newMovieNote.val(),
  }
}

function renderMovie(movie) {
  $("#movies-list").prepend(movieHTML(movie))
  clearMovie();
}

function movieHTML(movie) {
  return `<div class='movie' data-id='${movie.id}' id="movie-${movie.id}">
          <p class="movie-title">Title: ${movie.title}</p>
          <p class="movie-note">Note: ${movie.note}</p>
          <p class="movie-watched">Watched?: ${movie.watched}</p>

          <p class="movie_buttons">
            <button class="mark-watched">Mark as Watched</button>
            <button class='edit-movie'><a href='/movies/${movie.id}/edit'>Edit</a></button>
          </p>

         </div>`
}

function clearMovie() {
  $newMovieTitle.val("");
  $newMovieNote.val("");
}

function showFailure(failureData) {
  $('.alert').html("This movie could NOT be created: " + failureData.responseText);
  clearMovie();
}