<%--
=========================================================================================================
  Module      : 新着情報出力コントローラ(BodyNews.ascx)
 ･･･････････････････････････････････････････････････････････････････････････････････････････････････････
  Copyright   : Copyright W2 Co.,Ltd. 2009 All Rights Reserved.
=========================================================================================================
--%>
<%@ Import Namespace = "w2.Domain.News" %>
<%@ control language="C#" autoeventwireup="true" inherits="Form_Common_BodyNews, App_Web_parts060news_999.ascx.b22d4bc" %>
<%--

下記のタグはファイル情報保持用です。削除しないでください。
タイトルタグはカスタムパーツのみ利用します。
<%@ Page Title="新着情報(デモ)" %>
<%@ FileInfo LastChanged="ｗ２ユーザー" %>

--%>
<%-- ▽編集可能領域：コンテンツ▽ --%>
<% if (rTopNewsList.DataSource != null) { %>
<div class="section_information"><!-- section_information Start -->
		<div class="information_box inner_960 pd_100">
		<div id="breadcrumb" class="breadcrumb_cstm">
			<ul>
				<li><a href="https://mybalance.jp/">TOP</a></li>
				<span>-</span>
				<li>お知らせ一覧</li>
			</ul>
		</div>
			<div class="h1_blc">
				<h1>NEWS</h1>
				<span class="h1_sub">お知らせ一覧</span>
			</div>
			<ul class="news">
				<%-- ▽新着情報ループ▽ --%>
				<asp:Repeater ID="rTopNewsList" runat="server" ItemType="w2.Domain.News.NewsModel">
				<ItemTemplate>
				<li>
					<p class="date"><%#: DateTimeUtility.ToStringFromRegion(Item.DisplayDateFrom, DateTimeUtility.FormatType.ShortDate2Letter) %></p>
					<%# Item.GetNewsTextHtml() %>
				</li>
				</ItemTemplate>
				</asp:Repeater>
				<%-- △新着情報ループ△ --%>
			</ul>
		</div>
</div>
<% } %>
<script>
	document.addEventListener("DOMContentLoaded", function() {
    const listItems = document.querySelectorAll(".news li");
    listItems.forEach((item, index) => {
        const number = String(index + 1).padStart(2, '0'); // 01, 02, 03...の形式にする
        item.id = `article${number}`;
    });
	});
</script>
<script>
	document.addEventListener("DOMContentLoaded", function() {
    const dateElements = document.querySelectorAll(".news .date");
    
    dateElements.forEach((dateElement) => {
        // テキストの内容を取得し、/を.に置換
        const updatedDate = dateElement.textContent.replace(/\//g, '.');
        // 置換後のテキストを設定
        dateElement.textContent = updatedDate;
    });
	});
</script>
<style>
/* section_information
--------------------------------------------------------------------*/
.h1_blc {
  text-align: center;
  margin-bottom: 40px;
}
@media screen and (max-width: 768px) {
	.h1_blc {
		margin: 40px 0;
	}
}
.h1_blc h1 {
  font-size: 28px;
  color: #5893b2;
}
.h1_blc .h1_sub {
  font-size: 12px;
}
.news {
	border-top: 1px solid #dbdbdb;
}
.news li {
	padding: 40px 0;
	border-bottom: 1px solid #dbdbdb;
}
@media screen and (max-width: 768px) {
	.news li {
		line-height: 1.5;
	}
}
.news li .date {
	min-width: 100px;
	color: #5893b2;
	font-size: 13px;
	margin-bottom: 20px;
}
.news li .main_text {
	width: 100%;
}
.news li .main_text h2 {
	font-size: 16px;
	font-weight: 600;
	margin-bottom: 30px;
}
.news li .main_text p {
	font-size: 13px;
}

</style>

<%-- △編集可能領域△ --%>