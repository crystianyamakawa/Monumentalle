class ContratoProdutosController < ApplicationController

  before_action :authenticate_user!
  before_action :set_contrato_produto, only: [:show, :edit, :update, :destroy]

  # GET /contrato_produtos
  def index
    @contrato_produtos = ContratoProduto.all
  end

  # GET /contrato_produtos/1
  def show
  end

  # GET /contrato_produtos/new
  def new

    @contrato_produto = ContratoProduto.new
    if !params[:contrato_id].blank?
      @contrato = Contrato.find(params[:contrato_id])
      @contrato_produto.contrato_id = @contrato.id
      @contrato_produto.dt_inicio   = @contrato.dt_evento
      @contrato_produto.dt_termino  = @contrato.dt_evento+1
    end
    @contratos = Contrato.order('descricao ASC')
    @produtos = Produto.order('descricao ASC')

  end

  # GET /contrato_produtos/1/edit
  def edit
    if !params[:contrato_id].blank?
      @contrato = Contrato.find(params[:contrato_id])
    end
    @contratos = Contrato.order('descricao ASC')
    @produtos = Produto.order('descricao ASC')
  end

  # POST /contrato_produtos
  def create
    @contrato_produto = ContratoProduto.new(contrato_produto_params)
    #@contratos = Contrato.order('descricao ASC')
    @contratos = Contrato.order('descricao ASC')
    @produtos = Produto.order('descricao ASC')

    if @contrato_produto.save
      redirect_to @contrato_produto, notice: 'Contrato produto foi criado com sucesso.'
    else
      render :new
    end
  end

  # PATCH/PUT /contrato_produtos/1
  def update
    if @contrato_produto.update(contrato_produto_params)
      redirect_to @contrato_produto, notice: 'Contrato produto foi atualizado com sucesso.'
    else
      render :edit
    end
  end

  # DELETE /contrato_produtos/1
  def destroy
    @contrato = @contrato_produto.contrato
    @contrato_produto.destroy
    redirect_to "/contrato/" + contrato.id.to_s
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contrato_produto
      @contrato_produto = ContratoProduto.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def contrato_produto_params
      params.require(:contrato_produto).permit(:contrato_id, :produto_id,
      :quantidade, :vl_tabela, :vl_negociado, :dt_inicio, :dt_termino, :created_by, :updated_by)
    end
end
