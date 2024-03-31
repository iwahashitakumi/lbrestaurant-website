module ApplicationHelper
  def default_meta_tags
    {
      site: 'LBrestaurant(株式会社)公式サイト(暖簾分け希望者、求職者募集中!)',
      title: '',
      reverse: true,
      charset: 'utf-8',
      description: 'LBrestaurant(株式会社)の公式ホームページです。地域密着の飲食店の創出×店長の高収入×店長の人間らしい生活を同時に達成する’ブラックな飲食業界を変える！',
      keywords: '飲食,居酒屋,大阪,焼き鳥,求人,採用',
      canonical: 'https://lbrestaurant.net/',
      separator: '|',
      icon: [
        { href: image_url('favicon.png') },
        { href: image_url('favicon-sm.png'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' },
      ],
      og: {
        site_name: 'LBrestaurant(株式会社)公式サイト(暖簾分け希望者、求職者募集中!)',
        title: '',
        description: 'LBrestaurant(株式会社)の公式ホームページです。地域密着の飲食店の創出×店長の高収入×店長の人間らしい生活を同時に達成する’ブラックな飲食業界を変える！',
        type: 'website',
        url: 'https://lbrestaurant.net/',
        image: image_url('opg.png'),
        locale: 'ja_JP',
      },
      twitter: {
        card: 'summary_large_image',
        image: image_url('opg.png'),
      }
    }
  end
  def show_error_messages(object, attribute)
    if object.errors.full_messages_for(attribute).any?
      content_tag(:div, class: "text-danger") do
        content_tag(:ul, class: "mb-0") do
          object.errors.full_messages_for(attribute).map do |message|
            concat content_tag(:li, content_tag(:i, "", class: "fa-solid fa-circle-xmark error-icon") + message)
          end.join.html_safe
        end
      end
    end
  end  

  def format_datetime(datetime)
    datetime.strftime("%Y/ %m/ %d /%H:%M")
  end

  def format_date(date)
    date.strftime("%Y/ %m/ %d")
  end

  def puiblic_calender_date(date)
    date.strftime("%Y. %m. %d")
  end
end
