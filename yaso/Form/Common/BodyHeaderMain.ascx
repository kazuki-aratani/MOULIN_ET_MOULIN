<%--
=========================================================================================================
  Module      : 共通ヘッダ出力コントローラ(BodyHeaderMain.ascx)
 ･･･････････････････････････････････････････････････････････････････････････････････････････････････････
  Copyright   : Copyright w2solution Co.,Ltd. 2009 All Rights Reserved.
=========================================================================================================
--%>
<%@ Register TagPrefix="uc" TagName="BodyMiniCart" Src="~/Form/Common/BodyMiniCart.ascx" %>
<%@ Register TagPrefix="uc" TagName="GlobalChangeMenu" Src="~/Form/Common/Global/GlobalChangeMenu.ascx" %>
<%@ control language="c#" autoeventwireup="true" inherits="Form_Common_BodyHeaderMain, App_Web_bodyheadermain.ascx.2af06a88" %>
<%--

下記は保持用のダミー情報です。削除しないでください。
<%@ FileInfo LastChanged="design" %>

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
<asp:UpdatePanel ID="upUpdatePanel2" runat="server">
<ContentTemplate>
<% this.Reload(); %>
<div id="Head">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Prompt:wght@100;200;300;400&family=Vollkorn:wght@400;500;600&family=Zen+Old+Mincho:wght@400;700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500&display=swap" rel="stylesheet">
  <script>
    var meta = document.createElement('meta');
    meta.setAttribute('name', 'viewport');
    meta.setAttribute('content', 'width=device-width,initial-scale=1.0');
    document.getElementsByTagName('head')[0].appendChild(meta);
    </script>
	<div class="inner">
    <button class="sp_header_hmbgBtn hp_pc_none hmbg-btn">
      <span class="hmbg-btn-line hmbg-btn-line top"></span>
      <span class="hmbg-btn-line hmbg-btn-line middle"></span>
      <span class="hmbg-btn-line hmbg-btn-line bottom"></span>
    </button>
    <div class="hmbg-menu hp_pc_none" id="hmbgMenu">
      <div class="hmbg-menu_inner">
        <div class="hmbg-menu_top">
          <a href="<%: this.CartListPageUrl %>" class="hmbg-menu_top_btn bl_cartBtn">
            <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/new_theme/sp_hmbgmenu-carticon.svg" alt="" class="hmbg-menu_top_btn_lefticon">
            カートを見る
          </a>
          <a href="<%: this.SecurePageProtocolAndHost + Constants.PATH_ROOT + Constants.PAGE_FRONT_MYPAGE %>" class="hmbg-menu_top_btn bl_mypageBtn">
            <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/new_theme/sp_hmbgmenu-usericon.svg" alt="" class="hmbg-menu_top_btn_lefticon">
            MY PAGE
          </a>
        </div>
        <ul class="hmbg-menu_list">
          <li class="hmbg-menu_list_item">
            <a href="<%= WebSanitizer.HtmlEncode(Constants.PATH_ROOT + "Page/about.aspx") %>">yasoについて<span class="en">ABOUT</span></a>
          </li>
          <style>
            .hmbg-menu_list_item_children {
              display: flex;
              flex-wrap: wrap;
              padding-bottom: 8px;
            }
            .hmbg-menu_list_item.hmbg-menu_list_item_hasChild {
              position: relative;
            }
            .hmbg-menu_list_item.hmbg-menu_list_item_hasChild::after {
              content: '';
              display: block;
              width: 13px;
              height: 13px;
              background-image: url('<%= Constants.PATH_ROOT %>Contents/ImagesPkg/new_theme/hmbg-menu_arrow.svg');
              background-size: contain;
              background-repeat: no-repeat;
              position: absolute;
              top: 11px;
              right: 10px;
              transform: rotate(180deg);
              transition: all 0.3s;
            }
            .hmbg-menu_list_item.hmbg-menu_list_item_hasChild.js_active::after {
              top: 16px;
              right: 10px;
              transform: rotate(0);
            }
            .hmbg-menu_list_item.hmbg-menu_list_item_hasChild > a {
              border-bottom: none;
            }
            .hmbg-menu_list_item.hmbg-menu_list_item_hasChild + .hmbg-menu_list_item {
              border-top: 1px solid #fff;
            }
            .hmbg-menu_list_item_children .hmbg-menu_list_item_child {
              width: 50%;
            }
            .hmbg-menu_list_item_children .hmbg-menu_list_item_child a {
              border-bottom: none;
            }
            .hmbg-menu_list_item a.disabled {
              opacity: 0.4;
              pointer-events: none
            }
            .hmbg-menu_list_item a.no_link:hover {
              background-color: transparent;
              color: #fff;
            }
            .header_link.no_link:hover {
              color: #333;
            }
            @media screen and (max-width: 767px){
                .bl_cartBtn, .bl_mypageBtn{
                    height:50px;
                }
                .hmbg-menu_list_item > a  {
                    font-size:13px;
                    letter-spacing:0.3em;
                    padding-top:25px;
                    padding-bottom:25px;
                }
                .hmbg-menu_list_item_child > a {
                    font-size:11px;
                    letter-spacing:0.3em;
                    padding-top:16px;
                    padding-bottom:16px;
                }
                .hmbg-menu_list_item.hmbg-menu_list_item_hasChild::after {
                    top:22px;
                }
                .hmbg-menu_list_item.hmbg-menu_list_item_hasChild.js_active::after {
                    top:28px;
                }
                .hmbg-menu_bottom_btns {
                    margin-bottom:38px;
                }
            }
          </style>
          <li class="hmbg-menu_list_item hmbg-menu_list_item_hasChild">
            <a class="no_link">商品<span class="en">PRODUCT</span></a>
            <ul class="hmbg-menu_list_item_children">
              <li class="hmbg-menu_list_item_child">
                <a href="<%= WebSanitizer.HtmlEncode(Constants.PATH_ROOT + "Page/yasocha.aspx") %>">八十茶</a>
              </li>
              <li class="hmbg-menu_list_item_child">
                <a href="<%= WebSanitizer.HtmlEncode(Constants.PATH_ROOT + "Page/apothecary.aspx") %>">アポセカリー</a>
              </li>
              <li class="hmbg-menu_list_item_child">
                <a href="<%= WebSanitizer.HtmlEncode(Constants.PATH_ROOT + "Form/Product/ProductList.aspx?cat=007") %>">フレグランス</a>
              </li>
              
            <li class="hmbg-menu_list_item_child">
              <a href="<%= WebSanitizer.HtmlEncode(Constants.PATH_ROOT + "Form/Product/ProductList.aspx?cat=002") %>">OTHER</a>
            </li>
              <li class="hmbg-menu_list_item_child">
                <a href="https://beer.yaso.jp/">赤松のビール</a>
              </li>
              <li class="hmbg-menu_list_item_child">
                <a href="<%= WebSanitizer.HtmlEncode(Constants.PATH_ROOT + "Form/Product/ProductList.aspx?cat=009") %>">ギフトセット</a>
              </li>
              <li class="hmbg-menu_list_item_child">
                <a href="<%= WebSanitizer.HtmlEncode(Constants.PATH_ROOT + "Form/Product/ProductList.aspx?cat=011") %>">森のスワッグ</a>
              </li>
              <li class="hmbg-menu_list_item_child">
                <a href="<%= WebSanitizer.HtmlEncode(Constants.PATH_ROOT + "Form/Product/ProductList.aspx?cat=010") %>">期間限定商品</a>
              </li>
              <li class="hmbg-menu_list_item_child">
                <a href="<%= WebSanitizer.HtmlEncode(Constants.PATH_ROOT + "Form/Product/ProductList.aspx") %>">ALL ITEMS</a>
              </li>
            </ul>
          </li>
          <li class="hmbg-menu_list_item">
            <a href="<%= WebSanitizer.HtmlEncode(Constants.PATH_ROOT + "Page/teiki.aspx") %>">定期便<span class="en">SUBSCRIPTION</span></a>
          </li>
          <li class="hmbg-menu_list_item">
            <a href="<%= WebSanitizer.HtmlEncode(Constants.PATH_ROOT + "Form/FeaturePage/FeaturePageList.aspx?fpcid=002") %>">読み物<span class="en">COLUMN</span></a>
          </li>
          <li class="hmbg-menu_list_item" style="border-bottom: 1px solid #fff;">
            <a href="<%= WebSanitizer.HtmlEncode(Constants.PATH_ROOT + "Page/shop-list.aspx") %>">取扱店舗<span class="en">SHOP</span></a>
          </li>
        </ul>
        <div class="hmbg-menu_bottom">
          <div class="hmbg-menu_bottom_btns">
            <a href="<%= WebSanitizer.HtmlEncode(Constants.PATH_ROOT + "Page/first.aspx") %>" class="hmbg-menu_bottom_btn">ご利用ガイド</a>
            <a href="<%= WebSanitizer.HtmlEncode(Constants.PATH_ROOT + "Page/faq.aspx") %>" class="hmbg-menu_bottom_btn">よくある質問</a>
            <a href="<%= WebSanitizer.HtmlEncode(Constants.PATH_ROOT + "Form/Inquiry/InquiryInput.aspx") %>" class="hmbg-menu_bottom_btn">お問い合わせ</a>
          </div>
          <div class="hmbg-menu_snsBtns bl_snsBtns">
            <a target="blank" href="https://www.facebook.com/yasoproject/" class="hmbg-menu_snsBtn bl_snsBtn">
              <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/new_theme/sp_hmbgmenu-facebookicon.svg" alt="" class="hmbg-menu_snsBtn_img bl_snsBtn_img">
            </a>
            <a target="blank" href="https://www.instagram.com/yaso_project/" class="hmbg-menu_snsBtn bl_snsBtn">
              <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/new_theme/sp_hmbgmenu-instaicon.svg" alt="" class="hmbg-menu_snsBtn_img bl_snsBtn_img">
            </a>
            <a target="blank" href="https://twitter.com/ProjectYaso" class="hmbg-menu_snsBtn bl_snsBtn">
              <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/new_theme/sp_hmbgmenu-twittericon.svg" alt="" class="hmbg-menu_snsBtn_img bl_snsBtn_img">
            </a>
          </div>
        </div>
      </div>
    </div>
		<%--▼ グローバル:切り替えタグ ▼--%>
		<uc:GlobalChangeMenu runat="server"/>
		<%--▲ グローバル:切り替えタグ ▲--%>

		<div id="LogoMain">
			<h1><a href="<%= WebSanitizer.HtmlEncode(this.UnsecurePageProtocolAndHost + Constants.PATH_ROOT) %>"><img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/new_theme/pc_header_logo.jpg" alt="yaso"></a></h1>
		</div>

		<div id="HeadRight" class="">
      <div class="header_link_unit hp_sp_none">
        <a href="<%= WebSanitizer.HtmlEncode(Constants.PATH_ROOT + "Page/about.aspx") %>" class="header_link">yasoについて</a>
        <div class="header_link__has_list">
          <a href="<%= WebSanitizer.HtmlEncode(Constants.PATH_ROOT + "Form/Product/ProductList.aspx") %>" class="header_link">商品</a>
          <ul class="header_link_menu">
            <li class="header_link_menu_item">
              <a href="<%= WebSanitizer.HtmlEncode(Constants.PATH_ROOT + "Page/yasocha.aspx") %>">八十茶</a>
            </li>
            <li class="header_link_menu_item">
              <a href="<%= WebSanitizer.HtmlEncode(Constants.PATH_ROOT + "Page/apothecary.aspx") %>">アポセカリー</a>
            </li>
            <li class="header_link_menu_item">
              <a href="<%= WebSanitizer.HtmlEncode(Constants.PATH_ROOT + "Form/Product/ProductList.aspx?cat=007") %>">フレグランス</a>
            </li>
            <li class="header_link_menu_item">
              <a href="<%= WebSanitizer.HtmlEncode(Constants.PATH_ROOT + "Form/Product/ProductList.aspx?cat=002") %>">OTHER</a>
            </li>
            <li class="header_link_menu_item">
              <a href="https://beer.yaso.jp/">赤松のビール</a>
            </li>
            <li class="header_link_menu_item">
              <a href="<%= WebSanitizer.HtmlEncode(Constants.PATH_ROOT + "Form/Product/ProductList.aspx?cat=009") %>">ギフトセット</a>
            </li>
            <li class="header_link_menu_item">
              <a href="<%= WebSanitizer.HtmlEncode(Constants.PATH_ROOT + "Form/Product/ProductList.aspx?cat=011") %>">森のスワッグ</a>
            </li>
            <li class="header_link_menu_item">
              <a href="<%= WebSanitizer.HtmlEncode(Constants.PATH_ROOT + "Form/Product/ProductList.aspx?cat=010") %>">期間限定商品</a>
            </li>
            <li class="header_link_menu_item">
              <a href="<%= WebSanitizer.HtmlEncode(Constants.PATH_ROOT + "Form/Product/ProductList.aspx") %>">ALL ITEMS</a>
            </li>
          </ul>
        </div>
        <a href="<%= WebSanitizer.HtmlEncode(Constants.PATH_ROOT + "Page/teiki.aspx") %>" class="header_link">定期便</a>
        <a href="<%= WebSanitizer.HtmlEncode(Constants.PATH_ROOT + "Form/FeaturePage/FeaturePageList.aspx?fpcid=002") %>" class="header_link">読み物</a>
        <a href="<%= WebSanitizer.HtmlEncode(Constants.PATH_ROOT + "Page/shop-list.aspx") %>" class="header_link no_link">取扱店舗</a>
    </div>
		<div class="header_cart_and_user">
      <div id="HeadCartView" class="hoverMenu">
        <a href="<%: this.CartListPageUrl %>">
          <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/new_theme/pc_header_carticon.jpg" alt="">
        <span class="header_num_in_cartItem"><%= WebSanitizer.HtmlEncode(GetNumeric(this.ProductCount))%></span>
        </a>
      </div>
          <div id="HeadMembers" class="hoverMenu hp_sp_none">
        <%if (this.IsLoggedIn) { %>
          <a href="<%: this.SecurePageProtocolAndHost + Constants.PATH_ROOT + Constants.PAGE_FRONT_MYPAGE %>" class="">
                <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/new_theme/pc_header_usericon.png" alt="">
                <span class="mypage hp_ff_prompt">MY PAGE</span>
          </a>
        <% }else{ %>
          <a href="<%= WebSanitizer.HtmlEncode(this.SecurePageProtocolAndHost + Constants.PATH_ROOT + Constants.PAGE_FRONT_LOGIN + "?" + Constants.REQUEST_KEY_NEXT_URL + "=" + HttpUtility.UrlEncode(this.NextUrl)) %>" class=""><img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/new_theme/pc_header_usericon.png" alt="">
          <span class="hp_ff_prompt">LOGIN</span>
          </a>
        <% } %>
      </div>
    </div>
		</div>
	</div>
