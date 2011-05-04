class Pergunta < ActiveRecord::Base
  belongs_to :pesquisa
  has_many :respostas, :dependent => :destroy
  accepts_nested_attributes_for :respostas, :reject_if => lambda {|a| a[:conteudo].blank?}, :allow_destroy => true
end
