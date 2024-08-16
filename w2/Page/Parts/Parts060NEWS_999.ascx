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
			<div class="h1_blc">
				<h1>NEWS</h1>
				<span class="h1_sub">お知らせ一覧</span>
			</div>
			<ul class="news">
				<%-- ▽新着情報ループ▽ --%>
				<asp:Repeater ID="rTopNewsList" runat="server" ItemType="w2.Domain.News.NewsModel">
				<ItemTemplate>
				<li>
					<a href="">
						<p class="date"><%#: DateTimeUtility.ToStringFromRegion(Item.DisplayDateFrom, DateTimeUtility.FormatType.ShortDate2Letter) %></p>
						<%# Item.GetNewsTextHtml() %>
					</a>
				</li>
				</ItemTemplate>
				</asp:Repeater>
				<%-- △新着情報ループ△ --%>
			</ul>
			<a href="https://mybalance.jp/Page/news.aspx" class="service_btn">お知らせをもっと見る</a>
		</div>
</div>
<% } %>
<script>
	document.addEventListener("DOMContentLoaded", function() {
    const links = document.querySelectorAll(".news li a");
    links.forEach((link, index) => {
        const number = String(index + 1).padStart(2, '0'); // 01, 02, 03...の形式にする
        link.href = `https://mybalance.jp/Page/news.aspx#article${number}`;
    });
	});
</script>
<script>
	document.addEventListener("DOMContentLoaded", function() {
    const listItems = document.querySelectorAll(".news li");
    
    // 3つまで表示し、それ以外は非表示にする
    listItems.forEach((item, index) => {
        if (index >= 3) {
            item.style.display = "none";
        }
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
.service_btn {
	margin: 0 auto;
}
.section_information {
	background-color: #e7f0f3;
}
.h1_blc {
  text-align: center;
  margin-bottom: 60px;
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
	margin-bottom: 80px;
}
@media screen and (max-width: 768px) {
	.news h2 {
		font-size: 16px;
		line-height: 1.5;
	}
}
.news li {
	position: relative;
}
.news li:after {
	content: "";
  display: block;
  position: absolute;
  top: 50%;
  right: 15px;
  width: 8px;
  height: 8px;
  border-top: 1px solid #5893b2;
  border-right: 1px solid #5893b2;
  transform: translateY(-50%) rotate(45deg);
}
.news li a {
	display: flex;
	column-gap: 20px;
	padding: 20px 0;
	border-bottom: 1px solid #dbdbdb;
}
@media screen and (max-width: 768px) {
	.news li a {
		flex-direction: column;
		row-gap: 20px;
	}
}
.news li .date {
	min-width: 100px;
}
.news li .main_text {
	width: 100%;
	overflow: hidden;
  display: -webkit-box;
  text-overflow: ellipsis;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 2;
	padding-right: 50px;
}
.news li .main_text p {
	display: none;
}

</style>

<%-- △編集可能領域△ --%>