class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :buys

  validates :nickname, presence: true
  validates :first_name, presence: true, format: {
    with: /\A[ぁ-んァ-ン一-龥]+\z/  }
  validates :last_name, presence: true, format: {
    with: /\A[ぁ-んァ-ン一-龥]+\z/  }
  validates :birthday, presence: true
  validates :email, presence: true

  validates :first_name_furi, presence: true,
       format: {
          with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/  }
  validates :last_name_furi, presence: true,
       format: {
          with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/ }
  validates :password, presence: true, length: { minimum: 6 },
      format: {
          with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i} 
                  
 #with_options presence: true, format: {
 #       with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/  } do
  #validates :first_name_furi  
  #validates :last_name_furi
  #end       
#with_options presence: true, length: { minimum: 6 },format: {
 #   with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i } do
  #validates :encrypted_password
  #end       
end
