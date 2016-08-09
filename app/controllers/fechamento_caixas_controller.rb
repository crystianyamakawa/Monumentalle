class FechamentoCaixasController < ApplicationController

    before_action :authenticate_user!
    before_action :set_fechamento_caixa, only: [:show, :edit, :update, :destroy]

  # GET /fechamento_caixas
  def index
    @fechamento_caixas = FechamentoCaixa.all
  end

  # GET /fechamento_caixas/1
  def show
  end

  # GET /fechamento_caixas/new
  def new
    setList
    @fechamento_caixa = FechamentoCaixa.new
    @fechamento_caixa.created_by = current_user.username
    @fechamento_caixa.updated_by = current_user.username


  end

  # GET /fechamento_caixas/1/edit
  def edit
    setList
    @fechamento_caixa.updated_by = current_user.username

  end

  # POST /fechamento_caixas
  def create
    @fechamento_caixa = FechamentoCaixa.new(fechamento_caixa_params)

    if @fechamento_caixa.save
      redirect_to @fechamento_caixa, notice: 'Fechamento caixa foi criado com sucesso.'
    else
      render :new
    end
  end

  # PATCH/PUT /fechamento_caixas/1
  def update
    if @fechamento_caixa.update(fechamento_caixa_params)
      redirect_to @fechamento_caixa, notice: 'Fechamento caixa foi alterado com sucesso.'
    else
      render :edit
    end
  end

  # DELETE /fechamento_caixas/1
  def destroy
    @fechamento_caixa.destroy
    redirect_to fechamento_caixas_url, notice: 'Fechamento caixa was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fechamento_caixa
      @fechamento_caixa = FechamentoCaixa.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def fechamento_caixa_params
      params.require(:fechamento_caixa).permit(:periodo, :fin_conta_id, :vl_saldo, :created_by, :updated_by)
    end

    def setList
      @contas = FinContum.order('descricao ASC')

    end
end
