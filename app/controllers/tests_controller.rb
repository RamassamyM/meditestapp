class TestsController < ApplicationController
  before_action :set_test, only: %i(show)
  skip_before_action :authenticate_user!



  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)
    if @test.save
      redirect_to test_path(@test)
    else
      render :new
    end
  end

  def show
  end


  private

  def test_params
    params.require(:test).permit(:test_type, :image_url, :codenumber)
  end

  def set_test
    @test = Test.find(params[:id])
  end
end
