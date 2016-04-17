class Television < ActiveRecord::Base
  belongs_to :user

  after_update :ensure_only_one_selected

  def as_json(options={})
    {
      id: id,
      name: name,
      brand: brand,
      cable_company: cable_company,
      selected: selected || false
    }
  end

  private

  def ensure_only_one_selected
    if selected
      user.televisions.each do |tv|
        tv.update!(selected: false) unless tv == self
      end
    end
  end
end
