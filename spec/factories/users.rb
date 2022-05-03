FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {Faker::Internet.free_email}
    password              {'a123456'}
    password_confirmation {password}
    name_sei              {'西川'}
    name_mei              {'優太'}
    name_sei_kana         {'ニシカワ'}
    name_mei_kana         {'ユウタ'}
    birthday              {'2000-10-26'}
  end
end