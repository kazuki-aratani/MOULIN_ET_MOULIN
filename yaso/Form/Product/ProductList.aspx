<%--
=========================================================================================================
  Module      : 商品一覧画面(ProductList.aspx)
 ･･･････････････････････････････････････････････････････････････････････････････････････････････････････
  Copyright   : Copyright w2solution Co.,Ltd. 2009 All Rights Reserved.
=========================================================================================================
--%>
<%-- ▽ユーザーコントロール宣言領域▽ --%>
<%@ Register TagPrefix="uc" TagName="BodyProductAdvancedSearchBox" Src="~/Form/Common/Product/BodyProductAdvancedSearchBox.ascx" %>
<%@ Register TagPrefix="uc" TagName="BodyProductCategoryTree" Src="~/Form/Common/Product/BodyProductCategoryTree.ascx" %>
<%@ Register TagPrefix="uc" TagName="BodyProductHistory" Src="~/Form/Common/Product/BodyProductHistory.ascx" %>
<%@ Register TagPrefix="uc" TagName="ProductColorSearchBox" Src="~/Form/Common/Product/ProductColorSearchBox.ascx" %>
<%-- △ユーザーコントロール宣言領域△ --%>
<%@ Register TagPrefix="uc" TagName="BodyProductArrivalMailRegisterTr" Src="~/Form/Common/Product/BodyProductArrivalMailRegisterTr.ascx" %>
<%@ Register TagPrefix="uc" TagName="BodyProductCategoryHtml" Src="~/Form/Common/Product/BodyProductCategoryHtml.ascx" %>
<%@ Register TagPrefix="uc" TagName="BodyProductSortBox" Src="~/Form/Common/Product/BodyProductSortBox.ascx" %>
<%@ Register TagPrefix="uc" TagName="BodyProductCategoryLinks" Src="~/Form/Common/Product/BodyProductCategoryLinks.ascx" %>
<%@ Register TagPrefix="uc" TagName="BodyProductVariationImages" Src="~/Form/Common/Product/BodyProductVariationImages.ascx" %>
<%@ Register TagPrefix="uc" TagName="BodyProductGroupContentsHtml" Src="~/Form/Common/Product/BodyProductGroupContentsHtml.ascx" %>
<%@ Register TagPrefix="uc" TagName="Criteo" Src="~/Form/Common/Criteo.ascx" %>
<%@ page language="C#" masterpagefile="~/Form/Common/DefaultPage.master" autoeventwireup="true" inherits="Form_Product_ProductList, App_Web_productlist.aspx.1e99e05" title="商品一覧ページ" %>
<%@ Import Namespace="ProductListDispSetting" %>
<%--

下記のタグはファイル情報保持用です。削除しないでください。In
<%@ FileInfo LayoutName="NoSide" %><%@ FileInfo LastChanged="manager" %>

--%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<%-- ▽編集可能領域：HEAD追加部分▽ --%>
<link href="<%= WebSanitizer.HtmlEncode(Constants.PATH_ROOT) %>Css/product.css" rel="stylesheet" type="text/css" media="all" />
<link rel="canonical" href="<%# CreateProductListCanonicalUrl() %>" />
<% if (Constants.MOBILEOPTION_ENABLED){%>
	<link rel="Alternate" media="handheld" href="<%= WebSanitizer.HtmlEncode(GetMobileUrl()) %>" />
<% } %>
<%= this.BrandAdditionalDsignTag %>
<% if (Constants.SEOTAG_IN_PRODUCTLIST_ENABLED){ %>
	<meta name="Keywords" content="<%: this.SeoKeywords %>" />
<% } %>
<%-- △編集可能領域△ --%>
<%# this.PaginationTag %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script type="text/javascript">
	$(function () {

		// 商品一覧:詳細検索
		function getUrlVars() {
			var vars = [], hash;
			var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
			for (var i = 0; i < hashes.length; i++) {
				hash = hashes[i].split('=');
				vars.push(hash[0]);
				vars[hash[0]] = hash[1];
			}
			return vars;
		}

		//ソート
		$(".btn-sort-search").click(function () {

			var urlVars = getUrlVars();

			// 店舗ID
			var $shop = (urlVars["<%= Constants.REQUEST_KEY_SHOP_ID %>"] == undefined)
				? "<%= Constants.CONST_DEFAULT_SHOP_ID %>"
				: urlVars["<%= Constants.REQUEST_KEY_SHOP_ID %>"];
			// カテゴリ及びカテゴリ名
			if ($(".sort-category select").val() != "") {
				var $cat = $(".sort-category select").val();
				var $catName = $(".sort-category select option:selected").text();
			} else {
				var $cat = "";
				var $catName = "";
			}
			// ブランド
			var $bid = urlVars["<%= Constants.REQUEST_KEY_BRAND_ID %>"];
			var $brand = "<%= this.BrandName %>";
			if ($("input[name='iBrand']").length != 0) {
				if (("<%= Constants.PRODUCT_BRAND_ENABLED %>" == "True") && ($("input[name='iBrand']:checked").val() != undefined)) {
					$bid  = $("input[name='iBrand']:checked").val();
				} else {
					$bid = undefined;
				}
			}

			// Product Group ID
			var $productGroupId = "&<%= Constants.REQUEST_KEY_PRODUCT_GROUP_ID %>=";
			$productGroupId = $productGroupId + ((urlVars["<%= Constants.REQUEST_KEY_PRODUCT_GROUP_ID %>"] == undefined) ? "" : urlVars["<%= Constants.REQUEST_KEY_PRODUCT_GROUP_ID %>"]);
			// キャンペーンアイコン
			var $cicon = "&<%= Constants.REQUEST_KEY_CAMPAINGN_ICOM %>="
				+ ((urlVars["<%= Constants.REQUEST_KEY_CAMPAINGN_ICOM %>"] == undefined)
					? ""
					: urlVars["<%= Constants.REQUEST_KEY_CAMPAINGN_ICOM %>"]);
			// 特別価格商品の表示
			var $dosp = "&<%= Constants.REQUEST_KEY_DISP_ONLY_SP_PRICE %>="
				+ ((urlVars["<%= Constants.REQUEST_KEY_DISP_ONLY_SP_PRICE %>"] == undefined)
					? ""
					: urlVars["<%= Constants.REQUEST_KEY_DISP_ONLY_SP_PRICE %>"]);
			// 表示件数
			if ($("input[name='dpcnt']:checked").val() != "") {
				var $dpcnt = "&<%= Constants.REQUEST_KEY_DISP_PRODUCT_COUNT %>="
					+ $("input[name='dpcnt']:checked").val();
			} else {
				var $dpcnt = "&<%= Constants.REQUEST_KEY_DISP_PRODUCT_COUNT %>="
					+ ((urlVars["<%= Constants.REQUEST_KEY_DISP_IMG_KBN %>"] == "<%= Constants.KBN_REQUEST_DISP_IMG_KBN_ON %>")
						? "<%= ProductListDispSettingUtility.CountDispContentsImgOn %>"
						: "<%= ProductListDispSettingUtility.CountDispContentsWindowShopping %>");
			}
			// 画像表示区分
			var $img = "&<%= Constants.REQUEST_KEY_DISP_IMG_KBN %>="
				+ ((urlVars["<%= Constants.REQUEST_KEY_DISP_IMG_KBN %>"] == undefined)
					? ""
					: urlVars["<%= Constants.REQUEST_KEY_DISP_IMG_KBN %>"]);
			// 価格帯
			if ($("input[name='price']:checked").val() != "") {
				var price = $("input[name='price']:checked").val();
				priceValue = price.split(",");
				var $min = "&<%= Constants.REQUEST_KEY_MIN_PRICE %>=" + priceValue[0];
				var $max = "&<%= Constants.REQUEST_KEY_MAX_PRICE %>=" + priceValue[1];
			} else {
				var $min = "&<%= Constants.REQUEST_KEY_MIN_PRICE %>=";
				var $max = "&<%= Constants.REQUEST_KEY_MAX_PRICE %>=";
			}
			// 表示順
			if ($("input[name='sort']:checked").val() != "") {
				var $sort = "&<%= Constants.REQUEST_KEY_SORT_KBN %>=" + $("input[name='sort']:checked").val();
			} else {
				var $sort = "&<%= Constants.REQUEST_KEY_SORT_KBN %>=<%= ProductListDispSettingUtility.SortDefault %>";
			}
			// キーワード
			if ($(".sort-word input").val() != "") {
				var $swrd = "&<%= Constants.REQUEST_KEY_SEARCH_WORD %>=" + $(".sort-word input").val();
			} else {
				var $swrd = "&<%= Constants.REQUEST_KEY_SEARCH_WORD %>=";
			}
			// 在庫
			if ($("input[name='udns']:checked").val() != "") {
				var $udns = "&<%= Constants.REQUEST_KEY_UNDISPLAY_NOSTOCK_PRODUCT %>=" + $("input[name='udns']:checked").val();
			} else {
				var $udns = "&<%= Constants.REQUEST_KEY_UNDISPLAY_NOSTOCK_PRODUCT %>=";
			}
			// 定期購入フィルタ
			if ($("input[name=<%= Constants.FORM_NAME_FIXED_PURCHASE_RADIO_BUTTON %>]:checked").val() != "") {
				var $fpfl = "&<%= Constants.REQUEST_KEY_FIXED_PURCHASE_FILTER %>=" + $("input[name=<%= Constants.FORM_NAME_FIXED_PURCHASE_RADIO_BUTTON %>]:checked").val();
			} else {
				var $fpfl = "&<%= Constants.REQUEST_KEY_FIXED_PURCHASE_FILTER %>=";
			}

			// 指定したURLにジャンプ(1ページ目へ)
			if (("<%= Constants.FRIENDLY_URL_ENABLED %>" == "True") && ($catName != "")) {
				if (("<%= Constants.PRODUCT_BRAND_ENABLED %>" == "True") && ($brand != "")) {
					var rootUrl = "<%= Constants.PATH_ROOT %>" + $brand + "-" + $catName + "/brandcategory/" + $bid + "/" + $shop + "/" + $cat + "/?";
				} else {
					var rootUrl = "<%= Constants.PATH_ROOT %>" + $catName + "/category/" + $shop + "/" + $cat + "/?" + (($bid != undefined) ? "<%= Constants.REQUEST_KEY_BRAND_ID %>=" + $bid : "");
				}
			} else {
				var rootUrl = "<%= Constants.PATH_ROOT %><%= Constants.PAGE_FRONT_PRODUCT_LIST %>?<%= Constants.REQUEST_KEY_SHOP_ID %>=" + $shop
					+ "&<%= Constants.REQUEST_KEY_CATEGORY_ID %>=" + $cat + (($bid != undefined) ? "&<%= Constants.REQUEST_KEY_BRAND_ID %>=" + $bid : "");
			}
			location.href = rootUrl + $productGroupId + $cicon + $dosp + $dpcnt + $img + $max + $min + $sort + $swrd + $udns + $fpfl + "&<%= Constants.REQUEST_KEY_PAGE_NO %>=1";
		});

	});

	function enterSearch() {
		//EnterキーならSubmit
		if (window.event.keyCode == 13) document.formname.submit();
	}

