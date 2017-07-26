feature 'Filtering by tags' do
  scenario 'can see links tagged as bubbles' do
    add_new_link('Makers Academy', 'http://makersacademy.com', 'education')
    add_new_link('Science Museum', 'http://www.sciencemuseum.org.uk/', 'bubbles')
    visit('/tags/bubbles')
    expect(page.status_code).to eq 200
    expect(page).not_to have_content('Makers Academy')
    expect(page).to have_content('Science Museum')
  end
end
