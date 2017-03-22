def sign_up
  visit '/users/new'
  fill_in :name, with: 'Albert'
  fill_in :password, with: 'password'
  fill_in :confirm_password, with: 'password'
  fill_in :email, with: 'albert@albert.com'
  click_button 'Submit'
end

def sign_up_with_a_blank_name
  visit '/users/new'
  fill_in :name, with: ''
  fill_in :password, with: 'password'
  fill_in :confirm_password, with: 'password'
  fill_in :email, with: 'albert@albert.com'
  click_button 'Submit'
end

def sign_in
  visit '/sessions/new'
  fill_in :email, with: 'albert@albert.com'
  fill_in :password, with: 'password'
  click_button 'Sign in'
end

def sign_in_with_false_details
  visit('/sessions/new')
  fill_in :email, with: "albert@albert.com"
  fill_in :password, with: "incorrect password"
  click_button 'Sign in'
end
