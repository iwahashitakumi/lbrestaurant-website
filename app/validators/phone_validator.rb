class PhoneValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value.match(/\A0[-\d]{10,11}\z/)
      record.errors.add(attribute, options[:message] || "の形式が不正です")
    end
  end
end
