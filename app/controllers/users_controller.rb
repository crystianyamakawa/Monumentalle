class UsersController < ApplicationController

    #
    # before_action :authenticate_user!
    #
    # def index
    #   @users = User.sorted
    #   @page_title="Cadastro de Usuários"
    # end
    #
    # def new
    #   @user = User.new
    #   @page_title = "Criação de Usuário"
    # end
    #
    # def create
    #   # Instantiate a new object using form parameters
    #   @user = User.new(user_params)
    #   # Save the object
    #   if @user.save
    #     # if save succeeds, redirect to the index action
    #     flash[:notice] = "Usuário criado com sucesso."
    #     redirect_to(:action => 'index')
    #   else
    #     #If save fails, redisplay the form so user can fix the problem
    #     render('new')
    #   end
    # end
    #
    # def edit
    #   @user = User.find(params[:id])
    # end
    #
    # def update
    #   # Find an existing object using form parameters
    #   @user = User.find(params[:id])
    #   # Update the object
    #   if @user.update_attributes(user_params)
    #     # if update succeeds, redirect to the index action
    #     flash[:notice] = "Usuário atualizado com sucesso."
    #     redirect_to(:action => 'index')
    #   else
    #     #If update fails, redisplay the form so user can fix the problem
    #     @page_title = "Editar Usuário: #{@user.name}"
    #     render('edit')
    #   end
    # end
    #
    # def delete
    #   @user = User.find(params[:id])
    #   @page_title = "Excluir Usuário: #{@user.name}"
    #
    # end
    #
    # def destroy
    #   User.find(params[:id]).destroy
    #   flash[:notice] = "Usuário apagado com sucesso."
    #   redirect_to(:action => 'index')
    # end
    #
    # private
    #   def user_params
    #     # params.require(:user).permit(:first_name, :last_name, :email, :username, :hashed_password)
    #   end
end
