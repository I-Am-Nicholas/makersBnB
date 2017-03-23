feature 'Edge casing' do

  scenario 'throws an error when an empty field is present' do
    sign_up_with_a_blank_name
    expect(page).to have_content "Empty field: please check sign up form and try again"
  end

  scenario 'throws an error with incorrect credentials' do
    sign_in_with_false_details
    expect(page).to have_text "Incorrect email or password: Please try again"
  end
  
end
