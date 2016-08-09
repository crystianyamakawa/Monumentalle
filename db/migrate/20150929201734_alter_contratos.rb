class AlterContratos < ActiveRecord::Migration

  def up
    add_column("contratos","cliente_id",:integer, :after => "descricao")
    add_column("contratos","tp_evento",:string, :after => "cliente_id")

    add_index("contratos", "cliente_id")
  end

  def down
    remove_index("contratos", "cliente_id")
    remove_index("contratos", "tp_evento")
    remove_column("contratos","cliente_id")

  end
end
