class ImageUploadTestsController < ApplicationController
  before_action :set_image_upload_test, only: [:show, :edit, :update, :destroy]

  # GET /image_upload_tests
  # GET /image_upload_tests.json
  def index
    @image_upload_tests = ImageUploadTest.all
  end

  # GET /image_upload_tests/1
  # GET /image_upload_tests/1.json
  def show
  end

  # GET /image_upload_tests/new
  def new
    @image_upload_test = ImageUploadTest.new
  end

  # GET /image_upload_tests/1/edit
  def edit
  end

  # POST /image_upload_tests
  # POST /image_upload_tests.json
  def create
    @image_upload_test = ImageUploadTest.new(image_upload_test_params)

    respond_to do |format|
      if @image_upload_test.save
        format.html { redirect_to @image_upload_test, notice: 'Image upload test was successfully created.' }
        format.json { render :show, status: :created, location: @image_upload_test }
      else
        format.html { render :new }
        format.json { render json: @image_upload_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /image_upload_tests/1
  # PATCH/PUT /image_upload_tests/1.json
  def update
    respond_to do |format|
      if @image_upload_test.update(image_upload_test_params)
        format.html { redirect_to @image_upload_test, notice: 'Image upload test was successfully updated.' }
        format.json { render :show, status: :ok, location: @image_upload_test }
      else
        format.html { render :edit }
        format.json { render json: @image_upload_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /image_upload_tests/1
  # DELETE /image_upload_tests/1.json
  def destroy
    @image_upload_test.destroy
    respond_to do |format|
      format.html { redirect_to image_upload_tests_url, notice: 'Image upload test was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image_upload_test
      @image_upload_test = ImageUploadTest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_upload_test_params
      params.require(:image_upload_test).permit(:image)
    end
end
