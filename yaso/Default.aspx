<%--
=========================================================================================================
  Module      : トップ画面(Default.aspx)
 ･･･････････････････････････････････････････････････････････････････････････････････････････････････････
  Copyright   : Copyright w2solution Co.,Ltd. 2009 All Rights Reserved.
=========================================================================================================
--%>
<%-- ▽ユーザーコントロール宣言領域▽ --%>
<%@ Register TagPrefix="uc" TagName="Parts000TMPL_001" Src="~/Page/Parts//Parts000TMPL_001.ascx" %>
<%@ Register TagPrefix="uc" TagName="Parts000TMPL_999" Src="~/Page/Parts//Parts000TMPL_999.ascx" %>
<%@ Register TagPrefix="uc" TagName="Parts060NEWS_999" Src="~/Page/Parts//Parts060NEWS_999.ascx" %>
<%@ Register TagPrefix="uc" TagName="Parts900FAT_999" Src="~/Page/Parts//Parts900FAT_999.ascx" %>
<%@ Register TagPrefix="uc" TagName="BodyProductRanking" Src="~/Form/Common/Product/BodyProductRanking.ascx" %>
<%@ Register TagPrefix="uc" TagName="BodyCoordinateList" Src="~/Form/Common/Coordinate/BodyCoordinateList.ascx" %>
<%@ Register TagPrefix="uc" TagName="BodyProductRecommendAdvanced" Src="~/Form/Common/Product/BodyProductRecommendAdvanced.ascx" %>
<%@ Register TagPrefix="uc" TagName="BodyFeaturePageList" Src="~/Form/Common/FeaturePage/BodyFeaturePageList.ascx" %>
<%-- △ユーザーコントロール宣言領域△ --%>
<%@ Register TagPrefix="uc" TagName="Criteo" Src="~/Form/Common/Criteo.ascx" %>
<%@ page language="C#" masterpagefile="~/Form/Common/DefaultPage.master" autoeventwireup="true" inherits="Default, App_Web_default.aspx.cdcab7d2" title="yaso 国産赤松の松葉茶、松のお香など森のカケラの販売" %>
<%--

下記は保持用のダミー情報です。削除しないでください。
<%@ FileInfo LayoutName="NoSide" %><%@ FileInfo LastChanged="design" %>

--%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<%-- ▽編集可能領域：HEAD追加部分▽ --%>
<% if (Constants.MOBILEOPTION_ENABLED){%>
	<link rel="Alternate" media="handheld" href="<%= GetMobileUrl() %>" />
<% } %>
<%= this.BrandAdditionalDsignTag %>

<%-- △編集可能領域△ --%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<table id="tblLayout">

<tr>
<td>
<%-- ▽レイアウト領域：レフトエリア▽ --%>
<%-- △レイアウト領域△ --%>
</td>
<td>
<div id="divTopArea">
<%-- ▽レイアウト領域：トップエリア▽ --%>
<style>
  /* 
  デフォルトのFVを非表示化
  <uc:Parts900FAT_999 runat="server" /> */
