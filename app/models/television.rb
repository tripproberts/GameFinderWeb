class Television < ActiveRecord::Base
  belongs_to :user

  def as_json(options={})
    {
      id: id,
      name: name,
      brand: brand,
      cable_company: cable_company
    }
  end
end
