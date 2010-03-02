Given /^the following hellos:$/ do |hellos|
  Hello.create!(hellos.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) hello$/ do |pos|
  visit hellos_url
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following hellos:$/ do |expected_hellos_table|
  expected_hellos_table.diff!(tableish('table tr', 'td,th'))
end
