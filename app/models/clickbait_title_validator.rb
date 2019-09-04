class ClickbaitTitleValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    unless value && (value.match(/Won't Believe/) || value.match(/Secret/) || value.match(/Top\s\d/) || value.match(/Guess/))
      record.errors[:title] << "Not clickbait-y"
    end
  end

end
