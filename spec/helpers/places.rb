module PlaceHelpers

  def add_place
    User.create(name: 'Albert',
                password: 'password',
                password_confirmation: 'password',
                email: 'albert@here.com')
    visit('/sessions/new')
    fill_in :email, with: 'albert@here.com'
    fill_in :password, with: 'password'
    click_button('Sign in')
    visit '/places/new'
    fill_in 'placename', with: 'The Joyroom'
    fill_in 'location', with: 'London'
    fill_in 'description', with: 'Listed building, second floor'
    fill_in 'price', with: 10
    fill_in 'date_from', with: '2017-03-23'
    fill_in 'date_to', with: '2017-03-23'
    click_button('submit')
  end

  def book_place
    click_button('bookthis')
    fill_in :message, with: 'Let me book!'
    fill_in :book_from, with: '2017-03-30'
    fill_in :book_to, with: '2017-04-01'
  end

end
