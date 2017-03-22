feature 'User Sign in' do

  scenario 'with correct credentials' do
    sign_up
    visit('/sessions/new')
    sign_in
    expect(page).to have_content "Welcome Albert!"
  end

  feature 'edge casing' do

    scenario 'throws an error when an empty field is present' do
      sign_up_with_a_blank_name
      expect(page).to have_content "Empty field: please check sign up form and try again"
    end

  end
end
