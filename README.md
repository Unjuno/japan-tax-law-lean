# Japan Tax Law in Lean 4 / 日本税法の形式検証

[![Lean CI](https://github.com/Unjuno/japan-tax-law-lean/actions/workflows/lean.yml/badge.svg)](https://github.com/Unjuno/japan-tax-law-lean/actions/workflows/lean.yml)

日本の税法を **Lean 4** で段階的に形式化し、条文・定義・特例の境界条件、相互整合性、改正に伴う回帰を機械的に検証する研究・オープンソースプロジェクトです。

> **現状：初期の概念実証（PoC）です。日本の税法に不備が見つかったと主張するものではありません。** Lean が証明するのは、与えられた形式モデルの内部における命題であり、モデルが法令の意味を正しく表すこと自体は自動的に保証されません。

## R1 実装範囲

**対象法令の版（2026-11-15 現在の適用版）を固定し、以下を機械的に検証します。**

### 所得税法第2条第1項第3号・第5号・第3条、所得税法施行令第13条〜第15条

JapanTaxLaw/StatutoryModel.lean では、居住者／非居住者の判定を四値論理（Verdict）で形式化します。
認定事実／不明／矛盾を区別し、**不明を偽として処理しません**。

- 第2条第1項第3号：国内に住所を有する場合、または現在まで引き続いて1年以上国内に居所を有する場合をモデル化。
- 第2条第1項第5号：非居住者は「居住者ではない個人」としてモデル化。
- 第3条・第3項の**公務員擬制**と**政令で定める者の除外（施行令13条）**をモデル化。
- **施行令14条の推定（国内住所の推定）**、**施行令15条の推定（国外住所の推定）**をモデル化。
- 対象条文が法10条・15条・16条の場合は擬制の適用外として扱います。

JapanTaxLaw/ResidencySpec.lean で**実装と独立した形式仕様**（spec）と、健全性・整合性・例外適用範囲の定理を証明しています（後述）。

### 法人税法第2条第3号・第4号（法人税法の適用主体）

JapanTaxLaw/CorpActor.lean では、法人税法の適用主体（内国法人・外国法人＝「内国法人以外の法人」）を四値論理（Verdict）で形式化します。
認定事実／不明／矛盾を区別し、**不明を偽として処理しません**。

- 第2条第3号：国内に本店又は主たる事務所を有する法人を内国法人として分類。
- 第2条第4号：内国法人以外の法人を外国法人として分類。
- 第2条第5号（公共法人）・第6号（公益法人等）、及び適用主体の帰結（法人税の納税義務の範囲、税率、課税標準等）は本PRでは**未対応**です。
- JapanTaxLaw/CorpActorSpec.lean で実装と独立した形式仕様（spec）を維持し、健全性・整合性の定理を証明しています（後述）。

### 国税通則法第2条第1号～第4号（定義層：国税・源泉徴収等による国税・消費税等・附帯税）

JapanTaxLaw/TaxGeneral.lean では、国税全般の基礎定義を形式化します（消費税法・相続税法などの基礎となる、最も依存性の高い分野です）。以下は**定義層のみ**です。

- 第2条第1号：「国税」の定義（国が課する税のうち、**関税・とん税・特別とん税・森林環境税・特別法人事業税を除く**）を、除外リストによる決定的述語として形式化。
- 第2条第2号：源泉徴収等による国税（源泉徴収に係る所得税・特別徴収に係る国際観光旅客税）。これらの税に係る附帯税は除外。
- 第2条第3号：消費税等（消費税・酒税・たばこ税・揮発油税・地方揮発油税・石油ガス税・石油石炭税）を列挙。
- 第2条第4号：附帯税（延滞税・利子税・過少申告加算税・無申告加算税・不納付加算税・重加算税）を列挙。
- 第2条第5号（納税者）は後段のスライスで形式化。第2条第6号以降（納税申告書・法定申告期限等）、及び第15条以降の課税要件・手続は**未対応**です。
- JapanTaxLaw/TaxGeneralSpec.lean で実装と独立した形式仕様（spec）を維持し、健全性・整合性の定理を証明しています（後述）。

### 国税通則法第2条第5号（納税者の定義）

JapanTaxLaw/Taxpayer.lean では、国税通則法第2条第5号（納税者）を、直接納付トラックと源泉徴収等トラックの二つの十分条件として四値論理で形式化します。
- 直接納付トラック：国税（源泉徴収等による国税を除く。）を納める義務がある者 **で、かつ** 国税徴収法に規定する **第二次納税義務者でも国税の保証人でもない** 者
- 源泉徴収等トラック：源泉徴収等による国税を徴収して国に納付しなければならない者
- 国税徴収法の規定・保証人の定義・納税申告書事務等は本PRでは **未対応** です（除外の外部事実だけを四値Verdictで表現）。
- JapanTaxLaw/TaxpayerSpec.lean で独立仕様を維持し、健全性・整合性の定理を証明しています。


### 国税通則法第2条第10号（強制換価手続の定義）

JapanTaxLaw/TaxProcedure.lean では、国税通則法第2条第10号の**強制換価手続**の定義を形式化します。本条文は列挙形式です：

- 滞納処分（その例による処分を含む。）／強制執行／担保権の実行としての競売／企業担保権の実行手続／企業価値担保権の実行手続／破産手続

- 法文の列挙を厳密に CompulsoryRealizationProcedure enum として閉じた universe を構成し、Membership/重複なし/個数=6 を機械検証しています。
- Act art. 2 item 7 （法定申告期限）: 他法令参照のため本PRでは未対応（定義層のみの項目を明記）。
- JapanTaxLaw/TaxProcedureSpec.lean で独立仕様を維持し、健全性・整合性の定理を証明しています（後述）。

### 国税通則法第2条第8号（除外期限：繰上請求・延納・納税の猶予・徴収の猶予・滞納処分の猶予）

JapanTaxLaw/StatutoryDeadline.lean では、国税通則法第2条第8号の但し書きに掲げる**除外期限**の定義を形式化します。覆い尽くされた「当該国税を納付すべき期限に含まれないものとする」旨を規定し、繰上請求・延納・納税の猶予・徴収の猶予・滞納処分に関する猶予の5種を除外期限として認め、いずれかが該当する期限は**法定納期限ではない**ものとして除外します。

- 「当該国税を納付すべき期限（次に掲げる国税については、それぞれ次に定める期限又は日）」の肯定規定・イ〜ホの各号は本PRでは**未対応**です。
- 不明（unknown）は偽として処理せず、conflict は判定不能の上位（矛盾）として扱います。
- JapanTaxLaw/StatutoryDeadlineSpec.lean で独立仕様（除外判定の十分条件）を維持し、健全性・整合性（証人形式）を証明しています（後述）。

### 国税通則法第2条第9号（課税期間の定義）

JapanTaxLaw/TaxationPeriod.lean では、国税通則法第2条第9号の**課税期間**の定義を形式化します。条文は原則と例外の二系統に分岐します。

- 原則：国税に関する法律の規定により国税の課税標準の計算の基礎となる期間
- 例外（消費税関連イベントに限定）：同法第十九条（課税期間）に規定する課税期間
- 課税資産の譲渡等／特定課税仕入れの判定事実は本モジュールの外の判定事実（四値 Verdict）として入力される。当該課税イベントを法文から推測して決めつけない。
- 消費税法が本条文で参照される（課税資産の譲渡等・特定課税仕入れ・Art. 19）が、消費税法側の形式化はPhase Dの別スライス。
- 不明（unknown）は偽として処理せず、conflict は判定不能の上位（矛盾）として扱います。
- JapanTaxLaw/TaxationPeriodSpec.lean で独立仕様を維持し、健全性・整合性の定理を証明しています（後述）。

### 消費税法第5条（納税義務者）＝登録免許税法の別表記（法定番号）

JapanTaxLaw/ConsumptionTaxActor.lean では、消費税法（昭和六十三年法律第百八号）の**納税義務**の第一項を形式化します：

- 事業者は、国内において行つた課税資産の譲渡等（特定資産の譲渡等に該当するものを除く。）及び特定課税仕入れ（課税仕入れのうち特定仕入れに該当するものをいう。）につき、消費税を納める義務がある。
- Act art. 2 item 4 事業者 = 個人事業者 ∪ 法人（item 3 個人事業者）。item 7 人格のない社団等は別分類として取り扱い、事業者の肯定の分類であれば事業能力として成立するものとして扱います。
- 課税事象（課税資産の譲渡等・特定課税仕入れ）自体の認定は本モジュールの対象外。外部判定事実として入力する。
- Act art. 2 items 7（人格のない社団等）、item 12（課税仕入れ）、item 13（事業年度）、item 14（基準期間）、item 16（調整対象固定資産）にまたがる事業能力認定は、本PRでは事業能力に無関係な部分を除き全面未対応（`unsupported`）。
- Act art. 4 の課税対象の細目（特定役務の提供の場所判定、見なし譲渡の特例等）は未対応。今閉じたのは「納税義務者＝事業者＋課税事象」までの範囲。
- JapanTaxLaw/ConsumptionTaxActorSpec.lean で独立仕様を維持し、健全性・整合性の定理を証明しています（後述）。

### 国税通則法第15条（納税義務の成立及びその納付すべき税額の確定）

JapanTaxLaw/ObligationArt15.lean では、国税通則法第15条の納税義務の成立条件のうち、本モデルが対応する税目（closed universe）のものを形式化します。

- 第15条第2項第2号「源泉徴収による所得税」：源泉徴収をすべきものとされている所得の支払の時に成立（timeOfIncomePayment）
- 第15条第2項第7号「消費税等」：課税資産の譲渡等をした時に成立（timeOfSupplyOrRemoval）
- 第15条第2項第14号：過少申告加算税・無申告加算税及び重加算税のうち第15号各括弧内限定部分：法定申告期限の経過の時に成立（timeOfExpiryOfFilingDeadline）
- 第15条第2項第15号：不納付加算税及び重加算税のうち第15号第二項限定部分：法定納期限の経過の時に成立（timeOfExpiryOfPaymentDeadline）
- 第15条第3項第7号（延滞税・利子税）：成立と同時に特別の手続を要しないで納付すべき税額が確定する（noSpecialProcedureNeeded）
- 第15条第2項第1号「所得税」（暦年の終了の時）、第3号（法人税・地方法人税、事業年度の終了の時）、第3号の2（対象会計年度の終了の時）、第4号（相続税、相続・遺贈による財産取得の時）、第5号（贈与税）、第6号（地価税）、第8号（航空機燃料税）、第9号（電源開発促進税）、第10号（自動車重量税）、第11号（国際観光旅客税）、第12号（印紙税）、第13号（登録免許税）、第14号・第15号にわたる附帯税：本モデルでは宣言的な列挙にとどめるか、未対応として明示します。特に前者は`otherNationalTax` catch-all と heavyAdditionalTax を unsupported として記録します。
- JapanTaxLaw/ObligationArt15Spec.lean で独立仕様を維持し、健全性・整合性の定理を証明しています（後述）。

### 国税通則法第4条（他の国税に関する法律との関係・優先規則）

JapanTaxLaw/TaxGeneralPriority.lean では、国税通則法第4条（「この法律に規定する事項と他の国税に関する法律に別段の定めがあるものは、その定めるところによる。」）を形式化します。他の国税に関する法律の別段の定めがあれば、本法より別段の定めが優先します（lex specialis）。

- 別段の定めがあれば他法適用（覆い尽くされた主張）。なければ本法規定が適用。
- 不明（unknown）は偽として処理せず、conflict は判定不能の上位（矛盾）として扱います。
- JapanTaxLaw/TaxGeneralPrioritySpec.lean で独立仕様を維持し、健全性・整合性（証人形式）の定理を証明しています（後述）。

### 構造監査（e-Gov 法令本文の機械検査）

scripts/law_audit/ は、2026-11-15 適用版の**所得税法**（法令ID 340AC0000000033）と
**所得税法施行令**（法令ID 340CO0000000096）について、次を検査する Python ツールです。
原文は data/raw/ に SHA-256 ハッシュ付きで保存し、PDF 生成 URL は e-Gov API v2 から取得します。

- 条・項・号・枝番号の参照先（未解決参照は candidate として報告、断定しない）
- 番号重複・欠落・逆転・削除された条文からの参照
- 項の重複・欠落・整序
- 括弧の対応・引用符の対応
- 目次（TOC）の条号範囲と本文の span 整合性
- 参照は「他律法（法人税法・国税通則法等）」「附則からの参照」を区別し、未解決でも誤りと断定しない

**未対応範囲**（明示）:
- 別表の内容意味検査は未対応。
- 「附則第○条」参照は対応する附則存在性までしか検査しない。
- 非永住者（第2条第1項第4号）・租税条約・非永住者特有規則は R1 対象外。

### 監査レポートの生成

```sh
python -m scripts.law_audit.audit --out build     # 誤検証結果を build/ に出力
python -m scripts.law_audit.report                # docs/AUDIT_REPORT.md を生成
python -m unittest scripts.tests.test_structural_audit   # 35 テスト
python -m unittest scripts.tests.test_mutation_injection # 12 誤変更注入検出テスト
```

## 根拠資料

- [e-Gov 法令検索：所得税法（法令ID 340AC0000000033）](https://laws.e-gov.go.jp/law/340AC0000000033/)
- [国税庁 No.2875 居住者と非居住者の区分（令和8年4月1日現在法令等）](https://www.nta.go.jp/taxes/shiraberu/taxanswer/gensen/2875.htm)
- [国税庁 No.2010 納税義務者となる個人（令和8年4月1日現在法令等）](https://www.nta.go.jp/taxes/shiraberu/taxanswer/shotoku/2010.htm)

条文は**施行日によって内容が変わり得る**ため、今後の各モデル・検証報告には対象法令の版・施行日・参照URLを必ず明記します。追加の出典・判定基準は [docs/METHODOLOGY.md](docs/METHODOLOGY.md) を参照。

## 開発環境・検証

- Lean 4: `leanprover/lean4:v4.35.0`（`lean-toolchain` で固定）
- Lake: 同梱バージョン、外部Leanライブラリ依存なし
- CI: GitHub Actions / `leanprover/lean-action@v1`

```sh
git clone https://github.com/Unjuno/japan-tax-law-lean.git
cd japan-tax-law-lean
lake build
```

`lake build` は `JapanTaxLaw.lean` 経由で仕様・定理・4通りのテストを検査します。GitHub Actionsで同じビルドを実行します。

## リポジトリ構成

```text
JapanTaxLaw.lean                 # ライブラリのエントリーポイント
JapanTaxLaw/Residency.lean       # PoC: 所得税法第2条の限定的形式モデルと定理（維持）
JapanTaxLaw/Verdict.lean         # 四値論理（Verdict）と各種結合子・冪等律
JapanTaxLaw/StatutoryModel.lean  # 四値論理による居住者判定本体・擬制・除外・推定・分類
JapanTaxLaw/ResidencySpec.lean   # 形式仕様（spec）と健全性・整合性の定理
JapanTaxLaw/Excluded.lean        # 公務員擬制の除外が成立する条件（enum-level）
JapanTaxLaw/VerdictLemmas.lean   # 四値論理の小さな同値補題集
JapanTaxLaw/Tests.lean           # 30件の境界・回帰テスト
JapanTaxLaw/TaxFinance.lean      # 共通意味論 L3/L4: Money/TaxRate/Period/Priority
JapanTaxLaw/TestsCommon.lean     # 共通意味論のテスト 21件
JapanTaxLaw/CorpActor.lean       # Phase D: 法人税法 act.2(3),(4) actor分類モデル
JapanTaxLaw/CorpActorSpec.lean   # 法人税法actorの独立仕様と健全性・整合性定理
JapanTaxLaw/CorpActorTests.lean  # 法人税法actorの退行テスト 11件
JapanTaxLaw/TaxGeneral.lean      # Phase D: 国税通則法 定義層（第2条第1号～第4号）
JapanTaxLaw/TaxGeneralSpec.lean  # 国税通則法 定義層の独立仕様と健全性・整合性定理
JapanTaxLaw/TaxGeneralTests.lean # 国税通則法 定義層の退行テスト 13件
JapanTaxLaw/Taxpayer.lean       # Phase D: 国税通則法 第2条第5号（納税者）
JapanTaxLaw/TaxpayerSpec.lean   # 納税者スライスの独立仕様と健全性・整合性定理
JapanTaxLaw/TaxpayerTests.lean  # 納税者スライスの退行テスト 11件
JapanTaxLaw/TaxGeneralPriority.lean      # 国税通則法 第4条（優先規則）
JapanTaxLaw/TaxGeneralPrioritySpec.lean  # Act art.4 の独立仕様・健全性・整合性定理
JapanTaxLaw/TaxGeneralPriorityTests.lean # Act art.4 の退行テスト 15件
JapanTaxLaw/StatutoryDeadline.lean      # 国税通則法 第2条第8号（除外期限の定義）
JapanTaxLaw/StatutoryDeadlineSpec.lean  # Act art.2(8) 除外期限の独立仕様・健全性・整合性定理
JapanTaxLaw/StatutoryDeadlineTests.lean # Act art.2(8) 除外期限の退行テスト 12件
JapanTaxLaw/TaxationPeriod.lean      # 国税通則法 第2条第9号（課税期間）
JapanTaxLaw/TaxationPeriodSpec.lean  # Act art.2(9) の独立仕様・健全性・整合性定理
JapanTaxLaw/TaxationPeriodTests.lean # Act art.2(9) の退行テスト 9件
JapanTaxLaw/ObligationArt15.lean      # 国税通則法 第15条（納税義務の成立）
JapanTaxLaw/ObligationArt15Spec.lean  # Act art.15 の独立仕様・健全性・整合性定理
JapanTaxLaw/ObligationArt15Tests.lean # Act art.15 の退行テスト 19件
JapanTaxLaw/ConsumptionTaxActor.lean      # 消費税法 第5条 納税義務者 anchor（事業能力＋課税事象）
JapanTaxLaw/ConsumptionTaxActorSpec.lean  # 消費税法 Act art.5 anchor の独立仕様・健全性・整合性定理
JapanTaxLaw/ConsumptionTaxActorTests.lean # 消費税法 anchor の退行テスト 19件
JapanTaxLaw/TaxProcedure.lean      # 国税通則法 第2条第10号（強制換価手続）
JapanTaxLaw/TaxProcedureSpec.lean  # Act art.2(10) の独立仕様・健全性・整合性定理
JapanTaxLaw/TaxProcedureTests.lean # Act art.2(10) の退行テスト 12件
scripts/law_audit/               # 構造監査エンジン（Python）
scripts/tests/                   # 構造監査テスト 35件 ＋ 誤変更注入検出テスト 12件
data/raw/                        # e-Gov API v2 から取得した適用版XML＋ハッシュ
data/PROVENANCE.json             # 法令ID・履歴ID・施行日・SHA-256
docs/METHODOLOGY.md              # 法令・モデルの対応づけ、発見の査読基準
docs/AUDIT_REPORT.md             # 監査レポート（生成物）
.github/workflows/lean.yml      # Lean ビルド・公理検査・構造監査・誤変更注入のCI
lakefile.toml / lean-toolchain  # 再現可能なビルド
```

## Phase A — 全法令インベントリ（完了）

対象法令台帳 `data/INVENTORY.json` を構築しました（2026-11-15 時点・公式法令一覧基準）。

- 母集団：e-Gov 公式全現行法令一覧（`/api/1/lawlists/1`、現行法令 9,001 件、sha256 を `data/INVENTORY.json` に記録）から「税」を含む **327 件**（法律 74・政令 113・省令/府令 140）を決定論的に抽出
- 現行版の確定：**325 / 327 件**について 2026-11-15 時点の適用版を確定
  - 324 件は `CurrentEnforced`（内 1 件は PreviousEnforced への退行記録を含むが監査不可として `audit_ready=False`）
  - **完全未施行の 2 件**（防衛特別所得税関連の政令・省令）は未確定のまま台帳へ記録し、検証対象から除外
  - 1 件は Historical fallback（e-Gov が `CurrentEnforced` を返さないため）と明示
- 版・施行日・改正履歴・原文ハッシュ：確定済み 325 件全件の原文 JSON と改正履歴 JSON を `data/raw/` に保存し SHA-256 を `data/INVENTORY.json` に記録（改正履歴 325 件ピン留め・ハッシュ照合済み）
- 参照関係の収集（走査可能な原文からの形式的抽出のみ）：参照抽出 461,067 件（うち内部解決 81,779 / 外部未解決 161,664 / 未対応 237,132）。**外部未解決・未対応を誤りとして断定しません**
- 未登録の範囲（地方税条例・租税条約・通達・裁判例）は、それぞれ独立した法源/解釈レイヤーとして台帳上 `unsupported` と明記します

検証スクリプト：

```sh
python scripts/law_audit/inventory/build_inventory.py --fetch-raw   # 取得（ネットワーク必要）
python scripts/law_audit/inventory/pin_revisions.py                 # 改正履歴ピン留め＋照合
python scripts/law_audit/inventory/validate_inventory.py             # 台帳の整合検証（オフライン）
python -m unittest scripts.tests.test_inventory_selection            # 7 テスト
```

## Phase B — 全体系の構造監査（完了）

Phase A でピン留めした 325 件の法令原文に対し、構造監査エンジンを全件に実行しました。

- 対象: pinned 325 トランザクション全件（0 件パース失敗、0 件監査失敗、附則含む）
- 検査件数: 条 33,652／項 77,471／号 45,836（総計約 15.7 万要素を走査）
- 参照抽出: 461,067 件（内部解決可能 63,214／外部未解決 169,032／未対応構文 240,799）
- **監査結果（verified-anomaly）: 0 件** — 既存の検証済み異常はありません。`candidate` 3,280 件は抽出チェックの候補であり、**確定した欠陥ではない**（独立の法的レビュー待ち）。
  - 候補内訳: かっこ不整合 1,492／参照項目欠落 914／参照条欠落 362／参照項欠落 341／附則参照欠落 95／削除条文参照 67 ほか
- 未対応範囲（明示）: 別表の内容意味、`AppdxStyle`、表の列構造の意味、租税条約・附則の経過措置の参照解決、R1 で除外した住所認定の詳細は対象外。

検証コマンド:

```sh
python scripts/law_audit/inventory/sweep.py            # 全法令スイープ
python scripts/law_audit/inventory/validate_inventory.py  # 台帳整合チェック
```

候補の一覧と根拠は `build/audit_sweep.json`（生成物・未コミット）に出力されます。
**`build/` はコミット対象外**。台帳台帳の再現手順は [docs/INVENTORY.md](docs/INVENTORY.md) を参照。

## R1 の検証結果（2026-11-15 時点）

- **`lake build`**: 成功（Lean v4.35.0、依存なし）
- **構造監査**: 所得税法 1,286 条文・所得税法施行令 1,142 条文を機械検査
- **意味モデル**: 実装:ジェネラリティを 3 種の網羅パターン（居住者／非居住者／不明）に分解して証明
- **監査結果**: `verified-anomaly` **0 件**、`candidate` 24 件（すべて**未確定**、独立レビュー未実施）
- **詳細**: [docs/AUDIT_REPORT.md](docs/AUDIT_REPORT.md)
- **公理依存**: 主要定理は `propext` のみ（`sorry` 未使用）

## 発見報告のルール

「矛盾」「抜け穴」「誤記」を称する前に、**(1) 法令・施行日時点、(2) 原文の参照箇所、(3) 形式化の前提、(4) 再現可能な証明／反例、(5) 別解釈・適用除外の検討、(6) 人による法的レビュー**を提示します。

**ビルド成功 ≠ 法令の正確な形式化 ≠ 現実の法的問題の発見** です。

## コントリビュート

貢献方法と検証基準は [CONTRIBUTING.md](CONTRIBUTING.md) を参照してください。コードは MIT ライセンスです。法的助言の提供を目的としません。
