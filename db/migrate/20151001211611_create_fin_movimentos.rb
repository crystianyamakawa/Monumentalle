class CreateFinMovimentos < ActiveRecord::Migration
  def change
    create_table :fin_movimentos do |t|
      t.string :tp_movimento
      t.string :descricao
      t.float :valor
      t.string :status
      t.string :motivo_status
      t.date :dt_previsto
      t.string :dt_executado
      t.string :tp_origem
      t.integer :origem_id
      t.integer :fin_conta_id
      t.text :obs
      t.string :created_by
      t.string :updated_by

      t.timestamps null: false
    end
  end
end
