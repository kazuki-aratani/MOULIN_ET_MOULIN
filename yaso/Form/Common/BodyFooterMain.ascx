<%--
=========================================================================================================
  Module      : 共通フッタ出力コントローラ(BodyFooterMain.ascx)
 ･･･････････････････････････････････････････････････････････････････････････････････････････････････････
  Copyright   : Copyright w2solution Co.,Ltd. 2009 All Rights Reserved.
=========================================================================================================
--%>
<%@ Register TagPrefix="uc" TagName="AccessLogTrackerScript" Src="~/Form/Common/AccessLogTrackerScript.ascx" %>
<%@ control language="C#" autoeventwireup="true" inherits="Form_Common_BodyFooterMain, App_Web_bodyfootermain.ascx.2af06a88" %>
<%--

下記のタグはファイル情報保持用です。削除しないでください。
<%@ FileInfo LastChanged="manager" %>

--%>
<%-- ▽編集可能領域：フッタ領域▽ --%>
<div class="inner">
<div class="footer_cont">
  <div class="footer_left">
    <div class="sp_footer_nav hp_pc_none">
      <a href="<%= WebSanitizer.HtmlEncode(Constants.PATH_ROOT + "Page/privacy.aspx") %>" class="sp_footer_nav_item">プライバシーポリシー</a>
      <!-- <a href="<%= WebSanitizer.HtmlEncode(Constants.PATH_ROOT + "Page/first.aspx") %>" class="sp_footer_nav_item">ご利用規約</a> -->
      <a href="<%= WebSanitizer.HtmlEncode(Constants.PATH_ROOT + "Page/termofuse.aspx") %>" class="sp_footer_nav_item">特定商取引法に基づく表示</a>
    </div>
    <div class="footer_logo">
      <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/new_theme/pc_footer_logo.svg" alt="" loading="lazy">
    </div>
    <div class="footer_sns">
      <div class="footer_sns_icon_unit">
        <a target="blank" href="https://www.facebook.com/yasoproject/" class="footer_sns_icon">
          <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/new_theme/pc_facebookicon.png" alt="">
        </a>
        <a target="blank" href="https://www.instagram.com/yaso_project/" class="footer_sns_icon">
          <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/new_theme/pc_instaicon.png" alt="">
        </a>
        <a target="blank" href="https://twitter.com/ProjectYaso" class="footer_sns_icon">
          <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/new_theme/pc_twittericon.png" alt="">
        </a>
      </div>
    </div>
    <div class="footer_left_nav hp_sp_none">
      <div class="footer_left_nav_link_unit">
        <a href="<%= WebSanitizer.HtmlEncode(Constants.PATH_ROOT + "Page/privacy.aspx") %>" class="footer_left_nav_link">プライバシーポリシー</a>
        <!-- <a href="<%= WebSanitizer.HtmlEncode(Constants.PATH_ROOT + "Page/first.aspx") %>" class="footer_left_nav_link">ご利用規約</a> -->
        <a href="<%= WebSanitizer.HtmlEncode(Constants.PATH_ROOT + "Page/termofuse.aspx") %>" class="footer_left_nav_link">特定商取引法に基づく表示</a>
      </div>
    </div>
  </div>
  <!-- /.footer_left -->
  <div class="footer_right">
    <div class="footer_right_nav_unit">
      <div class="footer_right_nav">
        <h4 class="footer_right_nav_head">ABOUT</h4>
        <div class="footer_right_nav_list">
          <a href="<%= WebSanitizer.HtmlEncode(Constants.PATH_ROOT + "Page/about.aspx#aboutyaso") %>" class="footer_right_nav_link">yasoについて</a>
          <a href="<%= WebSanitizer.HtmlEncode(Constants.PATH_ROOT + "Page/about.aspx#comcept") %>" class="footer_right_nav_link">コンセプト</a>
          <a href="<%= WebSanitizer.HtmlEncode(Constants.PATH_ROOT + "Page/about.aspx#torikumi") %>" class="footer_right_nav_link">木葉社の取り組み</a>
        </div>
      </div>
      <!-- /.footer_right_nav -->
      <div class="footer_right_nav">
        <h4 class="footer_right_nav_head">CATEGORY</h4>
        <div class="footer_right_nav_list">
          <a href="<%= WebSanitizer.HtmlEncode(Constants.PATH_ROOT + "Page/yasocha.aspx") %>" class="footer_right_nav_link">八十茶</a>
          <a href="<%= WebSanitizer.HtmlEncode(Constants.PATH_ROOT + "Page/apothecary.aspx") %>" class="footer_right_nav_link">アポセカリー</a>
          <a href="<%= WebSanitizer.HtmlEncode(Constants.PATH_ROOT + "Form/Product/ProductList.aspx?cat=007") %>" class="footer_right_nav_link">フレグランス</a>
          <a href="<%= WebSanitizer.HtmlEncode(Constants.PATH_ROOT + "Form/Product/ProductList.aspx?cat=002") %>" class="footer_right_nav_link">OTHER</a>
          <a href="https://beer.yaso.jp/" class="footer_right_nav_link">赤松のビール</a>
          <a href="<%= WebSanitizer.HtmlEncode(Constants.PATH_ROOT + "Form/Product/ProductList.aspx?cat=009") %>" class="footer_right_nav_link">ギフトセット</a>
          <a href="<%= WebSanitizer.HtmlEncode(Constants.PATH_ROOT + "Form/Product/ProductList.aspx?cat=011") %>" class="footer_right_nav_link">森のスワッグ</a>
          <a href="<%= WebSanitizer.HtmlEncode(Constants.PATH_ROOT + "Form/Product/ProductList.aspx?cat=010") %>" class="footer_right_nav_link">期間限定商品</a>
          <a href="<%= WebSanitizer.HtmlEncode(Constants.PATH_ROOT + "Page/teiki.aspx") %>" class="footer_right_nav_link">定期便のご案内</a>
        </div>
      </div>
      <!-- /.footer_right_nav -->
      <div class="footer_right_nav">
        <h4 class="footer_right_nav_head">COLUMN</h4>
        <div class="footer_right_nav_list">
          <a href="<%= WebSanitizer.HtmlEncode(Constants.PATH_ROOT + "Form/FeaturePage/FeaturePageList.aspx?fpcid=002") %>" class="footer_right_nav_link">ALL</a>
          <a href="<%= WebSanitizer.HtmlEncode(Constants.PATH_ROOT + "Form/FeaturePage/FeaturePageList.aspx?fpcid=002001") %>" class="footer_right_nav_link">BOOK&MUSIC</a>
          <a href="<%= WebSanitizer.HtmlEncode(Constants.PATH_ROOT + "Form/FeaturePage/FeaturePageList.aspx?fpcid=002002") %>" class="footer_right_nav_link">STORY</a>
          <a href="<%= WebSanitizer.HtmlEncode(Constants.PATH_ROOT + "Form/FeaturePage/FeaturePageList.aspx?fpcid=002003") %>" class="footer_right_nav_link">FOOD</a>
          <a href="<%= WebSanitizer.HtmlEncode(Constants.PATH_ROOT + "Form/FeaturePage/FeaturePageList.aspx?fpcid=002004") %>" class="footer_right_nav_link">NOTE</a>
          <a href="<%= WebSanitizer.HtmlEncode(Constants.PATH_ROOT + "Form/FeaturePage/FeaturePageList.aspx?fpcid=002005") %>" class="footer_right_nav_link">TREE</a>
        </div>
      </div>
      <!-- /.footer_right_nav -->
      <div class="footer_right_nav">
        <h4 class="footer_right_nav_head">SERVICE</h4>
        <div class="footer_right_nav_list">
          <a href="<%= WebSanitizer.HtmlEncode(Constants.PATH_ROOT + "Page/first.aspx") %>" class="footer_right_nav_link">ご利用ガイド</a>
          <a href="<%= WebSanitizer.HtmlEncode(Constants.PATH_ROOT + "Page/faq.aspx") %>" class="footer_right_nav_link">よくあるご質問</a>
          <a href="<%= WebSanitizer.HtmlEncode(this.SecurePageProtocolAndHost + Constants.PATH_ROOT + Constants.PAGE_FRONT_INQUIRY_INPUT) %>" class="footer_right_nav_link">お問い合わせ</a>
          <a href="<%: this.SecurePageProtocolAndHost + Constants.PATH_ROOT + Constants.PAGE_FRONT_MYPAGE %>" class="footer_right_nav_link">マイページ</a>
        </div>
      </div>
      <!-- /.footer_right_nav -->
    </div>
    <div class="footer_right_bottom_nav hp_pc_none">
      <a href="<%= WebSanitizer.HtmlEncode(Constants.PATH_ROOT + "Page/privacy.aspx") %>" class="footer_right_bottom_nav_item">プライバシーポリシー</a>
      <!-- <a href="<%= WebSanitizer.HtmlEncode(Constants.PATH_ROOT + "Page/first.axpx") %>" class="footer_right_bottom_nav_item">ご利用規約</a> -->
      <a href="<%= WebSanitizer.HtmlEncode(Constants.PATH_ROOT + "Page/termofuse.aspx") %>" class="footer_right_bottom_nav_item">特定商取引法に基づく表示</a>
    </div>
  </div>
