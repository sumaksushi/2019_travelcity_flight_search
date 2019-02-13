module Utilities

  def new_date no_of_days
    (Time.now + 60 * 60 * 24 * no_of_days).strftime("%m/%d/%Y")
  end

  # all_prices = @browser.spans(:class=>'full-bold no-wrap').each do |price|
  #   p price.text.gsub("$",'').gsub(',','').to_i
  # end
  # original_prices = all_prices
  # sorted_prices = all_prices.sort
  #
  # fail "Prices are not in ascending order" unless original_prices == sorted_prices

  def verify_results_are_same? expected_results, actual_results
    # if expected_results == actual_results
    #   p "PASS - #{expected_results} is same as #{actual_results}"
    # else
    #   fail "#{expected_results} is NOT same as #{actual_results}"
    # end


  end


end