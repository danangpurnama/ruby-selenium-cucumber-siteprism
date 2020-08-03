Given('I navigate to login page and login with email') do
    account = File.read("features/testdata/user_acoount.json")
    obj = JSON.parse(account)
    @test_site.login.load
    @test_site.login.login_with_gmail(obj["account_gmail"]["email"], obj["account_gmail"]["password"])
end
  
When('I try to create transaction domestic round trip with {int} transit') do |int|
    ##### Close If any Popup #####
    @test_site.home.skip_ab_modal

    @test_site.home.select_product_flight
    @test_site.home.radio_button_round_trip
    @test_site.home.input_form_and_to_flight("Jakarta", "Labuan Bajo")
    @test_site.home.select_date
    @test_site.home.wait_until_button_search_flight_visible
    @test_site.home.button_search_flight.click
    @test_site.home.onboarding_filght.click
    
    ##### Close If any Popup #####
    @test_site.home.skip_ab_modal
    @test_site.flightsearch.checkbox_transit

    ##### Get Price From and To, convert to integer#####
    $price_from = (@test_site.flightsearch.text_price.text).tr('IDR .','').to_i
    @test_site.flightsearch.botton_book_from
    $price_to = (@test_site.flightsearch.text_price.text).tr('IDR .','').to_i
    @test_site.flightsearch.botton_book_to
    @test_site.flightcart.detail_order("082137932843")
    @test_site.flightcart.detail_passenger("Tiket Test", "Indonesia")
        
    ##### Assert Total Price Flight #####
    $total_price_flight = ($price_from+$price_to).to_s.reverse.scan(/\d{1,3}/).join(".").reverse
    expect(@test_site.flightcart.total_price_flight.text).to eq("IDR #{$total_price_flight}")
    @test_site.flightcart.click_button_continue_pay
    @test_site.flightcart.skip_notif_button
end
  
When('I pay using virtual account') do
    $totalprice = @test_site.payment.curency.text
    $order_id = @test_site.payment.order_id.text
    @test_site.payment.virtual_bca
end

Then('I should transaction flight created and price correct') do
    @test_site.myorder.load
    @test_site.myorder.onboarding_my_order
    @test_site.myorder.detail_my_order
    expect(@test_site.myorder.detail_price.text).to eq($totalprice)
    @test_site.home.logout_from_profile
end