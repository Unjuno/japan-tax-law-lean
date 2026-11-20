### CustomsAirCargo.lean — 関税定率法 第四条の六（航空運送貨物等に係る課税価格の決定の特例）

- **pinned ids**: law_id `143AC0000000054` / rev `143AC0000000054_20260601_508AC0000000005`（施行 2026-06-01, amend `508AC0000000005`, 公布 2026-03-31）; `data/raw/143AC0000000054_20260601_508AC0000000005.law.json` を自前 Python で SHA-256 再計算 → `924A01D3014FD93EA50C6588D5A7ED414BECEF2CA806918081A18A6EF986AE9C`（9,407,678 bytes, doc-comment の id/rev と一致）。`law_full_text` を再帰 flatten し `Article attr.Num="4_6"` を 1 件検出 → path `(1,1,10)`, caption「（航空運送貨物等に係る課税価格の決定の特例）」を **LOCATED**。原文 leaf を `re.sub(r"[\s　]+","",...)` 正規化 → 549 文字, SHA-256 `8FAD043813666AE6040D225C30EC6BDA02E98A5EADDBB12DEA62793AF448BAAE`。原文 leaf の Unicode 数字トークンは「２」（2項番号）のみで金額・率・上限の数値は **0 個**。doc-comment / `transcription_audit.py` は信じず raw から独立抽出。
- **独立抽出**: 原文 leaf・Lean doc-comment を各々正規化し needle を count 照合（各 needle について raw=1 / doc=1 を確認）。

  | 原文リテラル（Num=4_6 より） | 独立計算 | Lean 定数 | 照合 |
  |---|---|---|---|
  | 「…当該輸入貨物が航空機により運送された貨物であるときは、…無償の見本（**航空機による運賃及び保険料により計算した場合の課税価格が少額であるものとして政令で定める額を超えないものに限る。**）又は災害の救助…政令で定めるものについての輸入港に到着するまでの運送に要する運賃及び保険料は、**航空機による運送方法以外の通常の運送方法による運賃及び保険料によるものとする。**」 | 代替が適用されれば通常運賃等を選択、なければ航空実費 | `airFreightForValuation sub conv freight = if sub then conv else freight` | ✅ |
  | 「…個人的な使用に供されると認められるものであるときは、**当該輸入貨物の課税価格は、当該貨物の輸入が通常の卸取引の段階でされたとした場合の価格とする。**」 | 個人的使用なら卸価格、なければ小売価格 | `personalUseValue pu wholesale retail = if pu then wholesale else retail` | ✅ |
  | 「**本邦に居住する者に寄贈される貨物で、当該寄贈を受ける者の個人的な使用に供されると認められるものであるときも、同様とする。**」 | 寄贈品も個人的使用と同じ選択式 | `personalUseValue`（寄贈品も `personalUse` の真に含む） | ✅ |
  | 「政令で定める額を超えない」「緊急に輸入する必要があると認められる」「政令で定めるもの」「個人的な使用に供されると認められる」 | 該当性は法的判断で Bool 化 | `substituteForConventional` / `personalUse` 引数 | ✅ BY-DESIGN |
  | 「空運賃・通常運賃・卸価格・小売価格」の具体額（政令算定細目なし） | caller-established Money | `conventional` / `freight` / `wholesale` / `retail` 引数 | ✅ BY-DESIGN |
  | 1項は「運賃及び保険料」の代替で課税価格全体の代替ではない／本関数は代替後運賃等を返す | doc-comment のスコープ申告どおり | 加算は呼び出し側（art. 4）に委ねる | ✅ BY-DESIGN |
