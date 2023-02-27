class ShortUrl < ApplicationRecord

    before_create :generate_short_url

    validates :full_url, presence: true, uniqueness: true
    validates :code, uniqueness: true

    has_many :visit_histories, dependent: :destroy

    def generate_short_url
      self.code ||= SecureRandom.hex(4)
    end

end
