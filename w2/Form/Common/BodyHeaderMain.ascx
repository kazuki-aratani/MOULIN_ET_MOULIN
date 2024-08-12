<%--
=========================================================================================================
  Module      : 共通ヘッダ出力コントローラ(BodyHeaderMain.ascx)
 ･･･････････････････････････････････････････････････････････････････････････････････････････････････････
  Copyright   : Copyright W2 Co.,Ltd. 2009 All Rights Reserved.
=========================================================================================================
--%>
<%@ Register TagPrefix="uc" TagName="BodyMiniCart" Src="~/Form/Common/BodyMiniCart.ascx" %>
<%@ Register TagPrefix="uc" TagName="GlobalChangeMenu" Src="~/Form/Common/Global/GlobalChangeMenu.ascx" %>
<%@ control language="c#" autoeventwireup="true" inherits="Form_Common_BodyHeaderMain, App_Web_bodyheadermain.ascx.2af06a88" %>
<%--

下記は保持用のダミー情報です。削除しないでください。
<%@ FileInfo LastChanged="最終更新者" %>

--%>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
<ContentTemplate>
<%
	// 検索テキストボックスEnterで検索させる（UpdatePanelで括っておかないと非同期処理時に検索が効かなくなる）
	this.WtbSearchWord.Attributes["onkeypress"] = "if (event.keyCode==13){__doPostBack('" + WlbSearch.UniqueID + "',''); return false;}";
%>
</ContentTemplate>
</asp:UpdatePanel>

<%-- ▽編集可能領域：共通ヘッダ領域▽ --%>
<link rel="stylesheet" href="<%= Constants.PATH_ROOT %>Css/reset.css">
<link rel="stylesheet" href="<%= Constants.PATH_ROOT %>Css/style.css">
<link rel="stylesheet" href="https://use.typekit.net/gba8fhr.css">
<script>
  (function(d) {
    var config = {
      kitId: 'upx6bub',
      scriptTimeout: 3000,
      async: true
    },
    h=d.documentElement,t=setTimeout(function(){h.className=h.className.replace(/\bwf-loading\b/g,"")+" wf-inactive";},config.scriptTimeout),tk=d.createElement("script"),f=false,s=d.getElementsByTagName("script")[0],a;h.className+=" wf-loading";tk.src='https://use.typekit.net/'+config.kitId+'.js';tk.async=true;tk.onload=tk.onreadystatechange=function(){a=this.readyState;if(f||a&&a!="complete"&&a!="loaded")return;f=true;clearTimeout(t);try{Typekit.load(config)}catch(e){}};s.parentNode.insertBefore(tk,s)
  })(document);
