require 'faker'

FactoryBot.define do
  factory :user, aliases: [:author, :commenter] do
    username { Faker::Internet.username(specifier: 5..30) }
    email { Faker::Internet.safe_email(name: username)  }
    password { Faker::Internet.password(min_length: 8) }
    password_confirmation { password }
  end
end
