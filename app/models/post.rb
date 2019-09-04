class Post < ActiveRecord::Base
  validates :title, :content, :summary, :category, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-fiction) }

  validate :title_is_sufficient

  def title_is_sufficient
    if self.title && (self.title.include?("Won't Believe") || self.title.include?("Secret") || self.title.include?("Top[number]") || self.title.include?("Guess"))
      true
    else
      self.errors.add(:title, "Invalid title")
    end
  end
end
