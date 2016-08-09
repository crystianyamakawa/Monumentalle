class AlterFinMovimento < ActiveRecord::Migration
  def change
    add_column("fin_movimentos","despesa_id",:integer, :after => "fin_conta_id")
    rename_column("fin_movimentos","origem_id","contrato_id")
    remove_column("fin_movimentos","tp_origem")

    add_index("fin_movimentos", "contrato_id")
    add_index("fin_movimentos", "despesa_id")

  end
end
