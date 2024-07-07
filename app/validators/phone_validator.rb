class PhoneValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value.match(/\A0\d{9,10}\z|\A0\d{2}-\d{3,4}-\d{3,4}\z/)
      record.errors.add(attribute, options[:message] || "の形式が不正です")
    end
  end
end
