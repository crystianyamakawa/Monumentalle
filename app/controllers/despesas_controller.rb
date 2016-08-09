class DespesasController < ApplicationController
  before_action :authenticate_user!
  before_action :set_despesa, only: [:show, :edit, :update, :destroy]


  # GET /despesas
  def index
    filter = ["0=0"]

    if params.has_key?("nome")
      if !params[:nome].blank?
        nome = params[:nome]
        filter << [" nome like '%#{nome}%'"]
      end
      if !params[:fornecedor].blank?
        fornec = params[:fornecedor]
        filter << [ " fornecedor_id = #{fornec}"]
      end
      if !params[:status].blank?
        status = params[:status]
        filter << [ " status = '#{status}'"]
      end

    end

    setList
    @despesas = Despesa.where(filter.join(" And ")).paginate(:page => params[:page], :per_page =>8 )

  end

  # GET /despesas/1
  def show
    @fin_movimentos = @despesa.fin_movimentos.order("dt_previsto ASC")
  end

  # GET /despesas/new
  def new
    setList
    @despesa = Despesa.new
    @despesa.created_by = current_user.username
    @despesa.updated_by = current_user.username
  end

  # GET /despesas/1/edit
  def edit
    setList
    @despesa.updated_by = current_user.username
  end

  # POST /despesas
  def create

    @despesa = Despesa.new(despesa_params)
    @despesa.created_by = current_user.username
    @despesa.updated_by = current_user.username

    if @despesa.save
      redirect_to @despesa, notice: 'Despesa foi criada com sucesso.'
    else
      render :new
    end
  end

  # PATCH/PUT /despesas/1
  def update
    @despesa.updated_by = current_user.username
    if @despesa.update(despesa_params)
        redirect_to @despesa, notice: 'Despesa foi atualizada com sucesso.'
    else
      render :edit
    end
  end

  # DELETE /despesas/1
  def destroy
    @despesa.destroy
    redirect_to despesas_url, notice: 'Despesa foi eliminada com sucesso.'
  end
###############################################################################
# Gerar Faturamento
def gerar_saida
   tp_movimento = 'Saida'
   tp_origem    = 'Despesa'
   despesa     = Despesa.find(params[:despesa_id].to_i)
   fin_conta    = FinContum.find_by_descricao(params[:conta])
   vl_parcela   = params[:vl_parcelas].to_f * -1
   nr_parcelas  = params[:nr_parcelas].to_i
   dt_inicio    = params[:dt_inicio].to_date



  for i in 1..nr_parcelas
    mov = FinMovimento.new
    mov.tp_movimento = tp_movimento
    mov.descricao    = despesa.nome + " - " + i.to_s + "/" + nr_parcelas.to_s
    mov.valor        = vl_parcela
    mov.status       = "Pendente"
    mov.dt_previsto  = dt_inicio + (i-1).month
    mov.despesa_id    = despesa.id
    mov.fin_conta_id = fin_conta.id
    mov.created_by   = current_user.username
    mov.updated_by   = current_user.username
    mov.created_at   = DateTime.now.to_date
    mov.updated_at   = DateTime.now.to_date
    mov.save

  end
end
###############################################################################


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_despesa
      @despesa = Despesa.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def despesa_params
      params.require(:despesa).permit(:nome, :fornecedor_id, :vl_despesa, :status, :obs, :tp_despesa,
                    :contrato_id, :dt_executado, :vl_executado, :created_by, :updated_by)
    end

    def setList
      @fornecedores = Fornecedor.order('nome ASC')
      @Status = ["Em Analise","Mensal","Cancelado","Parcelado","Executado"]
      @tpDespesa = ["Banco","Custo Fixo","Custo Variavel","Despesa Evento","Diarias", "Financiamento", "Investimento",
                    "Manutenção", "Ob. Fiscal","Publicidade"]
      @contratos = Contrato.order("dt_evento ASC")

    end
end
