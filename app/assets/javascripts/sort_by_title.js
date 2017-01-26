$(document).ready(function(){
  
  $(".sort-movies").on('click', sortMovies);
})

function sortMovies(event) {
  $("#movies-list .movie").sort(alphabetize) 
                          .appendTo('#movies-list'); 
}

function alphabetize(a, b){
  return ($(b).children('.movie-title').text().split(': ')[1]) < ($(a).children('.movie-title').text().split(': ')[1]) ? 1 : -1;    
}
