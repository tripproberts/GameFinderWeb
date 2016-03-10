class Television < ActiveRecord::Base
  belongs_to :user

  def as_json(options={})
    {
      brand: brand,
      cable_company: cable_company
    }
  end
end
