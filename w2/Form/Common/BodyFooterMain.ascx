<%--
=========================================================================================================
Module : 共通フッタ出力コントローラ(BodyFooterMain.ascx)
･･･････････････････････････････････････････････････････････････････････････････････････････････････････
Copyright : Copyright W2 Co.,Ltd. 2009 All Rights Reserved.
=========================================================================================================
--%> <%@ Register TagPrefix="uc" TagName="AccessLogTrackerScript"
Src="~/Form/Common/AccessLogTrackerScript.ascx" %> <%@ control language="C#"
autoeventwireup="true" inherits="Form_Common_BodyFooterMain,
App_Web_bodyfootermain.ascx.2af06a88" %> <%--
下記のタグはファイル情報保持用です。削除しないでください。 <%@ FileInfo
LastChanged="最終更新者" %> --%> <%-- ▽編集可能領域：フッタ領域▽ --%>
<footer>
  <div class="footer_blc">
    <img
      src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/bg_gradation_point03.png"
      alt=""
      class="gdt_point03"
    />
    <div class="inner_960 pd_120">
      <div class="footer_cont">
        <div class="left">
          <a
            href="<%= WebSanitizer.HtmlEncode(this.UnsecurePageProtocolAndHost + Constants.PATH_ROOT) %>"
          >
            <img
              src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/ft_logo.png"
              alt=""
              class="ft_logo"
            />
          </a>
          <div class="copy ov_tab">©️2024 My BALANCE</div>
        </div>
        <div class="right">
          <ul class="top_blc">
            <li><a href="">CONCEPT</a></li>
            <li><a href="">SERVICE</a></li>
            <li><a href="">LINE UP</a></li>
            <li><a href="">SKIN CHECK</a></li>
            <li><a href="" target="_blank">COMPANY</a></li>
          </ul>
          <ul class="bottom_blc">
            <li><a href="">お問い合わせ</a></li>
            <li><a href="">特定商取引法</a></li>
            <li><a href="">利用規約</a></li>
            <li><a href="">プライバシーポリシー</a></li>
            <li><a href="">ご利用ガイド</a></li>
            <li><a href="">よくある質問</a></li>
            <li><a href="">会社概要</a></li>
          </ul>
        </div>
        <div class="copy un_tab">©️2024 My BALANCE</div>
      </div>
    </div>
  </div>
</footer>
<%-- △編集可能領域△ --%> <%-- w2アクセスログトラッカー出力 --%>
<uc:AccessLogTrackerScript id="AccessLogTrackerScript1" runat="server" />