</style>
<!-- カスタムテンプレートのFVを読み込み↓ -->
<uc:Parts000TMPL_001 runat="server" />
<uc:Parts000TMPL_999 runat="server" />
<uc:Parts060NEWS_999 runat="server" />
<%-- △レイアウト領域△ --%>
</div>
<%-- ▽編集可能領域：コンテンツ▽ --%>
<!-- ▽季節のおすすめ商品▽ -->
<style>
  /*
<div class="bl_top_recommend bl_section">
  <div class="bl_top_recommend_head bl_section_head">
    <span class="bl_top_recommend_subTtl bl_section_subTtl hp_ff_vollkorn">RECOMMEND</span>
    <h2 class="bl_top_recommend_ttl bl_section_ttl hp_ff_zenOldMincho">
      季節のおすすめ商品
    </h2>
  </div>
  <div class="bl_top_recommend_body bl_products">
    <div class="bl_products_item_unit">
      <a href="" class="bl_products_item">
        <figure class="bl_products_item_img">
          <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/new_theme/pc_top_recommend_1.jpg" alt="">
        </figure>
        <div class="bl_products_item_body">
          <h4 class="bl_products_item_ttl">八十茶 801 ほうじ赤松 | 国産 松葉茶 (長野県産)</h4>
          <span class="bl_products_item_price bl_products_item_price__theme_soldout bl_soldoutLabel">SOLD OUT</span>
        </div>
      </a>
      <!-- /.bl_products_item -->
      <a href="" class="bl_products_item">
        <figure class="bl_products_item_img">
          <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/new_theme/pc_top_recommend_2.jpg" alt="">
        </figure>
        <div class="bl_products_item_body">
          <h4 class="bl_products_item_ttl">八十茶 802 赤松とペパーミント | 国産 松葉茶 (長野県産)</h4>
          <span class="bl_products_item_price">¥1,296（税込）</span>
        </div>
      </a>
      <!-- /.bl_products_item -->
      <a href="" class="bl_products_item">
        <figure class="bl_products_item_img">
          <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/new_theme/pc_top_recommend_3.jpg" alt="">
        </figure>
        <div class="bl_products_item_body">
          <h4 class="bl_products_item_ttl">八十茶 803 赤松とレモンジンジャー | 国産 松葉茶 (長野県産)</h4>
          <span class="bl_products_item_price">¥1,296（税込）</span>
        </div>
      </a>
      <!-- /.bl_products_item -->
      <a href="" class="bl_products_item">
        <figure class="bl_products_item_img">
          <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/new_theme/pc_top_recommend_4.jpg" alt="">
        </figure>
        <div class="bl_products_item_body">
          <h4 class="bl_products_item_ttl">八十茶  赤松 3種のギフトセット</h4>
          <span class="bl_products_item_price">¥3,996（税込）</span>
        </div>
      </a>
      <!-- /.bl_products_item -->
      <a href="" class="bl_products_item">
        <span class="bl_products_item_label">再入荷</span>
        <figure class="bl_products_item_img">
          <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/new_theme/pc_top_recommend_5.jpg" alt="">
        </figure>
        <div class="bl_products_item_body">
          <h4 class="bl_products_item_ttl">森のお香 - 松林の風に乗って -</h4>
          <span class="bl_products_item_price">¥1,320（税込）</span>
        </div>
      </a>
      <!-- /.bl_products_item -->
      <a href="" class="bl_products_item">
        <figure class="bl_products_item_img">
          <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/new_theme/pc_top_recommend_6.jpg" alt="">
        </figure>
        <div class="bl_products_item_body">
          <h4 class="bl_products_item_ttl">yaso stand  S</h4>
          <span class="bl_products_item_price">¥3,850（税込）</span>
        </div>
      </a>
      <!-- /.bl_products_item -->
      <a href="" class="bl_products_item">
        <figure class="bl_products_item_img">
          <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/new_theme/pc_top_recommend_7.jpg" alt="">
        </figure>
        <div class="bl_products_item_body">
          <h4 class="bl_products_item_ttl">yaso stand  M</h4>
          <span class="bl_products_item_price">¥5,500（税込）</span>
        </div>
      </a>
      <!-- /.bl_products_item -->
      <a href="" class="bl_products_item">
        <figure class="bl_products_item_img">
          <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/new_theme/pc_top_recommend_8.jpg" alt="">
        </figure>
        <div class="bl_products_item_body">
          <h4 class="bl_products_item_ttl">yaso stand  L</h4>
          <span class="bl_products_item_price">¥110,000（税込）</span>
        </div>
      </a>
      <!-- /.bl_products_item -->
      <a href="" class="bl_products_item">
        <figure class="bl_products_item_img">
          <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/new_theme/pc_top_recommend_9.jpg" alt="">
        </figure>
        <div class="bl_products_item_body">
          <h4 class="bl_products_item_ttl">yaso BOX -森の標本- 150150</h4>
          <span class="bl_products_item_price">¥1,650（税込）</span>
        </div>
      </a>
      <!-- /.bl_products_item -->
    </div>
    <div class="bl_products_bottom">
      <a href="" class="bl_products_moreBtn bl_btn">もっと見る</a>
    </div>
  </div>
</div>
 */
 </style>
<!-- △/季節のおすすめ商品△ -->

<%-- △編集可能領域△ --%>
<div id="divBottomArea">
<%-- ▽レイアウト領域：ボトムエリア▽ --%>
<style>
  /* <uc:BodyProductRanking runat="server" /> */
