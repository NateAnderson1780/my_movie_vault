require 'rails_helper'

RSpec.describe "user can add movie", :js => :true do
  scenario "can add movie to list" do
    user_logs_in
    
    fill_in "movie-title", :with => "Pulp Fiction"
    fill_in "movie-note", :with => "Tarantino's best"
    click_on "Add Movie"

    within('#movies-list') do
      expect(page).to have_text("Pulp Fiction")
      expect(page).to have_text("Tarantino's best")
      expect(page).to have_text("Watched?: false")
    end
  end
  
  scenario "can not create movie with no title" do
    user_logs_in
    
    fill_in "movie-title", :with => ""
    fill_in "movie-note", :with => "Tarantino's best"
    click_on "Add Movie"

    within('#links-list') do
      expect(page).not_to have_text("Turing")
      expect(page).not_to have_text("http://turing.io")
      expect(page).not_to have_text("Read?: false")
    end
    
    expect(page).to have_text("Title can't be blank")
  end
end