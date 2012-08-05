# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ingredient do |i|
    i.name "Mais"
    i.quantity "3"
    i.price "0.89"
  end
end
