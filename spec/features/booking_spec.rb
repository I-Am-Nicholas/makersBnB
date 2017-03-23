feature 'book new place for hire' do

  scenario 'clicking book button' do
    add_place
    book_place
    expect{click_button('book')}.to change(Booking, :count).by(1)
    expect(page).to have_content("Hello")
  end

end
