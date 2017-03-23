feature 'book new place for hire' do

  scenario 'clicking book button' do
    add_place
    click_button('bookthis')
    expect(page).to have_content('The Joyroom')
    click_button('book')
    expect(page).to have_content("Hello")
  end
end
