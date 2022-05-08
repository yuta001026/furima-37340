FactoryBot.define do
  factory :item do
    name               {'いぬ'}
    explain            {'いぬのがぞう'}
    state_id           {'2'}
    category_id        {'7'}
    delivery_fee_id    {'3'}
    region_id          {'12'}
    shipping_day_id    {'2'}
    price              {'300'}
    association        :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