</div>
<script>
  // 外ページからABOUTアンカーへ遷移
$(window).on('load', function() {
  let headerHeight = $('#Head').outerHeight();
  let urlHash = location.hash;
  if (urlHash) {
    let position = $(urlHash).offset().top - (headerHeight);
    $('html, body').animate({ scrollTop: position }, 0);
  }
});

$(function(){
    $("input"). keydown(function(e) {
        if ((e.which && e.which === 13) || (e.keyCode && e.keyCode === 13)) {
            return false;
        } else {
            return true;
        }
    });
});
</script>
<div id="coryRight"><address>© yaso</address></div>
<%if (this.IsSmartPhone 
		&& SmartPhoneUtility.GetSmartPhoneUrl(
								Request.AppRelativeCurrentExecutionFilePath,
								Request.UserAgent,
								HttpContext.Current) != null)
{%>
<div style="text-align:right;padding-right:20px;"><a class="button" href="<%= WebSanitizer.UrlAttrHtmlEncode(this.ChangeToSmartPhoneSiteUrl) %>">スマートフォンサイトへ</a> &gt;</div>
<%} %>

</div>
<%-- △編集可能領域△ --%>

<%-- w2アクセスログトラッカー出力 --%>
<uc:AccessLogTrackerScript id="AccessLogTrackerScript1" runat="server" />