- **反例**: 自前 Python で `airFreightForValuation(sub,c,f)=c if sub else f`, `personalUseValue(pu,w,r)=w if pu else r` を independent 実装し、`.lean` / `-Tests.lean` の全 `by decide` 期待値（本レビュー追加分を含む 8 ファイル計 53 例）を構文解析して再計算 → **53/53 一致, 矛盾 0**。境界再計算: `airFreightForValuation true 7 200_000=7`（小さい正の入力, 選択 identity）, `airFreightForValuation false 13 7=7`（入力等価）, `airFreightForValuation true 0 200_000=0`（零入力→結果 0）, `personalUseValue true 5 200_000=5`, `personalUseValue false 200_000 11=11`, `personalUseValue true 0 250_000=0`。全て Lean 期待値と一致。
- **判定**: **CONFIRMED 0（原文と Lean の実食い違いなし）**。BY-DESIGN 3: ①政令額・緊急輸入認定・政令貨物・個人的使用認定は caller-established Bool で金額式に反映せず、②空運賃・通常運賃・卸/小売価格は入力・政令算定細目は外、③1項は運賃等の代替のみで加算は art. 4 側（本関数は代替後運賃等を返す）。原文に率・上限・丸めの数値トークンがなく、Bool 選択・Money 入力という modeling と整合。**LOCATED, UNRESOLVED なし**。
- **H/T/D/C/U**: H=1項の代替条件に原文なき金額閾値や率が入る、又 2項が卸/小売を逆に選ぶ; T=Num=4_6 を path `(1,1,10)` で locate + 3 needle が raw=1/doc=1 + 原文数値トークン0 + 全 `by decide` 53 例独立再計算; D=NOT_CONFIRMED（不一致 0, LOCATED, BY-DESIGN 3）; C=「航空機による運送方法以外の通常の運送方法」を航空実費側と誤読する懸念は原文「…以外の通常の運送方法による運賃及び保険料によるものとする」で排斥、選択式は doc-comment の定理群も同向き; U=「政令で定める額」「緊急に輸入する必要があると認められる」「個人的な使用」の具体認定・政令算定細目・各価格の算定は caller-established／要専門家。
- **限定**: 本レビューは機械的独立クロスチェックであり、**人間の法律レビューではない**。本環境では `lake`/`lean` が PATH になくカーネル再実行は未実施（`by decide` 例は構成上カーネル判定される期待値と独立計算を照合）。一時 Python スクリプトは `D:\CodexData\Temp\advrev_8` に置き削除済み。

### CustomsDomesticValue.lean — 関税定率法 第四条の三（国内販売価格又は製造原価に基づく課税価格の決定）

- **pinned ids**: law_id `143AC0000000054` / rev `143AC0000000054_20260601_508AC0000000005`（施行 2026-06-01, amend `508AC0000000005`）; `data/raw/143AC0000000054_20260601_508AC0000000005.law.json` を独立再計算 → SHA-256 `924A01D3014FD93EA50C6588D5A7ED414BECEF2CA806918081A18A6EF986AE9C`（9,407,678 bytes）。`Article attr.Num="4_3"` を 1 件検出 → path `(1,1,7)`, caption「（国内販売価格又は製造原価に基づく課税価格の決定）」を **LOCATED**。正規化 1,341 文字, SHA-256 `9CEBA347F45B1B8935D97CD40FAC08865ACE63920128D139A1097DF248B91ED5`。原文の数字トークンは「２」「３」（2項・3項番号）のみで控除額・率・上限は **0 個**。
- **独立抽出**: raw leaf と doc-comment を正規化し needle を count 照合。

  | 原文リテラル（Num=4_3 より） | 独立計算 | Lean 定数 | 照合 |
  |---|---|---|---|
  | 1項一「**当該国内販売価格から次に掲げる手数料等の額を控除して得られる価格**」 | price − (加工+手数料利潤経費+国内運賃+本邦公課) | `domesticSalesValue price d = price - domesticDeductionsTotal d` | ✅ |
  | 1項一イ/ロ/ハ「…国内における販売に係る通常の手数料又は利潤及び一般経費（ロに掲げる費用を除く。）」「…輸入港到着後国内において販売するまでの運賃、保険料その他…費用」「…本邦において課された関税その他の公課」 | 控除 3 項目（イ・ロ・ハ）を合算 | `commissionProfit` / `inlandFreight` / `domesticDuties` | ✅ |
  | 1項二「…国内販売価格から**加工により付加された価額及び前号イからハまでに掲げる手数料等の額を控除して得られる価格**」（doc-comment は先頭を「…」で略するが核心句は raw=1/doc=1 一致） | 加工付加価額も控除に加算 | `processingValue` を `domesticDeductionsTotal` に含む | ✅ |
  | 2項「…製造原価に…通常の利潤及び一般経費並びに**輸入港までの運賃等の額を加えた価格とする。**」 | cost + profit + freight | `computedValue cost profit freight = cost + profit + freight` | ✅ |
  | 3項「…希望する旨を税関長に申し出たときは、**第一項の規定に先立つて前項の規定により当該輸入貨物の課税価格を計算するものとする。**」 | 申出あり→原価法を優先、なし→国内販売価格法 | `customsValueArt4_3 ... useCostFirst = if useCostFirst then computedValue ... else domesticSalesValue ...` | ✅ |
  | 1項ただし書「第二号の規定の適用については、第一号を適用することができない場合で、かつ…第二号の規定の適用を希望する旨を税関長に申し出た場合に限る」 | 適用判定は caller-established | `useCostFirst` は入力 Bool、本関数は提示方法の計算のみ | ✅ BY-DESIGN |
  | 国内販売価格・各控除額・製造原価・利潤経費・運賃等（政令算定細目なし） | caller-established Money | 各引数 / `DomesticDeductions` フィールド | ✅ BY-DESIGN |