</script>
<script>
  $(function () {
  $(".hamburger").click(function () {
    $(".globalMenuSp").addClass("active");
  });

  $(".hamburger_close").click(function () {
    $(".globalMenuSp").removeClass("active");
  });

  $(".anker a").click(function () {
    $(".globalMenuSp").removeClass("active");
  });
});
</script>
<asp:UpdatePanel ID="upUpdatePanel2" runat="server">
<ContentTemplate>
<% this.Reload(); %>
		<%--▼ グローバル:切り替えタグ ▼--%>
		<uc:GlobalChangeMenu runat="server"/>
		<%--▲ グローバル:切り替えタグ ▲--%>

    <header class="header_wrp">
      <div class="header_logo">
        <a href="<%= WebSanitizer.HtmlEncode(this.UnsecurePageProtocolAndHost + Constants.PATH_ROOT) %>">
          <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/hd_logo.png" alt="">
        </a>
      </div>
      <div class="icon_blc">
        <a href="" class="hd_skincheck_btn"><span>初めての方</span>スキンチェックのお申込み</a>
        <%if (this.IsLoggedIn) { %>
          <a href="<%: this.SecurePageProtocolAndHost + Constants.PATH_ROOT + Constants.PAGE_FRONT_MYPAGE %>" class="">
            <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/icon_mypage.svg" alt="マイページ">
          </a>
        <% }else{ %>
          <a href="<%= WebSanitizer.HtmlEncode(this.SecurePageProtocolAndHost + Constants.PATH_ROOT + Constants.PAGE_FRONT_LOGIN + "?" + Constants.REQUEST_KEY_NEXT_URL + "=" + HttpUtility.UrlEncode(this.NextUrl)) %>" class="">
            <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/icon_mypage.svg" alt="ログイン">
          </a>
        <% } %>
        <a href="<%: this.CartListPageUrl %>"><img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/icon_cart.svg" alt="カート"></a>
        <div class="hamburger">
          <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/icon_hamburger.svg" alt="ハンバーガー">
        </div>
      </div>
      
      <nav class="globalMenuSp">
        <div class="left_area">
          <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/ham_bg.jpg" alt="ナビメニュー画像" class="ov_tab">
        </div>
        <div class="right_area">
          <div class="ham_header">
            <div class="icon_blc">
              <a href="<%: this.SecurePageProtocolAndHost + Constants.PATH_ROOT + Constants.PAGE_FRONT_MYPAGE %>"><img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/icon_mypage.svg" alt="マイページ"></a>
              <a href="<%: this.CartListPageUrl %>"><img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/icon_cart.svg" alt="カート"></a>
              <div class="hamburger_close">
                <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/icon_hamburger_close.svg" alt="ハンバーガー">
              </div>
            </div>
          </div>
          <div class="ham_cont">
            <div class="ham_logo"><img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/ham_logo.png" alt="MyBALANCE"></div>
            <ul>
                <li class="anker">
                  <a href="<%= WebSanitizer.HtmlEncode(this.UnsecurePageProtocolAndHost + Constants.PATH_ROOT) %>/#concept">
                    <span class="ttl">CONCEPT</span>
                  </a>
                </li>
                <li class="anker">
                  <a href="<%= WebSanitizer.HtmlEncode(this.UnsecurePageProtocolAndHost + Constants.PATH_ROOT) %>/#service">
                    <span class="ttl">SERVICE</span>
                  </a>
                </li>
                <li class="anker">
                  <a href="<%= WebSanitizer.HtmlEncode(this.UnsecurePageProtocolAndHost + Constants.PATH_ROOT) %>/form/Product/ProductList.aspx">
                    <span class="ttl">LINE UP</span>
                  </a>
                </li>
                <li class="anker">
                  <a href="https://m-moulin.jp/company/" target="_blank">
                    <span class="ttl">COMPANY</span>
                  </a>
                </li>
            </ul>
            <a href="" class="ham_link_btn">
              <img class="ov_tab" src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/ham_bnr.jpg" alt="">
              <img class="un_tab" src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/sp_ham_bnr.jpg" alt="">
            </a>
          </div>
        </div>
      </nav>
    </header>

    <a href="#Wrap" class="top_back_btn">
      <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/top_back.svg" alt="">
    </a>


    <%--
		<div id="HeadUserNav" class="hoverMenu">
			<a href="javascript:void(0);"><img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/icn_menubar.gif" /></a>
			<div class="menu clearFix">
				<h3>ヘルプ</h3>
				<ul>
				<li><a href="<%= WebSanitizer.HtmlEncode(Constants.PATH_ROOT + "Page/first.aspx") %>">はじめての方へ</a></li>
				<li><a href="<%= WebSanitizer.HtmlEncode(this.SecurePageProtocolAndHost + Constants.PATH_ROOT + Constants.PAGE_FRONT_INQUIRY_INPUT) %>">お問い合わせ</a></li>
				<li><a href="#">よくある質問</a></li>
				<li><a href="<%= WebSanitizer.HtmlEncode(Constants.PATH_ROOT + "Page/privacy.aspx") %>">プライバシーポリシー</a></li>
				<% if (Constants.REALSHOP_OPTION_ENABLED) { %>
				<li><a href="<%= Constants.PATH_ROOT + Constants.PAGE_FRONT_SHOP_LIST %>">店舗一覧</a></li>
				<% } %>
				</ul>
			</div>
		</div>
    --%>



</ContentTemplate>
</asp:UpdatePanel>
<%-- △編集可能領域△ --%>

<%--
下記はファイル情報保持用のダミーです。削除しないでください。
<%@ FileInfo LastChanged="ｗ２ユーザー" %>
--%>