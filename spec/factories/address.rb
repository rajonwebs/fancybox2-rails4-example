FactoryGirl.define do
  factory :address do
    name 'Molly The Cat'
    street '123 Main Street'
    city 'Hometown'
    state 'ME'
    zip '12345'

    factory :new_address do
      name 'Frank the Beagle'
    end

    factory :invalid_address do
      name nil
    end
  end
end
