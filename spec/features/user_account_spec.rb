feature 'user has an account page' do

  scenario 'can view requests' do
    add_place
    expect(page).to have_content('Welcome Albert!')
    book_place
    click_button('book')
    visit '/user/account'
    expect(page).to have_content('Let me book!')
  end

end
