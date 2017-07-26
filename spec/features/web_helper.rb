def add_new_link(title, url, tags)
  visit '/links/new'
  fill_in 'title', with: title
  fill_in 'url', with: url
  fill_in 'tags', with: tags
  click_button 'Submit'
end
