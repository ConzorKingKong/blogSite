class Micropost < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  mount_uploader :video, VideoUploader
  validates :user_id, presence: true
  validates :content, length: {maximum: 1000}
  validate :has_a_name
  validate :picture_size
  # validate :set_success

  private

  # Validates the size of an uploaded picture
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end

  def set_success(format, opts)
    self.success = true
  end

  def has_a_name
  unless [content?, picture?, video?].include?(true)
    errors.add :base, 'You need at least one input in the micropost!'
  end
end

end