</script>

<table id="tblLayout" class="tblLayout_ProductList">
<tr>

<td>
  <div id="secondary">
  <%-- ▽レイアウト領域：レフトエリア▽ --%>
  <uc:ProductColorSearchBox runat="server" />
  <uc:BodyProductCategoryTree runat="server" />
  <%-- △レイアウト領域△ --%>
  </div>
</td>
<td>
<div id="divTopArea">
<%-- ▽レイアウト領域：トップエリア▽ --%>
<%-- △レイアウト領域△ --%>
</div>
<%-- ▽編集可能領域：コンテンツ▽ --%>
<style>
  /* 動かさない*/
  #Wrap{
  width: 100%;
  max-width: 100%;
  padding-left: 0;
  padding-right: 0;
}
#secondary{
  display: none !important;
}
</style>

<div class="bl_pageMv">
  <!-- yasoBOXのとき -->
  <% if(this.CategoryId == "003"){ %>
    <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/new_theme/pc_allproducts_yasobox_mv.jpg" alt="ALL PRODUCTS" class="bl_pageMv_img">
  <!-- /yasoBOXのとき -->
  <!-- yasoSTANDのとき -->
  <% } else if(this.CategoryId == "004"){ %>
    <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/new_theme/pc_allproducts_yasostand_mv.jpg" alt="ALL PRODUCTS" class="bl_pageMv_img">
    <!-- /yasoSTANDのとき -->
  <% } else if(this.CategoryId == "") { %>
    <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/new_theme/pc_allproducts_mv.jpg" alt="ALL PRODUCTS" class="bl_pageMv_img">
    <strong class="bl_pageMv_ttl hp_ff_vollkorn">ALL ITEMS</strong>
  <% } %>  
</div>
<!-- yasoBOXのとき -->
<% if(this.CategoryId == "003"){ %>
  <div class="bl_section_head bl_products_top">
    <h2 class="bl_section_ttl hp_ff_zenOldMincho">
      yaso BOX - 森の標本 -
    </h2>
    <p class="hp_ff_zenOldMincho">
      アーボリストたちの目に留まった木の実や枝葉を集めた、森の標本。<br class="">
      透明なケースに入れることで個々のディテールが浮き立ち、<br class="hp_sp_none">
      部屋のインテリアや装飾として存在感を放ちます。
    </p>
  </div>
<% } %>
<!-- / yasoBOXのとき -->
<!-- yasoSTANDのとき -->
<% if(this.CategoryId == "004"){ %>
<div class="bl_section_head bl_products_top">
  <h2 class="bl_section_ttl hp_ff_zenOldMincho">
    yaso stand
  </h2>
  <p class="hp_ff_zenOldMincho">
    樹木の持つ表情をありのままに活かした植物スタンド。<br class="">
    暮らしまわりのちょっとした枝や葉など、野のものをさり気なく飾る花器としてお楽しみください。<br class="">
    自然のカケラが、空間を優しく彩ります。
  </p>
</div>
<% } %>
<!-- /yasoSTANDのとき -->
<script>
  // let query = location.search
  // yasoboxのとき
  // if(query === '?cat=003')
  // if(query.indexOf('cat=003') > 0){
  //   let addDom = `<div class="bl_section_head bl_products_top">
  // <h2 class="bl_section_ttl hp_ff_zenOldMincho">
  //   yaso BOX - 森の標本 -
  // </h2>
  // <p class="hp_ff_zenOldMincho">
  //   アーボリストたちの目に留まった木の実や枝葉を集めた、森の標本。<br class="">
  //   透明なケースに入れることで個々のディテールが浮き立ち、<br class="hp_sp_none">
  //   部屋のインテリアや装飾として存在感を放ちます。
  // </p>
  // </div>`

  // $('.bl_pageMv').after(addDom)
  // $('.bl_pageMv_img').attr('src','/Contents/ImagesPkg/new_theme/pc_allproducts_yasobox_mv.jpg');
  // $('.bl_pageMv_ttl').hide()
  // }
  // yasostandのとき
  // if(query === '?cat=004')
  // if(query.indexOf('cat=004') > 0){
  //   let addDom = `<div class="bl_section_head bl_products_top">
  // <h2 class="bl_section_ttl hp_ff_zenOldMincho">
  //   yaso stand
  // </h2>
  // <p class="hp_ff_zenOldMincho">
  //   樹木の持つ表情をありのままに活かした植物スタンド。<br class="">
  //   暮らしまわりのちょっとした枝や葉など、野のものをさり気なく飾る花器としてお楽しみください。<br class="">
  //   自然のカケラが、空間を優しく彩ります。
  // </p>
  // </div>`

  // $('.bl_pageMv').after(addDom)
  // $('.bl_pageMv_img').attr('src','/Contents/ImagesPkg/new_theme/pc_allproducts_yasostand_mv.jpg');
  // $('.bl_pageMv_ttl').hide()
  // }
