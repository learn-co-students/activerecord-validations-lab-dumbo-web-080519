class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction),
        message: "%{value} is not a valid category" }
    validate :title_sufficiently_clickbaity
    
    def title_sufficiently_clickbaity
        if title.present? && !title.include?("Won't Believe") && !title.include?("Secret") && !title.include?("Top [number]")  && !title.include?("Guess")
            errors.add(:title, "must be clickbait")
        end
    end
    
end