- **反例**: 自前 Python で `domesticDeductionsTotal(d)=Σd`, `domesticSalesValue(p,d)=max(p−Σd,0)`（Nat saturating）, `computedValue(c,p,f)=c+p+f`, `customsValueArt4_3(...)=...` を independent 実装し全 `by decide`（計 53 例）を構文解析・再計算 → **矛盾 0**。境界再計算: `domesticSalesValue 13 ⟨1,2,3,4⟩=3`（Σ=10, 小さい正の入力）, `computedValue 5 4 3=12`, `domesticSalesValue 50_000 d3=0`（控除>価格→saturating 零, 飽和境界）, `domesticSalesValue 1_000_000 ⟨0,0,0,0⟩=1_000_000`（控除 0→入力等価, identity 境界）, `computedValue 0 0 0=0`（零入力）, `customsValueArt4_3 ... true=620_000` / `false=900_000`（申出による分岐）。
- **判定**: **CONFIRMED 0（原文と Lean の実食い違いなし）**。BY-DESIGN 3: ①各価格・控除額・原価・利潤・運賃は caller-established（政令算定細目は外）、②1項ただし書・3項の「希望する旨の申出」は caller-established Bool で適用判定はせず提示方法の計算のみ、③控除>価格を saturating 零とするのは Nat 化に伴う選択で「課税価格ゼロ」を主張するものではない（原文は想定外で caller が入力妥当性を担保）。原文に率・上限値がなく減算/加算の構造のみで Lean と整合。**LOCATED, UNRESOLVED なし**。
- **H/T/D/C/U**: H=控除項目の欠落・誤加算、又 3項の申出時に国内販売価格法を選ぶ等分岐が逆転する; T=Num=4_3 を path `(1,1,7)` で locate + 4 needle（加工控除句は核心句で raw=1/doc=1） + 原文数値トークン0 + 全 `by decide` 53 例独立再計算; D=NOT_CONFIRMED（不一致 0, LOCATED, BY-DESIGN 3）; C=doc-comment が 1項二を「…」で略すため 1 回、より長い needle が doc=0 となるが、短縮核心句は raw=1/doc=1 で transcoding ではなく省略と確認、又 1項二の加工価額を 2項 profit と混同する懸念は原文「当該加工により付加された価額」で排斥; U=国内販売価格・各控除額・原価・利潤一般経費・運賃等の算定（政令）・ただし書の適用認定は caller-established／要専門家。
- **限定**: 本レビューは機械的独立クロスチェックであり、**人間の法律レビューではない**。カーネル再実行未実施（`by decide` 期待値と独立計算を照合）。一時 Python スクリプトは `D:\CodexData\Temp\advrev_8` に置き削除済み。

### CustomsExchangeRate.lean — 関税定率法 第四条の七（価格の換算に用いる外国為替相場）

