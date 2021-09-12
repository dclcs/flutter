class IndexRecommondItem {
  final String title;
  final String subTitle;
  final String imageUrl;
  final String navigateUrl;
  const IndexRecommondItem(
      this.title, this.subTitle, this.imageUrl, this.navigateUrl);
}

const List<IndexRecommondItem> indexRecommondData = [
  const IndexRecommondItem(
      '家住回龙观', '归属的感觉', 'static/images/home_index_recommend_1.png', 'login'),
  const IndexRecommondItem(
      '宜居四五环', '大都市生活', 'static/images/home_index_recommend_2.png', 'login'),
  const IndexRecommondItem(
      '喧嚣三里屯', '繁华的背后', 'static/images/home_index_recommend_3.png', 'login'),
  const IndexRecommondItem(
      '比邻十号线', '地铁心连心', 'static/images/home_index_recommend_4.png', 'login'),
];
