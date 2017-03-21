feature 'User Sign in' do

  scenario 'with correct credentials' do
    sign_up
    visit('/sessions/new')
    fill_in :email, with: "albert@albert.com"
    fill_in :password, with: "password"
    expect(page).to have_content "Welcome Albert!"
  end
end
