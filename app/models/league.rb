class League < ActiveRecord::Base
  has_many :competitors

  def as_json(options={})
    {
      id: id,
      name: name
    }
  end
end
