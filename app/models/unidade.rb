class Unidade < ActiveRecord::Base
  belongs_to :regiao
  has_many :professors


end
