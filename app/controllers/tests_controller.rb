class TestsController < ApplicationController
  before_action :set_test, only: %i(show)
  skip_before_action :authenticate_user!

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)
    @test.test_type = "codenumber"
    if @test.save
      redirect_to test_path(@test)
    else
      render :new
    end
  end

  def show
    @truemedicine = Truemedicine.find_by_codenumber(@test.codenumber)
    if is_unique && is_truemedicine
      @result = "authentic"
    elsif is_truemedicine
      @result = "copy"
    else
      @result = "fake"
    end
  end

  private

  def test_params
    params.require(:test).permit(:test_type, :image_url, :codenumber)
  end

  def set_test
    @test = Test.find(params[:id])
  end
end
