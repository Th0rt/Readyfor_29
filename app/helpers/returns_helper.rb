module ReturnsHelper

  # optionのdata
  def return_count_options
    ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10",
     "11", "12", "13", "14", "15", "16", "17", "18", "19", "20",
      "21", "22", "23", "24", "25", "26", "27", "28", "29", "30"]
  end

  def return_month_options
    ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10",
     "11", "12"]
  end

  def return_year_options
    ["2018", "2019", "2020", "2021", "2022", "2023","2024", "2025",
     "2026", "2027", "2028", "2029", "2030"]
  end

  def payment_path(project_id, url, return_id)
    "/projects/#{project_id}/#{url}/#{return_id}"
  end

  # 安心安全のセキュリティの画像URLを返す
  def security_img_url
    'https://readyfor.jp/assets/contribution/support02-63c9bd72490f296b6bb24ebbb94ceb79d315888c6bac3ef79e63cf9ef2c7e7bd.gif'
  end

  # お気軽にお問い合わせくださいの画像URLを返す
  def inquiry_img_url
    'https://readyfor.jp/assets/contribution/support03-875f72bd79d2db130a9a41aa35007461cc368c7fdec4d00c7133679b0d3552c2.gif'
  end

  # ご利用可能なクレジットカードリストの画像URLを返す
  def creditcard_img_url
    'https://readyfor.jp/assets/contribution/caed5-bd4673425aa4e9850a622c63dc220988f7e2e09ae4f84357b924f6040f483e4d.png'
  end
end
