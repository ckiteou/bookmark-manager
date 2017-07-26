feature 'Creating links' do

  scenario 'I can create a new link' do
    visit '/links/new'
    fill_in 'url',   with: 'http://www.zombo.com/'
    fill_in 'title', with: 'This is Zombocom'
    click_button 'Create link'
    # we expect to be redirected back to the links page
    expect(current_path).to eq '/links'

    within 'ul#links' do
      expect(page).to have_content('This is Zombocom')
    end
  end

  scenario 'I can create a tag' do
    visit '/links/new'
    fill_in 'url',   with: 'http://www.zombo.com/'
    fill_in 'title', with: 'This is Zombocom'
    fill_in 'tags', with: 'Shopping'
    click_button 'Create link'
    expect(current_path).to eq '/links'
    expect(page).to have_content 'Shopping'
=begin
    click_button 'Create link'
    link = Link.first
    expect(link.tags.map(&:name)).to include('Shopping')
=end
  end
end
