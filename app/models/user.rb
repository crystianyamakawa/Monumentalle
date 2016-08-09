class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, :validatable
  #
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable,
          :registerable,:omniauthable, :omniauth_providers => [:google_oauth2]
  #has_secure_password

  #has_and_belongs_to_many :pages
  #has_many :section_edits
  #has_many :sections, :through => :section_edits

  EMAIL_REGEX = /\A[a-z0-9,_%.+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
  # validates_presence_of :first_name
  # validates_length_of :first_name, :maximum => 25
  # validates_presence_of :last_name
  # validates_length_of :last_name, :maximum => 50
  # validates_presence_of :username
  # validates_length_of :username, :widthin => 8..25
  # validates_uniqueness_of :username
  # validates_presence_of :email
  # validates_length_of :email, :width => 100
  # validates_format_of :email, :with => EMAIL_REGEX
  # validates_confirmation_of :email


  validates :first_name, :presence => true,
                         :length => { :maximum => 25 }
  validates :last_name,  :presence => true,
                         :length => { :maximum => 50 }
  validates :username,   :presence => true,
                         :length => { :within => 3..25 },
                         :uniqueness => true
  validates :email,      :presence => true,
                         :length => { :maximum => 100 },
                         :format => EMAIL_REGEX,
                         :confirmation => true

  #validate  :no_new_users_on_today, :on => :create
  scope :sorted, lambda { order("last_name ASC, first_name ASC") }

  def name
    "#{first_name} #{last_name}"
  end

  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
  data = access_token.info
  if (User.admins.include?(data.email))
    user = User.find_by(email: data.email)
    if user
      user.provider = access_token.provider
      user.uid = access_token.uid
      user.token = access_token.credentials.token
      user.save
      user
    else
      redirect_to new_user_registration_path, notice: "Error."
    end
  end
end

end
