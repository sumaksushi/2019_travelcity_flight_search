Feature: travelocity Flight Search functionality

  Background:
    Given user is on travelocity home page
    When user selects the flight tab
    And user clicks on the round trip flight option

#    Imperative
  Scenario: verify the user is able to search for the available future flights
    And user enter columbus in the flying from and select Columbus from the list of airports
    And user enter cleveland in the flying To and select Cleveland from the list of airports
    And user selects future departing date
    And user selects future arrival date
    And user clicks on the search button
    Then user should see the list of airports matching the date selected

#    Declarative
  Scenario: verify the user is able to search for the available future flights in declarative test
    And user searches for the future flights with valid inputs
    Then user should see the list of airports matching the date selected


  Scenario Outline: verify the user is able to search for the available future domestic flights
    And user enter <dep_city> in the flying from and select <dep_airport> from the list of airports
    And user enter <arr_city> in the flying To and select <arr_airport> from the list of airports
    And user selects future departing date
    And user selects future arrival date
    And user clicks on the search button
    Then user should see the list of airports matching the date selected

    Examples:
      | dep_city             | dep_airport  | arr_city  | arr_airport   |
      | columbus             | Columbus, OH | cleveland | Cleveland, OH |
      | chicago              | Ohare, IL    | austin    | Austin, TX    |
      | columbus             | Columbus, OH | cleveland | Cleveland, OH |
      | lkfdsajfkldfjfklasfj | Columbus, OH | cleveland | Cleveland, OH |
      | columbus             | Columbus, OH | cleveland | Cleveland, OH |
      | columbus             | Columbus, OH | cleveland | Cleveland, OH |


  Scenario: verify the user gets warnings when searching for past day flights without destination airport details
    And user enter columbus in the flying from and select Columbus from the list of airports
    And user enter cleveland in the flying To and select Cleveland from the list of airports
    And user selects past departing date
    And user selects past arrival date
    And user clicks on the search button
    Then user should see the below
      | warnings                                       |
      | Dates must be between 2/1/2019 and 12/28/2019. |
      | The date must be 2/1/2019 or after.            |


  Scenario: verify the user gets warnings when searching for past day flights without destination airport details in Declarative style
    And user searches for the past flights with valid inputs
    Then user should see the below
      | warnings                                       |
      | Dates must be between 2/1/2019 and 12/28/2019. |
      | The date must be 2/1/2019 or after.            |


