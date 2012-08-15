class Tagging < ActiveRecord::Base
  belongs_to :tag
  belongs_to :article
  attr_accessible :tag, :article
end
