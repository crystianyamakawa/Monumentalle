class AlterDespesa < ActiveRecord::Migration
  def change
    add_column("despesas","tp_despesa",:string, :after => "nome")
    add_column("despesas","contrato_id",:integer, :after => "tp_despesa")
    add_column("despesas","dt_executado",:date, :after => "status")
    add_column("despesas","vl_executado",:float, :after => "dt_executado")

  end
end
