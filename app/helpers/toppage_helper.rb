module ToppageHelper

  def render_header(text, custom_preset = nil, has_more_link = true)
    custom_class = Hash.new{ |hash,key| hash[key] = "" }

    # カスタムクラスの定義 どこかに移したい
    if custom_preset == "Entry-type1"
      custom_class = { header: "u-mt_30" }
    end

    if custom_preset == "Entry-type2"
      custom_class = { heading: "is-s" }
    end

    if custom_preset == "interview"
      custom_class = { heading: "heading__txt" }
    end

    render(partial: "layouts/Header",
           locals:  { text: text,
                      custom_class: custom_class,
                      has_more_link: has_more_link })
  end

end
