
FactoryGirl.define do
  factory :product, :class => Refinery::Ironman::Product do
    sequence(:product_no) { |n| "refinery#{n}" }
  end
end