</style>
<uc:BodyFeaturePageList runat="server" />
<style>
  /* <uc:BodyCoordinateList runat="server"/> */
</style>
<uc:BodyProductRecommendAdvanced runat="server" />
<%-- △レイアウト領域△ --%>
</div>
</td>
<td>
<%-- ▽レイアウト領域：ライトエリア▽ --%>
<%-- △レイアウト領域△ --%>
</td>
</tr>
</table>

<script runat="server">
public new void Page_Load(Object sender, EventArgs e)
{
base.Page_Load(sender, e);

var recommendEngineUserControls = WebControlUtility.GetRecommendEngineUserControls(this.Form.FindControl("ContentPlaceHolder1"));
var lProductRecommendByRecommendEngineUserControls = recommendEngineUserControls.Item1;
var lCategoryRecommendByRecommendEngineUserControls = recommendEngineUserControls.Item2;

<%-- ▽編集可能領域：プロパティ設定▽ --%>
// 外部レコメンド連携パーツ設定
// 1つ目の商品レコメンド
if (lProductRecommendByRecommendEngineUserControls.Count > 0)
{
	// レコメンドコードを設定します
	lProductRecommendByRecommendEngineUserControls[0].RecommendCode = "pc111";
	// レコメンドタイトルを設定します
	lProductRecommendByRecommendEngineUserControls[0].RecommendTitle = "おすすめ商品一覧";
	// 商品最大表示件数を設定します
	lProductRecommendByRecommendEngineUserControls[0].MaxDispCount = 5;
	// レコメンド対象にするカテゴリIDを設定します（複数選択時はカンマ区切りで指定）
	lProductRecommendByRecommendEngineUserControls[0].DispCategoryId = "";
	// レコメンド非対象にするカテゴリIDを設定します（複数選択時はカンマ区切りで指定）
	lProductRecommendByRecommendEngineUserControls[0].NotDispCategoryId = "";
	// レコメンド非対象にするアイテムIDを設定します（複数選択時はカンマ区切りで指定）
	lProductRecommendByRecommendEngineUserControls[0].NotDispRecommendProductId = "";
}

// 2つ目の商品レコメンド
if (lProductRecommendByRecommendEngineUserControls.Count > 1)
{
	// レコメンドコードを設定します
	lProductRecommendByRecommendEngineUserControls[1].RecommendCode = "pc112";
	// レコメンドタイトルを設定します
	lProductRecommendByRecommendEngineUserControls[1].RecommendTitle = "おすすめ商品一覧";
	// 商品最大表示件数を設定します
	lProductRecommendByRecommendEngineUserControls[1].MaxDispCount = 5;
	// レコメンド対象にするカテゴリIDを設定します（複数選択時はカンマ区切りで指定）
	lProductRecommendByRecommendEngineUserControls[1].DispCategoryId = "";
	// レコメンド非対象にするカテゴリIDを設定します（複数選択時はカンマ区切りで指定）
	lProductRecommendByRecommendEngineUserControls[1].NotDispCategoryId = "";
	// レコメンド非対象にするアイテムIDを設定します（複数選択時はカンマ区切りで指定）
	lProductRecommendByRecommendEngineUserControls[1].NotDispRecommendProductId = "";
}

// 1つ目のカテゴリレコメンド
if (lCategoryRecommendByRecommendEngineUserControls.Count > 0)
{
    //レコメンドコードを設定します
    lCategoryRecommendByRecommendEngineUserControls[0].RecommendCode = "p005";
    //アイテムコードを設定します
    //特定のカテゴリに対する行動履歴から、おすすめカテゴリを取得したい場合に設定します。
    //「"C"+カテゴリID」の形式で記述してください。【記述例】C001
    lCategoryRecommendByRecommendEngineUserControls[0].ItemCode = "";
    //表示区分を設定します (0:該当カテゴリのみ表示/1:パンくずリスト表示)
    lCategoryRecommendByRecommendEngineUserControls[0].DispKbn = "1";
    //商品最大表示件数を設定します
    lCategoryRecommendByRecommendEngineUserControls[0].MaxDispCount = 5;
}
<%-- △編集可能領域△ --%>
}

</script>

<%-- CRITEOタグ --%>
<uc:Criteo ID="criteo" runat="server" Datas="<%# null %>" />
</asp:Content>