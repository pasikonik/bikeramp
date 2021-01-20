FactoryBot.define do
  factory :trip do
    start_address { 'Zeromskiego 52, Wroclaw, Polska' }
    destination_address { 'Bujwida 18, Wroclaw, Polska' }
    distance { 12.5 }
    price { BigDecimal('25.75') }
    date { DateTime.now }
  end
end
