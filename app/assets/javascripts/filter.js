$(document).ready(function(){
  $('.filter-watched').on('click', filterWatched);
  $('.filter-unwatched').on('click', filterUnwatched);
})

function filterWatched(event) {
  event.preventDefault();
  
  $('.movie').each(function(index) {
    if ($(this).find('.movie-watched').text() == 'Watched?: true') {
      $(this).show();
    } else {
      $(this).hide();
    }
  })
}

function filterUnwatched(event) {
  event.preventDefault();
  
  $('.movie').each(function(index) {
    if ($(this).find('.movie-watched').text() == 'Watched?: false') {
      $(this).show();
    } else {
      $(this).hide();
    }
  })
}