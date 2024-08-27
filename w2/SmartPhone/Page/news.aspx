<%--
=========================================================================================================
  Module      : スマートフォン用カスタムページテンプレート画面(CustomPageTemplate.aspx)
 ･･･････････････････････････････････････････････････････････････････････････････････････････････････････
  Copyright   : Copyright W2 Co.,Ltd. 2011 All Rights Reserved.
=========================================================================================================
--%>
<%-- ▽ユーザーコントロール宣言領域▽ --%>
<%@ Register TagPrefix="uc" TagName="Parts060NEWS_998" Src="~/Page/Parts//Parts060NEWS_998.ascx" %>
<%-- △ユーザーコントロール宣言領域△ --%>
<%@ Page Title="お知らせ一覧" Language="C#" Inherits="ContentsPage" MasterPageFile="~/SmartPhone/Form/Common/DefaultPage.master" %>
<%--

下記のタグはファイル情報保持用です。削除しないでください。
<%@ FileInfo LayoutName="Default" %><%@ FileInfo LastChanged="株式会社レジット" %>

--%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<%-- ▽編集可能領域：HEAD追加部分▽ --%>

<%-- △編集可能領域△ --%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<%-- ▽編集可能領域：コンテンツ▽ --%>
<section>
  <uc:Parts060NEWS_998 runat="server" />
</section>
<style>
  #Wrap {
      width: auto;
      padding-top: 40px;
  }
  #Contents {
    padding: 40px 0 0 0;
  }
<%-- △編集可能領域△ --%>

</asp:Content>
