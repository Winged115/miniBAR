class Patron < ActiveRecord::Base
  has_many :tabs
  has_many :tab_items, through: :tabs

  has_secure_password

  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true

  validate :bar_email_nonexistent

  def bar_email_nonexistent
    if Bar.find_by(email: self.email)
      errors.add :email, "is taken"
    end
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
