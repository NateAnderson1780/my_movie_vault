require "rails_helper"

RSpec.describe "user can edit movies", :js => :true do
  
  scenario "edit an existing movie" do
    user_logs_in
    
    fill_in "movie-title", :with => "American Beauty"
    fill_in "movie-note", :with => "Kevin Spacey nails it"
    click_on "Add Movie"
    
    within('#movies-list') do
     expect(page).to have_text("American Beauty")
     expect(page).to have_text("Kevin Spacey nails it")
     expect(page).to have_text("Watched?: false")
    end

   movie = Movie.last 
   click_link "Edit"
   expect(current_path).to eq(edit_movie_path(movie))
   
   fill_in "movie[title]", :with => "New"
   fill_in "movie[note]", :with => "Kevin Spacey nails it"
   click_on "Update Movie"
   
   expect(current_path).to eq(movies_path)
   within('#movies-list') do
    expect(page).to have_text("New")
    expect(page).to have_text("Kevin Spacey nails it")
    expect(page).to have_text("Watched?: false")
   end
  end
  
  scenario "can not edit movie without including title" do
    user_logs_in
    
    fill_in "movie-title", :with => "American Beauty"
    fill_in "movie-note", :with => "Kevin Spacey nails it"
    click_on "Add Movie"
    
    within('#movies-list') do
     expect(page).to have_text("American Beauty")
     expect(page).to have_text("Kevin Spacey nails it")
     expect(page).to have_text("Watched?: false")
    end

   movie = Movie.last 
   click_link "Edit"
   expect(current_path).to eq(edit_movie_path(movie))
   
   fill_in "movie[title]", :with => ""
   fill_in "movie[note]", :with => "Kevin Spacey nails it"
   click_on "Update Movie"
   
   expect(current_path).to eq(edit_movie_path(movie))
   expect(page).to have_text("Title can't be blank")
  end
end