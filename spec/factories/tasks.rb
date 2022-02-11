FactoryBot.define do
    factory :task do
      name { "テストを書く" }
      description { "Rspecを準備" }
      user
    end
end