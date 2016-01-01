class TranportBrand < ActiveRecord::Base
  has_many :transpost_brands

  enum type: {car: 0, moto: 1, bike: 2}
end
