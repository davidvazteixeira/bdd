require 'rails_helper'

RSpec.feature "Editing an Article" do

  before do
    @john = User.create!(email: "john@mail.com", password: "password", password_confirmation: "password")
    login_as(@john)
    @article = Article.create(title: "The first article", body: "Body of first article", user: @john)
  end

  scenario "A user update an article" do
    visit "/"

    click_link @article.title
    click_link "Edit Article"

    fill_in "Title", with: "Edited Title"
    fill_in "Body", with: "Edited Body"
    click_button "Update Article"

    expect(page).to have_content("Article has been updated")
    expect(page.current_path).to eq(article_path(@article))

  end

  scenario "A user fail to update an article" do
    visit "/"

    click_link @article.title
    click_link "Edit Article"

    fill_in "Title", with: ""
    fill_in "Body", with: "Edited Body"
    click_button "Update Article"

    expect(page).to have_content("Article has not been updated")
    expect(page.current_path).to eq(article_path(@article))
  end
end
