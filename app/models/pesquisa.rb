class Pesquisa < ActiveRecord::Base
  has_many :perguntas, :dependent => :destroy
  accepts_nested_attributes_for :perguntas, :reject_if => lambda {|a| a[:conteudo].blank?}, :allow_destroy => true
end
