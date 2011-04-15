Given /^the following books:$/ do |books|
  Book.create!(books.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) book$/ do |pos|
  visit books_path
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following books:$/ do |expected_books_table|
  expected_books_table.diff!(tableish('table tr', 'td,th'))
end
