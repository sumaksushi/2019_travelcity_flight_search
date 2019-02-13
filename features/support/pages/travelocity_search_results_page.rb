class TravelocitySearchResultsPage
  require_relative '../modules/utilities'

  include PageObject
  include Utilities

  div(:get_flight_results_title, :class => 'title-departure')


  def verify_flights_displayed_correctly
    actual_welcome_message = get_flight_results_title_element.text
    verify_results_are_same? expected_welcome_message, actual_welcome_message
  end

end