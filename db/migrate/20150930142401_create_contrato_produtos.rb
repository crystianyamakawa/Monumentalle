class CreateContratoProdutos < ActiveRecord::Migration
  def change
    create_table :contrato_produtos do |t|
      t.integer :contrato_id
      t.integer :produto_id
      t.integer :quantidade
      t.float   :vl_tabela
      t.float   :vl_negociado
      t.string  :created_by
      t.string  :updated_by

      t.timestamps null: false
    end
    add_index("contrato_produtos", ["contrato_id","produto_id"])
  end
end
