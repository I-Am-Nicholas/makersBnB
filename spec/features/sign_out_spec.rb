feature 'User Sign Out' do

  scenario 'signing out after signing in' do
    sign_up
    click_button 'Sign out'
    expect(page).to have_content("goodbye!")
  end

  scenario 'being unable to sign out unless you are signed in' do
    visit '/'
    expect(page).to_not have_content("Sign out")
  end
end
