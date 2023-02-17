class Article < ApplicationRecord
    include Visible 
    has_many :comments, dependent: :destroy
    validates :title, presence: {message: "Es obligatorio el titulo!"}
    validates :body, presence: true, length: { minimum: 10 }

end
