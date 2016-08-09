class CreateContratos < ActiveRecord::Migration
  def change
    create_table :contratos do |t|
      t.string :descricao
      t.date :dt_evento
      t.text :obs
      t.string :created_by
      t.string :updated_by
      t.timestamps null: false
    end
  end
end
