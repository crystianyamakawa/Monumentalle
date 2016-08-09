class AlterFornecTab < ActiveRecord::Migration
  def change
    rename_table :fornecedores, :fornecedors
  end
end