- **pinned ids**: law_id `143AC0000000054` / rev `143AC0000000054_20260601_508AC0000000005`（施行 2026-06-01, amend `508AC0000000005`）; `data/raw/143AC0000000054_20260601_508AC0000000005.law.json` 独立再計算 → SHA-256 `924A01D3014FD93EA50C6588D5A7ED414BECEF2CA806918081A18A6EF986AE9C`（9,407,678 bytes）。`Article attr.Num="4_7"` を 1 件検出 → path `(1,1,11)`, caption「（価格の換算に用いる外国為替相場）」を **LOCATED**。正規化 184 文字, SHA-256 `DDBFA8DF6B99D5876F28F7575C82C602EDC7A7E2237DD4E3BB92E58982CC1A65`。原文の数字トークンは「２」（2項番号）のみで相場値・丸め規定は **0 個**。
- **独立抽出**: raw leaf と doc-comment を正規化し needle を count 照合（3 needle すべて raw=1 / doc=1）。

  | 原文リテラル（Num=4_7 より） | 独立計算 | Lean 定数 | 照合 |
  |---|---|---|---|
  | 1項「**外国通貨により表示された価格の本邦通貨への換算は、当該輸入貨物に係る輸入申告の日**（関税法第五条第一号（適用法令の特例）に掲げる貨物の課税価格を計算する場合にあつては、同号に定める日）における外国為替相場によるものとする。」 | 通常は輸入申告日、5条1号貨物は同号の日を選択 | `exchangeRateDate article5Goods declDay article5Day = if article5Goods then article5Day else declDay` | ✅ |
  | 1項括弧内「（関税法第五条第一号…に掲げる貨物の課税価格を計算する場合にあつては、**同号に定める日**）における外国為替相場によるものとする。」 | 例外日の選択条件は Bool 化 | `article5Goods : Bool` 引数 | ✅ |
  | 2項「**前項の外国為替相場は、財務省令で定める。**」 | 相場値は省令依存・原文に算術/丸めなし | 換算式を架空定義せず日付選択のみ固定 | ✅ BY-DESIGN |
  | 輸入申告の日・5条1号に定める日の特定・該当性（関税法側） | caller-established | `declarationDay` / `article5Day`（不透明 Nat 添字） | ✅ BY-DESIGN |
  | カレンダー演算・丸め・換算算術（原文に規定なし） | 非モデル化 | モデル外 | ✅ BY-DESIGN |
- **反例**: 自前 Python で `exchangeRateDate(b,d,a)=a if b else d` を independent 実装し全 `by decide`（計 53 例）を再計算 → **矛盾 0**。境界再計算: `exchangeRateDate false 7 200=7`（小さい正の入力, 申告日選択）, `exchangeRateDate true 200 13=13`（小さい正の入力, 5条1号日選択）, `exchangeRateDate false 0 200=0`（零入力→結果 0）, `exchangeRateDate true 100 100=100`（両候補同一→identity 境界, 選択結果は常に入力のいずれか）。
- **判定**: **CONFIRMED 0（原文と Lean の実食い違いなし）**。BY-DESIGN 3: ①換算算術・丸めは原文に数式がなく第2項で相場を財務省令に委任しているため架空の換算式を作らず日付選択のみを固定、②相場値・申告日/5条1号日の特定・該当性は caller-established（日付は不透明 Nat 添字）、③カレンダー演算はモデル外。原文に相場値・率・丸めの数値トークンがなく「日付選択のみ」という honest boundary と整合。**LOCATED, UNRESOLVED なし**。
- **H/T/D/C/U**: H=原文にない換算係数・丸め規則が混入する、又通常日と 5条1号日の選択が逆転する; T=Num=4_7 を path `(1,1,11)` で locate + 3 needle が raw=1/doc=1 + 原文数値トークン0 + 全 `by decide` 53 例独立再計算; D=NOT_CONFIRMED（不一致 0, LOCATED, BY-DESIGN 3）; C=「…における外国為替相場による」を換算式の存在と誤読する懸念は第2項の財務省令委任と原文の数式欠如で排斥、選択式は定理 `exchangeRateDate_is_one_of` も同向き; U=財務省令で定める相場の具体値・換算算術/丸め・関税法5条1号該当性と同号に定める日の特定は caller-established／要専門家。
- **限定**: 本レビューは機械的独立クロスチェックであり、**人間の法律レビューではない**。カーネル再実行未実施（`by decide` 期待値と独立計算を照合）。一時 Python スクリプトは `D:\CodexData\Temp\advrev_8` に置き削除済み。

### CustomsSimilarGoods.lean — 関税定率法 第四条の二（同種又は類似の貨物に係る取引価格による課税価格の決定）

