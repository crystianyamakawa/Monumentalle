class AlterContrato < ActiveRecord::Migration

    def up
      add_column("contratos","status",:string, :after => "dt_evento")
      add_column("contratos","vl_negociado",:float, :after => "status")

    end

    def down
      remove_column("contratos","status")
      remove_column("contratos","vl_negociado")


    end
  end
