class CertificatesController < ApplicationController
  def index
    @certificates = Certificate.order('purchase_date DESC')
  end

  def show
    @certificate = Certificate.find_by_slug(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        pdf = CertificatePdf.new @certificate
        send_data pdf.render, filename: "#{@certificate.slug}",
                              type: "application/pdf",
                              disposition: "inline"
      end
    end
  end

  def new
    @certificate = Certificate.new
  end

  def edit
    @certificate = Certificate.find_by_slug(params[:id])
    authorize! :update, @certificate, message: "You don't have access to edit this certificate."
  end

  def create
    @certificate = Certificate.new(certificate_params)
    authorize! :create, @certificate, message: "You don't have access to create this certificate." 
    
    if @certificate.save
      flash[:notice] = "Certificate was created successfully."
      redirect_to @certificate
    else
      flash[:error] = "Error creating certificate. Please try again."
      render :new
    end
  end

private

  def certificate_params
    params.require(:certificate).permit(:user_id, :course_id, :purchase_price, :purchase_date, :slug, :created_at, :updated_at)
  end
end
