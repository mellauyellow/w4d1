class Contact < ActiveRecord::Base
  validates :name, :email, :user_id, presence: true
  validates_uniqueness_of :user_id, :scope => :email

  belongs_to :owner,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_many :contact_shares,
    class_name: :ContactShare,
    primary_key: :id,
    foreign_key: :contact_id

  has_many :shared_users,
    through: :contact_shares,
    source: :user
end
