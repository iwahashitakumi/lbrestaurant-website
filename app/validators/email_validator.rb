class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value.match(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
      record.errors.add(attribute, options[:message] || "の形式が不正です")
    end
  end
end