- **pinned ids**: law_id `143AC0000000054` / rev `143AC0000000054_20260601_508AC0000000005`（施行 2026-06-01, amend `508AC0000000005`）; `data/raw/143AC0000000054_20260601_508AC0000000005.law.json` 独立再計算 → SHA-256 `924A01D3014FD93EA50C6588D5A7ED414BECEF2CA806918081A18A6EF986AE9C`（9,407,678 bytes）。`Article attr.Num="4_2"` を 1 件検出 → path `(1,1,6)`, caption「（同種又は類似の貨物に係る取引価格による課税価格の決定）」を **LOCATED**。正規化 770 文字, SHA-256 `C605FD782FA983A19923038D79DDC293B888CE2DCED1E87D2EFF1DFD2FAD9B79`。原文の数字トークンは「２」（2項番号）のみで価格・率・閾値は **0 個**。
- **独立抽出**: raw leaf と doc-comment を正規化し needle を count 照合。

  | 原文リテラル（Num=4_2 より） | 独立計算 | Lean 定数 | 照合 |
  |---|---|---|---|
  | 1項「**前条第一項の規定により輸入貨物の課税価格を計算することができない場合又は同条第二項本文の規定の適用がある場合において**、当該輸入貨物と同種又は類似の貨物…に係る取引価格があるときは…」 | 適用前提は caller-established | 入力 `samePrice` / `similarPrice` の Option | ✅ |
  | 1項「**当該輸入貨物の課税価格は、当該同種又は類似の貨物に係る取引価格（これらの取引価格の双方があるときは、同種の貨物に係る取引価格）とする。**」 | 双方あれば同種を優先、同種がなければ類似、双方なければ該当なし | `selectedSimilarGoodsPrice same similar = match same with | some v => some v | none => similar` | ✅ |
  | 1項後段・2項「…運送距離又は運賃等の差異による価格差につき、**政令で定めるところにより、必要な調整を行つた後**の取引価格とする。」（doc-comment は「必要な調整を行つた後」を保持, raw=2/doc=1） | 調整後価格を caller が渡す | `samePrice` / `similarPrice` は調整済み Money | ✅ BY-DESIGN |
  | 双方の取引価格がない場合 | 次の算定手段へ委ねる | `none` を返す（art. 4の3 は別スライス） | ✅ BY-DESIGN |
  | 同種・類似の該当性・生産国/輸出日の要件・取引段階/数量の同一性（政令調整なし） | caller-established | 引数の Option Money | ✅ BY-DESIGN |
- **反例**: 自前 Python で `selectedSimilarGoodsPrice(same,similar)= same if same is not None else similar`（Option を `None`/`('some',v)` で再現）を independent 実装し全 `by decide`（計 53 例）を構文解析・再計算 → **矛盾 0**。境界再計算: `selectedSimilarGoodsPrice (some 7) (some 900_000)=some 7`（小さい正の入力, 同種優先＝identity）, `selectedSimilarGoodsPrice none (some 13)=some 13`（小さい正の入力, 類似フォールバック）, `selectedSimilarGoodsPrice (some 0) (some 900_000)=some 0`（零入力も「ある」として保持）, `selectedSimilarGoodsPrice none none=none`（双方なし→委譲境界）。全て Lean 期待値と一致。
- **判定**: **CONFIRMED 0（原文と Lean の実食い違いなし）**。BY-DESIGN 3: ①同種・類似の該当性・生産国/輸出日要件・取引段階/数量の同一性は caller-established、②政令による運賃等差の調整は本モジュール外で調整済み価格を入力とする、③双方なしを `none` とし art. 4の3 への委譲を明示（本関数は取引価格の選択のみ）。原文「双方があるときは同種の貨物に係る取引価格」と選択式が逐語対応し、数値トークンもない。**LOCATED, UNRESOLVED なし**。
- **H/T/D/C/U**: H=「双方あるときは同種」が逆転して類似を優先する、又 0 円価格を「なし」と誤って除外する; T=Num=4_2 を path `(1,1,6)` で locate + 3 needle（調整句は「必要な調整を行つた後」で raw=2/doc=1） + 原文数値トークン0 + 全 `by decide` 53 例独立再計算; D=NOT_CONFIRMED（不一致 0, LOCATED, BY-DESIGN 3）; C=doc-comment が調整句を「…を行つた後」と略すため完全文 needle が doc=0 となるが短縮句は raw/doc 双方に存在し省略と確認、又 `some 0` を「価格なし」と読む懸念は原文「取引価格があるとき」＋選択式が some を保持することで排斥; U=同種/類似の認定・政令による価格差調整の具体値・取引価格の算定は caller-established／要専門家。
- **限定**: 本レビューは機械的独立クロスチェックであり、**人間の法律レビューではない**。カーネル再実行未実施（`by decide` 期待値と独立計算を照合）。一時 Python スクリプトは `D:\CodexData\Temp\advrev_8` に置き削除済み。
