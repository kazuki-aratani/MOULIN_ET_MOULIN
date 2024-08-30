<%--
=========================================================================================================
  Module      : スマートフォン用共通フッタ出力コントローラ(SmartPhoneFooterMain.ascx)
 ･･･････････････････････････････････････････････････････････････････････････････････････････････････････
  Copyright   : Copyright W2 Co.,Ltd. 2011 All Rights Reserved.
=========================================================================================================
--%>
<%@ Register TagPrefix="uc" TagName="AccessLogTrackerScript" Src="~/Form/Common/AccessLogTrackerScript.ascx" %>
<%@ Register TagPrefix="uc" TagName="BodyProductCategoryTree" Src="~/SmartPhone/Form/Common/Product/BodyProductCategoryTree.ascx" %>
<%@ Register TagPrefix="uc" TagName="ProductColorSearchBox" Src="~/SmartPhone/Form/Common/Product/ProductColorSearchBox.ascx" %>
<%@ Register TagPrefix="uc" TagName="BodyCoordinateList" Src="~/SmartPhone/Form/Common/Coordinate/BodyCoordinateList.ascx" %>
<%@ control language="C#" autoeventwireup="true" inherits="Form_Common_BodyFooterMain, App_Web_bodyfootermain.ascx.2a1dc234" %>
<%@ Import Namespace="w2.Domain.Coordinate" %>
<%--

下記のタグはファイル情報保持用です。削除しないでください。
<%@ FileInfo LastChanged="最終更新者" %>

--%>

<%-- ▽編集可能領域：フッタ領域▽ --%>
<footer>
  <div class="footer_blc">
    <div class="inner_960 pd_120">
      <div class="footer_cont">
        <div class="left">
          <a href="<%= WebSanitizer.HtmlEncode(this.UnsecurePageProtocolAndHost + Constants.PATH_ROOT) %>" >
            <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/ft_logo.png" alt="" class="ft_logo" />
          </a>
          <div class="copy ov_tab">©️2024 My BALANCE</div>
        </div>
        <div class="right">
          <ul class="top_blc">
            <li><a href="<%= WebSanitizer.HtmlEncode(this.UnsecurePageProtocolAndHost + Constants.PATH_ROOT) %>/#concept">CONCEPT</a></li>
            <li><a href="<%= WebSanitizer.HtmlEncode(this.UnsecurePageProtocolAndHost + Constants.PATH_ROOT) %>/#service">SERVICE</a></li>
            <li><a href="<%= WebSanitizer.HtmlEncode(this.UnsecurePageProtocolAndHost + Constants.PATH_ROOT) %>/form/Product/ProductList.aspx">LINE UP</a></li>
            <li><a href="<%= WebSanitizer.HtmlEncode(this.UnsecurePageProtocolAndHost + Constants.PATH_ROOT) %>/Landing/Formlp/new_lp.aspx">SKIN CHECK</a></li>
          </ul>
          <ul class="bottom_blc">
            <li><a href="<%= WebSanitizer.HtmlEncode(this.UnsecurePageProtocolAndHost + Constants.PATH_ROOT) %>/Form/Inquiry/InquiryInput.aspx">お問い合わせ</a></li>
            <li><a href="<%= WebSanitizer.HtmlEncode(this.UnsecurePageProtocolAndHost + Constants.PATH_ROOT) %>/Page/termofuse.aspx">特定商取引法</a></li>
            <!-- <li><a href="">利用規約</a></li> -->
            <li><a href="<%= WebSanitizer.HtmlEncode(this.UnsecurePageProtocolAndHost + Constants.PATH_ROOT) %>/Page/privacy.aspx">プライバシーポリシー</a></li>
            <li><a href="<%= WebSanitizer.HtmlEncode(this.UnsecurePageProtocolAndHost + Constants.PATH_ROOT) %>/Page/first.aspx">ご利用ガイド</a></li>
            <li><a href="<%= WebSanitizer.HtmlEncode(this.UnsecurePageProtocolAndHost + Constants.PATH_ROOT) %>/Page/faq.aspx">よくある質問</a></li>
            <li><a href="<%= WebSanitizer.HtmlEncode(this.UnsecurePageProtocolAndHost + Constants.PATH_ROOT) %>/Page/company.aspx">会社概要</a></li>
          </ul>
        </div>
        <div class="copy un_tab">©️2024 My BALANCE</div>
      </div>
    </div>
  </div>
</footer>
<script>
  // script.js
document.addEventListener("DOMContentLoaded", function() {
    const header = document.getElementById("header");

    window.addEventListener("scroll", function() {
        if (window.innerWidth <= 768) {
            if (window.scrollY > 200) {
                header.classList.add("blurred");
            } else {
                header.classList.remove("blurred");
            }
        } else {
            header.classList.remove("blurred");
        }
    });
});

</script>
<%-- △編集可能領域△ --%>

<%-- w2アクセスログトラッカー出力 --%>
<uc:AccessLogTrackerScript id="AccessLogTrackerScript1" runat="server" />