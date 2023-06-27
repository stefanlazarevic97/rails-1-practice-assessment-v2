# == Schema Information
#
# Table name: comments
#
#  id                :bigint           not null, primary key
#  body              :string           not null
#  video_id          :bigint           not null
#  commenter_id      :bigint           not null
#  parent_comment_id :bigint
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class Comment < ApplicationRecord
    belongs_to :commenter,
        class_name: :User

    belongs_to :video

    belongs_to :parent_comment,
        class_name: :Comment,
        optional: true

    has_many :replies,
        foreign_key: :parent_comment_id,
        class_name: :Comment,
        dependent: :destroy

    has_one :parent_commenter,
        through: :parent_comment,
        source: :commenter
end