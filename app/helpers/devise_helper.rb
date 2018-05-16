module DeviseHelper
  def devise_error_messages!
    return "" if resource.errors.empty?
    html = ""
    # エラーメッセージ用のHTMLを生成
    messages = resource.errors.full_messages.each do |msg|
      html += <<-EOF
        <div class="alert-form" role="alert">
        <i class="fas fa-exclamation-triangle"></i>
        <p>#{msg}</p>
        </div>
      EOF
    end
    html.html_safe
  end
end
