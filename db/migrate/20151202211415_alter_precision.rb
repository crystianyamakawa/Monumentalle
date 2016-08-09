class AlterPrecision < ActiveRecord::Migration
  def change
    change_column :fechamento_caixas, :vl_saldo, :decimal, precision: 15, scale: 2
    change_column :fin_movimentos, :valor, :decimal, precision: 15, scale: 2
    change_column :fin_conta, :saldo, :decimal, precision: 15, scale: 2
    change_column :despesas, :vl_despesa, :decimal, precision: 15, scale: 2
    change_column :contratos, :vl_negociado, :decimal, precision: 15, scale: 2

  end
end
