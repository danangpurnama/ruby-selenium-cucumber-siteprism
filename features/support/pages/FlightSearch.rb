class FlightSearch < SitePrism::Page
    set_url '/pesawat/search'

    element :checkbox_two_transit, :xpath, '(//*[@class="check"])[3]//label'
    element :text_price, :xpath, '(//*[@class="col-xs-7"])[1]//div'
    element :button_book_now, :xpath, '(//*[@class="btn-book-now"])[1]'

    def checkbox_transit
        wait_until_checkbox_two_transit_visible
        checkbox_two_transit.click
    end

    def botton_book_from
        wait_until_button_book_now_visible
        button_book_now.click
    end

    def botton_book_to
        wait_until_button_book_now_visible
        button_book_now.click
    end

end