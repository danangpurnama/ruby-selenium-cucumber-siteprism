class TestSite
    def home
        @home ||= Home.new
    end

    def hotelsearch
        @hotelsearch ||= HotelSearch.new
    end 

    def hotel
        @hotel ||= Hotel.new
    end

    def hotelcheckout
        @hotelcheckout ||= HotelCheckout.new
    end

    def hotelorder
        @hotelorder ||= HotelOrder.new
    end

    def login
        @login ||= Login.new
    end

    def myorder
        @myorder ||= MyOrder.new
    end

    def flightsearch
        @flightsearch ||= FlightSearch.new
    end

    def flightcart
        @flightcart ||= FlightCart.new
    end

    def payment
        @payment ||= Payment.new
    end
end