class CreateClientes < ActiveRecord::Migration
  def change
    create_table :clientes do |t|
      t.string :nome
      t.date :dt_nascimento
      t.string :nr_documento
      t.string :tp_documento
      t.string :nr_cpf_cnpj
      t.string :rua
      t.string :complemento
      t.string :numero
      t.string :bairro
      t.string :cidade
      t.string :uf
      t.string :cep
      t.text :obs
      t.string :created_by
      t.string :updated_by
      t.timestamps null: false
    end
  end
end
