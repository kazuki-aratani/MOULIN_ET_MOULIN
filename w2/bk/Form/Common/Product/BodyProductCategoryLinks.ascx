<%--
=========================================================================================================
  Module      : 商品カテゴリリスト出力コントローラ(BodyProductCategoryLinks.ascx)
 ･･･････････････････････････････････････････････････････････････････････････････････････････････････････
  Copyright   : Copyright W2 Co.,Ltd. 2009 All Rights Reserved.
=========================================================================================================
--%>
<%@ control language="c#" inherits="Form_Common_Product_BodyProductCategoryLinks, App_Web_bodyproductcategorylinks.ascx.acb385f3" %>
<asp:Repeater id="rCategoriesLink" runat="server">
<HeaderTemplate><ul><li><a href="<%= WebSanitizer.UrlAttrHtmlEncode(this.UnsecurePageProtocolAndHost + Constants.PATH_ROOT) %>">HOME</a></li>
</HeaderTemplate>
<ItemTemplate>
	<li>
		<span>&raquo;</span>
			<a href='<%# WebSanitizer.UrlAttrHtmlEncode(CreateCategoryLinkUrl(Eval(Constants.FIELD_PRODUCTCATEGORY_SHOP_ID), Eval(Constants.FIELD_PRODUCTCATEGORY_CATEGORY_ID), Eval(Constants.FIELD_PRODUCTCATEGORY_URL), (string)Eval(Constants.FIELD_PRODUCTCATEGORY_NAME))) %>'>
				<%# WebSanitizer.HtmlEncode(Eval(Constants.FIELD_PRODUCTCATEGORY_NAME)) %></a>
	</li>
</ItemTemplate>
<FooterTemplate>
	</ul>
	&nbsp;<%#: string.IsNullOrEmpty(this.ProductColorId) ? "" : "(" + this.ProductColorId + "系)" %>
</FooterTemplate>
</asp:Repeater>
