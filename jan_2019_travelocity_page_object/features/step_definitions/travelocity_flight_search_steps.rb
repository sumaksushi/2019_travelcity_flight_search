Given(/^user is on travelocity home page$/) do
  visit TravelocityHomePage
end

When(/^user selects the flight tab$/) do
  on(TravelocityHomePage).select_flight_tab_element.when_visible.click
end

And(/^user clicks on the round trip flight option$/) do
  on(TravelocityHomePage).select_round_trip_option_element.when_visible(100).click
end

And(/^user enter (.+) in the flying from and select (.+) from the list of airports$/) do |city_name, airport_name|
  on(TravelocityHomePage).set_dep_airport city_name, airport_name
end

And(/^user enter (.+) in the flying To and select (.+) from the list of airports$/) do |city_name, airport_name|
  on(TravelocityHomePage).set_arr_airport city_name, airport_name
end

And(/^user selects (future|past) departing date$/) do |future_past|
  if future_past == 'future'
    future_past = 2
  else
    future_past = -2
  end

  on(TravelocityHomePage).set_dep_date future_past
end

And(/^user selects (future|past) arrival date$/) do |future_past|
  if future_past == 'future'
    future_past = 2
  else
    future_past = -2
  end

  on(TravelocityHomePage).set_arr_date future_past
end

And(/^user clicks on the search button$/) do
  on(TravelocityHomePage).search_flights_element.click
end

Then(/^user should see the list of airports matching the date selected$/) do
  expected_welcome_message = "Select your departure to Cleveland Wed, Jan 30 "
  actual_welcome_message = on(TravelocitySearchResultsPage).get_flight_results_title_element.text
  expect(expected_welcome_message).should eq actual_welcome_message
end

Then(/^user should see the below$/) do |table|
  # table is a table.hashes.keys # => [:warnings]
  all_messages = on(TravelocityHomePage).get_all_error_messages
  table.hashes.each do |flight|
    expect(all_messages).should include(flight[:warnings])
  end
end

And(/^user searches for the (future|past) flights with valid inputs$/) do |future_past|
  if future_past == 'future'
    future_past = 2
  else
    future_past = -2
  end
  # on(TravelocityHomePage).set_dep_airport "columbus", "Columbus"
  # on(TravelocityHomePage).set_arr_airport "cleveland", "Cleveland"
  # on(TravelocityHomePage).set_dep_date future_past
  # on(TravelocityHomePage).set_arr_date future_past
  # on(TravelocityHomePage).search_flights_element.click


  on(TravelocityHomePage) do |page|
    page.set_dep_airport "columbus", "Columbus"
    page.set_arr_airport "cleveland", "Cleveland"
    page.set_dep_date future_past
    page.set_arr_date future_past
    page.search_flights_element.click
  end

  # Step "user enter #{columbus} in the flying from and select #{Columbus} from the list of airports"
  # Step "user enter #{cleveland} in the flying To and select #{Cleveland} from the list of airports"
  # Step "user selects #{past} departing date"
  # Step "user selects #{future} arrival date"
  # Step "user clicks on the search button"


  # Steps %Q{
  #   And user enter "#{columbus}" in the flying from and select "#{Columbus}" from the list of airports
  #   And user enter "#{cleveland}" in the flying To and select "#{Cleveland}" from the list of airports
  #   And user selects "#{future}" departing date
  #   And user selects "#{future}" arrival date
  #   And user clicks on the search button
  # }

end