feature 'User Sign Up' do

  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome Albert!')
    expect(User.first.email).to eq('albert@albert.com')
  end

  scenario 'throw error when user enters password shorter than 6 characters' do
    visit '/users/new'
    fill_in :name, with: 'Albert'
    fill_in :password, with: 'passw'
    fill_in :confirm_password, with: 'passw'
    fill_in :email, with: 'albert@albert.com'
    click_button 'Submit'
    expect(page).to have_content("Password length error: Password must be longer than 6 characters")
  end

  scenario 'throw error when user does not enter an @ sign' do
    visit '/users/new'
    fill_in :name, with: 'Albert'
    fill_in :password, with: 'password'
    fill_in :confirm_password, with: 'password'
    fill_in :email, with: 'albert.com'
    click_button 'Submit'
    expect(page).to have_content("E-mail character error: Missing @ sign")
  end

end
