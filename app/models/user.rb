class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :user_projects, dependent: :destroy
  has_many :projects, through: :user_projects
  has_many :comments, dependent: :destroy
  has_many :milestones, through: :comments
  belongs_to :company
end
