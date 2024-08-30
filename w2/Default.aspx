<%--
=========================================================================================================
  Module      : トップ画面(Default.aspx)
 ･･･････････････････････････････････････････････････････････････････････････････････････････････････････
  Copyright   : Copyright W2 Co.,Ltd. 2009 All Rights Reserved.
=========================================================================================================
--%>
<%-- ▽ユーザーコントロール宣言領域▽ --%>
<%@ Register TagPrefix="uc" TagName="Parts000TMPL_999" Src="~/Page/Parts//Parts000TMPL_999.ascx" %>
<%@ Register TagPrefix="uc" TagName="Parts060NEWS_999" Src="~/Page/Parts//Parts060NEWS_999.ascx" %>
<%@ Register TagPrefix="uc" TagName="Parts900FAT_999" Src="~/Page/Parts//Parts900FAT_999.ascx" %>
<%@ Register TagPrefix="uc" TagName="BodyProductRanking" Src="~/Form/Common/Product/BodyProductRanking.ascx" %>
<%@ Register TagPrefix="uc" TagName="BodyProductHistory" Src="~/Form/Common/Product/BodyProductHistory.ascx" %>
<%@ Register TagPrefix="uc" TagName="BodyCoordinateList" Src="~/Form/Common/Coordinate/BodyCoordinateList.ascx" %>
<%@ Register TagPrefix="uc" TagName="BodyFeaturePageList" Src="~/Form/Common/FeaturePage/BodyFeaturePageList.ascx" %>
<%@ Register TagPrefix="uc" TagName="BodyProductRecommendAdvanced" Src="~/Form/Common/Product/BodyProductRecommendAdvanced.ascx" %>
<%@ Register TagPrefix="uc" TagName="BodySubscriptionBoxList" Src="~/Form/Common/BodySubscriptionBoxList.ascx" %>
<%-- △ユーザーコントロール宣言領域△ --%>
<%@ Register TagPrefix="uc" TagName="Criteo" Src="~/Form/Common/Criteo.ascx" %>
<%@ page language="C#" masterpagefile="~/Form/Common/DefaultPage.master" autoeventwireup="true" inherits="Default, App_Web_default.aspx.cdcab7d2" title="MyBALANCE" %>
<%--

下記は保持用のダミー情報です。削除しないでください。
<%@ FileInfo LayoutName="NoSide" %><%@ FileInfo LastChanged="ｗ２ユーザー" %>

--%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  <%-- ▽編集可能領域：HEAD追加部分▽ --%> <% if
  (Constants.MOBILEOPTION_ENABLED){%>
  <link rel="Alternate" media="handheld" href="<%= GetMobileUrl() %>" />
  <% } %> <%= this.BrandAdditionalDsignTag %> <%-- △編集可能領域△ --%>
</asp:Content>

<asp:Content
  ID="Content2"
  ContentPlaceHolderID="ContentPlaceHolder1"
  Runat="Server"
