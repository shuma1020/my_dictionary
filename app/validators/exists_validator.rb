class ExistsValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    model = record.class
    unless model.where(attribute.to_sym => value).count > 0
      record.errors.add(attribute, :invalid)
    end
  end

end