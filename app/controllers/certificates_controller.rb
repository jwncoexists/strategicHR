class CertificatesController < ApplicationController
  def index
    @certificates = Certificate.all.order('purchase_date DESC')
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

private

  def certificate_params
    params.require(:certificate).permit(:user_id, :course_id, :purchase_price, :purchase_date, :slug, :created_at, :updated_at, :ceu_id)
  end
end
