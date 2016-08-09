class AlterClienteFornec < ActiveRecord::Migration
  def change
    add_column("clientes","nr_telefone",:string, :after => "nome")
    add_column("clientes","nr_telefone2",:string, :after => "nr_telefone")
    add_column("fornecedors","obs",:text, :after => "nr_telefone2")
  end
end
