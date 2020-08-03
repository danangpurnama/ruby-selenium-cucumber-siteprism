class Payment < SitePrism::Page
    element :payment_virtual_bca, :xpath, '(//*[@class="tix tixicon tixicon-right"])[6]'
    element :button_continue, '.button.default.primary '
    element :order_id, '.title-extra>p:nth-child(2)'
    element :curency, '.currency'

    def virtual_bca
        wait_until_payment_virtual_bca_visible
        payment_virtual_bca.click
        wait_until_button_continue_visible
        button_continue.click
    end
end