</div>
<script>
window.onpageshow = function(event) {
	if (event.persisted) {
    window.location.reload();
	}
};
  $(function () {
    $('.hmbg-btn').click(function(e){
      e.preventDefault()
      e.stopPropagation()
      $('.hmbg-menu').toggleClass('hmbg-menu_active')
      $('body').toggleClass('hp_overlay')
      $(this).toggleClass('sp_hmbg-menu_closeBtn')
    })
    $('.hmbg-menu a').not('.no_link').click(function(){
      $('.hmbg-menu').toggleClass('hmbg-menu_active')
      $('body').toggleClass('hp_overlay')
      $('.hmbg-btn').toggleClass('sp_hmbg-menu_closeBtn')
    })
  })
  
  
$(function(){ 
  var process = function () {
    $('.hmbg-btn').click(function(e){
      e.preventDefault()
      e.stopPropagation()
      $('.hmbg-menu').toggleClass('hmbg-menu_active')
      $('body').toggleClass('hp_overlay')
      $(this).toggleClass('sp_hmbg-menu_closeBtn')
    })
    // $('.hmbg-menu a').not('.no_link').click(function(){
    //   $('.hmbg-menu').toggleClass('hmbg-menu_active')
    //   $('body').toggleClass('hp_overlay')
    //   $('.hmbg-btn').toggleClass('sp_hmbg-menu_closeBtn')
    // })
  }; 
  if (Sys && Sys.Application) { Sys.Application.add_load(process); } else { process(); }
});

$(function(){ 
  $('.hmbg-menu_list_item_children').hide()
  $(".hmbg-menu_list_item_hasChild").on("click", function (e) {
    $(this).toggleClass('js_active')
    $(this).find('.hmbg-menu_list_item_children').slideToggle()
  });
});

</script>
</ContentTemplate>
</asp:UpdatePanel>
<%-- △編集可能領域△ --%>

<%--
下記はファイル情報保持用のダミーです。削除しないでください。
<%@ FileInfo LastChanged="ｗ２ユーザー" %>
--%>