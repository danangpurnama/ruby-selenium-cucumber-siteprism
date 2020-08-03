class HotelSearch < SitePrism::Page
  set_url '/hotel/search'

  element :destination_input, '#destination-input'
  element :guest_and_room, :xpath, '//*[@name="guestAndRoom"]'
  element :title_hotel, :xpath, '(//*[@class="title ellipsis"])[1]'
  element :after_price, :xpath, '(//*[@class="after-price"])[1]'
end