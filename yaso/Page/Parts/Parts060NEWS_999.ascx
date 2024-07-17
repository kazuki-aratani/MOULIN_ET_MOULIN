<%--
=========================================================================================================
  Module      : 新着情報出力コントローラ(BodyNews.ascx)
 ･･･････････････････････････････････････････････････････････････････････････････････････････････････････
  Copyright   : Copyright w2solution Co.,Ltd. 2009 All Rights Reserved.
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
<div class="section_information bl_news"><!-- section_information Start -->
  <div class="bl_news_cont">
    <div class="bl_news_head">
      <h2 class="bl_news_ttl">INFORMATION</h2>
      <span class="bl_news_subTtl">お知らせ</span>
    </div>
    <ul class="bl_news_body">
      <%-- ▽新着情報ループ▽ --%>
      <asp:Repeater ID="rTopNewsList" runat="server" ItemType="w2.Domain.News.NewsModel">
      <ItemTemplate>
      <li>
      <span class="bl_news_date"><%#: DateTimeUtility.ToStringFromRegion(Item.DisplayDateFrom, DateTimeUtility.FormatType.ShortDate2Letter) %></span>
      <p><%# Item.GetNewsTextHtml() %></p>
      </li>
      </ItemTemplate>
      </asp:Repeater>
      <%-- △新着情報ループ△ --%>
    </ul>
  </div>
  <!-- <a href="" class="bl_news_more">READ MORE <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/new_theme/rightarrow.png" class="bl_news_more_arrow" alt=""></a> -->
</div>
<% } %>
<script type="text/javascript">
	$(function () {
		$('.section_information .info_btn').click(function () {
			if ($(this).hasClass('selected')) {
				$(this).removeClass('selected');
				$(this).parents('.section_information').find('.news > li:nth-child(n+2)').slideUp('fast');
				$(this).parents('.section_information').find('.viewall_btn').hide();
			} else {
				$(this).addClass('selected');
				$(this).parents('.section_information').find('.news > li:nth-child(n+2)').slideDown('fast');
				$(this).parents('.section_information').find('.viewall_btn').show();
			}
		});
		var n = $('.section_brandnews ul li').length;
		$('.section_brandnews ul li:gt(3)').hide();
		var Num = 4; $('.section_brandnews .more_btn a').click(function () {
			Num += 4; $('.section_brandnews ul li:lt(' + Num + ')').slideDown();
			return false;
		})
	});
    </script>
<style>
/* section_information
--------------------------------------------------------------------*/

.section_information {
	height:24px;
	position:relative;
}
.section_information .information_fixed {
	width:978px;
	background:#eeeeee;
	position:absolute;
	top:0;
	left:0;
	z-index:51;
}
.section_information .information_box {
	width:978px;
	margin:0 auto;
	position:relative;
}
.section_information ul li {
	/* padding:5px 100px 5px 0; */
	/* line-height:1.2em; */
	/* font-weight:bold; */
}
.section_information .date {
	/* width:80px; */
	/* color:#888888; */
	/* font-size:10px; */
	/* font-weight:bold; */
	display:block;
}
.section_information .info_btn {
	width:28px;
	height:14px;
	letter-spacing:1px;
	margin-right:1px;
	padding-right:12px;
	font-size:10px;
	font-weight:bold;
	font-family: 'Poppins',NotoSans, "游ゴシック", "Yu Gothic", YuGothic, "Hiragino Kaku Gothic ProN", "Hiragino Kaku Gothic Pro", "メイリオ", Meiryo, "ＭＳ ゴシック", sans-serif;
	display:block;
	position:absolute;
	top:7px;
	right:0px;
	cursor:pointer;
}
.section_information .info_btn:before {
	content:"";
	width:5px;
	height:5px;
	border-top:1px solid #000;
	border-right:1px solid #000;
	position:absolute;
	top:2px;
	right:0px;
	transform:rotate(135deg);
	-webkit-transform: rotate(135deg);
}
.section_information .info_btn.selected:before {
	content:"";
	width:5px;
	height:5px;
	border-top:1px solid #000;
	border-right:1px solid #000;
	position:absolute;
	top:5px;
	right:0px;
	transform:rotate(-45deg);
	-webkit-transform: rotate(-45deg);
}
.section_information .info_moreBtnArea {
	font-family:'Poppins',NotoSans, "游ゴシック", "Yu Gothic", YuGothic, "Hiragino Kaku Gothic ProN", "Hiragino Kaku Gothic Pro", "メイリオ", Meiryo, "ＭＳ ゴシック", sans-serif;
	text-align:right;
	letter-spacing:1px;
	padding-right:0;
}
.section_information .info_moreBtn {
	display:inline-block;
	font-size:16px;
	font-weight:bold;
	padding-right:12px;
	position:relative;
}
.section_information .info_moreBtn:after {
	content:"";
	width:6px;
	height:6px;
	border-top:1px solid #000;
	border-right:1px solid #000;
	position:absolute;
	top:5px;
	right:0px;
	transform:rotate(45deg);
	-webkit-transform:rotate(45deg);
}
.news > li {
	border-bottom:1px solid #ccc;
}
.news > li:last-child {
	border-bottom:none;
}
.news > li:nth-child(n+2) {
	display: none;
}
.news ul li {
	list-style-type: disc;
	list-style-position:inside;
}
.news ol li {
	list-style-type: decimal;
	list-style-position:inside;
}
.news h1 {
	font-size: 200%;
}
.news h2 {
	font-size: 150%;
}
.news h3 {
	font-size: 116%;
}
.news h5 {
	font-size: 83%;
}
.news h6 {
	font-size: 75%;
}
</style>

<%-- △編集可能領域△ --%>