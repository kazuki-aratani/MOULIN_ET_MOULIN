<%--
=========================================================================================================
  Module      : 商品一覧ソートリンク出力コントローラ(BodyProductSortBox.ascx)
 ･･･････････････････････････････････････････････････････････････････････････････････････････････････････
  Copyright   : Copyright W2 Co.,Ltd. 2009 All Rights Reserved.
=========================================================================================================
--%>
<%@ control language="c#" autoeventwireup="true" inherits="Form_Common_Product_BodyProductSortBox, App_Web_bodyproductsortbox.ascx.acb385f3" %>
<%@ Import Namespace="ProductListDispSetting" %>
<div id="sortBox" class="clearFix">
<%--- 表示件数 ---%>
<% if (this.DisplayCountFilter) { %>
<asp:Repeater ID="rNumberDisplayLinks" runat="server">
	<HeaderTemplate>
	<div class="box clearFix">
	<p class="title">表示件数</p>
	<ul class="nav clearFix">
	</HeaderTemplate>
		<ItemTemplate>
		<%--- 未選択 ---%>
		<li visible='<%# this.DisplayCount != (int)Container.DataItem %>' runat="server">
		<a href='<%# WebSanitizer.UrlAttrHtmlEncode(CreateDisplayCountUrl(int.Parse(WebSanitizer.HtmlEncode(Container.DataItem)))) %>'>
		<%# WebSanitizer.HtmlEncode(Container.DataItem)%></a>
		</li>
		<%--- 選択中 ---%>
		<li visible='<%# this.DisplayCount == (int)Container.DataItem %>' class='active' runat="server">
		<%# WebSanitizer.HtmlEncode(Container.DataItem)%>
		</li>
		</ItemTemplate>
	<FooterTemplate>
	</ul>
	</div>
	</FooterTemplate>
</asp:Repeater>
<% } %>
	
<% if (this.DisplayChangeFilter) { %>
<asp:Repeater ID="rImgList" runat="server">
	<HeaderTemplate>
	<div class="box clearFix">
	<p class="title">表示切替</p>
	<ul class="nav clearFix">
	</HeaderTemplate>
		<ItemTemplate>
		<%--- 未選択 ---%>
		<li visible='<%# this.DispImageKbn != ((ProductListDispSettingModel)Container.DataItem).SettingId %>' runat="server"><a href="<%# WebSanitizer.UrlAttrHtmlEncode(CreateImageDispTypeUrl(((ProductListDispSettingModel)Container.DataItem).SettingId)) %>"><%# WebSanitizer.HtmlEncode(((ProductListDispSettingModel)Container.DataItem).SettingName)%></a></li>
		<%--- 選択中 ---%>
		<li visible='<%# this.DispImageKbn == ((ProductListDispSettingModel)Container.DataItem).SettingId %>' class='active' runat="server">
		<%# WebSanitizer.HtmlEncode(((ProductListDispSettingModel)Container.DataItem).SettingName)%></li>
		</ItemTemplate>
	<FooterTemplate>
	</ul>
	</div>
	</FooterTemplate>
</asp:Repeater>
<% } %>

<% if (this.DisplayStockFilter) { %>
<%--- 在庫有無 ---%>
<asp:Repeater ID="rStockList" runat="server">
	<HeaderTemplate>
		<div class="box clearFix">
		<p class="title">在庫</p>
		<ul class="nav clearFix">
	</HeaderTemplate>
	<ItemTemplate>
		<%--- 未選択 ---%>
		<li visible='<%# this.UndisplayNostock != ((ProductListDispSettingModel)Container.DataItem).SettingId %>' runat="server"><a href="<%# WebSanitizer.UrlAttrHtmlEncode(CreateDisplayStockUrl(((ProductListDispSettingModel)Container.DataItem).SettingId)) %>"><%# WebSanitizer.HtmlEncode(((ProductListDispSettingModel)Container.DataItem).SettingName)%></a></li>
		<%--- 選択中 ---%>
		<li visible='<%# this.UndisplayNostock == ((ProductListDispSettingModel)Container.DataItem).SettingId %>' class='active' runat="server">
			<%# WebSanitizer.HtmlEncode(((ProductListDispSettingModel)Container.DataItem).SettingName)%></li>
	</ItemTemplate>
	<FooterTemplate>
	</ul>
	</div>
	</FooterTemplate>
</asp:Repeater>
<% } %>

<% if (this.DisplayFixedPurchaseFilter) {%>
<%--- 定期購入フィルタ ---%>
<div class="box clearFix">
    <p class="title">通常・定期：</p>
    <ul class="nav clearFix">
        <% if (this.FixedPurchaseFilter == Constants.KBN_PRODUCT_LIST_FIXED_PURCHASE_FILTER_ALL) { %>
            <li class="active">すべて表示</li>
        <% } else if (this.FixedPurchaseFilter == Constants.KBN_PRODUCT_LIST_FIXED_PURCHASE_FILTER_NORMAL) { %>
            <li class="active">通常購入可能</li>
        <% } else if (this.FixedPurchaseFilter == Constants.KBN_PRODUCT_LIST_FIXED_PURCHASE_FILTER_FIXED_PURCHASE) { %>
            <li class="active">定期購入可能</li>
        <% } %>
    </ul>
    <div class="dropdown">
        <ul>
            <li><a href="<%#: CreateFixedPurchaseFilterUrl(Constants.KBN_PRODUCT_LIST_FIXED_PURCHASE_FILTER_ALL) %>">すべて表示</a></li>
            <li><a href="<%#: CreateFixedPurchaseFilterUrl(Constants.KBN_PRODUCT_LIST_FIXED_PURCHASE_FILTER_NORMAL) %>">通常購入可能</a></li>
            <li><a href="<%#: CreateFixedPurchaseFilterUrl(Constants.KBN_PRODUCT_LIST_FIXED_PURCHASE_FILTER_FIXED_PURCHASE) %>">定期購入可能</a></li>
        </ul>
    </div>
</div>

<script>
    document.querySelector('.box').addEventListener('mouseenter', function() {
        document.querySelector('.dropdown').style.display = 'block';
    });

    document.querySelector('.box').addEventListener('mouseleave', function() {
        document.querySelector('.dropdown').style.display = 'none';
    });
</script>


<style>
  .box {
    position: relative;
    cursor: pointer;
  }

  .dropdown {
      display: none;
      position: absolute;
      top: 100%;
      left: 0;
      background-color: #fff;
      z-index: 1000;
      width: 300px; /* 適宜調整 */
      box-shadow: 10px 10px 21px -6px #dfdddd;
      border-radius: 15px;
  }

  .dropdown ul {
      list-style: none;
      margin: 0;
      padding: 0;
  }

  .dropdown ul li {
      border-bottom: 1px solid #ccc;
  }

  .dropdown ul li a {
      text-decoration: none;
      color: #333;
  }

  .dropdown ul li:hover {
      background-color: #f5f5f5;
  }

  .title:hover + .dropdown, .dropdown:hover {
      display: block;
  }

</style>

<% } %>
</div>
