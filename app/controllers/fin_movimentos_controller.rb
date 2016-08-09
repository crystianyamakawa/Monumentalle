class FinMovimentosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_fin_movimento, only: [:show, :edit, :update, :destroy]

  # GET /fin_movimentos
  def index

    filter = ["0=0"]

    if params.has_key?("descricao")
      if !params[:descricao].blank?
        descricao = params[:descricao]
        filter << [" descricao like '%#{descricao}%'"]
      end
      if !params[:fornecedor].blank?
        fornec = params[:fornecedor]
        filter << [ " fornecedor_id = #{fornec}"]
      end
      if !params[:status].blank?
        status = params[:status]
        filter << [ " status = '#{status}'"]
      end

      if !params[:periodo].blank?
        periodo = params[:periodo]
        filter << [ " dt_previsto >= '#{periodo}'"]
      end
    end

    setList
    @fin_movimentos = FinMovimento.where(filter.join(" And ")).order("dt_previsto ASC").paginate(:page => params[:page], :per_page =>10 )

  end

  # GET /fin_movimentos/1
  def show
  end

  # GET /fin_movimentos/new
  def new
    @fin_movimento = FinMovimento.new
    setList
  end

  # GET /fin_movimentos/1/edit
  def edit
    setList
  end

  # POST /fin_movimentos
  def create
    @fin_movimento = FinMovimento.new(fin_movimento_params)
    setList
    if @fin_movimento.save
      redirect_to @fin_movimento, notice: 'Fin movimento foi criado com sucesso.'
    else
      render :new
    end
  end

  # PATCH/PUT /fin_movimentos/1
  def update
    if @fin_movimento.update(fin_movimento_params)
      redirect_to @fin_movimento, notice: 'Fin movimento foi alterado com sucesso.'
    else
      render :edit
    end
  end

  # DELETE /fin_movimentos/1
  def destroy
    @fin_movimento.destroy
    redirect_to fin_movimentos_url, notice: 'Fin movimento was successfully destroyed.'
  end

  # GET /fin_movimentos/1
  def fluxo_caixa
    @FechamentoCaixa = FechamentoCaixa.order("periodo DESC")

    if params.has_key?("fechamento_caixa_id")
      filter = ["0=0"]
      if !params[:fechamento_caixa_id].blank?
        fechamento_caixa = FechamentoCaixa.find(params[:fechamento_caixa_id])
        @dt_fechamento = fechamento_caixa.periodo + 1.months
        @vl_saldo      = fechamento_caixa.vl_saldo
        filter << [" dt_previsto >= '#{@dt_fechamento}'"]
        @fechamento_caixa_id = params[:fechamento_caixa_id]
      end

      #if !params[:dt_termino].blank?
      #  termino = params[:dt_termino]
      #  filter << [ " dt_previsto <= '#{termino}'"]
      #end
    else
      filter = ["0=1"]
      @dt_fechamento = DateTime.now.to_date
      @vl_saldo      = 0

    end
    setList
    @fin_movimentos = FinMovimento.where(filter.join(" And ")).order( "dt_previsto ASC")
  end


  # GET /fin_movimentos/1
  def realizar_movimento
    if params.has_key?("fin_movimento_id")
      if !params[:fin_movimento_id].blank?
        @Movimento = FinMovimento.find(params[:fin_movimento_id])
        @Movimento.dt_executado = Movimento.dt_previsto
        @Movimento.status       = "Realizado"
      end
    end
    @FechamentoCaixa = FechamentoCaixa.order("periodo DESC")
    #@dt_fechamento = fechamento_caixa.periodo + 1.months
    #@vl_saldo      = fechamento_caixa.vl_saldo
    filter = ["0=1"]
    @fin_movimentos = FinMovimento.where(filter.join(" And ")).order( "dt_previsto ASC")
    render partial: "list_movto"
  end

  ######################################
  def graficos

     @lst_graficos = ['Barras','Linhas','Torta']
     @lst_group   = ['Dias','Meses','Anos']

     if !params[:Tipo_grafico].blank?
       @Tipo_grafico = params[:Tipo_grafico]
     end

    #@DataSet = FechamentoCaixa.group(:periodo).sum(:vl_saldo)

    conn = ActiveRecord::Base.connection
    @DataSet = conn.execute "select sum(valor) as valor,DATE_FORMAT(dt_previsto,'%m/%Y') as Periodo,
                                    tp_movimento as tipo
                             from fin_movimentos
                             group by DATE_FORMAT(dt_previsto,'%m/%Y'), tp_movimento
                             order by dt_previsto"

    #@DataSet = FinMovimento.group(:tp_movimento).group_by_month(:dt_previsto, time_zone: "Brasilia").sum(:valor)

  end



  def verificar_saldo
      conn = ActiveRecord::Base.connection
      @SALDO_CC = conn.execute "SELECT VERIFICA_SALDO_CC()"
      puts @SALDO_CC
  end;
  #####################################

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fin_movimento
      @fin_movimento = FinMovimento.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def fin_movimento_params
      params.require(:fin_movimento).permit(:tp_movimento, :descricao, :valor, :status,
      :motivo_status, :dt_previsto, :dt_executado, :contrato_id, :despesa_id, :fin_conta_id, :obs,
      :created_by, :updated_by)
    end

    def setList
      @Status = ["Pendente","Realizado","Cancelado"]
      @FimPeriodo = ["1 Mes","3 Meses","Tudo"]
    end

end
