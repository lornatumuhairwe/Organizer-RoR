FactoryBot.define do
  factory :item do
    title "MyString"
    description "MyText"
    category factory: :category
  end
end
