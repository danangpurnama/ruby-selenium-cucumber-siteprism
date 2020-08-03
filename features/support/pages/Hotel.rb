class Hotel < SitePrism::Page
    set_url '/hotel/indonesia'

    element :button_book, :xpath, '(//*[@class="btn-book tix-button-2"])[1]'
    element :select_box, '.select-box-input.tix-pointer.borderless'
    element :price, :xpath, '(//*[@class="rc-price"]//span)[2]//span//span'
end