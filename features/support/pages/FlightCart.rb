class FlightCart < SitePrism::Page
    set_url '/cart/flight'

    element :switch_button, :xpath, '//*[@class="switch"]'
    element :dropdown_country, :xpath, '(//*[@class="tix tix-chevron-down"])[7]'
    element :input_search_country, :xpath, '(//*[@type="text"])[9]'
    element :select_result_country, :xpath, '(//*[@class="ul-list-menu"])[1]'
    element :button_continue_pay, '.v3-btn.v3-btn__yellow.pull-right'
    element :total_price_flight, :xpath, '(//*[@class="row total-payment"]//span)[2]'
    element :field_phone_detail_order, 'input[name="cp-phone"]'
    element :button_confirm_yes, :xpath, '(//*[@class="btn-notif"]//button)[2]'
    element :notif_button, :xpath, '//*[@class="btn-notif"]//button'
    element :dropdown_passenger, :xpath, '(//*[@class="input-flight-dropdown"])[2]'
    element :field_nama_passenger, :xpath, '(//*[@class="input-list-autocomplete"])[2]'
    element :list_dorpdown_man, :xpath, '(//*[@class="ul-list-menu"]//li)[1]'

    def detail_order(phone)
        wait_until_field_phone_detail_order_visible
        field_phone_detail_order.set phone
    end

    def switch_passenger_button
        wait_until_switch_button_visible
        switch_button.click
    end

    def detail_passenger(name, country)
        wait_until_dropdown_passenger_visible
        dropdown_passenger.click
        wait_until_list_dorpdown_man_visible
        list_dorpdown_man.click
        wait_until_field_nama_passenger_visible
        field_nama_passenger.set name
        wait_until_dropdown_country_visible
        dropdown_country.click
        wait_until_input_search_country_visible
        input_search_country.set country
        wait_until_select_result_country_visible
        select_result_country.click
    end

    def click_button_continue_pay
        wait_until_button_continue_pay_visible
        button_continue_pay.click
        wait_until_button_confirm_yes_visible
        button_confirm_yes.click
    end

    def skip_notif_button
        if has_notif_button? == true
            notif_button.click
        end
    end
end