class AppController < ApplicationController
      before_action :authenticate_user!


      def dashboard
          # verificar saldo atual
          conn = ActiveRecord::Base.connection
          result = conn.execute "SELECT saldo_atual_cc() as saldo, proximas_saidas(30) as saidas,
                                        proximas_entradas(30) as entradas,
                                        proximo_evento() as evento"

          result.each do |ret|
             @saldoCC     =  ret[0]
             @PrxSaidas   =  ret[1]
             @PrxEntradas =  ret[2]
             @PrxEvento   =  ret[3].to_i()
          end

          @saldos = FechamentoCaixa.order('periodo DESC')
          @contrato = Contrato.find(@PrxEvento)
          @dt_evento = @contrato.dt_evento.strftime('%d/%m/%Y')
          @tp_evento = @contrato.tp_evento
          @ds_evento = @contrato.descricao

          @produtos  = @contrato.contrato_produtos.all

          render :dashboard
          #render(:partial => "saldoCC", :locals => {:saldoCC => @saldoCC})
      end;
end
