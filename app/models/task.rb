class Task < ApplicationRecord
def self.ransackable_attributes(auth_object = nil)
  %w[name created_at]
end
def self.ransackable_associations(auth_object = nil)
  []
end
  scope :recent, -> { order(created_at: :desc) }
  validates :name, presence: true, length: { maximum: 30 }
  validate :validate_name_not_including_conma
  has_one_attached :image

  belongs_to :user
private

def validate_name_not_including_conma
    errors.add(:name, "にカンマを含めることはできません") if name&.include?(",")
end

end
