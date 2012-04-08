class User < ActiveRecord::Base

  has_attached_file                 :avatar, 
                                    :url                => "/assets/avatar/:id/_:style_:basename.:extension",
                                    :path               => ":rails_root/public:url",
                                    :styles             => { :big => "73x73>", :medium => "48x48>", :small => "24x24>" },
                                    :default_url        => "/assets/avatar/default_:style.jpg"
  validates_attachment_content_type :avatar,
                                    :content_type => ['image/jpeg', 'image/png', 'image/gif'],
                                    :message => 'Seriously, WTF file is that?!'
  #validates_attachment_size         :avatar,
  #                                  :less_than => 700.kilobytes
  #                                  :message => 'Your avatar to big!!'
                                    
  has_many                          :tees
  has_many                          :comments

  devise                            :database_authenticatable, :confirmable, :lockable, :recoverable,
                                    :rememberable, :registerable, :trackable, :timeoutable, :validatable,
                                    :token_authenticatable
         
  
  attr_accessible   :avatar, :login, :email, :password, :password_confirmation,:remember_me, :name, :username, :location, :website, :description
  validates         :username, :email, :presence => true
  attr_accessor     :login
  protected
  #allowing auth login using email or name
  def self.find_for_authentication(conditions)
     login = conditions.delete(:login)
     where(conditions).where(["username = :value OR email = :value", { :value => login }]).first
  end

end
