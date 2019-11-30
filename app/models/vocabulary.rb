class Vocabulary < ApplicationRecord
  before_validation :set_contentless_name
  
  validates :word, presence: true, length: {maximum: 30}
  validates :meaning, length: {maximum: 30}
  validates :comment, length: {maximum: 100}

  validate :validate_word_not_including_mark

  private
    def validate_word_not_including_mark
      if word&.include?('?') || word&.include?('%') || word&.include?('#')
        errors.add(:word, 'に「－」ハイフン以外の記号は使えません')
      end
    end

    def set_contentless_name
      self.meaning = '意味登録なし' if meaning.blank?
      self.comment = 'コメント登録なし' if comment.blank?
    end
end
