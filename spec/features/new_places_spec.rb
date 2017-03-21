feature 'posting a new place for hire' do

  scenario 'filling in a form' do
    visit '/places/new'
    fill_in 'placename', with: 'The Joyroom'
    fill_in 'location', with: 'London'
    fill_in 'description', with: 'Listed building, second floor'
    fill_in 'price', with: 10
    click_button('submit')
    expect(page).to have_content('Hello World!')
  end
end