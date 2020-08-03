require 'date'
class Home < SitePrism::Page
  set_url '/'

  ##### Hotel Element ######
  element :product_search_destination, 'input[id="productSearchDestination"]'
  element :destination_location, '#destinationDropDownList-place1'
  element :hotel_guest_room, '#productSearchGuestRoom'
  element :guest_tix_plus, :xpath, '(//*[@class="tix tix-plus"])[1]'
  element :room_tix_plus, :xpath, '(//*[@class="tix tix-plus"])[2]'
  element :done_filter, :xpath, '(//*[@class="tix tix-cancel"])[5]'
  element :product_form_search_btn, '.product-form-search-btn'
  element :account_label, :xpath, '//*[@class="account-label"]'
  element :account_item_logout, :xpath, '(//*[@class="account-item"])[7]'
  element :modal_logout_yes, :xpath, '//*[@class="logout-yes"]' 
  
  ##### Filght Element ######
  element :product_box_filght, :xpath, '(//*[@class="product-box"])[1]'
  element :radio_botton_round_trip, :xpath, '(//*[@for="roundTrip"])'
  element :select_form_airport, 'toDropDownList-airport1'
  element :from_input, '#productSearchFrom'
  element :to_input, "#productSearchTo"
  element :search_destination_flight, :xpath, '//*[@class="product-form-search-btn"]'
  element :from_list_airport1, ('#fromDropDownList-airport1')
  element :to_list_airport1, ('#toDropDownList-airport1')
  element :start_date_flight, ('#startDate')
  element :end_date_flight, ('#endDate')
  date_next_month = Date.today.next_month
  element :select_date_start, :xpath, "((//*[@class='CalendarMonth CalendarMonth_1'])[3]//tbody/tr/td/div)[#{date_next_month.day}]"
  element :select_date_end, :xpath, "((//*[@class='CalendarMonth CalendarMonth_1'])[2]//tbody//tr/td/div)[#{date_next_month.next_day.day}]"
  element :done_passenger_cabin, :xpath, '//*[@class="passenger-cabin-drop-down-text"]//span'
  element :button_search_flight, :xpath, '//*[@class="product-form-search-btn"]'
  element :onboarding_filght, :xpath, '(//*[@class="comp-info-box"]//div)[3]'
  element :ab_close_button, :xpath, '(//*[@class="ab-close-button"])[1]'


  def input_search_destinatiom(destination)
    product_search_destination.set(destination)
    wait_until_destination_location_visible
    sleep 1
    execute_script("document.getElementById('destinationDropDownList-place1').click()")
  end

  def input_guest_and_room(int, int2)
    wait_until_hotel_guest_room_visible
    hotel_guest_room.click
    wait_until_guest_tix_plus_visible

    ##### Loop For Guest and Room Hotel#####
    i = 0
    guest = int
    room = int2
    begin
        guest_tix_plus.click
        i +=1
    end while i < guest 
    
    (0..room).each do |i|
        room_tix_plus.click
    end
  end

  def select_product_flight
    wait_until_product_box_filght_visible
    product_box_filght.click
  end

  def radio_button_round_trip
    wait_until_radio_botton_round_trip_visible
    radio_botton_round_trip.click
  end

  def input_form_and_to_flight(from, to)
    wait_until_from_input_visible
    from_input.send_keys(from)
    execute_script("document.getElementById('fromDropDownList-airport1').click()")
    wait_until_to_input_visible
    to_input.send_keys(to)
    sleep 1
    execute_script("document.getElementById('toDropDownList-airport1').click()")
  end
  
  def select_date
    wait_until_start_date_flight_visible
    start_date_flight.click
    wait_until_select_date_start_visible
    select_date_start.click
    wait_until_select_date_end_visible
    select_date_end.click
    wait_until_done_passenger_cabin_visible
    done_passenger_cabin.click
  end

  def logout_from_profile
    account_label.click
    account_item_logout.click
    modal_logout_yes.click
  end

  def skip_ab_modal
    if has_ab_close_button?(wait: 5) == true
        ab_close_button.click
    end
end
end