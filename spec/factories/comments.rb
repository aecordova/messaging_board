FactoryBot.define do
  factory :comment do
    content { Faker::Quote.most_interesting_man_in_the_world }
    author
    post
  end
end
