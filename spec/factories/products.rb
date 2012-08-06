FactoryGirl.define do
  factory :product do |p|
    p.sequence(:title) { |n| "Pizza #{n}" }
    p.sequence(:price) { |n| "#{n}.23" }
    p.ingredients { [FactoryGirl.create(:ingredient)] }
  end
end
