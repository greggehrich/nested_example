
require 'rails_helper'

feature 'Visitor uses contact form' do

  scenario 'to deliver a valid message' do
    visit contact_new_path
    fill_in 'contact_form_name', :with => 'Nolan Bushnell'
    fill_in 'contact_form_email', :with => 'nolan@example.com'
    fill_in 'contact_form_message', :with => 'I love ArcadeNomad!'
    click_button 'Send message'
    expect(page.body).to have_content('Thank you for your message!')
    expect(last_email.to).to have_content('arcadenomad@wjgilmore.com')
    expect(last_email.from).to have_content('nolan@example.com')
  end

  scenario 'but provides a blank e-mail address' do
    visit contact_new_path
    fill_in 'contact_form_name', :with => 'Nolan Bushnell'
    fill_in 'contact_form_message', :with => 'I love ArcadeNomad!'
    click_button 'Send message'
    expect(page.body).to have_content("Email can't be blank")
    expect(last_email).to be_nil
  end

end