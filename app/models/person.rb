class Person < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :person_has_role, class_name: "PersonHasRole"
  has_many :roles, through: :person_has_role
  belongs_to :city, optional: true
  
  validates :firstname, presence: true, length: { minimum: 3, maximum: 45 }
  validates :lastname, presence: true, length: { minimum: 3, maximum: 45 }
  validates :email, presence: true, uniqueness: true, length: { minimum: 3, maximum: 100 }

  def admin?
    check_role('admin')
  end

  def moderator?
    check_role('moderator')
  end

  def user?
    check_role('user')
  end

  private
  def check_role(role)
    roles.any? { |r| r.slug == role }
  end

end
