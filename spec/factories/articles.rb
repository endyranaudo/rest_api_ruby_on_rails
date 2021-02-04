FactoryBot.define do
  factory :article do
    # sequence() allows us to have each instance with dynamic progressive content so each property will be unique
    sequence(:title) { |n| "My article #{n}" }
    sequence(:content) { |n| "Content of my article #{n}" }
    sequence(:slug) { |n| "my-article-#{n}" }
  end
end
