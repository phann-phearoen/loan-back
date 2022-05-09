class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  def self.authenticate(email, password)
    user = User.find_for_authentication(email: email)
    user&.valid_password?(password) ? user : nil
  end
  def self.get_user_by_id user_id
    self.where(id: user_id).last
  end
  def as_json(options = {})
    super(options.merge({ except: [:created_at, :is_deleted, :uuid, :updated_at] }))
  end
  
  protected
  def confirmation_required?
    false
  end
end
