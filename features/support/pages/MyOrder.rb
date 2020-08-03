class MyOrder < SitePrism::Page
    set_url '/myorder'
  
    element :order_details_id, :xpath, '(//*[@class="card-order-details"]//div/p)[1]'
    element :order_details_id_list, :xpath, '//*[@class="order-details id"]//p'
    element :button_see_details_first, :xpath, '(//*[@class="see-details"])[1]'
    element :detail_order_id_all, :xpath, '//*[@class="order-details id"]//p'
    element :detail_order_id, ('.order-id')
    element :detail_price, ('.price-total>.price')
    element :onboarding_button, ('.btn.pointer-button')

    def detail_my_order
        wait_until_button_see_details_first_visible
        button_see_details_first.click
    end

    def onboarding_my_order
        if has_onboarding_button? == true
            onboarding_button.click
        end
    end
  end