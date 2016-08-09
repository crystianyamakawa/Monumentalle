class CreateFinConta < ActiveRecord::Migration
  def change
    create_table :fin_conta do |t|
      t.string :descricao
      t.string :banco
      t.string :agencia
      t.string :conta
      t.float :saldo
      t.string :status
      t.text :obs
      t.string :created_by
      t.string :updated_by

      t.timestamps null: false
    end
  end
end
