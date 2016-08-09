class ContratoProduto < ActiveRecord::Base
  belongs_to :contrato
  belongs_to :contrato, :class_name => "Contrato",
  :foreign_key => "contrato_id"
  belongs_to :produto
  belongs_to :produto, :class_name => "Produto",
  :foreign_key => "produto_id"

end
