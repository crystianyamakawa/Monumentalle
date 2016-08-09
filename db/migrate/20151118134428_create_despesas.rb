class CreateDespesas < ActiveRecord::Migration
  def change
    create_table :despesas do |t|
      t.string :nome
      t.integer :fornecedor_id
      t.float :vl_despesa
      t.string :status
      t.text :obs
      t.string :created_by
      t.string :updated_by

      t.timestamps null: false
    end
  end
end
