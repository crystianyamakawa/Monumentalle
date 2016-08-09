class Produto < ActiveRecord::Base
  has_many :contratos, :through => :contrato_produtos,
  :class_name =>"ContratoProdutos"
end
