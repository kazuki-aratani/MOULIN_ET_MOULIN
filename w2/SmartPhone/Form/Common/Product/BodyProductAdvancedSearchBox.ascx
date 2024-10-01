<%--
=========================================================================================================
  Module      : スマートフォン用商品詳細検索コントローラ(BodyProductAdvancedSearchBox.ascx)
 ･･･････････････････････････････････････････････････････････････････････････････････････････････････････
  Copyright   : Copyright W2 Co.,Ltd. 2011 All Rights Reserved.
=========================================================================================================
--%>
<%@ control language="C#" autoeventwireup="true" inherits="Form_Common_Product_BodyProductAdvancedSearchBox, App_Web_bodyproductadvancedsearchbox.ascx.1b7f36c0" %>
<%@ Import Namespace="ProductListDispSetting" %>
<%--

下記のタグはファイル情報保持用です。削除しないでください。
<%@ FileInfo LastChanged="ｗ２ユーザー" %>

--%>
<%-- ▽編集可能領域：コンテンツ▽ --%>
<div id="dvProductAdvancedSearch" runat="server">
<table>
<tbody>


<% if (this.DisplayStockFilter) { %>
	<asp:Repeater ID="rStockList" runat="server">
		<HeaderTemplate>
			<tr>
			<th>在庫</th>
			<td>
			<%-- 在庫有無 --%>
			<ul class="horizon">
		</HeaderTemplate>
		<ItemTemplate>
			<li>
				<input id="udns<%# ((ProductListDispSettingModel)Container.DataItem).SettingId %>" name="udns" type="radio" value="<%# ((ProductListDispSettingModel)Container.DataItem).SettingId %>" <%#: (((StringUtility.ToEmpty(Request["udns"]) == "") && (((ProductListDispSettingModel)Container.DataItem).SettingId == "0")) || StringUtility.ToEmpty(Request["udns"]) == ((ProductListDispSettingModel)Container.DataItem).SettingId) ? "checked" : "" %> />
				<label for="udns<%# ((ProductListDispSettingModel)Container.DataItem).SettingId %>"><%#: ((ProductListDispSettingModel)Container.DataItem).SettingName %></label>
			</li>
		</ItemTemplate>
		<FooterTemplate>
		</ul>
		</td>
		</tr>
		</FooterTemplate>
	</asp:Repeater>
<% } %>
<tr class="none">
	<th>カラー</th>
	<td class="sort-category">
		<asp:DropDownList ID="ddlColors" runat="server" Style="display:none;"></asp:DropDownList>
		<asp:Repeater runat="server" ID="rColors" DataSource="<%# ProductColorUtility.GetProductColorList() %>" ItemType="w2.App.Common.Product.ProductColor">
			<HeaderTemplate><div class="categoryList" style="display: inline-block;"></HeaderTemplate>
			<ItemTemplate>
				<img ID="<%#: "iColor" + Item.Id %>" name="iColor" data-color='<%#: Item.Id %>' src='<%#: Item.Url %>' width="35" height="35" Style="padding: 4px 4px 4px 4px;" />
			</ItemTemplate>
			<FooterTemplate></div></FooterTemplate>
		</asp:Repeater>
	</td>
</tr>

<% if (this.DisplaySubscriptionBoxFilter) {%>
	<tr>
		<th>頒布会検索</th>
		<td class="sort-word">
			<w2c:ExtendedTextBox ID="tbSubscriptionBoxSearchWord" type="search" runat="server" MaxLength="250" placeholder="キーワード"></w2c:ExtendedTextBox>
		</td>
	</tr>
<% } %>

<%-- For option brand enabled --%>
<% if (this.DisplayBrandFilter) { %>
<tr>
	<th>ブランド</th>
	<td>
		<ul>
			<asp:HiddenField ID="hfBrandId" Value="" runat="server" />
			<asp:Repeater ID="rBrandList" runat="server">
				<ItemTemplate>
				<li>
					<input id="<%#: ((DataRowView)Container.DataItem)[Constants.FIELD_PRODUCTBRAND_BRAND_ID] %>" name="iBrand" type="radio"
						value="<%#: ((DataRowView)Container.DataItem)[Constants.FIELD_PRODUCTBRAND_BRAND_ID] %>" />
					<label for="<%#: ((DataRowView)Container.DataItem)[Constants.FIELD_PRODUCTBRAND_BRAND_ID] %>">
						<%#: ((DataRowView)Container.DataItem)[Constants.FIELD_PRODUCTBRAND_BRAND_NAME] %></label>
				</li>
				</ItemTemplate>
			</asp:Repeater>
		</ul>
	</td>
</tr>
<% } %>

<style>
	#dropbtn {
		cursor: pointer;
		border: 1px solid #565655;
		border-radius: 5px;
		padding: 10px 5px 10px 15px;
		font-size: 14px;
		font-weight: 500;
	}
	#dropbtn:after {
		display: inline-block;
    content: "";
    background-image: url(https://mybalance.jp/Contents/ImagesPkg/mybalance/arrow_down.svg);
    background-repeat: no-repeat;
    width: 11px;
    height: 7px;
    margin-left: 15px;
	}
	.dropdown {
			position: relative;
			display: inline-block;
			
	}
	.dropdown-content {
			display: none;
			position: absolute;
			background-color: #f9f9f9;
			min-width: 220px;
			box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
			z-index: 1;
			border-radius: 5px;
	}
	.dropdown-content li {
			padding: 15px 16px;
			cursor: pointer;
			list-style: none;
			font-size: 14px;
			font-weight: 500;
	}
	.dropdown-content li:first-of-type {
			border-radius: 5px 5px 0 0;
	}
	.dropdown-content li:last-of-type {
			border-radius: 0 0 5px 5px;
	}
	.dropdown-content li:hover {
			background-color: #e7f0f3;
	}
	.dropdown-content.show {
			display: block;
	}
