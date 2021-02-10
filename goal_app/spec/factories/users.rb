FactoryBot.define do
    factory :user do
        username { Faker::Name.unique.username}
        password { 'bulma'}
    end
end