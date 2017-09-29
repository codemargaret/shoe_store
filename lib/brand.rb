class Brand < ActiveRecord::Base
  has_and_belongs_to_many(:stores)
  validates(:name, {:presence => true, :length => {:maximum => 100}})
  # validates(:price, {:presence => true})
  validates_uniqueness_of :name
  before_save :cap_name
  before_save :money_format

private

  def cap_name
    name = self.name
    words = name.split(" ")
    cap_words = []
    words.each do |word|
      cap_words.push(word.capitalize)
    end
    self.name = cap_words.join(" ")
  end

  def money_format
    price_before = self.price
    price_after = '%.02f' % price_before
    self.price = price_after
  end
end
