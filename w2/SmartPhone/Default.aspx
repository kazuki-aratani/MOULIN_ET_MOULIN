<%--
=========================================================================================================
  Module      : トップ画面(Default.aspx)
 ･･･････････････････････････････････････････････････････････････････････････････････････････････････････
  Copyright   : Copyright W2 Co.,Ltd. 2011 All Rights Reserved.
=========================================================================================================
--%>
<%-- ▽ユーザーコントロール宣言領域▽ --%>
<%@ Register TagPrefix="uc" TagName="Parts000TMPL_999" Src="~/SmartPhone/Page/Parts//Parts000TMPL_999.ascx" %>
<%@ Register TagPrefix="uc" TagName="Parts900FAT_999" Src="~/SmartPhone/Page/Parts//Parts900FAT_999.ascx" %>
<%-- △ユーザーコントロール宣言領域△ --%>
<%@ Register TagPrefix="uc" TagName="BodyProductRecommendAdvanced" Src="~/SmartPhone/Form/Common/Product/BodyProductRecommendAdvanced.ascx" %>
<%@ Register TagPrefix="uc" TagName="BodyProductSearchBox" Src="~/SmartPhone/Form/Common/Product/BodyProductSearchBox.ascx" %>
<%@ Register TagPrefix="uc" TagName="BodyProductRanking" Src="~/SmartPhone/Form/Common/Product/BodyProductRanking.ascx" %>
<%@ Register TagPrefix="uc" TagName="BodyProductHistory" Src="~/SmartPhone/Form/Common/Product/BodyProductHistory.ascx" %>
<%@ Register TagPrefix="uc" TagName="BodyNews" Src="~/SmartPhone/Form/Common/BodyNews.ascx" %>
<%@ Register TagPrefix="uc" TagName="Criteo" Src="~/Form/Common/Criteo.ascx" %>
<%@ Register TagPrefix="uc" TagName="BodyCoordinateListForTop" Src="~/SmartPhone/Form/Common/Coordinate/BodyCoordinateListForTop.ascx" %>
<%@ Register TagPrefix="uc" TagName="BodyFeaturePageList" Src="~/SmartPhone/Form/Common/FeaturePage/BodyFeaturePageList.ascx" %>
<%@ page language="C#" masterpagefile="~/SmartPhone/Form/Common/DefaultPage.master" autoeventwireup="true" inherits="Default, App_Web_default.aspx.df7cd90b" title="ｗ２ショッピングデモサイト トップページ" %>

<%--

下記は保持用のダミー情報です。削除しないでください。
<%@ FileInfo LayoutName="Default" %><%@ FileInfo LastChanged="ｗ２ユーザー" %>

--%>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
	<span style="color: #fff"><%# this.BrandId %></span>

