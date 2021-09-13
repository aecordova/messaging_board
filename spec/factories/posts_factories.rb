# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :post do
    title { Faker::Lorem.sentences(number: 1).join(' ') }
    body { Faker::Lorem.paragraphs(number: 4).join(' ') }
    author
  end
end
