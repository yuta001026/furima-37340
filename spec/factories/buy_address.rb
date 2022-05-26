FactoryBot.define do
  factory :buy_address do
    postal_code       {"444-4444"}
    region_id   {1}
    municipality            {"あああ市"}
    house_number    {"いいい区"}
    telephone_number    {"08027245201"}
    building      {"森ビル"}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