>
  <span style="color: #fff"><%# this.BrandId %></span>
  <style>
    img {
      display: block;
      width: auto;
      height: auto;
    }
    #Wrap {
      width: auto;
      padding-top: initial;
    }
    #Contents {
      margin: 0;
    }
  </style>
  <%-- ▽レイアウト領域：トップエリア▽ --%> 
  
  <main>
    <section id="fv">
      <div class="fv_blc">
        <h1>MyBALANCE</h1>
        <img class="fv_img un_tab" src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/sp_top_fv.jpg" alt="MyBALANCE">
        <div class="ov_tab">
          <div class="blc_bnr">
            <a href="https://mybalance.jp/Landing/Formlp/new_lp.aspx"><img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/bnr_skincheck.jpg" alt="スキンチェックから"></a>
            <a href="https://mybalance.jp/Form/Product/ProductList.aspx"><img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/bnr_buy.jpg" alt="商品のご購入はこちら"></a>
          </div>
        </div>
        <div class="un_tab">
          <div class="blc_bnr">
            <a href="https://mybalance.jp/Landing/Formlp/new_lp.aspx"><img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/sp_bnr_skincheck.jpg" alt="スキンチェックから"></a>
            <a href="https://mybalance.jp/Form/Product/ProductList.aspx"><img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/sp_bnr_buy.jpg" alt="商品のご購入はこちら"></a>
          </div>
        </div>
      </div>
    </section>
    <div class="gdt_bg pd_120">
      <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/bg_gradation_point01.png" alt="緑丸" class="gdt_point01">
      <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/bg_gradation_point02.png" alt="緑丸" class="gdt_point02">
      <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/bg_gradation_bottom.png" alt="緑丸" class="gdt_bottom ov_tab">
      <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/sp_bg_gradation_bottom.png" alt="緑丸" class="gdt_bottom un_tab">
      <div class="inner_960">
        <div class="gdt_flex">
          <section id="concept">
            <div class="concept_blc">
              <div class="h2_blc">
                <h2 class="un_tab">CONCEPT</h2>
                <p class="h2_sub"><span>肌</span>が<span>整</span>うと、<span>毎日</span>が<span>楽</span>しい</p>
              </div>
              <p class="text">
                ひとは皆それぞれが持つバランスを保つことで、毎日を楽しく過ごしています。<br>
                私たちは、肌本来の美しさを保つスキンケアで、あなたの肌のマイバランスをサポートします。
              </p>
              <div class="concept_img_blc">
                <h2 class="side_word">CONCEPT</h2>
                <div class="img_blc">
                  <img class="" src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/top_concept_01.jpg" alt="コンセプト画像01">
                </div>
                <div class="concept_blc_flex bottom_blc">
                  <div class="right">
                    <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/top_concept_02.jpg" alt="コンセプト画像02">
                  </div>
                  <div class="left">
                    <div class="h2_blc">
                      <p class="h2_sub">自分の肌を信じよう</p>
                    </div>
                    <p class="text">
                      肌には自ら美しさを保つ力があります。<br>
                      自分の肌状態を知り、自分に合った正しいスキンケアをすることで、<br>
                      肌はしっかり応えてくれます。<br>
                      なりたいキレイを叶えると、自信が芽生え、心も前向きになります。<br>
                      <span></span>さあ、自分の肌を信じよう。
                    </p>
                  </div>
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
                  私たちは、一人ひとりの「キレイ」と向き合う中で、<br>
                  バリア機能が低下した“ゆらぎ肌”の方が多いことが分かりました。<br>
                  一人ひとり異なるゆらぎ肌の原因を見つめ直す提案で、<br>
                  あなたのなりたい肌に寄り添います。
                </p>
              </div>
              <div class="right">
                <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/top_thought_01.jpg" alt="THOHGHT画像01">
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
                  <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/top_mb_figure.png" alt="なりたい肌へ">
                </div>
                <div class="right">
                  <div class="text_blc">
                    <div class="ttl"><span class="num">01</span>自分の肌状態を知る</div>
                    <p class="text">スキンチェックによって、皮膚科学の専門家が、あなたの肌状態を科学的に分析します。<br>まずはスキンチェックで自分の肌状態を知りましょう！</p>
                    <a href="https://mybalance.jp/Landing/Formlp/new_lp.aspx" class="gdt_btn">
                      <div class="left_blc"><img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/gdt_btn_free.png" alt="無料"></div>
                      <div class="right_blc">
                        <span>SKIN CHECK</span>
                        スキンチェックのお申し込みはこちら
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
      <div class="fullImg_blc ov_tab"><img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/top_fullImg.jpg" alt="フルイメージ画像"></div>
      <div class="fullImg_blc un_tab"><img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/sp_top_fullImg.jpg" alt="フルイメージ画像"></div>
    </section>
    <section id="lineup">
      <div class="lineup_wrp inner_960 pd_120">
        <div class="lineup_blc">
          <div class="h2_blc">
            <h2>LINE UP</h2>
          </div>
          <p class="lineup_text gen">マイバランスはお客さま一人ひとりの肌状態に合った商品をお使いいただくため、<br>
            <span>スキンチェック（肌分析）をお申込みいただいた方</span>に販売しております。
          </p>
          <a href="https://mybalance.jp/Landing/Formlp/new_lp.aspx" class="gdt_btn">
            <div class="left_blc"><img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/gdt_btn_free.png" alt="無料"></div>
            <div class="right_blc">
              <span>SKIN CHECK</span>
              スキンチェックのお申し込みはこちら
            </div>
          </a>
        </div>
        <div class="teiki_blc">
          <div class="ttl">定期お届けコースがお得！</div>
          <p class="ttl_sub">マイバランスはデイリーケアとして正しいお手入れを継続的に行っていただくことで、なりたい肌に近づけると考えています。<br>まずはお得な定期お届けコースから始めてみませんか？</p>
          <ul class="teiki_cont">
            <li class="teiki_cont_item">
              <span class="num">01</span>
              <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/top_course_01.svg" alt="定期お届けアイコン01">
              <p class="text">通常価格から<br><span class="marker">33%OFF</span></p>
            </li>
            <li class="teiki_cont_item">
              <span class="num">02</span>
              <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/top_course_02.svg" alt="定期お届けアイコン02">
              <p class="text">デイリーケアセットを<br>6回ご購入ごとに、<br><span>スキンチェックが無料</span></p>
            </li>
            <li class="teiki_cont_item">
              <span class="num">03</span>
              <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/top_course_03.svg" alt="定期お届けアイコン03">
              <p class="text">購入回数に関わらず、<br><span>いつでも解約OK</span></p>
            </li>
            <li class="teiki_cont_item">
              <span class="num">04</span>
              <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/top_course_04.svg" alt="定期お届けアイコン04">
              <p class="text">配達日・セット内容<br><span>変更OK</span></p>
            </li>
          </ul>
          <div class="about">
            <p class="left">定期お届けコースとは</p>
            <p class="right">毎月1回定期的にお選びになったデイリーケアセットが届くシステムです。<br><span>※商品は基本の使用量で約1か月分となっております。</span></p>
          </div>
        </div>
        <div class="setItem_blc product_blc">
          <div class="h2_blc">
            <h2>SET ITEM<span class="h2_sub">定期お届けコース用セット</span></h2>
          </div>
          <p class="setItem_blc_text">スキンチェックの結果より、あなたの肌状態に合ったデイリーケアセットをお選びください！</p>
          <ul class="product_grid">
            <li class="product_grid_item">
              <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/product_teiki_n.jpg" alt="マイバランス デイリーケア N">
              <div class="product_name_blc">
                <p class="product_name gen">マイバランス デイリーケア N</p>
                <span class="product_name_en">My BALANCE Daily Care N</span>
              </div>
              <div class="skin_type_blc"><span class="oil">オイリー肌</span><span class="normal">ノーマル肌</span></div>
              <p class="set_item">セット内容：<br>クレンジング/ウォッシング N/リクイド N</p>
              <div class="teiki_price_blc">
                <p class="teiki_price">通常価格 <span>7,500円</span></p>
                <p class="teiki_sale_price">→ 5,000円（税込 5,500円）</p>
              </div>
              <a href="https://mybalance.jp/Form/Product/ProductDetail.aspx?shop=0&pid=MB110" class="product_btn">DETAIL MORE</a>
            </li>
            <li class="product_grid_item">
              <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/product_teiki_nd.jpg" alt="マイバランス デイリーケア ND">
              <div class="product_name_blc">
                <p class="product_name gen">マイバランス デイリーケア ND</p>
                <span class="product_name_en">My BALANCE Daily Care ND</span>
              </div>
              <div class="skin_type_blc"><span class="normal">ノーマル肌</span><span class="oildry">オイリードライ肌</span></div>
              <p class="set_item">セット内容：<br>クレンジング/ウォッシング N/リクイド D</p>
              <div class="teiki_price_blc">
                <p class="teiki_price">通常価格 <span>7,500円</span></p>
                <p class="teiki_sale_price">→ 5,000円（税込 5,500円）</p>
              </div>
              <a href="https://mybalance.jp/Form/Product/ProductDetail.aspx?shop=0&pid=MB110" class="product_btn">DETAIL MORE</a>
            </li>
            <li class="product_grid_item">
              <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/product_teiki_d.jpg" alt="マイバランス デイリーケア D">
              <div class="product_name_blc">
                <p class="product_name gen">マイバランス デイリーケア D</p>
                <span class="product_name_en">My BALANCE Daily Care D</span>
              </div>
              <div class="skin_type_blc"><span class="oildry">オイリードライ肌</span><span class="dry">ドライ肌</span></div>
              <p class="set_item">セット内容：<br>クレンジング/ウォッシング D/リクイド D</p>
              <div class="teiki_price_blc">
                <p class="teiki_price">通常価格 <span>7,500円</span></p>
                <p class="teiki_sale_price">→ 5,000円（税込 5,500円）</p>
              </div>
              <a href="https://mybalance.jp/Form/Product/ProductDetail.aspx?shop=0&pid=MB110" class="product_btn">DETAIL MORE</a>
            </li>
          </ul>
        </div>
        <div class="singleItem_blc product_blc">
          <div class="h2_blc">
            <h2>SINGLE ITEM<span class="h2_sub">単品商品</span></h2>
          </div>
          <ul class="product_grid">
            <li class="product_grid_item">
              <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/product_cleansing.jpg" alt="マイバランス クレンジング">
              <div class="product_name_blc">
                <p class="product_name gen">マイバランス クレンジング</p>
                <span class="product_name_en">My BALANCE Cleansing</span>
              </div>
              <p class="normal_price">75g / 2,250円<span>（税込 2,475円）</span></p>
              <a href="https://mybalance.jp/Form/Product/ProductDetail.aspx?shop=0&pid=MB10060012" class="product_btn">DETAIL MORE</a>
            </li>
            <li class="product_grid_item">
              <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/product_washing_n.jpg" alt="マイバランス ウォッシング N">
              <div class="product_name_blc">
                <p class="product_name gen">マイバランス ウォッシング N</p>
                <span class="product_name_en">My BALANCE Washing N</span>
              </div>
              <p class="normal_price">90g / 2,250円<span>（税込 2,475円）</span></p>
              <a href="https://mybalance.jp/Form/Product/ProductDetail.aspx?shop=0&pid=MB10160029" class="product_btn">DETAIL MORE</a>
            </li>
            <li class="product_grid_item">
              <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/product_washing_d.jpg" alt="マイバランス ウォッシング D">
              <div class="product_name_blc">
                <p class="product_name gen">マイバランス ウォッシング D</p>
                <span class="product_name_en">My BALANCE Washing D</span>
              </div>
              <p class="normal_price">90g / 2,250円<span>（税込 2,475円）</span></p>
              <a href="https://mybalance.jp/Form/Product/ProductDetail.aspx?shop=0&pid=MB10260036" class="product_btn">DETAIL MORE</a>
            </li>
            <li class="product_grid_item">
              <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/product_liquid_n.jpg" alt="マイバランス リクイド N">
              <div class="product_name_blc">
                <p class="product_name gen">マイバランス リクイド N</p>
                <span class="product_name_en">My BALANCE Liquid N</span>
              </div>
              <p class="normal_price">100mL / 3,000円<span>（税込 3,300円）</span></p>
              <a href="https://mybalance.jp/Form/Product/ProductDetail.aspx?shop=0&pid=MB10360043" class="product_btn">DETAIL MORE</a>
            </li>
            <li class="product_grid_item">
              <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/product_liquid_d.jpg" alt="マイバランス リクイド D">
              <div class="product_name_blc">
                <p class="product_name gen">マイバランス リクイド D</p>
                <span class="product_name_en">My BALANCE Liquid D</span>
              </div>
              <p class="normal_price">100mL / 3,000円<span>（税込 3,300円）</span></p>
              <a href="https://mybalance.jp/Form/Product/ProductDetail.aspx?shop=0&pid=MB10460050" class="product_btn">DETAIL MORE</a>
            </li>
            <li class="product_grid_item">
              <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/product_skincheck.jpg" alt="スキンチェック（肌分析）">
              <div class="product_name_blc">
                <p class="product_name gen">スキンチェック（肌分析）</p>
                <span class="product_name_en">SKIN CHECK</span>
              </div>
              <p class="normal_price">1,500円<span>（税込 1,650円）</span></p>
              <a href="https://mybalance.jp/Landing/Formlp/new_lp.aspx" class="product_btn">DETAIL MORE</a>
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
              スキンチェックを受けていただいた方は、お客さまご相談窓口やオンラインカウンセリングにて、<br>
              お肌のお悩みや正しいお手入れ方法をご相談できます。
            </p>
            <div class="service_cont">
              <div class="left">
                <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/top_service_01.jpg" class="ov_tab" alt="サービスイメージ画像01">
                <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/sp_top_service_01.jpg" class="un_tab" alt="サービスイメージ画像01">
                <p class="ttl"><span class="num">01</span>お客さまご相談窓口</p>
                <p class="text">商品やサービスのご不明点など「教えて！マイバランスパートナー」または「お問い合わせフォーム」から気軽にお問い合わせいただけます。</p>
              </div>
              <div class="right">
                <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/top_service_02.jpg" class="ov_tab" alt="サービスイメージ画像02">
                <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/sp_top_service_02.jpg" class="un_tab" alt="サービスイメージ画像02">
                <p class="ttl"><span class="num">02</span>オンラインカウンセリング</p>
                <p class="text">肌の悩みなど、より専門的な肌に関するご質問をお受けします。ご予約は、お客さまご相談窓口までお問い合わせください。</p>
              </div>
            </div>
            <div class="service_btn_blc">
                <a href="<%= WebSanitizer.HtmlEncode(this.UnsecurePageProtocolAndHost + Constants.PATH_ROOT) %>/Form/Inquiry/InquiryInput.aspx" class="service_btn">お問い合わせはこちらから</a>
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
              <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/top_bottom_area_logo.png" alt="MyBALANCE" class="logo">
              <img class="left_img un_tab" src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/top_bottom_area_img.png" alt="">
              <a href="https://mybalance.jp/Landing/Formlp/new_lp.aspx" class="skinCheck_btn"><span><img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/skinCheck_btn_free.png" class="" alt="無料"></span>スキンチェックから始める</a>
            </div>
            <div class="right ov_tab">
              <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/top_bottom_area_img.png" alt="スキンチェックイメージ画像">
            </div>
          </div>
        </div>
      </div>
    </section>
    <section>
      <uc:Parts060NEWS_999 runat="server" />
    </section>
  </main>

  
  <%-- △レイアウト領域△ --%>

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
    	lProductRecommendByRecommendEngineUserControls[0].RecommendCode = "pc111";
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

    // 2つ目の商品レコメンド
    if (lProductRecommendByRecommendEngineUserControls.Count > 1)
    {
    	// レコメンドコードを設定します
    	lProductRecommendByRecommendEngineUserControls[1].RecommendCode = "pc112";
    	// レコメンドタイトルを設定します
    	lProductRecommendByRecommendEngineUserControls[1].RecommendTitle = "おすすめ商品一覧";
    	// 商品最大表示件数を設定します
    	lProductRecommendByRecommendEngineUserControls[1].MaxDispCount = 5;
    	// レコメンド対象にするカテゴリIDを設定します（複数選択時はカンマ区切りで指定）
    	lProductRecommendByRecommendEngineUserControls[1].DispCategoryId = "";
    	// レコメンド非対象にするカテゴリIDを設定します（複数選択時はカンマ区切りで指定）
    	lProductRecommendByRecommendEngineUserControls[1].NotDispCategoryId = "";
    	// レコメンド非対象にするアイテムIDを設定します（複数選択時はカンマ区切りで指定）
    	lProductRecommendByRecommendEngineUserControls[1].NotDispRecommendProductId = "";
    }

    // 1つ目のカテゴリレコメンド
    if (lCategoryRecommendByRecommendEngineUserControls.Count > 0)
    {
        //レコメンドコードを設定します
        lCategoryRecommendByRecommendEngineUserControls[0].RecommendCode = "p005";
        //アイテムコードを設定します
        //特定のカテゴリに対する行動履歴から、おすすめカテゴリを取得したい場合に設定します。
        //「"C"+カテゴリID」の形式で記述してください。【記述例】C001
        lCategoryRecommendByRecommendEngineUserControls[0].ItemCode = "";
        //表示区分を設定します (0:該当カテゴリのみ表示/1:パンくずリスト表示)
        lCategoryRecommendByRecommendEngineUserControls[0].DispKbn = "1";
        //商品最大表示件数を設定します
        lCategoryRecommendByRecommendEngineUserControls[0].MaxDispCount = 5;
    }
    <%-- △編集可能領域△ --%>
    }
  </script>

  <%-- CRITEOタグ --%>
  <uc:Criteo ID="criteo" runat="server" Datas="<%# null %>" />
</asp:Content>
