class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :buys

  with_options presence: true do
  validates :nickname
  validates :birthday
  validates :email
  end 
  
  validates :password, presence: true, length: { minimum: 6 },
      format: {
          with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i} 
                  
 with_options presence: true, format: {
  with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/  } do
  validates :first_name_furi  
  validates :last_name_furi
  end       

  with_options presence: true, format: {
  with: /\A[ぁ-んァ-ン一-龥]+\z/   } do
   validates :first_name
   validates :last_name
   end              
end
