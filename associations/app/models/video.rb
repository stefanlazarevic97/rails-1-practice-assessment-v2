# == Schema Information
#
# Table name: videos
#
#  id          :bigint           not null, primary key
#  title       :string           not null
#  description :text             not null
#  uploader_id :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Video < ApplicationRecord
    has_many :likes,
        foreign_key: :video_id,
        dependent: :destroy

    has_many :comments,
        foreign_key: :video_id,
        dependent: :destroy

    belongs_to :uploader,
        class_name: :User

    has_many :likers,
        through: :likes,
        source: :liker

    has_many :commenters,
        through: :comments,
        source: :commenter

    has_many :likers_comments,
        through: :likers,
        source: :comments

    
end