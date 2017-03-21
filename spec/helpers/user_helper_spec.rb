def sign_up
  visit '/users/new'
  fill_in :name, with: 'Albert'
  fill_in :password, with: 'password'
  fill_in :confirm_password, with: 'password'
  fill_in :email, with: 'albert@albert.com'
  click_button 'Submit'
end

def sign_in(email:, password:)
  visit '/sessions/new'
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Sign in'
end