<main>
    <section id="fv">
      <div class="fv_blc">
        <h1>MyBALANCE</h1>
        <img class="fv_img un_tab" src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/sp_top_fv.jpg" alt="MyBALANCE">
        <div class="ov_tab">
          <div class="blc_bnr">
            <a href=""><img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/bnr_skincheck.jpg" alt="スキンチェックから"></a>
            <a href=""><img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/bnr_buy.jpg" alt="商品のご購入はこちら"></a>
          </div>
        </div>
        <div class="un_tab">
          <div class="blc_bnr">
            <a href=""><img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/sp_bnr_skincheck.jpg" alt="スキンチェックから"></a>
            <a href=""><img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/sp_bnr_buy.jpg" alt="商品のご購入はこちら"></a>
          </div>
        </div>
      </div>
    </section>
    <div class="gdt_bg pd_120">
      <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/bg_gradation_point01.png" alt="" class="gdt_point01">
      <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/bg_gradation_point02.png" alt="" class="gdt_point02">
      <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/bg_gradation_bottom.png" alt="" class="gdt_bottom ov_tab">
      <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/sp_bg_gradation_bottom.png" alt="" class="gdt_bottom un_tab">
      <div class="inner_960">
        <div class="gdt_flex">
          <section id="concept">
            <div class="concept_blc">
              <h2 class="side_word">CONCEPT</h2>
              <div class="h2_blc">
                <h2>CONCEPT</h2>
                <p class="h2_sub"><span>肌</span>が<span>整</span>うと、<span>毎日</span>が<span>楽</span>しい</p>
              </div>
              <p class="text">
                ひとは皆それぞれが持つバランスを保つことで、<br>
                毎日を楽しく過ごしています。<br>
                私たちは、肌本来の美しさを保つスキンケアで、<br>
                あなたの肌のマイバランスをサポートします。
              </p>
              <div class="img_blc">
                <img class="" src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/top_concept_01.jpg" alt="">
              </div>
              <div class="bottom_blc">
                <h3>自分の肌を信じよう</h3>
                <div class="text">
                  肌には自ら美しさを保つ力があります。<br>
                  自分の肌状態を知り、自分に合った正しいスキンケアをすることで、肌はしっかり応えてくれます。<br>
                  なりたいキレイを叶えると、自信が芽生え、心も前向きになります。<br>
                  <span></span>さあ、自分の肌を信じよう。
                </div>
                <div class="img_blc">
                  <img class="" src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/top_thought_01.jpg" alt="">
                </div>
              </div>

            </div>
          </section>
          <section id="thought">
            <div class="thought_blc">
              <h2 class="side_word">THOUGHT</h2>
              <div class="left">
                <div class="h2_blc">
                  <h2>THOUGHT</h2>
                  <p class="h2_sub">一人ひとりの肌に寄り添う</p>
                </div>
                <p class="text">
                  私たちは、一人ひとりの「キレイ」と向き合う中で、バリア機能が低下した“ゆらぎ肌”の方が多いことが分かりました。<br>
                  一人ひとり異なるゆらぎ肌の原因を見つめ直す提案で、あなたのなりたい肌に寄り添います。
                </p>
              </div>
            </div>
          </section>
          <section id="suggestion">
            <div class="suggestion_blc">
              <div class="h2_blc">
                <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/top_mb_h2.png" alt="MyBALANCE">
                <h2>マイバランスができる<span>3</span>つの提案</h2>
              </div>
              <div class="contents_flex">
                <div class="left">
                  <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/top_mb_figure.png" alt="">
                </div>
                <div class="right">
                  <div class="text_blc">
                    <div class="ttl"><span class="num">01</span>自分の肌状態を知る</div>
                    <p class="text">スキンチェックによって、皮膚科学の専門家が、あなたの肌状態を科学的に分析します。<br>まずはスキンチェックで自分の肌状態を知りましょう！</p>
                    <a href="" class="gdt_btn">
                      <div class="left_blc"><img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/gdt_btn_free.png" alt="無料"></div>
                      <div class="right_blc">
                        <span>SKIN CHECK</span>
                        スキンチェックの<br>お申し込みはこちら
                      </div>
                    </a>
                  </div>
                  <div class="text_blc">
                    <div class="ttl"><span class="num">02</span>自分の肌に合った化粧品を知る</div>
                    <p class="text">スキンチェックの結果から、あなたの肌状態に合ったマイバランスのアイテムをご提案します。</p>
                  </div>
                  <div class="text_blc">
                    <div class="ttl"><span class="num">03</span>正しいお手入れ方法を知る</div>
                    <p class="text">アイテムを効果的にお使いいただくための、あなたの肌状態に合ったお手入れ方法をご提案。</p>
                  </div>
                </div>
              </div>
            </div>
          </section>
        </div>
      </div>
    </div>
    <section id="fullImg">
      <div class="fullImg_blc"><img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/sp_top_fullImg.jpg" alt=""></div>
    </section>
    <section id="lineup">
      <div class="lineup_wrp inner_960 pd_120">
        <div class="lineup_blc">
          <div class="h2_blc">
            <h2>LINE UP</h2>
          </div>
          <p class="lineup_text gen">マイバランスはお客さま一人ひとりの肌状態に合った商品をお使いいただくため、<br>
            <span>スキンチェック（肌分析）を<br>お申込みいただいた方に</span>販売しております。
          </p>
          <a href="" class="gdt_btn">
            <div class="left_blc"><img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/gdt_btn_free.png" alt="無料"></div>
            <div class="right_blc">
              <span>SKIN CHECK</span>
              スキンチェックの<br>お申し込みはこちら
            </div>
          </a>
        </div>
        <div class="teiki_blc">
          <div class="ttl">定期お届けコースがお得！</div>
          <p class="ttl_sub">マイバランスはデイリーケアとして<br>正しいお手入れを継続的に<br>行っていただくことで、<br>なりたい肌に近づけると考えています。<br>まずはお得な定期お届けコースから<br>始めてみませんか？</p>
          <ul class="teiki_cont">
            <li class="teiki_cont_item">
              <span class="num">01</span>
              <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/top_course_01.svg" alt="">
              <p class="text">通常価格から<br><span class="marker">33%OFF</span></p>
            </li>
            <li class="teiki_cont_item">
              <span class="num">02</span>
              <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/top_course_02.svg" alt="">
              <p class="text">デイリーケアセットを<br>6回ご購入ごとに、<br><span class="small">スキンチェックが無料</span></p>
            </li>
            <li class="teiki_cont_item">
              <span class="num">03</span>
              <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/top_course_03.svg" alt="">
              <p class="text">購入回数に関わらず、<br><span>いつでも解約OK</span></p>
            </li>
            <li class="teiki_cont_item">
              <span class="num">04</span>
              <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/top_course_04.svg" alt="">
              <p class="text">配達日・セット内容<br><span>変更OK</span></p>
            </li>
          </ul>
          <div class="about">
            <p class="left">定期お届けコースとは</p>
            <p class="right">毎月1回定期的にお選びになった<br>デイリーケアセットが届くシステムです。<br><span>※商品は基本の使用量で約1か月分となっております。</span></p>
          </div>
        </div>
        <div class="setItem_blc product_blc">
          <div class="h2_blc">
            <h2>SET ITEM<span class="h2_sub">定期お届けコース用セット</span></h2>
          </div>
          <p class="setItem_blc_text">スキンチェックの結果より、あなたの肌状態に合ったスキンケアセットをお選びください！</p>
          <ul class="product_grid">
            <li class="product_grid_item">
              <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/product_teiki_n.jpg" alt="">
              <div class="product_name_blc">
                <p class="product_name gen" style="height: 40px;">マイバランス デイリーケア N</p>
                <span class="product_name_en">My BALANCE Daily Care N</span>
              </div>
              <div class="skin_type_blc"><span class="oil">オイリー肌</span><span class="normal">ノーマル肌</span></div>
              <p class="set_item">セット内容：<br>クレンジング/ウォッシング N/リクイド N</p>
              <div class="teiki_price_blc">
                <p class="teiki_price">単品合計価格 <span class="cross">7,500円<span class="tax">(税込)</span></span></p>
                <p class="teiki_sale_price">→ 5,000円(税込 5,500円)</p>
              </div>
              <a href="" class="product_btn">DETAIL MORE</a>
            </li>
            <li class="product_grid_item">
              <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/product_teiki_nd.jpg" alt="">
              <div class="product_name_blc">
                <p class="product_name gen">マイバランス デイリーケア ND</p>
                <span class="product_name_en">My BALANCE Daily Care ND</span>
              </div>
              <div class="skin_type_blc"><span class="normal">ノーマル肌</span><span class="oildry">オイリードライ肌</span></div>
              <p class="set_item">セット内容：<br>クレンジング/ウォッシング N/リクイド D</p>
              <div class="teiki_price_blc">
                <p class="teiki_price">単品合計価格 <span class="cross">7,500円<span class="tax">(税込)</span></span></p>
                <p class="teiki_sale_price">→ 5,000円(税込 5,500円)</p>
              </div>
              <a href="" class="product_btn">DETAIL MORE</a>
            </li>
            <li class="product_grid_item">
              <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/product_teiki_d.jpg" alt="">
              <div class="product_name_blc">
                <p class="product_name gen">マイバランス デイリーケア D</p>
                <span class="product_name_en">My BALANCE Daily Care D</span>
              </div>
              <div class="skin_type_blc"><span class="oildry">オイリードライ肌</span><span class="dry">ドライ肌</span></div>
              <p class="set_item">セット内容：<br>クレンジング/ウォッシング D/リクイド D</p>
              <div class="teiki_price_blc">
                <p class="teiki_price">単品合計価格 <span class="cross">7,500円<span class="tax">(税込)</span></span></p>
                <p class="teiki_sale_price">→ 5,000円(税込 5,500円)</p>
              </div>
              <a href="" class="product_btn">DETAIL MORE</a>
            </li>
          </ul>
        </div>
        <div class="singleItem_blc product_blc">
          <div class="h2_blc">
            <h2>SINGLE ITEM<span class="h2_sub">単品商品</span></h2>
          </div>
          <ul class="product_grid">
            <li class="product_grid_item">
              <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/product_cleansing.jpg" alt="">
              <div class="product_name_blc">
                <p class="product_name gen">マイバランス デイリーケア N</p>
                <span class="product_name_en">My BALANCE Daily Care N</span>
              </div>
              <p class="normal_price">75g/2,250円<span>(税込 2,475円)</span></p>
              <a href="" class="product_btn">DETAIL MORE</a>
            </li>
            <li class="product_grid_item">
              <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/product_washing_n.jpg" alt="">
              <div class="product_name_blc">
                <p class="product_name gen">マイバランス ウォッシング N</p>
                <span class="product_name_en">My BALANCE Washing N</span>
              </div>
              <p class="normal_price">90g/2,250円<span>(税込 2,475円)</span></p>
              <a href="" class="product_btn">DETAIL MORE</a>
            </li>
            <li class="product_grid_item">
              <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/product_washing_d.jpg" alt="">
              <div class="product_name_blc">
                <p class="product_name gen">マイバランス ウォッシング D</p>
                <span class="product_name_en">My BALANCE Washing D</span>
              </div>
              <p class="normal_price">90g/2,250円<span>(税込 2,475円)</span></p>
              <a href="" class="product_btn">DETAIL MORE</a>
            </li>
            <li class="product_grid_item">
              <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/product_liquid_n.jpg" alt="">
              <div class="product_name_blc">
                <p class="product_name gen">マイバランス リクイド N</p>
                <span class="product_name_en">My BALANCE Liquid N</span>
              </div>
              <p class="normal_price">100mL/3,000円<span>(税込 3,300円)</span></p>
              <a href="" class="product_btn">DETAIL MORE</a>
            </li>
            <li class="product_grid_item">
              <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/product_liquid_d.jpg" alt="">
              <div class="product_name_blc">
                <p class="product_name gen">マイバランス リクイド D</p>
                <span class="product_name_en">My BALANCE Liquid D</span>
              </div>
              <p class="normal_price">100mL/3,000円<span>(税込 3,300円)</span></p>
              <a href="" class="product_btn">DETAIL MORE</a>
            </li>
            <li class="product_grid_item">
              <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/product_skincheck.jpg" alt="">
              <div class="product_name_blc">
                <p class="product_name gen">スキンチェック（肌分析）</p>
                <span class="product_name_en">SKIN CHECK</span>
              </div>
              <p class="normal_price">1,500円<span>(税込 1,650円)</span></p>
              <a href="" class="product_btn">DETAIL MORE</a>
            </li>
          </ul>
        </div>
      </div>
    </section>
    <section id="service">
      <div class="service_blc">
        <div class="inner_840 pd_120">
            <div class="h2_blc">
              <h2>SERVICE</h2>
            </div>
            <p class="service_text gen">
              スキンチェックを受けていただいた方は、<br>
              お客さまご相談窓口や<br>
              オンラインカウンセリングにて、<br>
              お肌のお悩みや正しいお手入れ方法を<br>
              ご相談できます。
            </p>
            <div class="service_cont">
              <div class="left">
                <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/sp_top_service_01.jpg" class="" alt="">
                <p class="ttl"><span class="num">01</span>お客さまご相談窓口</p>
                <p class="text">商品やサービスのご不明点など「教えて！マイバランスパートナー」または「お問い合わせフォーム」から気軽にお問い合わせいただけます。</p>
              </div>
              <div class="right">
                <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/sp_top_service_02.jpg" class="" alt="">
                <p class="ttl"><span class="num">02</span>オンラインカウンセリング</p>
                <p class="text">肌の悩みなど、より専門的な肌に関するご質問をお受けします。ご予約は、お客さまご相談窓口までお問い合わせください。</p>
              </div>
            </div>
            <div class="service_btn_blc">
              <div class="service_btn_flex">
                <a href="" class="service_btn">お問い合わせフォーム</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <section id="skinCheck">
      <div class="skinCheck_blc">
        <div class="inner_960 pd_100">
          <div class="skinCheck_cont">
            <div class="left">
              <h2>SKIN CHECK</h2>
              <p class="text">マイバランスをはじめる</p>
              <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/top_bottom_area_logo.png" alt="" class="logo">
              <img class="left_img un_tab" src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/top_bottom_area_img.png" alt="">
              <a href="" class="skinCheck_btn"><span><img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/skinCheck_btn_free.png" class="" alt="無料"></span>スキンチェックから始める</a>
            </div>
            <div class="right ov_tab">
              <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/top_bottom_area_img.png" alt="">
            </div>
          </div>
        </div>
      </div>
    </section>
  </main>

<%-- CRITEOタグ --%>
<uc:Criteo ID="criteo" runat="server" Datas="<%# null %>" />
</asp:Content>