FactoryBot.define do
  factory :user do
    full_name { 'Test User' }
    email { 'test@user.com' }
    password { '123456789' }
    password_confirmation { '123456789' }
  end
end
