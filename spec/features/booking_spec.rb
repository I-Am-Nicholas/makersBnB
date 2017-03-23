feature 'book new place for hire' do

  scenario 'clicking book button' do
    add_place
    click_button('bookthis')
    expect(page).to have_content('The Joyroom')
    fill_in :message, with: 'Let me book!'
    fill_in :book_from, with: '2017-03-30'
    fill_in :book_to, with: '2017-04-01'
    expect{click_button('book')}.to change(Booking, :count).by(1)
    expect(page).to have_content("Hello")
  end
  
end
