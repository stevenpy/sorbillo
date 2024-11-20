class InstructionsController < ApplicationController
  before_action :set_recipe
  before_action :set_instruction, only: [:edit, :update, :destroy]

  def new
    @instruction = @recipe.instructions.new
  end

  def create
    @instruction = @recipe.instructions.new(instruction_params)
    if @instruction.save
      redirect_to @recipe, notice: 'Instruction was successfully added.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @instruction.update(instruction_params)
      redirect_to @recipe, notice: 'Instruction was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @instruction.destroy
    redirect_to @recipe, notice: 'Instruction was successfully removed.'
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def set_instruction
    @instruction = @recipe.instructions.find(params[:id])
  end

  def instruction_params
    params.require(:instruction).permit(:steps_number, :description)
  end
end