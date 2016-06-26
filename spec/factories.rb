FactoryGirl.define do
  factory :todo do
    title 'Todo'
  end

  factory :user do
    sequence :username do |n|
      "username#{n}"
    end
  end
end
