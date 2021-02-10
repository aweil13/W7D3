FactoryBot.define do
    factory :user do
        username { Faker::Names.username}
        password { 'bulma'}
    end
end