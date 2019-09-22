require "rails_helper"

RSpec.feature "Widget management", :type => :feature do
  scenario "Correctly displays Articles" do
    visit "/articles"
  end

  scenario "Correctly filters Articles by publishing status" do
    visit "/articles"
  end

#Test case for checking the valid attriutes
  it "Checking is valid with valid attributes" do
  	usr = User.create(name: "Clara Oswald123", email: "clara11@alkhemy.co")
  	expect(Article.create(title: 'Anything', content: 'dummy content', published_at: DateTime.now, author_id: usr.id)).to be_valid
  end

end
