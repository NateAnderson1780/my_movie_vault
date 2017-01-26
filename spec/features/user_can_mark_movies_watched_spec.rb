require "rails_helper"

RSpec.describe "can mark movies as read", :js => :true do
  
  scenario "user can mark movies as read" do
    user_logs_in
    fill_in "movie-title", :with => "Big Lebowski"
    fill_in "movie-note", :with => "The Dude knows everything"
    click_on "Add Movie"
    expect(current_path).to eq(root_path)
    
    within('#movies-list') do
      expect(page).to have_text("Big Lebowski")
      expect(page).to have_text("The Dude knows everything")
      expect(page).to have_text("Watched?: false")
      expect(page).to have_button('Mark as Watched')
    end
    click_button "Mark as Watched"
    
    expect(current_path).to eq(root_path)
    within('#movies-list') do
      expect(page).to have_text("Big Lebowski")
      expect(page).to have_text("The Dude knows everything")
      expect(page).to have_text("Watched?: true")
      expect(page).to have_button('Mark Unwatched')
    end
  end
  
  scenario "user can mark movies as unread" do
    user_logs_in
    fill_in "movie-title", :with => "Big Lebowski"
    fill_in "movie-note", :with => "The Dude knows everything"
    click_on "Add Movie"
    expect(current_path).to eq(root_path)
    within('#movies-list') do
      expect(page).to have_text("Big Lebowski")
      expect(page).to have_text("The Dude knows everything")
      expect(page).to have_text("Watched?: false")
      expect(page).to have_button('Mark as Watched')
    end
    click_button "Mark as Watched"
    
    expect(current_path).to eq(root_path)
    within('#movies-list') do
      expect(page).to have_text("Big Lebowski")
      expect(page).to have_text("The Dude knows everything")
      expect(page).to have_text("Watched?: true")
      expect(page).to have_button('Mark Unwatched')
    end
    click_button "Mark Unwatched"
    
    expect(current_path).to eq(root_path)
    within('#movies-list') do
      expect(page).to have_text("Big Lebowski")
      expect(page).to have_text("The Dude knows everything")
      expect(page).to have_text("Watched?: false")
      expect(page).to have_button('Mark as Watched')
    end
  end
end