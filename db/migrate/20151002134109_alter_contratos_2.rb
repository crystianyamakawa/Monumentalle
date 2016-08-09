class AlterContratos2 < ActiveRecord::Migration

      def up
        add_column("contratos","dt_inicio",:datetime, :after => "dt_evento")
        add_column("contratos","dt_termino",:datetime, :after => "dt_inicio")
        add_column("contratos","vl_extenso",:string, :after => "vl_negociado")

        add_column("contrato_produtos","dt_inicio",:datetime, :after => "vl_negociado")
        add_column("contrato_produtos","dt_termino",:datetime, :after => "dt_inicio")


      end

      def down
        remove_column("contratos","dt_inicio")
        remove_column("contratos","dt_termino")
        remove_column("contratos","vl_negociado")

        remove_column("contrato_produtos","dt_inicio")
        remove_column("contrato_produtos","dt_termino")
      end

end
