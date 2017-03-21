feature 'User Sign in' do

  let!(:user) do
    User.create(name: 'test',
                password: 'secret1234',
                # password_confirmation: 'secret1234',
                email: 'user@example.com')
  end

  scenario 'with correct credentials' do
    sign_in(email: user.email,   password: user.password)
    expect(page).to have_content "Welcome #{user.name}!"
  end
end
