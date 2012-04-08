class Tee < ActiveRecord::Base
  has_attached_file                 :design, 
                                    :url                => "/assets1/tees/:id/:style_:basename.:extension",
                                    :path               => ":rails_root/public:url",
                                    :styles             => { :big => "800x400>",:small => "160x80>" },
                                    :default_url        => "/assets1/tees/default_:style.jpg"
  validates_attachment_content_type :design,
                                    :content_type => ['image/jpeg', 'image/png', 'image/gif'],
                                    :message => 'Seriously, WTF file is that?!'
  belongs_to                        :user
  has_many                          :comments, :as => :commentable

  attr_accessible :design, :user_id, :name, :category, :content, :published
  validates :name,  :presence => true, :length => { :maximum => 35 }
  validates :design, :category, :content,:presence => true

    CATEGORY = ['Finished - Tee For Sale', 'Unfinished - Want Critiques']

   #email verification!
  def published?
    published
  end

  def published!
   self.published = true
   save
  end

  def unpublished!
   self.published = false
   save
  end
  

  
end
