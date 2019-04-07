module ApplicationHelper
  def set_title_description
    c = params[:controller]
    a = params[:action]
    h = {
      "welcome" => {
        "index" => Proc.new{ return ["HIDEAKI TAKAHASHI", "HIDEAKI TAKAHASHIのポートフォリオ"]},
        "about" => Proc.new{ return ["ABOUT - HIDEAKI TAKAHASHI", "HIDEAKI TAKAHASHIの紹介"]},
        "contact" => Proc.new{ return ["CONTACT - HIDEAKI TAKAHASHI", "HIDEAKI TAKAHASHIへの連絡"]},
      },
      "works" => {
        "index" => Proc.new{ return ["WORKS - HIDEAKI TAKAHASHI", "HIDEAKI TAKAHASHIの実績"]},
        "show" => Proc.new {return ["#{Work.find_by(id: params[:id]).try(:client)}", "過去の実績"]}
      },
    }
    h[c].try(:[], a).try(:call)
  end
end
