class CreateFornecedors < ActiveRecord::Migration
  def change
    create_table :fornecedors do |t|
      t.string :nome
      t.string :nr_telefone
      t.string :nr_telefone2
      t.string :contato
      t.string :rua
      t.string :nr_endereco
      t.string :bairro
      t.string :cidade
      t.string :cep
      t.string :uf
      t.string :created_by
      t.string :updated_by

      t.timestamps null: false
    end
  end
end
