FactoryGirl.define do
  factory :item do
    sequence :name do |n|
      "#{n}name"
    end
    sequence :description do |n|
      "#{n}description"
    end
    image_url "http://www.511tactical.com/media/catalog/product/cache/1/small_image/9df78eab33525d08d6e5fb8d27136e95/12110/120/12110_120_01.jpg"
  end
end
