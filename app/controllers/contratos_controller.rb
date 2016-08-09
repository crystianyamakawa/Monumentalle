class ContratosController < ApplicationController

    before_action :authenticate_user!
    before_action :set_contrato, only: [:show, :edit, :update, :destroy,
             :atualiza_vl_negociado, :set_listas ,:lista_produtos, :lista_entradas ,:print ]

  # GET /contratos
  def index
    filter = ["0=0"]
    if params.has_key?("descricao")
      if !params[:descricao].blank?
        descricao = params[:descricao]
        filter << [" descricao like '%#{descricao}%'"]
      end
      if !params[:status].blank?
        status = params[:status]
        filter << [ " status = '#{status}'"]
      end
      if !params[:dt_evento].blank?
        periodo = params[:dt_evento]
        filter << [ " dt_evento = '#{periodo}'"]
      end
    end

    @contratos = Contrato.where(filter.join(" And ")).order("dt_evento ASC").paginate(:page => params[:page], :per_page =>8 )
    set_listas
  end

  # GET /contratos/1
  def show
    @contrato_produtos = @contrato.contrato_produtos.all
    @produtos = Produto.order('descricao ASC')
    @clientes = Cliente.order('nome ASC')
    @fin_movimentos =  @contrato.fin_movimentos.order("dt_previsto ASC")

  end

  # GET /contratos/new
  def new
    @contrato = Contrato.new
    @clientes = Cliente.order('nome ASC')
    set_listas
  end

  # GET /contratos/1/edit
  def edit
    @clientes = Cliente.order('nome ASC')
    set_listas
  end

  def print
    #render :print
    @cliente = @contrato.cliente
    @contrato_produtos = @contrato.contrato_produtos.all
  end

  def lista_produtos
    @contrato_produtos = @contrato.contrato_produtos.all
    @produtos = Produto.order('descricao ASC')
     render(:partial => "produtos", :locals => {:contrato => @contrato})

  end

  def lista_entradas
    @FinMovimento = FinMovimento.where(" tp_origem = 'Contrato' and origem_id = #{@contrato.id} ").order("dt_previsto ASC")
     render(:partial => "mov_entrada", :locals => {:contrato => @contrato})

  end


  # POST /contratos
  def create
    @contrato = Contrato.new(contrato_params)
    @contrato.created_by = current_user.username
    @contrato.updated_by = current_user.username
    @contrato.status = "ABERTO"

    if @contrato.save
      redirect_to @contrato, notice: 'Contrato foi criado com sucesso.'
    else
      render :new
    end
  end

  # PATCH/PUT /contratos/1

  def update
    @contrato.updated_by = current_user.username
    if @contrato.update(contrato_params)
      redirect_to @contrato, notice: 'Contrato foi alterado com sucesso.'
    else
      render :edit
    end
  end

  # DELETE /contratos/1
  def destroy
    @contrato.destroy
    redirect_to contratos_url, notice: 'Contrato was successfully destroyed.'
  end


  def atualiza_vl_negociado
    @contrato_produtos = @contrato.contrato_produtos.all
    @contrato.vl_negociado = 0
     @contrato_produtos.each do |contrato_produto|
       @contrato.vl_negociado = @contrato.vl_negociado + contrato_produto.vl_negociado
     end

     @contrato.updated_by = current_user.username
     @contrato.save
     @produtos = Produto.order('descricao ASC')
    #  if @contrato.update(contrato_params)
    #     redirect_to @contrato, notice: 'Contrato foi alterado com sucesso.'
    #  end
    #
    render :show

  end

  ###########################################
  # Customizações
  ###########################################

  # Gerar Faturamento
  def faturamento
    puts "Entrando Faturamento"
     tp_movimento = 'Entrada'
     tp_origem    = 'Contrato'
     contrato     = Contrato.find(params[:contrato_id].to_i)
     fin_conta    = FinContum.find_by_descricao(params[:conta])
     vl_parcela   = params[:vl_parcelas].to_f
     nr_parcelas  = params[:nr_parcelas].to_i
     dt_inicio    = params[:dt_inicio].to_date
     inc_despesas = params[:inc_despesas]
     inc_entradas = params[:inc_entradas]


    # # Entradas
    if inc_entradas === "Sim"
        for i in 1..nr_parcelas
          mov = FinMovimento.new
          mov.tp_movimento = tp_movimento
          mov.descricao    = contrato.tp_evento + " - " + contrato.dt_evento.strftime("%d/%m/%y") + " - " + i.to_s + "/" + nr_parcelas.to_s
          mov.valor        = vl_parcela
          mov.status       = "Pendente"
          mov.dt_previsto  = dt_inicio + (i-1).month
          mov.contrato_id    = contrato.id
          mov.fin_conta_id = fin_conta.id
          mov.created_by   = current_user.username
          mov.updated_by   = current_user.username
          mov.created_at   = DateTime.now.to_date
          mov.updated_at   = DateTime.now.to_date
          mov.save

        end
    end
    # Saidas
    if  inc_despesas === "Sim"

        # Ariovaldo
        desp = Despesa.new
        desp.nome = contrato.tp_evento + " - " + contrato.dt_evento.strftime("%d/%m/%y") + " - Diaria Ariovaldo"
        desp.tp_despesa  = "Diarias"
        desp.contrato_id =  contrato.id
        desp.fornecedor_id = Fornecedor.find_by_nome("ARIOVALDO FERNANDES TELES").id
        desp.vl_despesa    = -300
        desp.created_by   = current_user.username
        desp.updated_by   = current_user.username
        desp.created_at   = DateTime.now.to_date
        desp.updated_at   = DateTime.now.to_date
        desp.save

        mov = FinMovimento.new
        mov.tp_movimento = "Saida"
        mov.descricao    = desp.nome
        mov.valor        = desp.vl_despesa
        mov.status       = "Pendente"
        mov.dt_previsto  = contrato.dt_evento - 3.days
        mov.contrato_id  = contrato.id
        mov.despesa_id   = desp.id
        mov.fin_conta_id = fin_conta.id
        mov.created_by   = current_user.username
        mov.updated_by   = current_user.username
        mov.created_at   = DateTime.now.to_date
        mov.updated_at   = DateTime.now.to_date
        mov.save

        # Auxiliar Limpeza
        desp = Despesa.new
        desp.nome = contrato.tp_evento + " - " + contrato.dt_evento.strftime("%d/%m/%y") + " - Diaria Aux. Limpeza"
        desp.tp_despesa  = "Diarias"
        desp.contrato_id =  contrato.id
        desp.fornecedor_id = Fornecedor.find_by_nome("GRAZIELLE MEDEIROS").id
        desp.vl_despesa    = -200
        desp.created_by   = current_user.username
        desp.updated_by   = current_user.username
        desp.created_at   = DateTime.now.to_date
        desp.updated_at   = DateTime.now.to_date
        desp.save
        mov = FinMovimento.new
        mov.tp_movimento = "Saida"
        mov.descricao    = desp.nome
        mov.valor        = desp.vl_despesa
        mov.status       = "Pendente"
        mov.dt_previsto  = contrato.dt_evento - 3.days
        mov.contrato_id  = contrato.id
        mov.despesa_id   = desp.id
        mov.fin_conta_id = fin_conta.id
        mov.created_by   = current_user.username
        mov.updated_by   = current_user.username
        mov.created_at   = DateTime.now.to_date
        mov.updated_at   = DateTime.now.to_date
        mov.save


        # Compra de Material e Outros
        desp = Despesa.new
        desp.nome = contrato.tp_evento + " - " + contrato.dt_evento.strftime("%d/%m/%y") + " - Material e Ocasionais "
        desp.tp_despesa  = "Despesa Evento"
        desp.contrato_id =  contrato.id
        # desp.fornecedor_id = Fonecedor.find_by_descricao("Material").id
        desp.vl_despesa    = -100
        desp.created_by   = current_user.username
        desp.updated_by   = current_user.username
        desp.created_at   = DateTime.now.to_date
        desp.updated_at   = DateTime.now.to_date
        desp.save
        mov = FinMovimento.new
        mov.tp_movimento = "Saida"
        mov.descricao    = desp.nome
        mov.valor        = desp.vl_despesa
        mov.status       = "Pendente"
        mov.dt_previsto  = contrato.dt_evento - 3.days
        mov.contrato_id  = contrato.id
        mov.despesa_id   = desp.id
        mov.fin_conta_id = fin_conta.id
        mov.created_by   = current_user.username
        mov.updated_by   = current_user.username
        mov.created_at   = DateTime.now.to_date
        mov.updated_at   = DateTime.now.to_date
        mov.save
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contrato
      @contrato = Contrato.find(params[:id])
    end

    def set_listas
      @tp_eventos = ["Aniversario","Casamento","Formatura","Corporativo"]
      @status =  ["ABERTO","CONTRATADO","EXECUTADO","RESCINDIDO","SUSPENSO"]
    end

    # Only allow a trusted parameter "white list" through.
    def contrato_params
      params.require(:contrato).permit(:descricao, :dt_evento, :obs, :created_by, :updated_by,
                   :cliente_id, :tp_evento, :vl_negociado, :vl_extenso, :dt_inicio, :dt_termino,  :status)
    end
end
