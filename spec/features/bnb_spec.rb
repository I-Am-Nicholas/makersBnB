feature 'Set up test' do

  scenario 'root page' do
    visit '/'
    expect(page).to have_content("Hello World!")
  end

end
