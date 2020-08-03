Given('I navigate to login page and login with facebook') do
    account = File.read("features/testdata/user_acoount.json")
    obj = JSON.parse(account)
    @test_site.login.load
    @test_site.login.login_with_fb(obj["account_fb"]["phone"], obj["account_fb"]["password"])
end
  
When('I try to book hotel for {int} guest and {int} room') do |guest, room|
    @test_site.home.load

    ##### Close If any Popup #####
    @test_site.home.skip_ab_modal

    @test_site.home.input_search_destinatiom("Bali")
    @test_site.home.select_date
    @test_site.home.input_guest_and_room(guest, room)
    @test_site.home.done_filter.click

    ##### Check Filter Before Search #####
    expect(@test_site.home.product_search_destination['value']).to include('Bali')
    expect(@test_site.home.hotel_guest_room['value']).to include("#{guest.to_s} Tamu, #{room.to_s} Kamar")
    @test_site.home.product_form_search_btn.click
    price = @test_site.hotelsearch.after_price.text
     
    ##### Close If any Popup #####
    @test_site.home.skip_ab_modal
    
    ##### Check Filter Before Search #####
    expect(@test_site.hotelsearch.destination_input['value']).to include('Bali')
    expect(@test_site.hotelsearch.guest_and_room['value']).to include("#{room.to_s} Kamar, #{guest.to_s} Tamu")
    @test_site.hotelsearch.title_hotel.click
    switch_to_window(windows.last)
    
    ##### Close If any Popup #####
    @test_site.home.skip_ab_modal

    ##### Check Filter Before Search and Price #####
    expect(@test_site.hotel.select_box['value']).to include("#{guest.to_s} Tamu, #{room.to_s} Kamar")
    expect(@test_site.hotel.price.text).to eq(price)
    @test_site.hotel.button_book.click
    $totalprice = @test_site.hotelcheckout.price.text

    ##### Close If any Popup #####
    @test_site.home.skip_ab_modal
    @test_site.hotelcheckout.smoking_preference_exist
    @test_site.hotelcheckout.bed_type_preference_exist
    @test_site.hotelcheckout.wait_until_button_checkout_visible
    @test_site.hotelcheckout.button_checkout.click
    $order_id = @test_site.hotelorder.order_id.text
end
  
Then('I should transaction created and price correct') do
    @test_site.myorder.load
    @test_site.myorder.onboarding_my_order
    @test_site.myorder.detail_my_order
    expect(@test_site.myorder.detail_order_id.text).to eq($order_id)
    expect(@test_site.myorder.detail_price.text).to eq($totalprice)
    @test_site.home.logout_from_profile
end