</script>
<div id="">

<!--▽ 上部カテゴリリンク ▽-->
<style>
/*   <div id="breadcrumb">
  <uc:BodyProductCategoryLinks runat="server"></uc:BodyProductCategoryLinks>
  </div> */
</style>
<!--△ 上部カテゴリリンク △-->

<!--▽ カテゴリHTML領域 ▽-->
<uc:BodyProductCategoryHtml runat="server" />
<!--△ カテゴリHTML領域 △-->

<!--▽ 商品グループページHTML領域 ▽-->
<uc:BodyProductGroupContentsHtml runat="server" />
<!--△ 商品グループページHTML領域 △-->

<style>
/*   検索機能 非表示
<uc:BodyProductAdvancedSearchBox runat="server" /> */
</style>

<!--▽ ソートコントロール ▽-->
<style>
/*   <uc:BodyProductSortBox CategoryName="<%# this.CategoryName %>" runat="server"></uc:BodyProductSortBox> */
</style>
<!--△ ソートコントロール △-->

<!--▽ ページャ ▽-->
<style>
/*   <div id="pagination" class="above clearFix">
  <%# this.PagerHtml %>
  </div> */
</style>
<!--△ ページャ △-->

<div class="">

<%-- カート投入ボタン押下時にどの画面へ遷移するか？ --%>
<%-- CART：カート一覧画面 CSCART:クロスセルカート画面 その他：画面遷移しない --%>
<asp:HiddenField ID="hfIsRedirectAfterAddProduct" Value="CART" runat="server" />

<%-- お気に入り追加ボタン押下時にどの画面へ遷移するか？ --%>
<%-- true:ポップアップ表示、false:お気に入り一覧ページへ遷移 --%>
<% IsDisplayPopupAddFavorite = true; %>
<div>
<p id="addFavoriteTip" class="toolTip" style="display: none; position: fixed;">
	<span style="margin: 10px;" id="txt-tooltip"></span>
	<a href="<%= WebSanitizer.HtmlEncode(Constants.PATH_ROOT + Constants.PAGE_FRONT_FAVORITE_LIST) %>" class="btn btn-mini btn-inverse">お気に入り一覧</a>
</p>
</div>

