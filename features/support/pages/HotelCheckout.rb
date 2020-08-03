class HotelCheckout < SitePrism::Page
    set_url '/hotel/checkout'

    element :ab_close_button, :xpath, '(//*[@class="ab-close-button"])[1]'
    element :tix_core_dropdown, :xpath, '(//*[@class="tix-core-dropdown"])[1]'
    element :list_drop_down_mr, :xpath, '(//*[@data-value="Mr"])[1]'
    element :field_cp_name, 'input[name="cp-name"]'
    element :field_cp_phone, 'input[name="cp-phone"]'
    element :field_cp_email, 'input[name="cp-email"]'
    element :button_checkout, '.btn.pull-right.tix-button-2'
    element :price, :xpath, '//*[@class="value tix-text-orange"]'
    element :smoking_preference, 'input[name="smokingPreference"]'
    element :bed_type_preference, 'input[name="bedTypePreference"]'

    def smoking_preference_exist
        if has_smoking_preference?(wait: 3) == true
            smoking_preference.click
        end
    end

    def bed_type_preference_exist
        if has_bed_type_preference?(wait: 3) == true
            bed_type_preference.click
        end
    end
end