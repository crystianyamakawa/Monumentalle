class Contrato < ActiveRecord::Base
  belongs_to :cliente

  has_many :contrato_produtos
  has_many :fin_movimentos
  has_many :produtos, :through => :contrato_produtos,
  :class_name =>"ContratoProdutos"
end
