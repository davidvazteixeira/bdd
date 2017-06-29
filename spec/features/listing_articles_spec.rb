require 'rails_helper'

RSpec.feature "Listing articles" do
  before do
    @article1 = Article.create(title: "First title", body: "First body")
    @article2 = Article.create(title: "Second title", body: "Second body")
  end

  scenario "List all articles" do
    visit "/"

    expect(page).to have_content(@article1.title)
    expect(page).to have_content(@article2.title)
    expect(page).to have_content(@article1.body)
    expect(page).to have_content(@article2.body)

    expect(page).to have_link(@article1.title)
    expect(page).to have_link(@article2.title)

  end
end
