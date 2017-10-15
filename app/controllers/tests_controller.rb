class TestsController < ApplicationController
  before_action :set_test, only: %i(show)
  skip_before_action :authenticate_user!

  def new
    @test = Test.new
    @type = test_params[:test_type] if test_params[:test_type]
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
    @truemedicine = Truemedicine.find_by(codenumber: @test.codenumber)
    if @test.is_unique(@test.codenumber) && @test.is_truemedicine(@test.codenumber)
      @result = "authentic"
    elsif @test.is_truemedicine(@test.codenumber)
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
