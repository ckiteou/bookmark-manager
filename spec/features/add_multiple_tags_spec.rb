feature 'Adding mulitple tags' do
  scenario 'add mutiple tags' do
    add_new_link('Makers Academy', 'http://makersacademy.com', 'education learning bootcamp')
    expect(current_path).to eq '/links'
    link = Link.first(title: 'Makers Academy')
    expect(link.tags.map(&:name)).to include('education', 'learning', 'bootcamp')
  end
end
