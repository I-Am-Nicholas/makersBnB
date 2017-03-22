feature 'User Sign in' do

  scenario 'with correct credentials' do
    sign_up
    visit('/sessions/new')
    sign_in
    expect(page).to have_content "Welcome Albert!"
  end

end
