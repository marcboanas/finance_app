class ExpensesController < ApplicationController
  def new
  end

  def create
    @expense = Expense.new(expense_params)
    
    @expense.save
    redirect_to @expense
  end

  def edit
    @expense = Expense.find(params[:id])
  end

  def update
    @expense = Expense.find(params[:id])
    
    @expense.update!(expense_params)
    redirect_to @expense
  end

  def show
    @expense = Expense.find(params[:id])
  end

  def index
    @expenses = Expense.all
  end

  def destroy
    @expense = Expense.find(params[:id])
    @expense.destroy
    flash[:notice] = "Expense: Successfully Deleted"
    redirect_to expenses_path()
  end
  
  private
  
  def expense_params
    params.require(:expense).permit(:description, :date)
  end
end
