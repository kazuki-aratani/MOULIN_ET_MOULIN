<%--
=========================================================================================================
Module : トップ画面(Default.aspx)
･･･････････････････････････････････････････････････････････････････････････････････････････････････････
Copyright : Copyright W2 Co.,Ltd. 2009 All Rights Reserved.
=========================================================================================================
--%> <%-- ▽ユーザーコントロール宣言領域▽ --%> <%@ Register TagPrefix="uc"
TagName="Parts000TMPL_999" Src="~/Page/Parts//Parts000TMPL_999.ascx" %> <%@
Register TagPrefix="uc" TagName="Parts060NEWS_999"
Src="~/Page/Parts//Parts060NEWS_999.ascx" %> <%@ Register TagPrefix="uc"
TagName="Parts900FAT_999" Src="~/Page/Parts//Parts900FAT_999.ascx" %> <%@
Register TagPrefix="uc" TagName="BodyProductRanking"
Src="~/Form/Common/Product/BodyProductRanking.ascx" %> <%@ Register
TagPrefix="uc" TagName="BodyProductHistory"
Src="~/Form/Common/Product/BodyProductHistory.ascx" %> <%@ Register
TagPrefix="uc" TagName="BodyCoordinateList"
Src="~/Form/Common/Coordinate/BodyCoordinateList.ascx" %> <%@ Register
TagPrefix="uc" TagName="BodyFeaturePageList"
Src="~/Form/Common/FeaturePage/BodyFeaturePageList.ascx" %> <%@ Register
TagPrefix="uc" TagName="BodyProductRecommendAdvanced"
Src="~/Form/Common/Product/BodyProductRecommendAdvanced.ascx" %> <%@ Register
TagPrefix="uc" TagName="BodySubscriptionBoxList"
Src="~/Form/Common/BodySubscriptionBoxList.ascx" %> <%--
△ユーザーコントロール宣言領域△ --%> <%@ Register TagPrefix="uc" TagName="Criteo"
Src="~/Form/Common/Criteo.ascx" %> <%@ page language="C#"
masterpagefile="~/Form/Common/DefaultPage.master" autoeventwireup="true"
inherits="Default, App_Web_default.aspx.cdcab7d2"
title="ｗ２ショッピングデモサイト トップページ" %> <%--
下記は保持用のダミー情報です。削除しないでください。 <%@ FileInfo
LayoutName="NoSide" %><%@ FileInfo LastChanged="ｗ２ユーザー" %> --%>
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
                <p class="h2_sub">肌が整うと、毎日が楽しい</p>
              </div>
              <p class="text">
                なりたいキレイを叶えることで、自信が芽生え、<br class="un_tab">心も前向きになります。<br>
                美しさへの近道は、自分の肌状態を知り、<br class="un_tab">自分に合ったスキンケアを知ること。<br>
                そうすることで、<br class="un_tab">肌はしっかりとこたえてくれます。<br>
                さあ、自分の肌を信じよう
              </p>
              <div class="img_blc">
                <img class="left" src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/top_concept_01.jpg" alt="">
                <img class="right" src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/top_concept_02.jpg" alt="">
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
                  私たちは美しさを提案する美容メーカーとして、<br>
                  一人ひとりの 「キレイ」と向き合ってきました。<br>
                  その中で、毎日をがんばっている人の肌に目を向けると、<br class="ov_tab">
                  不規則な生活や環境からくるストレスによって、<br class="ov_tab">
                  自分でも気づかないうちに、バリア機能が低下した<br class="ov_tab">
                  “ゆらぎ肌”※の方が多いことが分かりました。<br>
                  マイバランスは、そんなゆらぎ肌の方にもご使用いただけるご提案と、<br class="ov_tab">
                  商品設計にこだわり、あなたの「肌が整うと毎日が楽しい」を応援します。
                </p>
                <p class="note">※バリア機能が低下し、不安定な状態の肌</p>
              </div>
              <div class="right">
                <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/top_thought_01.jpg" alt="">
              </div>
            </div>
          </section>
          <section id="suggestion">
            <div class="suggestion_blc">
              <div class="h2_blc">
                <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/top_mb_h2.png" alt="MyBALANCE">
                <h2>マイバランスのご提案</h2>
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
                      <span>SKIN CHECK</span>
                      スキンチェックのお申し込みはこちら
                    </a>
                  </div>
                  <div class="text_blc">
                    <div class="ttl"><span class="num">02</span>自分に合った化粧品を知る</div>
                    <p class="text">スキンチェックの結果から、あなたの肌状態に合ったマイバランスのアイテムをご提案します。</p>
                  </div>
                  <div class="text_blc">
                    <div class="ttl"><span class="num">03</span>正しいスキンケアを知る</div>
                    <p class="text">スキンケアの効果をより感じていただくためのコンシェルジュやオンラインカウンセリングサポート。</p>
                  </div>
                </div>
              </div>
            </div>
          </section>
        </div>
      </div>
    </div>
    <section id="fullImg">
      <div class="fullImg_blc ov_tab"><img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/top_fullImg.jpg" alt=""></div>
      <div class="fullImg_blc un_tab"><img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/sp_top_fullImg.jpg" alt=""></div>
    </section>
    <section id="lineup">
      <div class="lineup_wrp inner_960 pd_120">
        <div class="lineup_blc">
          <div class="h2_blc">
            <h2>LINE UP</h2>
          </div>
          <p class="lineup_text gen">My BALANCEはお客さま一人ひとりの肌状態に合った商品をお使いいただくため、<br>
            <span>スキンチェック（肌分析）にお申込みいただいた方のみ</span>に販売をさせていただいております。
          </p>
          <a href="" class="gdt_btn center">
            <span>SKIN CHECK</span>
            スキンチェックのお申し込みはこちら
          </a>
        </div>
        <div class="teiki_blc">
          <div class="ttl">定期お届けコースがお得！</div>
          <ul class="teiki_cont">
            <li class="teiki_cont_item">
              <span class="num">01</span>
              <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/top_course_01.svg" alt="">
              <p class="text">33％OFF</p>
            </li>
            <li class="teiki_cont_item">
              <span class="num">02</span>
              <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/top_course_02.svg" alt="">
              <p class="text">6回ご購入ごとに、<br>スキンチェックが無料<br><span>※通常¥1,650（税込）</span></p>
            </li>
            <li class="teiki_cont_item">
              <span class="num">03</span>
              <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/top_course_03.svg" alt="">
              <p class="text">いつでも解約OK</p>
            </li>
            <li class="teiki_cont_item">
              <span class="num">04</span>
              <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/top_course_04.svg" alt="">
              <p class="text">配達日・<br>セット内容変更OK</p>
            </li>
          </ul>
        </div>
        <div class="setItem_blc product_blc">
          <div class="h2_blc">
            <h2>SET ITEM<span class="h2_sub">定期商品</span></h2>
          </div>
          <p class="setItem_blc_text">スキンチェックの結果より、あなたの肌状態に合ったスキンケアセットをお選びください！</p>
          <ul class="product_grid">
            <li class="product_grid_item">
              <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/product_teiki_n.jpg" alt="">
              <div class="product_name_blc">
                <p class="product_name gen">マイバランス デイリーケア N</p>
                <span class="product_name_en">My BALANCE Daily Care N</span>
              </div>
              <div class="skin_type_blc"><span class="oil">オイリー肌</span><span class="normal">ノーマル肌</span></div>
              <p class="set_item">セット内容：クレンジング/ウォッシング N/リクイド N</p>
              <div class="teiki_price_blc">
                <p class="teiki_price">通常価格 7,500円</p>
                <p class="teiki_sale_price">→ 5,000円（税込 5,500円）</p>
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
              <p class="set_item">セット内容：クレンジング/ウォッシング N/リクイド D</p>
              <div class="teiki_price_blc">
                <p class="teiki_price">通常価格 7,500円</p>
                <p class="teiki_sale_price">→ 5,000円（税込 5,500円）</p>
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
              <p class="set_item">セット内容：クレンジング/ウォッシング D/リクイド D</p>
              <div class="teiki_price_blc">
                <p class="teiki_price">通常価格 7,500円</p>
                <p class="teiki_sale_price">→ 5,000円（税込 5,500円）</p>
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
              <p class="normal_price">75g ｜ 2,250円<span>（税込 2,475円）</span></p>
              <a href="" class="product_btn">DETAIL MORE</a>
            </li>
            <li class="product_grid_item">
              <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/product_washing_n.jpg" alt="">
              <div class="product_name_blc">
                <p class="product_name gen">マイバランス ウォッシング N</p>
                <span class="product_name_en">My BALANCE Washing N</span>
              </div>
              <p class="normal_price">90g ｜ 2,250円<span>（税込 2,475円）</span></p>
              <a href="" class="product_btn">DETAIL MORE</a>
            </li>
            <li class="product_grid_item">
              <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/product_washing_d.jpg" alt="">
              <div class="product_name_blc">
                <p class="product_name gen">マイバランス ウォッシング D</p>
                <span class="product_name_en">My BALANCE Washing D</span>
              </div>
              <p class="normal_price">90g ｜ 2,250円<span>（税込 2,475円）</span></p>
              <a href="" class="product_btn">DETAIL MORE</a>
            </li>
            <li class="product_grid_item">
              <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/product_liquid_n.jpg" alt="">
              <div class="product_name_blc">
                <p class="product_name gen">マイバランス リクイド N</p>
                <span class="product_name_en">My BALANCE Liquid N</span>
              </div>
              <p class="normal_price">100mL ｜ 3,000円<span>（税込 3,300円）</span></p>
              <a href="" class="product_btn">DETAIL MORE</a>
            </li>
            <li class="product_grid_item">
              <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/product_liquid_d.jpg" alt="">
              <div class="product_name_blc">
                <p class="product_name gen">マイバランス リクイド D</p>
                <span class="product_name_en">My BALANCE Liquid D</span>
              </div>
              <p class="normal_price">100mL ｜ 3,000円<span>（税込 3,300円）</span></p>
              <a href="" class="product_btn">DETAIL MORE</a>
            </li>
            <li class="product_grid_item">
              <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/product_skincheck.jpg" alt="">
              <div class="product_name_blc">
                <p class="product_name gen">スキンチェック（肌分析）</p>
                <span class="product_name_en">SKIN CHECK</span>
              </div>
              <p class="normal_price">1,500円<span>（税込 1,650円）</span></p>
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
              スキンチェックを受けていただいた方は、<br class="un_tab">コンシェルジュやオンラインカウンセリングによる、<br>
              お肌のお悩みや、正しいお手入れ方法を<br class="un_tab">ご相談できます。
            </p>
            <div class="service_cont">
              <div class="left">
                <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/top_service_01.jpg" class="ov_tab" alt="">
                <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/sp_top_service_01.jpg" class="un_tab" alt="">
                <p class="ttl"><span class="num">01</span>コンシェルジュ</p>
                <p class="text">商品サービスや基本的なスキンケアに関するご質問をお受けします。</p>
              </div>
              <div class="right">
                <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/top_service_02.jpg" class="ov_tab" alt="">
                <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/sp_top_service_02.jpg" class="un_tab" alt="">
                <p class="ttl"><span class="num">02</span>オンラインカウンセリング</p>
                <p class="text">肌の悩みなど、より専門的な肌に関するご質問をお受けします。</p>
              </div>
            </div>
            <div class="service_btn_blc">
              <p class="service_btn_text">＼ ご利用はこちらから／</p>
              <div class="service_btn_flex">
                <a href="" class="service_btn">チャットボット</a>
                <a href="" class="service_btn">メール</a>
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
              <a href="" class="skinCheck_btn">スキンチェックへ</a>
            </div>
            <div class="right ov_tab">
              <img src="<%= Constants.PATH_ROOT %>Contents/ImagesPkg/mybalance/top_bottom_area_img.png" alt="">
            </div>
          </div>
        </div>
      </div>
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
