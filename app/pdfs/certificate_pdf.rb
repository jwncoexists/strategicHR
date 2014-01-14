class CertificatePdf < Prawn::Document

  def initialize(certificate)
    super(page_layout: :landscape)
    @certificate = certificate
    @ceu = Ceu.find(@certificate.ceu_id)
    @user = User.find(@certificate.user_id)
    @course = Course.find(@certificate.course_id)
    image "#{Rails.root}/app/assets/images/StrategicHRCertificate.png", :at => [0, 542]
    certificate_info
  end
  
  def certificate_info
    font "Helvetica", style: :bold_italic
    stroke_color "003399"
    fill_color "003399"
    text_box "#{@user.name}",
              at: [0,350],
              width: 720, 
              height: 36, 
              size: 24, 
              align: :center,
              color: [100,0,0,0],
              overflow: :shrink_to_fit
    font "Helvetica", style: :italic
    if( @ceu )
      text_box  "# #{@ceu.code} #{@course.name}",  
              at: [0,260],
              width: 720, 
              height: 36, 
              size: 18, 
              align: :center, 
              overflow: :shrink_to_fit
      text_box  "#{@ceu.full_ceu_name_no_org}",  
              at: [0,230],
              width: 720, 
              height: 36, 
              size: 18, 
              align: :center, 
              overflow: :shrink_to_fit
    else
      text_box  "#{@course.name}",  
              at: [0,250],
              width: 720, 
              height: 36, 
              size: 20, 
              align: :center, 
              overflow: :shrink_to_fit
    end
    text_box  "#{@certificate.purchase_date.strftime('%B %e, %Y')}",  
              at: [78,163],
              width: 200, 
              height: 36, 
              size: 18, 
              align: :center, 
              overflow: :shrink_to_fit

  end
end