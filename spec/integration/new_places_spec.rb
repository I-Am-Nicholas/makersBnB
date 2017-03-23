feature 'posting a new place for hire but atleast one required field missing' do

  before(:each) do
    User.create(name: 'Albert',
                password: 'password',
                password_confirmation: 'password',
                email: 'albert@here.com')
    visit('/sessions/new')
    fill_in :email, with: 'albert@here.com'
    fill_in :password, with: 'password'
    click_button('Sign in')
  end

  scenario 'filling in a form with name missing' do
    visit '/places/new'
    fill_in 'placename', with: ''
    fill_in 'location', with: 'London'
    fill_in 'description', with: 'Listed building, second floor'
    fill_in 'price', with: 10
    fill_in 'date_from', with: '2017-03-23'
    fill_in 'date_to', with: '2017-03-23'
    click_button('submit')
    expect(page).to have_content('Name must not be blank')
  end

  scenario 'filling in a form with description missing' do
    visit '/places/new'
    fill_in 'placename', with: 'The Joyroom'
    fill_in 'location', with: 'London'
    fill_in 'description', with: ''
    fill_in 'price', with: 10
    fill_in 'date_from', with: '2017-03-23'
    fill_in 'date_to', with: '2017-03-23'
    click_button('submit')
    expect(page).to have_content('Description must not be blank')
  end

  scenario 'filling in a form with price missing' do
    visit '/places/new'
    fill_in 'placename', with: 'The Joyroom'
    fill_in 'location', with: 'London'
    fill_in 'description', with: 'Listed building, second floor'
    fill_in 'price', with: ''
    fill_in 'date_from', with: '2017-03-23'
    fill_in 'date_to', with: '2017-03-23'
    click_button('submit')
    expect(page).to have_content('Price must not be blank')
  end

  scenario 'filling in a form with date wrong' do
    visit '/places/new'
    fill_in 'placename', with: 'The Joyroom'
    fill_in 'location', with: 'London'
    fill_in 'description', with: 'Listed building, second floor'
    fill_in 'price', with: 10
    fill_in 'date_from', with: ''
    fill_in 'date_to', with: '2017-03-23'
    click_button('submit')
    expect(page).to have_content('Date from must be of type Date')
  end


end
