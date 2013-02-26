# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ingredient do |i|
    i.sequence(:name) { |n| "Ingredient #{n}" }
    i.sequence(:quantity) { |n| "#{n}" }
    i.sequence(:threshold) { |n| "#{n}" }
    i.sequence(:price) { |n| "#{n}.89" }
    i.active true
  end
end
