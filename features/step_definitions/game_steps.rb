Given(/^I go to the game home page$/) do
  visit '/'
end

#When(/^I click on "([^"]*)"$/) do |link|
#  click_link(link)
#end

When(/^I click on link "([^"]*)"$/) do |link|
  click_link(link)
end

When(/^I click on button "([^"]*)"$/) do |button|
  click_button(button)
end


Then(/^I should see "([^"]*)"$/) do |text|
  expect(page).to have_content(text)
end

Then(/^I should have one new game created$/) do
  expect(Game.all.count).to eq(1)
end

When(/^I fill in "(.*?)" with "(.*?)"$/) do |field, text|
  fill_in(field, with: text)
end

Then(/^I should have one new player created$/) do
  expect(Player.all.count).to eq(1)
end