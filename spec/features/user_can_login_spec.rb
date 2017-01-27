require "rails_helper"

RSpec.describe "user can log in" do
  before(:each) do
    User.create(email: "test@test.com", password: "test", password_confirmation: "test")
  end
  
  scenario "user can log in" do
    visit '/'

    fill_in "email", with: "test@test.com"
    fill_in "password", with: "test"
    click_on "Submit"
    
    expect(current_path).to eq(root_path)
    expect(page).to have_text('Welcome to Movie Vault!')
  end
  
  scenario "can not log in with invalid credentials" do
    visit '/'

    fill_in "email", with: "random@nate.com"
    fill_in "password", with: "nate"
    click_on "Submit"
    
    expect(current_path).to eq(login_path)
    expect(page).to have_text('Your email and/or password is incorrect, please try again')
  end
  
  scenario "user can log out" do
    visit '/'

    fill_in "email", with: "test@test.com"
    fill_in "password", with: "test"
    click_on "Submit"
    
    expect(current_path).to eq(root_path)
    click_on "Logout"
    expect(current_path).to eq(login_path)
  end
end