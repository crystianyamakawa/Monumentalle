class CreateFechamentoCaixas < ActiveRecord::Migration
  def change
    create_table :fechamento_caixas do |t|
      t.date :periodo
      t.integer :fin_conta_id
      t.float :vl_saldo
      t.string :created_by
      t.string :updated_by

      t.timestamps null: false
    end
  end
end
