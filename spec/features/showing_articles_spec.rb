require 'rails_helper'

RSpec.feature "Showing Article" do

  before do
    @john = User.create(email: "john@example.com", password: "password1")
    @fred = User.create(email: "fred@example.com", password: "password2")
    @article = Article.create(title: "The first article", body: "Body of first article", user: @john)
  end

  scenario "A non-signed in user does not see Edit or Delete links" do
    visit "/"

    click_link @article.title

    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)
    expect(current_path).to eq(article_path(@article))

    expect(page).not_to have_content("Edit Article")
    expect(page).not_to have_content("Delete Article")

  end
  
  scenario "A non-owner signed-in user does not see Edit or Delete links" do
    login_as(@fred)

    visit "/"

    click_link @article.title

    expect(page).not_to have_content("Edit Article")
    expect(page).not_to have_content("Delete Article")

  end

  scenario "A owner signed in user does not see Edit or Delete links" do
    login_as(@john)

    visit "/"

    click_link @article.title

    expect(page).to have_content("Edit Article")
    expect(page).to have_content("Delete Article")
  end


  scenario "Display individual article" do
    visit "/"

    click_link @article.title

    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)
    expect(current_path).to eq(article_path(@article))

  end
end
