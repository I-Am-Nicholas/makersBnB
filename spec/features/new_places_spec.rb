feature 'posting a new place for hire' do

  scenario 'filling in a form' do
    visit '/places/new'
    fill_in 'placename', with: 'The Joyroom'
    fill_in 'location', with: 'London'
    fill_in 'description', with: 'Listed building, second floor'
    fill_in 'price', with: 10
    fill_in 'date_from', with: '2017-03-23'
    fill_in 'date_to', with: '2017-03-23'
    click_button('submit')
    expect(page).to have_content('The Joyroom')
  end
end
