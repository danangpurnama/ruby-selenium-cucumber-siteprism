class HotelOrder < SitePrism::Page
    element :login_button, '.button.flat.card-label-value'
    element :order_id, '.title-extra>p:nth-child(2)'
    element :curency, '.currency'
end