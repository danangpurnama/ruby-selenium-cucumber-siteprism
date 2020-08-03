class Login < SitePrism::Page
    set_url '/login'
  
    element :button_login_fb, :xpath, '(//*[@class="btn-list"]//li)[3]'
    element :field_name_fb, 'input[id="email"]'
    element :field_password_fb, 'input[id="pass"]'
    element :login_btn_fb, '#loginbutton'
    element :button_login_gmail, :xpath, '(//*[@class="btn-list"]//li)[2]'
    element :field_email_gmail, 'input[type="email"]'
    element :next_email, '#identifierNext'
    element :field_password_gmail, 'input[type="password"]'
    element :next_password, '#passwordNext'
  
    def login_with_gmail(email, password)
        button_login_gmail.click
        field_email_gmail.send_keys(email)
        wait_until_next_email_visible
        next_email.click
        field_password_gmail.send_keys(password)
        wait_until_next_password_visible
        next_password.click
        sleep 15
    end

    def login_with_fb (phone, password)
        button_login_fb.click
        field_name_fb.send_keys(phone)
        field_password_fb.send_keys(password)
        login_btn_fb.click
        sleep 15
    end
end