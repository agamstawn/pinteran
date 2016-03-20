class Photo < ActiveRecord::Base

  scope :status_active, -> {where(status: 'active')}


  validates :title, presence: true,
    length: { minimum: 5 }
  validates :content, presence: true,
    length: { minimum: 10 }
  validates :status, presence: true

  has_many :comments, dependent: :destroy

  has_attached_file :gambar, styles: { medium: "400x200>", thumb: "200x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :gambar, content_type: /\Aimage\/.*\Z/
  validates_with AttachmentSizeValidator, attributes: :gambar, less_than: 200.kilobytes


  self.per_page = 10

  def self.search(search)
      if search
          where(["title LIKE ?","%#{search}%"])
      else
         all
      end
  end
end
