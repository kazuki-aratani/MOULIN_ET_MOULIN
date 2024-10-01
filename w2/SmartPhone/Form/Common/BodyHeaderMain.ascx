<%--
=========================================================================================================
  Module      : スマートフォン用共通ヘッダ出力コントローラ(SmartPhoneHeaderMain.ascx)
 ･･･････････････････････････････････････････････････････････････････････････････････････････････････････
  Copyright   : Copyright W2 Co.,Ltd. 2010 All Rights Reserved.
=========================================================================================================
--%>
<%@ Register TagPrefix="uc" TagName="BodyProductSearchBox" Src="~/SmartPhone/Form/Common/Product/BodyProductSearchBox.ascx" %>
<%@ Register TagPrefix="uc" TagName="BodyMiniCart" Src="~/SmartPhone/Form/Common/BodyMiniCart.ascx" %>
<%@ Register TagPrefix="uc" TagName="BodyProductCategoryTree" Src="~/SmartPhone/Form/Common/Product/BodyProductCategoryTree.ascx" %>
<%@ Register TagPrefix="uc" TagName="GlobalChangeList" Src="~/SmartPhone/Form/Common/Global/GlobalChangeList.ascx" %>
<%@ Register TagPrefix="uc" TagName="GlobalChangeIcon" Src="~/SmartPhone/Form/Common/Global/GlobalChangeIcon.ascx" %>
<%@ control language="c#" autoeventwireup="true" inherits="Form_Common_BodyHeaderMain, App_Web_bodyheadermain.ascx.2a1dc234" %>
<%--

下記は保持用のダミー情報です。削除しないでください。
<%@ FileInfo LastChanged="最終更新者" %>

--%>

<asp:UpdatePanel ID="upUpdatePanel" runat="server">
<ContentTemplate>

<% this.Reload(); %>

<%-- ▽編集可能領域：共通ヘッダ領域▽ --%> 
<link rel="stylesheet" href="<%= Constants.PATH_ROOT %>Css/reset.css">
<link rel="stylesheet" href="<%= Constants.PATH_ROOT %>Css/style.css">
<link rel="stylesheet" href="https://use.typekit.net/gba8fhr.css">
<script>
  (function(d) {
    var config = {
      kitId: 'qsj2tao',
      scriptTimeout: 3000,
      async: true
    },
    h=d.documentElement,t=setTimeout(function(){h.className=h.className.replace(/\bwf-loading\b/g,"")+" wf-inactive";},config.scriptTimeout),tk=d.createElement("script"),f=false,s=d.getElementsByTagName("script")[0],a;h.className+=" wf-loading";tk.src='https://use.typekit.net/'+config.kitId+'.js';tk.async=true;tk.onload=tk.onreadystatechange=function(){a=this.readyState;if(f||a&&a!="complete"&&a!="loaded")return;f=true;clearTimeout(t);try{Typekit.load(config)}catch(e){}};s.parentNode.insertBefore(tk,s)
  })(document);
</script>
<script>
$(function () {
    function bindHamburgerEvents() {
        $(".hamburger").off("click").on("click", function () {
            $(".globalMenuSp").addClass("active");
        });

        $(".hamburger_close").off("click").on("click", function () {
            $(".globalMenuSp").removeClass("active");
        });

        $(".anker a").off("click").on("click", function () {
            $(".globalMenuSp").removeClass("active");
        });
    }

    // 初期バインド
    bindHamburgerEvents();

    // .valiation_item を監視し、商品が切り替わった後にハンバーガーイベントを再バインド
    document.body.addEventListener('click', function(event) {
        if (event.target.closest('.valiation_item a')) {
            setTimeout(bindHamburgerEvents, 100); // 遅延で再バインド
        }
    });
});

</script>

<header id="header" class="header_wrp">
  <div class="header_logo">
    <a href="<%= WebSanitizer.HtmlEncode(this.UnsecurePageProtocolAndHost + Constants.PATH_ROOT) %>">
      <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/hd_logo.png" alt="">
    </a>
  </div>
  <div class="icon_blc">
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
              <a href="<%= WebSanitizer.HtmlEncode(this.UnsecurePageProtocolAndHost + Constants.PATH_ROOT) %>/Page/company.aspx">
                <span class="ttl">COMPANY</span>
              </a>
            </li>
        </ul>
        <a href="<%= WebSanitizer.HtmlEncode(this.UnsecurePageProtocolAndHost + Constants.PATH_ROOT) %>/Landing/Formlp/new_lp.aspx" class="ham_link_btn">
          <img class="un_tab" src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/sp_ham_bnr.jpg" alt="">
        </a>
      </div>
    </div>
  </nav>
</header>

<a href="#Contents" class="top_back_btn">
  <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/top_back.svg" alt="">
</a>




<%-- △編集可能領域△ --%>
</ContentTemplate>
</asp:UpdatePanel>

<%if (this.IsOrderPage == false) {%>
<%--▼ 注文系以外のページ ▼--%>
<%-- ▽編集可能領域：注文ページ以外で表示する領域▽ --%>

<%-- △編集可能領域△ --%>
<%--▲ 注文系以外のページ ▲--%>
<%} %>