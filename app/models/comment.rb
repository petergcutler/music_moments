class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :commentable, :polymorphic => true, :counter_cache => true
end
