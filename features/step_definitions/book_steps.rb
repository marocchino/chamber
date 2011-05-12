# encoding: utf-8
Given /^다음 책들이 있습니다:$/ do |books|
  Book.create!(books.hashes)
end

When /^(\d+)번째 책을 지웁니다$/ do |pos|
  visit books_path
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^다음 책들이 보여야 합니다:$/ do |expected_books_table|
  expected_books_table.diff!(tableish('table tr', 'td,th'))
end