</style>
<tr>
	<th class="dropdown">
			<div id="dropbtn" onclick="toggleDropdown()">すべて表示</div>
			<div class="dropdown-content" id="dropdownContent">
					<ul class="horizon">
							<li onclick="filterResults('0', 'すべて表示')">すべて表示</li>
							<li onclick="filterResults('1', '通常購入可能')">通常購入可能</li>
							<li onclick="filterResults('2', '定期購入可能')">定期購入可能</li>
					</ul>
			</div>
	</th>
</tr>

</tbody>
</table>
</div>

<script>
	function toggleDropdown() {
			document.getElementById("dropdownContent").classList.toggle("show");
	}

	function filterResults(value, text) {
			document.getElementById("dropbtn").innerText = text;
			localStorage.setItem('selectedOptionText', text);
			localStorage.setItem('selectedOptionValue', value);
			sessionStorage.setItem('filterApplied', 'true');

			// Simulate form submission with the selected value
			var form = document.createElement('form');
			form.method = 'POST';
			form.action = ''; // Specify your form action here

			var input = document.createElement('input');
			input.type = 'hidden';
			input.name = 'fpfl';
			input.value = value;
			form.appendChild(input);

			document.body.appendChild(form);
			form.submit();
	}

	window.onload = function() {
        // 外部からのURLに含まれる 'fpfl' パラメーターを取得
        var urlParams = new URLSearchParams(window.location.search);
        var fpfl = urlParams.get('fpfl');
        
        // fpfl パラメーターが存在する場合、その値に応じてドロップダウンの表示を変更
        if (fpfl !== null) {
            var selectedOptionText = '';
            switch(fpfl) {
                case '0':
                    selectedOptionText = 'すべて表示';
                    break;
                case '1':
                    selectedOptionText = '通常購入可能';
                    break;
                case '2':
                    selectedOptionText = '定期購入可能';
                    break;
                default:
                    selectedOptionText = 'すべて表示'; // デフォルト値
            }
            document.getElementById("dropbtn").innerText = selectedOptionText;
            localStorage.setItem('selectedOptionText', selectedOptionText);
            localStorage.setItem('selectedOptionValue', fpfl);
        } else {
            // fpfl が存在しない場合、通常の処理
            var filterApplied = sessionStorage.getItem('filterApplied');
            if (filterApplied === 'true') {
                var selectedOptionText = localStorage.getItem('selectedOptionText');
                if (selectedOptionText) {
                    document.getElementById("dropbtn").innerText = selectedOptionText;
                }
            } else {
                document.getElementById("dropbtn").innerText = "すべて表示";
                localStorage.setItem('selectedOptionText', "すべて表示");
                localStorage.setItem('selectedOptionValue', '0');
            }
        }
        sessionStorage.removeItem('filterApplied');
    };


	// Close the dropdown if the user clicks outside of it
	window.onclick = function(event) {
			if (!event.target.matches('#dropbtn')) {
					var dropdowns = document.getElementsByClassName("dropdown-content");
					for (var i = 0; i < dropdowns.length; i++) {
							var openDropdown = dropdowns[i];
							if (openDropdown.classList.contains('show')) {
									openDropdown.classList.remove('show');
							}
					}
			}
	}
</script>

<script>
	var requestColor = "<%# this.ProductColorId %>";
	$("[name=iColor]").each(function (i) {
		e = $("#" + $("[name=iColor]")[i].id);
		if ($("[name=iColor]")[i].getAttribute("data-color") == requestColor) {
			e.css('outline', 'thin solid #000000');
		}
		e.on('click', function (elem) {
			var data = elem.target.getAttribute("data-color");
			var ddl = $("#<%# ddlColors.ClientID %>");
			if (data != ddl.val()) {
				ddl.val(data);
				$(this).css('outline', 'thin solid #000000');
			} else {
				ddl.val("");
				$(this).css('outline', '');
			}
			$("[name=iColor]").each(function (i) {
				var e2 = $("#" + $("[name=iColor]")[i].id);
				if ($("[name=iColor]")[i].getAttribute("data-color") != data) {
					e2.css('outline', '');
				}
			});
		});
	});

	// For option search brand enabled
	<% if (HasControlAndOptionBrandEnabled) { %>
	$("[name=iBrand]").each(function (index, element) {
		// Event click for each input radio buttons and set value for hidden field brand id
		$("#" + element.id).click(function () {
			var valueChoose = $("#" + element.id).val();
			$("#" + "<%= this.WhfBandId.ClientID %>").val(valueChoose);
		});

		// Set attribute checked for input type radio buttons
		if ($("#" + element.id).val() == $("#" + "<%= this.WhfBandId.ClientID %>").val()) {
			$("#" + element.id).prop("checked", true);
		} else {
			$("#" + element.id).removeAttr("checked", false);
		}
	});
	<% } %>
</script>

<script>
    function filterResults(value, text) {
    document.getElementById("dropbtn").innerText = text;
    localStorage.setItem('selectedOptionText', text);
    localStorage.setItem('selectedOptionValue', value);
    sessionStorage.setItem('filterApplied', 'true');

    // 現在のURLから特定のパラメーターを削除
    var url = new URL(window.location.href);
    url.searchParams.delete('udns');
    url.searchParams.delete('fpfl');
    url.searchParams.delete('sfl');
    
    // 新しいパラメーターを追加
    url.searchParams.set('fpfl', value);
    
    // ページをリロードして新しいURLに移動
    window.location.href = url.href;
}

</script>
<%-- △編集可能領域△ --%>
