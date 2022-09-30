Given /^the following events exist$/ do |table|
  require 'date'
  table.hashes.each { |h|
    h['datetime'] = Date.parse h['datetime']
    h['last_modified'] = Date.parse h['last_modified']
    create :event, h
  }
end

Given /^I access "(.+)"$/ do |url|
  @url = url
end

When /^I post an image parameter$/ do
  event = build :event
  @response = patch @url, params: { image: event.image }
end

Then /^I should get a successful response$/ do
  expect(@response).to be_successful
end