<!-- 商品一覧ループ(通常表示) -->
<%-- UPDATE PANEL開始 --%>
<asp:UpdatePanel runat="server">
<ContentTemplate>
<%-- ▽商品一覧ループ(通常表示)▽ --%>
<asp:Repeater DataSource="<%# this.IsDispImageKbnOn ? this.ProductMasterList : null %>" runat="server" Visible="<%# this.IsDispImageKbnOn %>" OnItemCommand="ProductMasterList_ItemCommand">
<HeaderTemplate>
<ul>
</HeaderTemplate>
<ItemTemplate>
<li class="productList">
<ul>
<li>
<ul class="clearFix">
<!-- 商品画像表示 -->
<li class="plPhoto">
<% if(Constants.LAYER_DISPLAY_VARIATION_IMAGES_ENABLED){ %>
<uc:BodyProductVariationImages ImageSize="M" ProductMaster="<%# Container.DataItem %>" VariationList="<%# this.ProductVariationList %>" VariationNo="<%# Container.ItemIndex.ToString() %>" runat="server" />
<% } else { %>
<a href='<%# WebSanitizer.UrlAttrHtmlEncode(CreateProductDetailUrl(Container.DataItem, true)) %>'>
<w2c:ProductImage ImageSize="M" ProductMaster="<%# Container.DataItem %>" IsVariation="false" runat="server" /></a>
<% } %>
<%-- ▽在庫切れ可否▽ --%>
<p visible='<%# ProductListUtility.IsProductSoldOut(Container.DataItem) %>' runat="server" class="soldout">SOLDOUT</p>
<%-- ▽在庫切れ可否▽ --%>
</li>
<li class="plProductInfo">
<ul>
<li class="plName">
<!-- アイコン表示 -->
<p>
<w2c:ProductIcon IconNo="1" ProductMaster="<%# Container.DataItem %>" runat="server" />
<w2c:ProductIcon IconNo="2" ProductMaster="<%# Container.DataItem %>" runat="server" />
<w2c:ProductIcon IconNo="3" ProductMaster="<%# Container.DataItem %>" runat="server" />
<w2c:ProductIcon IconNo="4" ProductMaster="<%# Container.DataItem %>" runat="server" />
<w2c:ProductIcon IconNo="5" ProductMaster="<%# Container.DataItem %>" runat="server" />
<w2c:ProductIcon IconNo="6" ProductMaster="<%# Container.DataItem %>" runat="server" />
<w2c:ProductIcon IconNo="7" ProductMaster="<%# Container.DataItem %>" runat="server" />
<w2c:ProductIcon IconNo="8" ProductMaster="<%# Container.DataItem %>" runat="server" />
<w2c:ProductIcon IconNo="9" ProductMaster="<%# Container.DataItem %>" runat="server" />
<w2c:ProductIcon IconNo="10" ProductMaster="<%# Container.DataItem %>" runat="server" />
</p>
<!-- 商品名表示 -->
<h3><a href='<%# WebSanitizer.UrlAttrHtmlEncode(CreateProductDetailUrl(Container.DataItem, true)) %>'>
<%# WebSanitizer.HtmlEncode(GetProductData(Container.DataItem, "name")) %></a></h3>
<!-- TODO:表示テスト -->
<!-- 商品ID表示 -->
[<span class="productId"><%# WebSanitizer.HtmlEncode(GetProductData(Container.DataItem, "product_id")) %></span>]
</li>
<li class="plExcerpt">
<!-- 概要表示 -->
<%# GetProductDataHtml(Container.DataItem, "outline") %>
</li>
<li>
<asp:Repeater ID="rSetPromotion" DataSource="<%# GetSetPromotionByProduct((DataRowView)Container.DataItem) %>" runat="server">
<ItemTemplate>
<span visible='<%# ((SetPromotionModel)Container.DataItem).Url != "" %>' runat="server">
	<a href="<%# WebSanitizer.HtmlEncode(Constants.PATH_ROOT + ((SetPromotionModel)Container.DataItem).Url) %>"><%# WebSanitizer.HtmlEncode(((SetPromotionModel)Container.DataItem).SetpromotionDispName) %></a><br />
</span>
<span visible='<%# (string)Eval("Url") == "" %>' runat="server">
	<%# WebSanitizer.HtmlEncode(((SetPromotionModel)Container.DataItem).SetpromotionDispName) %><br />
</span>
</ItemTemplate>
</asp:Repeater>
</li>

<li class="plPrice">

<%-- ▽商品会員ランク価格有効▽ --%>
<span visible='<%# GetProductMemberRankPriceValid(Container.DataItem) %>' runat="server">
販売価格:<span class="productPrice"><strike><%#: CurrencyManager.ToPrice(ProductPage.GetProductPriceNumeric(Container.DataItem)) %>（<%# WebSanitizer.HtmlEncode(GetTaxIncludeString(Container.DataItem)) %>）</strike></span><br />
<span>会員ランク価格:<%#: CurrencyManager.ToPrice(ProductPage.GetProductMemberRankPrice(Container.DataItem)) %></span>(<%# WebSanitizer.HtmlEncode(GetTaxIncludeString(Container.DataItem)) %>)
</span>
<%-- △商品会員ランク価格有効△ --%>
<%-- ▽商品セール価格有効▽ --%>
<span visible='<%# GetProductTimeSalesValid(Container.DataItem) %>' runat="server">
販売価格:<span class="productPrice"><strike><%#: CurrencyManager.ToPrice(ProductPage.GetProductPriceNumeric(Container.DataItem)) %>（<%# WebSanitizer.HtmlEncode(GetTaxIncludeString(Container.DataItem)) %>）</strike></span><br />
<span>タイムセールス価格:<%#: CurrencyManager.ToPrice(ProductPage.GetProductTimeSalePriceNumeric(Container.DataItem)) %></span>（<%# WebSanitizer.HtmlEncode(GetTaxIncludeString(Container.DataItem)) %>）
</span>
<%-- △商品セール価格有効△ --%>
<%-- ▽商品特別価格有効▽ --%>
<span visible='<%# GetProductSpecialPriceValid(Container.DataItem) %>' runat="server">
販売価格:<span class="productPrice"><strike><%#: CurrencyManager.ToPrice(ProductPage.GetProductPriceNumeric(Container.DataItem)) %>（<%# WebSanitizer.HtmlEncode(GetTaxIncludeString(Container.DataItem)) %>）</strike></span><br />
<span>特別価格:<%#: CurrencyManager.ToPrice(ProductPage.GetProductSpecialPriceNumeric(Container.DataItem)) %></span>（<%# WebSanitizer.HtmlEncode(GetTaxIncludeString(Container.DataItem)) %>）
</span>
<%-- △商品特別価格有効△ --%>
<%-- ▽商品通常価格有効▽ --%>
<span visible='<%# GetProductNormalPriceValid(Container.DataItem) %>' runat="server">
販売価格:<span class="productPrice"><%#: CurrencyManager.ToPrice(ProductPage.GetProductPriceNumeric(Container.DataItem)) %></span>（<%# WebSanitizer.HtmlEncode(GetTaxIncludeString(Container.DataItem)) %>）
</span>
<%-- △商品通常価格有効△ --%>
<%-- ▽商品加算ポイント▽ --%>
<p visible='<%# (this.IsLoggedIn && (GetProductAddPointString(Container.DataItem) != "")) %>' runat="server">
	<span class="addPoint">ポイント<%# WebSanitizer.HtmlEncode(GetProductAddPointString(Container.DataItem)) %></span><span id="Span1" visible='<%# ((string)GetKeyValue(Container.DataItem, Constants.FIELD_PRODUCT_POINT_KBN1)) != Constants.FLG_PRODUCT_POINT_KBN1_NUM %>' runat="server">(<%# WebSanitizer.HtmlEncode(GetProductAddPointCalculateAfterString(Container.DataItem, false, false))%>)
	</span>
</p>
<%-- △商品加算ポイント△ --%>
<%-- ▽商品定期購入価格▽ --%>
<% if (Constants.FIXEDPURCHASE_OPTION_ENABLED) {%>
<span visible='<%# (GetKeyValue(Container.DataItem, Constants.FIELD_PRODUCT_FIXED_PURCHASE_FLG).ToString() != Constants.FLG_PRODUCT_FIXED_PURCHASE_FLG_INVALID) && ((CheckFixedPurchaseLimitedUserLevel(this.ShopId, (string)GetProductData(Container.DataItem, "product_id")) == false)) %>' runat="server">
	<span visible='<%# IsProductFixedPurchaseFirsttimePriceValid(Container.DataItem) %>' runat="server">
		<br />
		定期初回価格:<%#: CurrencyManager.ToPrice(ProductPage.GetProductFixedPurchaseFirsttimePrice(Container.DataItem)) %>（<%#: GetTaxIncludeString(Container.DataItem) %>）
	</span>
	<br />
	定期通常価格:<%#: CurrencyManager.ToPrice(ProductPage.GetProductFixedPurchasePrice(Container.DataItem)) %>（<%#: GetTaxIncludeString(Container.DataItem) %>）
</span>
<% } %>
<%-- △商品定期購入価格△ --%>
<%-- ▽定期商品加算ポイント▽ --%>
<p visible='<%# (this.IsLoggedIn && (GetProductAddPointString(Container.DataItem) != "") && (GetKeyValue(Container.DataItem, Constants.FIELD_PRODUCT_FIXED_PURCHASE_FLG).ToString() != Constants.FLG_PRODUCT_FIXED_PURCHASE_FLG_INVALID) && ((CheckFixedPurchaseLimitedUserLevel(this.ShopId, (string)GetProductData(Container.DataItem, "product_id")) == false))) %>' runat="server">
	<span class="addPoint">ポイント<%# WebSanitizer.HtmlEncode(GetProductAddPointString(Container.DataItem, false, false, true)) %></span>
	<span visible='<%# ((string)GetKeyValue(Container.DataItem, Constants.FIELD_PRODUCT_POINT_KBN2)) != Constants.FLG_PRODUCT_POINT_KBN1_NUM %>' runat="server">(<%# WebSanitizer.HtmlEncode(GetProductAddPointCalculateAfterString(Container.DataItem, false, false, true))%>)
	</span>
</p>
<%-- △定期商品加算ポイント△ --%>

<%-- ▽商品タグ項目：メーカー▽ --%>
<span visible='<%# StringUtility.ToEmpty(GetKeyValue(Container.DataItem, "tag_manufacturer")) != "" %>' runat="server">
メーカー:<%# WebSanitizer.HtmlEncode(GetKeyValue(Container.DataItem, "tag_manufacturer")) %>
</span>
<%-- △商品タグ項目：メーカー△ --%>

<%-- ▽お気に入りの登録人数表示▽ --%>
<p visible="true" runat="server" class="favoriteRegistration">
お気に入りの登録人数：<%# this.GetFavoriteCount((string)GetKeyValue(Container.DataItem, Constants.FIELD_PRODUCTVARIATION_PRODUCT_ID)) %>人
</p>
<%-- △お気に入りの登録人数表示△ --%>

<%-- ▽お気に入り追加▽ --%>
<asp:LinkButton ID="lbAddFavorite" runat="server"
CommandName="FavoriteAdd" CommandArgument="<%# GetKeyValue(Container.DataItem, Constants.FIELD_PRODUCTVARIATION_PRODUCT_ID) %>" class="btn btn-mini">
	<%# (FavoriteDisplayWord((string) GetKeyValue(Container.DataItem, Constants.FIELD_FAVORITE_SHOP_ID), this.LoginUserId, (string) GetKeyValue(Container.DataItem, Constants.FIELD_FAVORITE_PRODUCT_ID), "")) ? "お気に入り登録済み" : "お気に入りに追加" %>
</asp:LinkButton>

<%-- △お気に入り追加△ --%>
</li>
</ul>
</li>
</ul>
</li>

<%-- ▽バリエーションリストループ▽ --%>
<%if (Constants.PRODUCTLIST_VARIATION_DISPLAY_ENABLED) { %>
<li id="divProductListMultiVariation">
<table>
<tr>
<th>表示名1</th> <%-- 表示名1 --%>
<th>表示名2</th> <%-- 表示名2 --%>
<th>価格</th> <%-- 価格 --%>
<th>&nbsp;</th> <%-- カート投入ボタン・入荷通知メールボタン --%>
</tr>
<asp:Repeater ID="rAddCartVariationList" DataSource="<%# GetProductListVariation((DataRowView)Container.DataItem) %>" onitemcommand="AddCartVariationList_ItemCommand" runat="server">
<HeaderTemplate>
</HeaderTemplate>
<ItemTemplate>
<tr>

<%-- 表示名1 --%>
<td>
<%# WebSanitizer.HtmlEncode(GetKeyValue(Container.DataItem, Constants.FIELD_PRODUCTVARIATION_VARIATION_NAME1)) %>
</td>

<%-- 表示名2 --%>
<td>
<%# WebSanitizer.HtmlEncode(GetKeyValue(Container.DataItem, Constants.FIELD_PRODUCTVARIATION_VARIATION_NAME2)) %>
</td>

<%-- 価格 --%>
<td>
<%-- ▽商品会員ランク価格有効▽ --%>
<div visible='<%# GetProductMemberRankPriceValid(Container.DataItem, true) %>' runat="server">
	<p>
	販売価格:<strike><%#: CurrencyManager.ToPrice(GetProductPriceNumeric(Container.DataItem, true)) %>（<%# WebSanitizer.HtmlEncode(GetKeyValue(Container.DataItem, "TaxIncluded")) %>）</strike>
	</p>
	<p>
	会員ランク価格:<%#: CurrencyManager.ToPrice(GetProductMemberRankPrice(Container.DataItem, true)) %>(<%# WebSanitizer.HtmlEncode(GetKeyValue(Container.DataItem, "TaxIncluded")) %>)
	</p>
</div>
<%-- △商品会員ランク価格有効△ --%>
<%-- ▽商品セール価格有効▽ --%>
<div visible='<%# GetProductTimeSalesValid(Container.DataItem) %>' runat="server">
	<p>
	販売価格:<strike><%#: CurrencyManager.ToPrice(GetProductPriceNumeric(Container.DataItem, true)) %>（<%# WebSanitizer.HtmlEncode(GetKeyValue(Container.DataItem, "TaxIncluded")) %>）</strike>
	</p>
	<p>
	タイムセールス価格:<%#: CurrencyManager.ToPrice(ProductPage.GetProductTimeSalePriceNumeric(Container.DataItem)) %>（<%# WebSanitizer.HtmlEncode(GetKeyValue(Container.DataItem, "TaxIncluded")) %>）
	</p>
</div>
<%-- △商品セール価格有効△ --%>
<%-- ▽商品特別価格有効▽ --%>
<div visible='<%# GetProductSpecialPriceValid(Container.DataItem, true) %>' runat="server">
	<p>
	販売価格:<strike><%#: CurrencyManager.ToPrice(GetProductPriceNumeric(Container.DataItem, true)) %>（<%# WebSanitizer.HtmlEncode(GetKeyValue(Container.DataItem, "TaxIncluded")) %>）</strike>
	</p>
	<p>
特別価格:<%#: CurrencyManager.ToPrice(GetProductSpecialPriceNumeric(Container.DataItem, true)) %></span>（<%# WebSanitizer.HtmlEncode(GetKeyValue(Container.DataItem, "TaxIncluded")) %>）
	</p>
</div>
<%-- △商品特別価格有効△ --%>
<%-- ▽商品通常価格有効▽ --%>
<p visible='<%# GetProductNormalPriceValid(Container.DataItem, true) %>' runat="server">
販売価格:<span class="productPrice"><%#: CurrencyManager.ToPrice(GetProductPriceNumeric(Container.DataItem, true)) %></span>（<%# WebSanitizer.HtmlEncode(GetKeyValue(Container.DataItem, "TaxIncluded")) %>）</p>
<%-- △商品通常価格有効△ --%>
<%-- ▽商品加算ポイント▽ --%>
<p visible='<%# (this.IsLoggedIn && (GetProductAddPointString(Container.DataItem, true, true) != "")) %>' runat="server">
<span class="addPoint">
ポイント：<%# WebSanitizer.HtmlEncode(GetProductAddPointString(Container.DataItem, true, true)) %></span><span visible='<%# ((string)GetKeyValue(Container.DataItem, Constants.FIELD_PRODUCT_POINT_KBN1)) != Constants.FLG_PRODUCT_POINT_KBN1_NUM %>' runat="server">(<%# WebSanitizer.HtmlEncode(GetProductAddPointCalculateAfterString(Container.DataItem, true, true))%>)</span>
</p>
<%-- △商品加算ポイント△ --%>
<%-- ▽商品定期購入価格 --%>
<% if (Constants.FIXEDPURCHASE_OPTION_ENABLED) {%>
<p visible='<%# (GetKeyValue(Container.DataItem, Constants.FIELD_PRODUCT_FIXED_PURCHASE_FLG).ToString() != Constants.FLG_PRODUCT_FIXED_PURCHASE_FLG_INVALID) && ((CheckFixedPurchaseLimitedUserLevel(this.ShopId, (string)GetProductData(Container.DataItem, "product_id")) == false)) %>' runat="server">
	<p visible='<%# IsProductFixedPurchaseFirsttimePriceValid(Container.DataItem, true) %>' runat="server">
		定期初回価格:<%#: CurrencyManager.ToPrice(GetProductFixedPurchaseFirsttimePrice(Container.DataItem, true)) %>（<%#: GetKeyValue(Container.DataItem, "TaxIncluded") %>）
	</p>
	<p>
		定期通常価格:<%#: CurrencyManager.ToPrice(GetProductFixedPurchasePrice(Container.DataItem, true)) %>（<%#: GetKeyValue(Container.DataItem, "TaxIncluded") %>）
	</p>
</p>
<% } %>
<%-- △商品定期購入価格△ --%>
<%-- ▽商品加算ポイント▽ --%>
<p visible='<%# (this.IsLoggedIn && (GetProductAddPointString(Container.DataItem, true, true, true) != "") && (((bool)GetKeyValue(Container.DataItem, "CanFixedPurchase")) && ((CheckFixedPurchaseLimitedUserLevel(this.ShopId, (string)GetProductData(Container.DataItem, "product_id")) == false)))) %>' runat="server">
<span class="addPoint">
ポイント：<%# WebSanitizer.HtmlEncode(GetProductAddPointString(Container.DataItem, true, true, true)) %></span><span visible='<%# ((string)GetKeyValue(Container.DataItem, Constants.FIELD_PRODUCT_POINT_KBN2)) != Constants.FLG_PRODUCT_POINT_KBN2_NUM %>' runat="server">(<%# WebSanitizer.HtmlEncode(GetProductAddPointCalculateAfterString(Container.DataItem, true, true, true))%>)</span>
</p>

<%-- △商品加算ポイント△ --%>
</td>

<td>
<%-- カート投入ボタン --%>
<p class="addCart">
<%-- カートに入れるボタン表示 --%>
<div class="mb5">
<asp:LinkButton ID="lbCartAddVariationList" runat="server" Visible='<%# (bool)GetKeyValue(Container.DataItem, "CanCart") %>' CommandName="CartAdd" class="btn btn-mid btn-inverse">
カートに入れる
</asp:LinkButton>
</div>
<%-- 定期購入ボタン表示 --%>
<div class="mb5">
<asp:LinkButton ID="lbCartAddFixedPurchaseVariationList" runat="server" Visible='<%# (((bool)GetKeyValue(Container.DataItem, "CanFixedPurchase")) && (this.IsUserFixedPurchaseAble)) %>' OnClientClick="return add_cart_check_for_fixedpurchase_variationlist();" CommandName="CartAddFixedPurchase" class="btn btn-mid btn-inverse">
カートに入れる(定期購入)
</asp:LinkButton>
<span runat="server" Visible='<%# ((bool)GetKeyValue(Container.DataItem, "CanFixedPurchase")) && ((string)GetKeyValue(Container.DataItem, Constants.FIELD_PRODUCT_FIXED_PURCHASE_FLG) == Constants.FLG_PRODUCT_FIXED_PURCHASE_FLG_ONLY) && (this.IsUserFixedPurchaseAble == false) %>' style="color: red;">定期購入のご利用はできません</span>
</div>
<%-- ギフト購入ボタン表示 --%>
<div class="mb5">
<asp:LinkButton ID="lbCartAddForGiftVariationList" runat="server" Visible='<%# (bool)GetKeyValue(Container.DataItem, "CanGiftOrder") %>' CommandName="CartAddGift" class="btn btn-mid btn-inverse">
カートに入れる(ギフト購入)
</asp:LinkButton>
</div>
<% if (Constants.VARIATION_FAVORITE_CORRESPONDENCE){ %>
<%-- お気に入りに追加ボタン表示 --%>
<div class="mb5">
<asp:LinkButton ID="lbAddFavoriteVariation" runat="server" CommandName="AddFavorite" class="btn btn-mid">
	<%# (FavoriteDisplayWord(this.ShopId, this.LoginUserId, (string)GetKeyValue(Container.DataItem, Constants.FIELD_FAVORITE_PRODUCT_ID), (string)GetKeyValue(Container.DataItem, Constants.FIELD_FAVORITE_VARIATION_ID))) ? "お気に入り登録済み" : "お気に入りに追加" %>
</asp:LinkButton>
</div>
<% } %>
</p>
					
<%-- 入荷通知メールボタン --%>
<p class="arrivalMailButton">
<%-- 再入荷通知メール申し込みボタン表示 --%>
<div visible='<%# ((string)GetKeyValue(Container.DataItem, "ArrivalMailKbn") == Constants.FLG_USERPRODUCTARRIVALMAIL_ARRIVAL_MAIL_KBN_ARRIVAL) %>' runat="server">
<asp:LinkButton CommandName="SmartArrivalMail" CommandArgument="Arrival" Runat="server" class="btn btn-mid btn-inverse">
入荷お知らせメール申込
</asp:LinkButton>
</div>
<%-- 販売開始通知メール申し込みボタン表示 --%>
<div visible='<%# ((string)GetKeyValue(Container.DataItem, "ArrivalMailKbn") == Constants.FLG_USERPRODUCTARRIVALMAIL_ARRIVAL_MAIL_KBN_RELEASE) %>' runat="server">
<asp:LinkButton CommandName="SmartArrivalMail" CommandArgument="Release" Runat="server" class="btn btn-mid btn-inverse">
販売開始通知メール申込
</asp:LinkButton>
</div>
<%-- 再販売通知メール申し込みボタン表示 --%>
<div visible='<%# ((string)GetKeyValue(Container.DataItem, "ArrivalMailKbn") == Constants.FLG_USERPRODUCTARRIVALMAIL_ARRIVAL_MAIL_KBN_RESALE) %>' runat="server">
<asp:LinkButton CommandName="SmartArrivalMail" CommandArgument="Resale" Runat="server" class="btn btn-mid btn-inverse">
再販売通知メール申込
</asp:LinkButton>
</div>
<%-- エラー表示 --%>
<p class="error"><%# WebSanitizer.HtmlEncode(GetKeyValue(Container.DataItem, "ErrorMessage")) %></p>
</p>	

<p>
<asp:Repeater ID="rSetPromotionByVariation" DataSource="<%# GetSetPromotionByVariation((Dictionary<string, object>)Container.DataItem) %>" runat="server">
<ItemTemplate>
<%# WebSanitizer.HtmlEncode(((SetPromotionModel)Container.DataItem).SetpromotionDispName) %><br />
</ItemTemplate>
</asp:Repeater>
</p>

<%-- 隠しフィールド --%>
<asp:HiddenField ID="hfProductId" Value="<%# GetKeyValue(Container.DataItem, Constants.FIELD_PRODUCTVARIATION_PRODUCT_ID) %>" runat="server" />
<asp:HiddenField ID="hfVariationId" Value="<%# GetKeyValue(Container.DataItem, Constants.FIELD_PRODUCTVARIATION_VARIATION_ID) %>" runat="server" />
<asp:HiddenField ID="hfArrivalMailKbn" Value='<%# GetKeyValue(Container.DataItem, "ArrivalMailKbn") %>' runat="server" />

</td>
</tr>

<%-- 再入荷通知メール登録フォーム表示 --%>
<uc:BodyProductArrivalMailRegisterTr runat="server" ID="ucBpamrArrival" ArrivalMailKbn="<%#: Constants.FLG_USERPRODUCTARRIVALMAIL_ARRIVAL_MAIL_KBN_ARRIVAL %>" ProductId="<%#: GetKeyValue(Container.DataItem, Constants.FIELD_PRODUCT_PRODUCT_ID) %>" VariationId="<%#: GetKeyValue(Container.DataItem, Constants.FIELD_PRODUCTVARIATION_VARIATION_ID) %>" Visible="false" />
<%-- 販売開始通知メール登録フォーム表示 --%>
<uc:BodyProductArrivalMailRegisterTr runat="server" ID="ucBpamrRelease" ArrivalMailKbn="<%#: Constants.FLG_USERPRODUCTARRIVALMAIL_ARRIVAL_MAIL_KBN_RELEASE %>" ProductId="<%#: GetKeyValue(Container.DataItem, Constants.FIELD_PRODUCT_PRODUCT_ID) %>" VariationId="<%#: GetKeyValue(Container.DataItem, Constants.FIELD_PRODUCTVARIATION_VARIATION_ID) %>" Visible="false" />
<%-- 再販売知メール登録フォーム表示 --%>
<uc:BodyProductArrivalMailRegisterTr runat="server" ID="ucBpamrResale" ArrivalMailKbn="<%#: Constants.FLG_USERPRODUCTARRIVALMAIL_ARRIVAL_MAIL_KBN_RESALE %>" ProductId="<%#: GetKeyValue(Container.DataItem, Constants.FIELD_PRODUCT_PRODUCT_ID) %>" VariationId="<%#: GetKeyValue(Container.DataItem, Constants.FIELD_PRODUCTVARIATION_VARIATION_ID) %>" Visible="false" />

</ItemTemplate>
<FooterTemplate>
</FooterTemplate>
</asp:Repeater>
</table>
</li>
<% } %>
<%-- △バリエーションリストループ△ --%>
</ul>
</li>
</ItemTemplate>
<FooterTemplate>
</ul>
</FooterTemplate>
</asp:Repeater>
</ContentTemplate>
</asp:UpdatePanel>
<%-- UPDATE PANELここまで --%>
<%-- △商品一覧ループ(通常表示)△ --%>

</div>


<%-- ▽商品一覧ループ(ウインドウショッピング)▽ --%>
<asp:Repeater DataSource="<%# (this.IsDispImageKbnWindowsShopping) ? this.ProductMasterList : null %>" runat="server" Visible="<%# this.IsDispImageKbnWindowsShopping %>">
<HeaderTemplate>

<div class="bl_allProducts">
<div class="bl_products">
<div class="bl_products_item_unit">
</HeaderTemplate>
<ItemTemplate>

<div class="bl_products_item">

<ul>
<style>
/*   <li class="icon">
  <w2c:ProductIcon IconNo="1" ProductMaster="<%# Container.DataItem %>" runat="server" />
  <w2c:ProductIcon IconNo="2" ProductMaster="<%# Container.DataItem %>" runat="server" />
  <w2c:ProductIcon IconNo="3" ProductMaster="<%# Container.DataItem %>" runat="server" />
  <w2c:ProductIcon IconNo="4" ProductMaster="<%# Container.DataItem %>" runat="server" />
  <w2c:ProductIcon IconNo="5" ProductMaster="<%# Container.DataItem %>" runat="server" />
  <w2c:ProductIcon IconNo="6" ProductMaster="<%# Container.DataItem %>" runat="server" />
  <w2c:ProductIcon IconNo="7" ProductMaster="<%# Container.DataItem %>" runat="server" />
  <w2c:ProductIcon IconNo="8" ProductMaster="<%# Container.DataItem %>" runat="server" />
  <w2c:ProductIcon IconNo="9" ProductMaster="<%# Container.DataItem %>" runat="server" />
  <w2c:ProductIcon IconNo="10" ProductMaster="<%# Container.DataItem %>" runat="server" />
  </li> */
</style>
<li class="thumb">
<% if(Constants.LAYER_DISPLAY_VARIATION_IMAGES_ENABLED
	&& (Constants.SETTING_PRODUCT_LIST_SEARCH_KBN == false)) { %>
<figure class="bl_products_item_img">
  <uc:BodyProductVariationImages ImageSize="LL" ProductMaster="<%# Container.DataItem %>" VariationList="<%# this.ProductVariationList %>" VariationNo="<%# Container.ItemIndex.ToString() %>" runat="server" />
</figure>
<% } else { %>
<a href='<%# WebSanitizer.UrlAttrHtmlEncode(CreateProductDetailUrl(Container.DataItem, true)) %>'>
<% if (Constants.SETTING_PRODUCT_LIST_SEARCH_KBN) { %>
	<figure class="bl_products_item_img">
    <w2c:ProductImage ImageSize="LL" ProductMaster="<%# Container.DataItem %>" IsVariation="false" IsGroupVariation="true" runat="server" />
  </figure>
<% } else { %>
	<figure class="bl_products_item_img">
    <w2c:ProductImage ImageSize="LL" ProductMaster="<%# Container.DataItem %>" IsVariation="false" runat="server" />
  </figure>
<% } %>
</a>
<% } %>
</li>
<li class="bl_products_item_body">
	<style>
  /*   <p class="pid"><%# WebSanitizer.HtmlEncode(GetProductData(Container.DataItem, Constants.FIELD_PRODUCT_PRODUCT_ID)) %></p> */
  </style>
  <span class="bl_products_item_label">
  <w2c:ProductIcon IconNo="1" ProductMaster="<%# Container.DataItem %>" runat="server" />
  <w2c:ProductIcon IconNo="4" ProductMaster="<%# Container.DataItem %>" runat="server" />
  <style>
/*     <w2c:ProductIcon IconNo="2" ProductMaster="<%# Container.DataItem %>" runat="server" />
    <w2c:ProductIcon IconNo="3" ProductMaster="<%# Container.DataItem %>" runat="server" />
    <w2c:ProductIcon IconNo="5" ProductMaster="<%# Container.DataItem %>" runat="server" />
    <w2c:ProductIcon IconNo="6" ProductMaster="<%# Container.DataItem %>" runat="server" />
    <w2c:ProductIcon IconNo="7" ProductMaster="<%# Container.DataItem %>" runat="server" />
    <w2c:ProductIcon IconNo="8" ProductMaster="<%# Container.DataItem %>" runat="server" />
    <w2c:ProductIcon IconNo="9" ProductMaster="<%# Container.DataItem %>" runat="server" />
    <w2c:ProductIcon IconNo="10" ProductMaster="<%# Container.DataItem %>" runat="server" /> */
  </style>
    </span> 
	<h4 class="bl_products_item_ttl">
    <a href='<%# WebSanitizer.UrlAttrHtmlEncode(CreateProductDetailUrl(Container.DataItem, true)) %>'><%# WebSanitizer.HtmlEncode(GetProductData(Container.DataItem, "name")) %></a>
  </h4>
<!-- 商品ID表示 -->
	<p><%#: StringUtility.ToEmpty(ProductPage.GetKeyValueToNull(Container.DataItem, Constants.FIELD_PRODUCTVARIATION_VARIATION_NAME1)) %></p>
</li>
<li class="bl_products_item_price_unit" visible="<%# !ProductListUtility.IsProductSoldOut(Container.DataItem) %>" runat="server">

<style>
/*   <p>
    <%# CurrencyManager.ToPrice(ProductPage.GetKeyValueToNull(
      Container.DataItem,
      Constants.SETTING_PRODUCT_LIST_SEARCH_KBN
        ? Constants.FIELD_PRODUCTVARIATION_PRICE
        : Constants.FIELD_PRODUCT_DISPLAY_PRICE)) %>
    <%# StringUtility.ToEmpty(GetVariationPriceTax(Container.DataItem)) %>
  </p> */
</style>

<%-- ▽商品会員ランク価格有効▽ --%>
<p visible='<%# GetProductMemberRankPriceValid(Container.DataItem, Constants.SETTING_PRODUCT_LIST_SEARCH_KBN) %>' runat="server">
<span style="text-decoration: line-through"><%#: CurrencyManager.ToPrice(ProductPage.GetProductPriceNumeric(Container.DataItem, Constants.SETTING_PRODUCT_LIST_SEARCH_KBN)) %>（<%# WebSanitizer.HtmlEncode(GetTaxIncludeString(Container.DataItem)) %>）</span><br />
<span style="color: #f00;"><%#: CurrencyManager.ToPrice(ProductPage.GetProductMemberRankPrice(Container.DataItem, Constants.SETTING_PRODUCT_LIST_SEARCH_KBN)) %>（<%# WebSanitizer.HtmlEncode(GetTaxIncludeString(Container.DataItem)) %>）</span>
</p>

<%-- ▽商品セール価格有効▽ --%>
<p visible='<%# GetProductTimeSalesValid(Container.DataItem, Constants.SETTING_PRODUCT_LIST_SEARCH_KBN) %>' runat="server" class="bl_products_item_price">
	<span style="text-decoration: line-through"><%#: CurrencyManager.ToPrice(ProductPage.GetProductPriceNumeric(Container.DataItem, Constants.SETTING_PRODUCT_LIST_SEARCH_KBN)) %>（<%# WebSanitizer.HtmlEncode(GetTaxIncludeString(Container.DataItem)) %>）</span><br />
	<span style="color: #f00;"><%#: CurrencyManager.ToPrice(ProductPage.GetProductTimeSalePriceNumeric(Container.DataItem)) %>（<%# WebSanitizer.HtmlEncode(GetTaxIncludeString(Container.DataItem)) %>）</span>
</p>

<%-- ▽商品特別価格有効▽ --%>
<p visible='<%# GetProductSpecialPriceValid(Container.DataItem, Constants.SETTING_PRODUCT_LIST_SEARCH_KBN) %>' runat="server" class="bl_products_item_price">
<span style="text-decoration: line-through"><%#: CurrencyManager.ToPrice(ProductPage.GetProductPriceNumeric(Container.DataItem, Constants.SETTING_PRODUCT_LIST_SEARCH_KBN)) %>（<%# WebSanitizer.HtmlEncode(GetTaxIncludeString(Container.DataItem)) %>）</span><br />
<span style="color: #f00;"><%#: CurrencyManager.ToPrice(ProductPage.GetProductSpecialPriceNumeric(Container.DataItem, Constants.SETTING_PRODUCT_LIST_SEARCH_KBN)) %>（<%# WebSanitizer.HtmlEncode(GetTaxIncludeString(Container.DataItem)) %>）</span>
</p>

<%-- ▽商品通常価格有効▽ --%>
<p visible='<%# GetProductNormalPriceValid(Container.DataItem, Constants.SETTING_PRODUCT_LIST_SEARCH_KBN) %>' runat="server" class="bl_products_item_price">
<%#: CurrencyManager.ToPrice(ProductPage.GetProductPriceNumeric(Container.DataItem, Constants.SETTING_PRODUCT_LIST_SEARCH_KBN)) %>（<%# WebSanitizer.HtmlEncode(GetTaxIncludeString(Container.DataItem)) %>）
</p>
<%-- ▽定期購入価格有効▽ --%>
<% if (Constants.FIXEDPURCHASE_OPTION_ENABLED) {%>
<p visible='<%# (GetKeyValue(Container.DataItem, Constants.FIELD_PRODUCT_FIXED_PURCHASE_FLG).ToString() != Constants.FLG_PRODUCT_FIXED_PURCHASE_FLG_INVALID) && (CheckFixedPurchaseLimitedUserLevel(this.ShopId, (string)GetProductData(Container.DataItem, "product_id")) == false) %>' runat="server">
	<p visible='<%# IsProductFixedPurchaseFirsttimePriceValid(Container.DataItem, Constants.SETTING_PRODUCT_LIST_SEARCH_KBN) %>' runat="server" class="bl_products_item_price">
		定期初回:<%#: CurrencyManager.ToPrice(ProductPage.GetProductFixedPurchaseFirsttimePrice(Container.DataItem, Constants.SETTING_PRODUCT_LIST_SEARCH_KBN)) %>（<%#: GetTaxIncludeString(Container.DataItem) %>）
	</p>
	<p class="bl_products_item_price">
		定期通常:<%#: CurrencyManager.ToPrice(ProductPage.GetProductFixedPurchasePrice(Container.DataItem, Constants.SETTING_PRODUCT_LIST_SEARCH_KBN)) %>（<%#: GetTaxIncludeString(Container.DataItem) %>）
	</p>
</p>
<% } %>
</li>
<li>
  <span visible='<%# ProductListUtility.IsProductSoldOut(Container.DataItem) %>' runat="server" class="bl_products_item_price bl_products_item_price__theme_soldout bl_soldoutLabel soldout">SOLDOUT</span>
</li>

<%-- ▽お気に入りの登録人数表示▽ --%>
<style>
/*   <li class="favorite" runat="server">
  お気に入りの登録人数：<%# this.GetFavoriteCount((string)GetKeyValue(Container.DataItem, Constants.FIELD_PRODUCTVARIATION_PRODUCT_ID)) %>人
  </li> */
</style>
<%-- △お気に入りの登録人数表示△ --%>
<style>
  /*
  <a class="link_product_detail" href="<%# WebSanitizer.UrlAttrHtmlEncode(CreateProductDetailUrl(Container.DataItem, true)) %>">▶ 詳細ページへ</a>
  */
</style>
</ul>
</div>
</ItemTemplate>
<FooterTemplate>
</div>
</div>
</div>
</FooterTemplate>
</asp:Repeater>
<%-- △商品一覧ループ(ウインドウショッピング)△ --%>
		
<!--▽ ページャ ▽-->
<div id="pagination" class="below clearFix">
  <%# this.PagerHtml %>
  </div>
<!--△ ページャ △-->

<div visible="<%# (this.ProductMasterList.Count == 0) %>" runat="server" class="noProduct">
<!--▽ 商品が1つもなかった場合のエラー文言 ▽-->
<%# WebSanitizer.HtmlEncode(this.AlertMessage) %>
<!--△ 商品が1つもなかった場合のエラー文言 △-->
</div><!-- (this.ProductMasterList.Count != 0) -->

<%-- ▽最近チェックした商品▽ --%>
<style>
/*   <uc:BodyProductHistory runat="server" /> */
</style>
<%-- △最近チェックした商品△ --%>

</div>
<%-- △編集可能領域△ --%>
<div id="divBottomArea">
<%-- ▽レイアウト領域：ボトムエリア▽ --%>
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
	lProductRecommendByRecommendEngineUserControls[0].RecommendCode = "pc211";
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
<%-- △編集可能領域△ --%>
}
</script>

<script type="text/javascript">
<!--
	// バリエーション選択チェック(定期)
	function add_cart_check_for_fixedpurchase_variationlist() {
		return confirm('定期的に商品が送られてくる「定期購入」で購入します。\nよろしいですか？');
	}

	// 入荷通知登録画面をポップアップウィンドウで開く
	function show_arrival_mail_popup(pid, vid, amkbn) {
		show_popup_window('<%= this.SecurePageProtocolAndHost %><%= Constants.PATH_ROOT %><%= Constants.PAGE_FRONT_USER_PRODUCT_ARRIVAL_MAIL_REGIST %>?<%= Constants.REQUEST_KEY_PRODUCT_ID %>=' + pid + '&<%= Constants.REQUEST_KEY_VARIATION_ID %>=' + vid + '&<%= Constants.REQUEST_KEY_USERPRODUCTARRIVALMAIL_ARRIVAL_MAIL_KBN %>=' + amkbn, 520, 310, true, true, 'Information');
	}

	// マウスイベントの初期化
	addOnload(function () { init(); });
//-->
</script>

<%-- CRITEOタグ（引数：商品一覧情報） --%>
<uc:Criteo ID="criteo" runat="server" Datas="<%# this.ProductMasterList %>" />

</asp:Content>
