class FornecedorsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_fornecedor, only: [:show, :edit, :update, :destroy]

  # GET /fornecedors
  def index
    @fornecedors = Fornecedor.all
  end

  # GET /fornecedors/1
  def show
  end

  # GET /fornecedors/new
  def new
    set_lists
    @fornecedor = Fornecedor.new
    @fornecedor.created_by = current_user.username
    @fornecedor.updated_by = current_user.username
  end

  # GET /fornecedors/1/edit
  def edit
    set_lists
    @fornecedor.updated_by = current_user.username

  end

  # POST /fornecedors
  def create
    @fornecedor = Fornecedor.new(fornecedor_params)

    if @fornecedor.save
      redirect_to @fornecedor, notice: 'Fornecedor foi criado com sucesso.'
    else
      render :new
    end
  end

  # PATCH/PUT /fornecedors/1
  def update
    if @fornecedor.update(fornecedor_params)
      redirect_to @fornecedor, notice: 'Fornecedor foi atualizado com sucesso.'
    else
      render :edit
    end
  end

  # DELETE /fornecedors/1
  def destroy
    @fornecedor.destroy
    redirect_to fornecedors_url, notice: 'Fornecedor foi eliminado com sucesso.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fornecedor
      @fornecedor = Fornecedor.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def fornecedor_params
      params.require(:fornecedor).permit(:nome, :nr_telefone, :nr_telefone2, :contato, :rua, :nr_endereco, :bairro, :cidade, :cep, :uf, :created_by, :updated_by)
    end

    def set_lists
        @UFs = ["AC","AL","AM","AP","BA","CE","DF","ES","GO","MA","MG","MS","MT","PA","PB","PE",
              "PI","PR","RJ","RN","RO","RR","RS","SC","SE","SP","TO"]

    end

end
