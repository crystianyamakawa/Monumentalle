class CreateEventos < ActiveRecord::Migration
  def change
    create_table :eventos do |t|
      t.date :dt_evento
      t.datetime :dt_inicio
      t.datetime :dt_termino
      t.string :created_by
      t.string :update_by
      t.text :obs
      t.string :tp_evento
      t.string :status
      t.integer :sinc_google
      t.datetime :dt_sinc

      t.timestamps null: false
    end
  end
end
