class Price
  def initialize(value)
    @currency = value.split(' ')[0]
    @value = (value.split(' ')[1].to_f * 100).to_i
  end

  def to_s
    "#{currency} #{value / 100.0}"
  end

  private

  attr_reader :value, :currency
end

class Price
  class Type < ActiveRecord::Type::Value
    def cast(value)
      Price.new(value)
    end

    def serialize(value)
      value.to_s
    end
  end
end
