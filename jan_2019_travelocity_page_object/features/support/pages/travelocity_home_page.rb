class TravelocityHomePage
  require_relative '../modules/utilities'

  include PageObject
 # include Utilities

  page_url 'www.travelocity.com'

  link(:select_flight_tab, :id => 'primary-header-flight')
  label(:select_round_trip_option, :id => 'flight-type-roundtrip-label-flp')
  text_field(:set_dep_airport, :id => 'flight-origin-flp')
  ul(:list_of_matching_airports, :id => 'typeaheadDataPlain')
  text_field(:set_arr_airport, :id => 'flight-destination-flp')
  text_field(:set_departure_date, :id => 'flight-departing-flp')
  text_field(:set_arrival_date, :id => 'flight-returning-flp')
  button(:search_flights, :class => 'btn-primary btn-action gcw-submit ')
  ul(:error_message, :class=> 'validation-alert-list')


  def search_valid_airport

  end

  def get_all_error_messages
    error_message_element.list_item_elements.map do |x|
      x.text
    end
  end


  def set_dep_airport city_name, airport_details
    self.set_dep_airport = city_name
    # set_dep_airport_element.set city_name
    choose_correct_airport(airport_details)
  end


  def set_arr_airport city_name, airport_details
    # @browser.text_field(:id => 'flight-destination-flp').set city_name
    self.set_arr_airport = city_name
    choose_correct_airport(airport_details)
  end


  def choose_correct_airport(airport_details)
    # @browser.ul(:id => 'typeaheadDataPlain').lis.each do |each_airport|
    list_of_matching_airports_element.list_item_elements.each do |each_airport|
      p each_airport.text
      if each_airport.text.include? airport_details
        each_airport.click
        break
      end
    end
  end


  def set_dep_date no_of_days
    self.set_departure_date = new_date no_of_days
  end

  def set_arr_date no_of_days
    self.set_arrival_date = new_date no_of_days
  end


end