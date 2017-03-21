feature 'User Sign-Up' do
  scenario 'welcomes user after signing up' do
    visit '/users/new'
    fill_in :name, with: 'Albert'
    fill_in :password, with: 'password'
    fill_in :confirm_password, with: 'password'
    fill_in :email, with: 'albert@albert.com'
    click_button 'Submit'
    expect(page).to have_content('Welcome Albert!')
  end
end
