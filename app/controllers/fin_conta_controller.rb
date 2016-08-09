class FinContaController < ApplicationController

    before_action :authenticate_user!
    before_action :set_fin_contum, only: [:show, :edit, :update, :destroy]

  # GET /fin_conta
  def index
    @fin_conta = FinContum.all
  end

  # GET /fin_conta/1
  def show
  end

  # GET /fin_conta/new
  def new
    @fin_contum = FinContum.new
  end

  # GET /fin_conta/1/edit
  def edit
  end

  # POST /fin_conta
  def create
    @fin_contum = FinContum.new(fin_contum_params)
    @fin_contum.created_by = current_user.username
    @fin_contum.updated_by = current_user.username
    @fin_contum.status = "ABERTO"

    if @fin_contum.save
      redirect_to @fin_contum, notice: 'Fin contum foi criado com sucesso.'
    else
      render :new
    end
  end

  # PATCH/PUT /fin_conta/1
  def update
    @fin_contum.updated_by = current_user.username
    if @fin_contum.update(fin_contum_params)
      redirect_to @fin_contum, notice: 'Fin contum foi alterado com sucesso.'
    else
      render :edit
    end
  end

  # DELETE /fin_conta/1
  def destroy
    @fin_contum.destroy
    redirect_to fin_conta_url, notice: 'Fin contum was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fin_contum
      @fin_contum = FinContum.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def fin_contum_params
      params.require(:fin_contum).permit(:descricao, :banco, :agencia, :conta, :saldo, :status, :obs, :created_by, :updated_by)
    end
end
