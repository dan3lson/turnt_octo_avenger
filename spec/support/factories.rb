FactoryGirl.define do
  factory :restaurant do
    name "Mangu"
    street1 "123 Main St"
    street2 "Apt 3"
    city "Bronx"
    state "NY"
    zipcode "10473"
  end

  factory :restaurant_category do
    restaurant
    category
  end

  factory :category do
    name "Dominican"
  end

  factory :review do
    rating 3
    description "Best mangu on earth - go get some now!"
    restaurant
  end
end
