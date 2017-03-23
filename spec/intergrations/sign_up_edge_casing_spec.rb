feature 'Sign Up Edge Casing' do

  scenario 'throw error when user enters password shorter than 6 characters' do
    visit '/users/new'
    fill_in :name, with: 'Albert'
    fill_in :password, with: 'passw'
    fill_in :password_confirmation, with: 'passw'
    fill_in :email, with: 'albert@albert.com'
    click_button 'Submit'
    expect(page).to have_content("Password must be longer than 6 characters")
  end

  scenario 'throw error when user does not enter an @ sign' do
    visit '/users/new'
    fill_in :name, with: 'Albert'
    fill_in :password, with: 'password'
    fill_in :password_confirmation, with: 'password'
    fill_in :email, with: 'albert.com'
    click_button 'Submit'
    expect(page).to have_content("Format error: Email address is not typed properly")
  end

end
