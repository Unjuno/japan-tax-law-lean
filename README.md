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

### 地方税法第7条（受益に因る不均一課税及び一部課税）

JapanTaxLaw/LocalPrivilege.lean では、地方税法（昭和二十五年法律第二百二十六号・現行2026-11-01付施行版）第七条（地方団体は、その一部に対して特に利益がある事件に関しては、不均一の課税をし、又はその一部に課税をすることができる）を形式化します。

- 「その一部に対して特に利益がある事件」の該当性は verdict-level の外部入力事実として扱います（認定のための内部関数は作成しません）。
- 二つの特例（i）不均一の課税（ii）その一部にのみ課税は同一の許可適用判定から導かれ、同一の verdict-table 判定により両特例が同時に成立することもあります（.bothAllowed クラス）。
- 地方団体でない場合・利益がない場合の不適用は本 PR の対象外ではありません（non-applicable クラス明示）。
- Act art. 2（地方団体の課税権）、Act art. 4・5（各課税の対象）、Act art. 3（条例要件）、後続条目（附則・各税目）は未対応。
- JapanTaxLaw/LocalPrivilegeSpec.lean で独立仕様を維持し、健全性・整合性の定理を証明しています（後述）。

### 地方税法第24条（道府県民税の納税義務者等・actor-scope）

JapanTaxLaw/LocalObligor.lean では、地方税法（昭和二十五年法律第二百二十六号・現行2026-11-01付施行版）第二十四条第1項（道府県民税の納税義務者等）の actor 分類、すなわち適用主体の判定を行う部分を形式化します（第5号〜第7号（利子割・配当割・株式等譲渡所得割）の withholding 系統および第2項以降は本PRでは未対応）。

- Act art. 24(1) の五類型を分類します：
  - 一（道府県内に住所を有する個人） → `.equalAndIncome`（均等割＋所得割）
  - 二（事務所等を有する個人で住所を有しない者） → `.equalOnlyIndividual`（均等割のみ）
  - 三（道府県内に事務所又は事業所を有する法人） → `.equalPlusCorporate`（均等割＋法人税割）
  - 四（道府県内に寮等を有する法人で事務所又は事業所を有しないもの） → `.equalOnlyDormitory`（均等割のみ）
  - 四の二（法人課税信託の引受けにより法人税を課される個人で事務所等を有するもの） → `.corporateOnly`（法人税割のみ）
- 複数類型が同時に確立する場合は `.multipleApplicable` を返します（法人と個人の同一人物像は存在します；立法上の優先順位規則はモデル化していません）。
- 認定はverdict-levelの外部入力事実として扱います（住所・事務所・寮等の内部認定関数は作成しません）。
- 対象外（未対応）：第5号（利子割）〜第7号（株式等譲渡所得割）の withholding トラック、第2項〜第9項（みなし規定・収益事業の範囲（政令委任）・人格のない社団等のみなし法人・外国法人の恒久的施設＝事務所/事業所 みなし・一般事業法人の均等割判定・住民基本台帳法参照の記録）、利子割・配当割の実際の処理。
- ドキュメント化した既知の限界（LocalObligor.lean の module docstring 参照）：Act art. 24(2) 以降との優先関係、item 一と item 四の二の重複（同一人物）に対する課税方式の取捨選択は法律解釈問題であり、本PRでは解決しません（PHASE E の横断検証範囲として記録）。
- JapanTaxLaw/LocalObligorSpec.lean で独立仕様を維持し、健全性・整合性の定理を証明しています（後述）。

### 地方税法第6条（公益等に因る課税免除及び不均一課税）

JapanTaxLaw/LocalExemption.lean では、地方税法（昭和二十五年法律第二百二十六号・現行2026-11-01付施行版）第六条（地方団体は、公益上その他の事由に因り課税を不適当とする場合においては、課税をしないことができる／同条第2項：不均一の課税をすることができる）の二項を形式化します。Act art. 7 （受益に因る加重・減免） 及び art. 24 （都道府県税の普通税目・目的税目の枠割と課税免除）・関連する行政規則・市町村税条例は本PRでは**未対応**です。

- 適用対象：地方団体（都道府県・市町村・特別区等）が、公益上その他の事由に因り（i）課税をしないことができる（ii）不均一の課税をすることができる。両項は別件の異なる規定（"課税しないことができる"と "不均一の課税をすることができる"）として各々 verdict 判定を分離する。
- 公益上の事由に因り課税を不適当とする場合は一時的な政策委託ではなく、地方団体の立法裁量と地方税条例による具体的な特定条件も含む。本モデルは verdict-level の規則モデルであり、実際の特定政策条件（防災避難施設、半ば非課税の建物等）へのマッピングは未対応。
- 不均一課税の実際の計算方法（差し替え税率・差し引き比例課税等）は本PRの対象外。
- JapanTaxLaw/LocalExemptionSpec.lean で独立仕様を維持し、健全性・整合性の定理を証明しています（後述）。

### 相続税法第1条の3（相続税の納税義務者・actor-scope）

JapanTaxLaw/InheritanceTaxActor.lean では、相続税法（昭和二十五年法律第七十三号・現行2026-04-01付施行版）第1条の3（相続税の納税義務者）のうち、第一項第一号イほぼ全般（「一時居住者でない個人」が施行地に住所を有し、又は遺贈等により財産を取得した者）を形式化します。

- Act art. 1の3 第一項 一号 イ「一時居住者でない個人」が施行地に住所を有する場合を含む、ほぼこのアウトラインで主にモデル化。
- 居住者側の判定関数（`isResidentCompliantIndividual`）は、`isIndividual ∧ isResidentInJapanAtAcquisition ∧ isNotTemporaryResident` の `and` 結合。
- 取得行為（`acquiredThroughInheritanceOrBequest`）は外部判定事実として入力し、騙し口のように「推定」や「みなし相続財産（第3条）」の内部判定は別モジュールとします。
- 施行地の該当性・相続開始時期・一時居住者の定義（第1条の3第三項一号「相続開始の時において在留資格を有する者にして当該相続の開始前十五年以内においてこの法律の施行地に住所を有していた期間の合計が十年以下であるもの」）は Act art. 1の3第三項参考ですが、本モデルでは双方向 verdict を制約しない外部入力事実として持ちます。
- Act art. 1の3 第一項 一号 ロ（一時居住者である個人で、被相続人が外国人被相続人又は非居住被相続人である場合を除く。）、二号〜五号、第二項「所得税法第百三十七条の二／百三十七条の三の規定の適用がある場合における納税猶予者のみなし住所規則」は未対応です。
- Act art. 1の3 第3項の解釈規定（「一時居住者」「外国人被相続人」「非居住被相続人」を定義する規定）も本PRでは未対応。
- Act art. 1の3 第二項・第三項特別規定、Act art. 66 （相続税額の加算） 及び類似規定等は対象外です。
- JapanTaxLaw/InheritanceTaxActorSpec.lean で独立仕様を維持し、健全性・整合性の定理を証明しています（後述）。

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
JapanTaxLaw/TaxRounding.lean        # 国税通則法 第118/119条（課税標準・確定金額の端数切り捨て）
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
JapanTaxLaw/InheritanceTaxActor.lean      # 相続税法 第1条の3 anchor（納税義務者・施行地住所）
JapanTaxLaw/InheritanceTaxActorSpec.lean  # Act art.1の3 actor anchor の独立仕様・健全性・整合性定理
JapanTaxLaw/InheritanceTaxActorTests.lean # Act art.1の3 anchor の退行テスト 18件
JapanTaxLaw/LocalExemption.lean        # 地方税法 第6条 （公益等に因る課税免除及び不均一課税）
JapanTaxLaw/LocalExemptionSpec.lean    # Act art.6 の独立仕様・健全性・整合性定理
JapanTaxLaw/LocalExemptionTests.lean   # Act art.6 の退行テスト 15件
JapanTaxLaw/LocalPrivilege.lean      # 地方税法 第7条 （受益に因る不均一課税及び一部課税）
JapanTaxLaw/LocalPrivilegeSpec.lean  # Act art.7 の独立仕様・健全性・整合性定理
JapanTaxLaw/LocalPrivilegeTests.lean # Act art.7 の退行テスト 12件
JapanTaxLaw/LocalObligor.lean         # 地方税法 第24条第1項 actor scope（一〜四の二）
JapanTaxLaw/LocalObligorSpec.lean     # Act art.24(1) actor anchor の独立仕様・健全性・整合性定理
JapanTaxLaw/LocalObligorTests.lean    # Act art.24(1) の退行テスト 17件
JapanTaxLaw/IndividualIncomeTax.lean      # 所得税法 第89条(税率) L4 税額計算モデル
JapanTaxLaw/IndividualIncomeTaxSpec.lean  # art. 89 の独立定式・端点検証（総還元表・経路表）
JapanTaxLaw/IndividualIncomeTaxTests.lean # art. 89 の退行テスト
JapanTaxLaw/CorporateTaxRate.lean      # 法人税法 第66条（税率） L4 税額計算モデル
JapanTaxLaw/CorporateTaxRateSpec.lean  # 第66条 の独立定式・端点/サンプル点検証
JapanTaxLaw/CorporateTaxRateTests.lean # 第66条 の退行テスト
JapanTaxLaw/InheritanceTax.lean      # 相続税法 第15/16/17条 L4 税額計算モデル
JapanTaxLaw/InheritanceTaxSpec.lean  # art. 15/16 の独立定式・端点検証
JapanTaxLaw/InheritanceTaxTests.lean # art. 15/16 の退行テスト
JapanTaxLaw/ConsumptionTaxRate.lean      # 消費税法 第29条（税率）L4 税額計算モデル
JapanTaxLaw/ConsumptionTaxRateSpec.lean  # art. 29 の独立定式・端点検証
JapanTaxLaw/ConsumptionTaxRateTests.lean # art. 29 の退行テスト
JapanTaxLaw/GiftTax.lean      # 相続税法 第21条の5/21条の7 L4 税額計算モデル
JapanTaxLaw/GiftTaxSpec.lean  # art. 21-7 の独立定式・端点検証
JapanTaxLaw/GiftTaxTests.lean # art. 21-7 の退行テスト
JapanTaxLaw/StampDuty.lean      # 印紙税法 第20条（過怠税）L4 計算モデル
JapanTaxLaw/StampDutySpec.lean  # art. 20 の独立定式・端点検証
JapanTaxLaw/StampDutyTests.lean # art. 20 の退行テスト
JapanTaxLaw/InheritanceSurcharge.lean      # 相続税法 第18条（相続税額の加算）L4 計算モデル
JapanTaxLaw/InheritanceSurchargeSpec.lean  # art. 18 の独立定式・端点検証
JapanTaxLaw/InheritanceSurchargeTests.lean # art. 18 の退行テスト
JapanTaxLaw/InheritanceSuccessiveDeduction.lean      # 相続税法 第20条（相次相続控除）L4 計算モデル
JapanTaxLaw/InheritanceSuccessiveDeductionSpec.lean  # art. 20 の独立定式・端点検証
JapanTaxLaw/InheritanceSuccessiveDeductionTests.lean # art. 20 の退行テスト
JapanTaxLaw/SpouseRelief.lean      # 相続税法 第19条の2（配偶者軽減）L4 計算モデル
JapanTaxLaw/SpouseReliefSpec.lean  # art. 19-2 の独立定式・端点検証
JapanTaxLaw/SpouseReliefTests.lean # art. 19-2 の退行テスト
JapanTaxLaw/CorporateSurtax.lean      # 法人税法 第67条（特定同族会社の特別税率）L4 計算モデル
JapanTaxLaw/CorporateSurtaxSpec.lean  # art. 67 の独立定式・端点検証
JapanTaxLaw/CorporateSurtaxTests.lean # art. 67 の退行テスト
JapanTaxLaw/GiftAddBack.lean      # 相続税法 第19条（相続開始前7年以内の贈与加算）L4 計算モデル
JapanTaxLaw/GiftAddBackSpec.lean  # art. 19 の独立定式・端点検証
JapanTaxLaw/GiftAddBackTests.lean # art. 19 の退行テスト
JapanTaxLaw/SpousalGiftDeduction.lean      # 相続税法 第21条の6（贈与税の配偶者控除）L4 計算モデル
JapanTaxLaw/SpousalGiftDeductionSpec.lean  # art. 21-6 の独立定式・端点検証
JapanTaxLaw/SpousalGiftDeductionTests.lean # art. 21-6 の退行テスト
JapanTaxLaw/StampTable.lean      # 印紙税法 別表第一 第一〜三号（契約書・請負・手形）L4 税率表モデル
JapanTaxLaw/StampTableSpec.lean  # 別表第一 第一〜三号の独立定式・表駆動検証
JapanTaxLaw/StampTableTests.lean # 別表第一 第一〜三号の退行テスト
JapanTaxLaw/RegistrationTax.lean      # 登録免許税法 別表第一（一）不動産の登記の定率項目 L4 モデル
JapanTaxLaw/RegistrationTaxSpec.lean  # 別表第一（一）の独立定式・端点検証
JapanTaxLaw/RegistrationTaxTests.lean # 別表第一（一）/ art. 15・18・19 の退行テスト
JapanTaxLaw/LocalIncomeTax.lean      # 地方税法 道府県民税 art. 34(2)基礎控除・(1)十号配偶者控除・art. 35 所得割の税率
JapanTaxLaw/LocalIncomeTaxSpec.lean  # art. 34(2)/(1)十号/art. 35 の独立定式・端点検証
JapanTaxLaw/LocalIncomeTaxTests.lean # art. 34(2)/(1)十号/art. 35 の退行テスト
JapanTaxLaw/LocalInhabitantTax.lean      # 地方税法 市町村民税 art. 314の3（所得割の税率 6%/8%）L4 モデル
JapanTaxLaw/LocalInhabitantTaxSpec.lean  # art. 314の3 の独立定式・端点検証
JapanTaxLaw/LocalInhabitantTaxTests.lean # art. 314の3 の退行テスト
JapanTaxLaw/DeemedCapitalGainsCost.lean      # 租税特別措置法 art. 31の4（長期譲渡所得 概算取得費控除）L4 モデル
JapanTaxLaw/DeemedCapitalGainsCostSpec.lean  # art. 31の4 の独立定式・端点検証
JapanTaxLaw/DeemedCapitalGainsCostTests.lean # art. 31の4 の退行テスト
JapanTaxLaw/RegistrationCommercialTax.lean      # 登録免許税法 別表第一（二）第二十四号（一）イ（株式会社設立登記）L4 モデル
JapanTaxLaw/RegistrationCommercialTaxSpec.lean  # 別表第一（二）第二十四号（一）イ の独立定式・端点検証
JapanTaxLaw/RegistrationCommercialTaxTests.lean # 別表第一（二）第二十四号（一）イ の退行テスト
JapanTaxLaw/PhaseECorpRates.lean        # Phase E: 法人税法 art. 66 ↔ 租税特別措置法 art. 67の2/68 の法人税率クロスロー整合性検査
JapanTaxLaw/PhaseECorpRatesSpec.lean    # 同上 独立定式
JapanTaxLaw/PhaseECorpRatesTests.lean   # 同上 退行テスト
JapanTaxLaw/SpecialGiftRate.lean        # Phase E: 租税特別措置法 art. 70の2の5 ↔ 相続税法 art. 21-7 の贈与税率クロスロー整合性検査
JapanTaxLaw/SpecialGiftRateSpec.lean    # 同上 独立定式
JapanTaxLaw/SpecialGiftRateTests.lean   # 同上 退行テスト
JapanTaxLaw/SpecialGiftRateDomination.lean  # Phase E: 成立済み — art. 70の2の5 特別表 ≤ 相続税法 art. 21-7 一般表 の普遍支配定理 `specialGiftPortionTax_le_giftPortionTax`（pure-Nat 展開 + 9区間 `omega`、`grind`不使用）
JapanTaxLaw/StampDutySpecial91.lean      # Phase E: 租税特別措置法 art. 91(1),(2) ↔ 印紙税法 別表第一第一号/第二号 の印紙税率クロスロー整合性検査
JapanTaxLaw/StampDutySpecial91Spec.lean  # 同上 独立定式
JapanTaxLaw/StampDutySpecial91Tests.lean # 同上 退行テスト
JapanTaxLaw/InheritanceMinorDisabledDeduction.lean      # 相続税法 art. 19-3/19-4（未成年者控除・障害者控除）L4 モデル
JapanTaxLaw/InheritanceMinorDisabledDeductionSpec.lean  # 同上 独立定式
JapanTaxLaw/InheritanceMinorDisabledDeductionTests.lean # 同上 退行テスト
JapanTaxLaw/RegistrationCommercialTaxTable.lean  # 登録免許税法 別表第一（二）第二十四〜三十一号（ロ〜ナ・（二）/（三）外国会社・清算・SPC・投資法人・有限責任事業組合契約・投資事業有限責任組合契約・限定責任信託・個人の商業登記・船舶管理人・夫婦財産契約 等）
JapanTaxLaw/RegistrationCommercialTaxTableSpec.lean  # 同上 独立定式
JapanTaxLaw/RegistrationCommercialTaxTableTests.lean # 同上 退行テスト
JapanTaxLaw/InheritanceApportionment.lean       # 相続税法 art. 17（各相続人等の相続税額： 総額を課税価格割合で按分）L4 モデル
JapanTaxLaw/InheritanceApportionmentSpec.lean   # 同上 独立定式
JapanTaxLaw/InheritanceApportionmentTests.lean  # 同上 退行テスト
JapanTaxLaw/ResidentialTransferSpecialTax.lean      # 租税特別措置法 art. 31の3（居住用財産を譲渡した場合の長期譲渡所得の課税の特例: 百分の十／超 ¥6,000,000 + 百分の十五）L4 モデル
JapanTaxLaw/ResidentialTransferSpecialTaxSpec.lean  # 同上 独立定式
JapanTaxLaw/ResidentialTransferSpecialTaxTests.lean # 同上 退行テスト
JapanTaxLaw/ListedDividendWithholding.lean      # 租税特別措置法 art. 9の3の二（上場株式等の配当等に係る源泉徴収義務等の特例: 15/20% 税率・控除額は所得税額を限度とする）L4 モデル
JapanTaxLaw/ListedDividendWithholdingSpec.lean  # 同上 独立定式
JapanTaxLaw/ListedDividendWithholdingTests.lean # 同上 退行テスト
JapanTaxLaw/CorporateLossCarryforward.lean      # 法人税法 art. 57（欠損金の繰越し: 前十年・百分の五十上限／中小法人等の読み替え）L4 モデル
JapanTaxLaw/CorporateLossCarryforwardSpec.lean  # 同上 独立定式
JapanTaxLaw/CorporateLossCarryforwardTests.lean # 同上 退行テスト
JapanTaxLaw/LocalInsuranceDeduction.lean      # 地方税法 art. 34(1)第五号（生命保険料控除 新旧別・合計上限 ¥70,000）／第五号の三（地震保険料控除 ¥25,000）L4 モデル
JapanTaxLaw/LocalInsuranceDeductionSpec.lean  # 同上 独立定式
JapanTaxLaw/LocalInsuranceDeductionTests.lean # 同上 退行テスト
JapanTaxLaw/DisasterLossDeduction.lean      # 地方税法 art. 34(1)第一号（雑損控除: イ/ロ/ハ の閾値計算・超える金額控除）L4 モデル
JapanTaxLaw/DisasterLossDeductionSpec.lean  # 同上 独立定式
JapanTaxLaw/DisasterLossDeductionTests.lean # 同上 退行テスト
JapanTaxLaw/SocialInsuranceMutualAidDeduction.lean      # 地方税法 art. 34(1)第三号（社会保険料控除）・第四号（小規模企業共済等掛金控除）L4 モデル
JapanTaxLaw/SocialInsuranceMutualAidDeductionSpec.lean  # 同上 独立定式
JapanTaxLaw/SocialInsuranceMutualAidDeductionTests.lean # 同上 退行テスト
JapanTaxLaw/LocalDependentAndStudentSpec.lean  # LocalIncomeTax.lean 内 art. 34(1）九号（勤労学生 ¥260,000）・第十一号（特定扶養親族 ¥450,000・老人 ¥380,000）・art. 34(4）（同居直系尊属 老人扶養親族 ¥450,000）の独立定式
JapanTaxLaw/LocalDependentAndStudentTests.lean # 同上 退行テスト
JapanTaxLaw/LowAlcoholDutySpecialRate.lean       # 租税特別措置法 art. 87の2（低アルコール分の蒸留酒類等に係る酒税の税率の特例: 十一度未満 ¥100,000／十一度以上十三度未満 ¥100,000 + 10度超の一度ごとに ¥10,000／リキュールは <12°）L4 モデル
JapanTaxLaw/LowAlcoholDutySpecialRateSpec.lean  # 同上 独立定式
JapanTaxLaw/LowAlcoholDutySpecialRateTests.lean # 同上 退行テスト
JapanTaxLaw/SpouseSpecialDeduction.lean      # 地方税法 art. 34(1)第十号の二（配偶者特別控除: 帯域計算 ¥330,000／¥380,000−taper taper=¥50,000整数倍−¥30,000切下・所得¥9,000,000〜¥10,000,000 で 2/3・1/3（¥10,000 切上げ））L4 モデル
JapanTaxLaw/SpouseSpecialDeductionSpec.lean  # 同上 独立定式
JapanTaxLaw/SpouseSpecialDeductionTests.lean # 同上 退行テスト
JapanTaxLaw/RegistrationQualificationFees.lean      # 登録免許税法 別表第一（二）第三十二号 (一)〜(三十五)／三十二の二〜三十四の二（人の資格の登録若しくは認定又は技能証明： 公認会計士・行政書士・弁護士・司法書士・土地家屋調査士・税理士・技術士・公認心理師・医師歯科医師・薬剤師・保健師等・歯科衛生士・歯科技工士・救急救命士・言語聴覚士・あん摩等・柔道整復師・管理栄養士・理容師・美容師・社会福祉士・精神保健福祉士・獣医師・愛玩動物看護師・社会保険労務士・作業環境測定士・キャリアコンサルタント・計量士・情報処理安全確保支援士・弁理士・小型船舶操縦士・水先人・海事補佐人・海事代理士・航空従事者技能証明（定期運送用操縦士〜操縦技能審査員）・不動産鑑定士・一級建築士・建築基準適合判定資格者・構造計算適合判定資格者・マンション管理士・測量士・認定匿名加工／仮名加工医療情報作成事業者等・認定個人情報保護団体・警備員等登録講習機関・登録誘引情報提供機関・カジノ事業関連等・電子決済等取扱業者等／代行業者等・保険会社等・信託会社等・担保付社債信託事業・金融商品市場関連等・金融商品取引業者等・証券金融会社・貸金業・無尽業・金融サービス仲介業・資金決済関連・公認会計士等の認定/登録/認可の flat fee）L4 モデル
JapanTaxLaw/RegistrationQualificationFeesSpec.lean  # 同上 独立定式
JapanTaxLaw/RegistrationQualificationFeesTests.lean # 同上 退行テスト
JapanTaxLaw/CorporateGroupLossOffset.lean      # 法人税法 art. 64の5（損益通算: 通算対象欠損金額・通算対象所得金額 — プール×割合配分）L4 モデル
JapanTaxLaw/CorporateGroupLossOffsetSpec.lean  # 同上 独立定式
JapanTaxLaw/CorporateGroupLossOffsetTests.lean # 同上 退行テスト
JapanTaxLaw/ConsumptionTaxableBase.lean          # 消費税法 art. 28(1)(2)(3)（課税標準: 対価の額・著しく低い役員譲渡は資産の価額・特定課税仕入れは支払対価・消費/使用/贈与は資産の価額）L4 モデル
JapanTaxLaw/ConsumptionTaxableBaseSpec.lean      # 同上 独立定式
JapanTaxLaw/ConsumptionTaxableBaseTests.lean     # 同上 退行テスト
JapanTaxLaw/ConsumptionTaxImportBase.lean        # 消費税法 art. 28(4)（輸入課税貨物の課税標準: 関税定率法に準じた価格＋附帯税除き消費税等＋附帯税除き関税）L4 モデル
JapanTaxLaw/ConsumptionTaxImportBaseSpec.lean    # 同上 独立定式
JapanTaxLaw/ConsumptionTaxImportBaseTests.lean   # 同上 退行テスト
JapanTaxLaw/ConsumptionTaxInputCredit.lean          # 消費税法 art. 30(1)（仕入れに係る消費税額の控除: 課税標準額に対する消費税額から課税仕入れ税額＋特定課税仕入れ税額（支払対価×7.8%）＋保税貨物税額を控除）L4 モデル
JapanTaxLaw/ConsumptionTaxInputCreditSpec.lean      # 同上 独立定式
JapanTaxLaw/ConsumptionTaxInputCreditTests.lean     # 同上 退行テスト
JapanTaxLaw/NonpaymentSurcharge.lean                # 国税通則法 art. 67（不納付加算税: 告知税額等×10%／調査予知でない納付×5%）L4 モデル
JapanTaxLaw/NonpaymentSurchargeSpec.lean            # 同上 独立定式
JapanTaxLaw/NonpaymentSurchargeTests.lean           # 同上 退行テスト
JapanTaxLaw/UnreportedSurcharge.lean              # 国税通則法 art. 66（無申告加算税: 納付税額×15%／軽減10%／3項三段階 50万以下15%・50万超300万以下20%・300万超30%）L4 モデル
JapanTaxLaw/UnreportedSurchargeSpec.lean          # 同上 独立定式
JapanTaxLaw/UnreportedSurchargeTests.lean         # 同上 退行テスト
JapanTaxLaw/DelinquencyTax.lean                   # 国税通則法 art. 60（延滞税: 年7.3%／年14.6% の利率と「納期限の翌日から二月を経過する日まで」の期間区分 — 日割り分母は条文に明示なく未モデル化）L4 モデル
JapanTaxLaw/DelinquencyTaxSpec.lean               # 同上 独立定式
JapanTaxLaw/DelinquencyTaxTests.lean              # 同上 退行テスト
JapanTaxLaw/RefundInterest.lean                    # 国税通則法 art. 58（還付加算金: 還付金等×年7.3%（art.60低率を再利用）／差押送達翌日から7日・仮差押え期間は控除 — 日割り分母は条文に明示なく未モデル化）L4 モデル
JapanTaxLaw/RefundInterestSpec.lean                # 同上 独立定式
JapanTaxLaw/RefundInterestTests.lean               # 同上 退行テスト
JapanTaxLaw/GroupLossRatio.lean                    # 法人税法 art. 64の7（欠損金の通算: 割合 零分母→零・1超→1キャップ／非特定欠損金配賦額＝金額×割合 — 配分規定全体は未モデル化）L4 モデル
JapanTaxLaw/GroupLossRatioSpec.lean                # 同上 独立定式
JapanTaxLaw/GroupLossRatioTests.lean               # 同上 退行テスト
JapanTaxLaw/CustomsValueAfterDamage.lean          # 関税定率法 art. 4の5（変質又は損傷後の課税価格: 仮想課税価格−減価額、saturating Nat 減算・input≤output のとき正確）L4 モデル
JapanTaxLaw/CustomsValueAfterDamageSpec.lean      # 同上 独立定式
JapanTaxLaw/CustomsValueAfterDamageTests.lean     # 同上 退行テスト
JapanTaxLaw/CustomsTransactionPrice.lean        # 関税定率法 art. 4（課税価格の決定の原則: 現実支払価格＋輸入港運賃・手数料・無償提供物品役務・知財使用対価・売手帰属収益の10項目）L4 モデル
JapanTaxLaw/CustomsTransactionPriceSpec.lean    # 同上 独立定式
JapanTaxLaw/CustomsTransactionPriceTests.lean   # 同上 退行テスト
JapanTaxLaw/CustomsSimilarGoods.lean           # 関税定率法 art. 4の2（同種又は類似の貨物の取引価格による決定: 双方あるときは同種優先、なければ類似、双方なければ次の算定手段へ）L4 モデル
JapanTaxLaw/CustomsSimilarGoodsSpec.lean       # 同上 独立定式
JapanTaxLaw/CustomsSimilarGoodsTests.lean      # 同上 退行テスト
JapanTaxLaw/CustomsDomesticValue.lean          # 関税定率法 art. 4の3（国内販売価格から控除／製造原価に加算、申出で製造原価法を先立てる）L4 モデル
JapanTaxLaw/CustomsDomesticValueSpec.lean      # 同上 独立定式
JapanTaxLaw/CustomsDomesticValueTests.lean     # 同上 退行テスト
JapanTaxLaw/CustomsAirCargo.lean              # 関税定率法 art. 4の6（航空貨物の運賃等を通常运送方法に代替／携帯品・個人的使用品を卸価格みなし）L4 モデル
JapanTaxLaw/CustomsAirCargoSpec.lean          # 同上 独立定式
JapanTaxLaw/CustomsAirCargoTests.lean         # 同上 退行テスト
JapanTaxLaw/CustomsSmallConsignment.lean      # 関税定率法 art. 3の3（少額輸入貨物 20万円閾値・簡易税率の適用可否）L4 モデル
JapanTaxLaw/CustomsSmallConsignmentSpec.lean  # 同上 独立定式
JapanTaxLaw/CustomsSmallConsignmentTests.lean # 同上 退行テスト
JapanTaxLaw/CustomsExchangeRate.lean        # 関税定率法 art. 4の7（換算に用いる外国為替相場の日付選択: 輸入申告の日／関税法第五条第一号貨物は同号の日）L4 モデル
JapanTaxLaw/CustomsExchangeRateSpec.lean    # 同上 独立定式
JapanTaxLaw/CustomsExchangeRateTests.lean   # 同上 退行テスト
JapanTaxLaw/CustomsDamageReduction.lean      # 関税定率法 art. 10(1)（変質・損傷の関税軽減: 価格低下率基準／差額以内の上限）L4 モデル
JapanTaxLaw/CustomsDamageReductionSpec.lean  # 同上 独立定式
JapanTaxLaw/CustomsDamageReductionTests.lean # 同上 退行テスト
JapanTaxLaw/CustomsRetaliatoryDuty.lean    # 関税定率法 art. 6（報復関税: 別表関税のほか課税価格と同額以下の追加関税）L4 モデル
JapanTaxLaw/CustomsRetaliatoryDutySpec.lean# 同上 独立定式
JapanTaxLaw/CustomsRetaliatoryDutyTests.lean # 同上 退行テスト
JapanTaxLaw/GiftSpecialDeduction.lean      # 相続税法 art. 21の12（相続時精算課税の特別控除: min(2500万−既控除, 控除後課税価格)）L4 モデル
JapanTaxLaw/GiftSpecialDeductionSpec.lean  # 同上 独立定式
JapanTaxLaw/GiftSpecialDeductionTests.lean # 同上 退行テスト
JapanTaxLaw/InheritanceMiscRates.lean       # 相続税法 art. 21の13/26/17（相続時精算課税20%・立木評価85%・相続税額按分）L4 モデル
JapanTaxLaw/InheritanceMiscRatesSpec.lean   # 同上 独立定式
JapanTaxLaw/InheritanceMiscRatesTests.lean  # 同上 退行テスト
JapanTaxLaw/CorporateMiscRates.lean         # 法人税法 art. 87/82の5/145の12（退職年金積立金1%・国際最低課税90.7%等）L4 モデル
JapanTaxLaw/CorporateMiscRatesSpec.lean     # 同上 独立定式
JapanTaxLaw/CorporateMiscRatesTests.lean    # 同上 退行テスト
JapanTaxLaw/IncomeMiscDeductions.lean       # 所得税法 art. 80/81/82/211/209の3/182/170（寡婦・ひとり親・勤労学生控除／源泉徴収税率）L4 モデル
JapanTaxLaw/IncomeMiscDeductionsSpec.lean   # 同上 独立定式
JapanTaxLaw/IncomeMiscDeductionsTests.lean  # 同上 退行テスト
JapanTaxLaw/CustomsProcedureRates.lean    # 関税法 art. 14の5（換価代金充当の上限: 公売代金−関税に先だつ費用）L4 モデル
JapanTaxLaw/CustomsProcedureRatesSpec.lean # 同上 独立定式
JapanTaxLaw/CustomsProcedureRatesTests.lean# 同上 退行テスト
JapanTaxLaw/SpecialMeasuresMisc.lean       # 租税特別措置法 art. 36/37の15/41の10（5000万円上限・貸付信託不足額控除・給付補填金15%分離課税）L4 モデル
JapanTaxLaw/SpecialMeasuresMiscSpec.lean   # 同上 独立定式
JapanTaxLaw/SpecialMeasuresMiscTests.lean  # 同上 退行テスト
JapanTaxLaw/CorporateGlobeRates.lean       # 法人税法 art. 82の13/82の21/145の8（GloBE 90.7%/75.3%）L4 モデル
JapanTaxLaw/CorporateGlobeRatesSpec.lean   # 同上 独立定式
JapanTaxLaw/CorporateGlobeRatesTests.lean  # 同上 退行テスト
JapanTaxLaw/IncomeWithholdingRates.lean     # 所得税法 art. 208/175/179（源泉徴収: 年金×10%・利子15%配当20%・外国法人20/10/15%）L4 モデル
JapanTaxLaw/IncomeWithholdingRatesSpec.lean # 同上 独立定式
JapanTaxLaw/IncomeWithholdingRatesTests.lean# 同上 退行テスト
JapanTaxLaw/IncomeDependentDeductions.lean   # 所得税法 art. 84/186の2（扶養控除 一般38万・特定63万・老人48万）L4 モデル
JapanTaxLaw/IncomeDependentDeductionsSpec.lean # 同上 独立定式
JapanTaxLaw/IncomeDependentDeductionsTests.lean# 同上 退行テスト
JapanTaxLaw/SpecialMeasuresCasinoRatio.lean # 租税特別措置法施行令 art. 46の4（カジノ収入5%割合判定）L4 モデル
JapanTaxLaw/SpecialMeasuresCasinoRatioSpec.lean # 同上 独立定式
JapanTaxLaw/SpecialMeasuresCasinoRatioTests.lean# 同上 退行テスト
JapanTaxLaw/InheritanceAssetValuation.lean     # 相続税法 art. 23/25（地上権残存期間別割合表 5〜90%・評価額）L4 モデル
JapanTaxLaw/InheritanceAssetValuationSpec.lean # 同上 独立定式
JapanTaxLaw/InheritanceAssetValuationTests.lean# 同上 退行テスト
JapanTaxLaw/IncomeBasicDeduction.lean          # 所得税法 art. 86（基礎控除 58/48/32/16万円の4段階）L4 モデル
JapanTaxLaw/IncomeBasicDeductionSpec.lean      # 同上 独立定式
JapanTaxLaw/IncomeBasicDeductionTests.lean     # 同上 退行テスト
JapanTaxLaw/ForeignCorpResidualRate.lean       # 法人税法 art. 145の4（外国法人 国際最低課税残余額90.7%）L4 モデル
JapanTaxLaw/ForeignCorpResidualRateSpec.lean   # 同上 独立定式
JapanTaxLaw/ForeignCorpResidualRateTests.lean  # 同上 退行テスト
JapanTaxLaw/SpecialMeasuresApportionment.lean   # 租税特別措置法施行令 art. 25の18/40の5の2（按分計算）L4 モデル
JapanTaxLaw/SpecialMeasuresApportionmentSpec.lean # 同上 独立定式
JapanTaxLaw/SpecialMeasuresApportionmentTests.lean# 同上 退行テスト
JapanTaxLaw/CorpAssetCompression.lean         # 法人税法施行令 art. 79の2/82の3/83の4（固定資産圧縮限度額の按分）L4 モデル
JapanTaxLaw/CorpAssetCompressionSpec.lean     # 同上 独立定式
JapanTaxLaw/CorpAssetCompressionTests.lean    # 同上 退行テスト
JapanTaxLaw/IncomeSocialInsuranceDeduction.lean      # 所得税法 art. 74（社会保険料控除＝支払額を控除）L4 モデル
JapanTaxLaw/IncomeSocialInsuranceDeductionSpec.lean  # 同上 独立定式
JapanTaxLaw/IncomeSocialInsuranceDeductionTests.lean # 同上 退行テスト
JapanTaxLaw/RegistryRealEstateFeesP1A.lean        # 登録免許税法 別表第一（一）(一)〜(五) 不動産登記手数料 L4 モデル
JapanTaxLaw/RegistryRealEstateFeesP1ASpec.lean    # 同上 独立定式
JapanTaxLaw/RegistryRealEstateFeesP1ATests.lean   # 同上 退行テスト
JapanTaxLaw/RegistryRealEstateFeesP1B.lean        # 登録免許税法 別表第一（一）(六)〜(十) L4 モデル
JapanTaxLaw/RegistryRealEstateFeesP1BSpec.lean    # 同上 独立定式
JapanTaxLaw/RegistryRealEstateFeesP1BTests.lean   # 同上 退行テスト
JapanTaxLaw/RegistryRealEstateFeesP1C.lean        # 登録免許税法 別表第一（一）(十一)〜(十五) 仮登記等 L4 モデル
JapanTaxLaw/RegistryRealEstateFeesP1CSpec.lean    # 同上 独立定式
JapanTaxLaw/RegistryRealEstateFeesP1CTests.lean   # 同上 退行テスト
JapanTaxLaw/RegistryCopyrightFees.lean       # 登録免許税法 別表第一（二）十〜十二 著作権/出版権/著作隣接権 L4 モデル
JapanTaxLaw/RegistryCopyrightFeesSpec.lean   # 同上 独立定式
JapanTaxLaw/RegistryCopyrightFeesTests.lean  # 同上 退行テスト
JapanTaxLaw/RegistryPatentFees.lean          # 登録免許税法 別表第一（二）十三〜十四 特許権/実用新案権 L4 モデル
JapanTaxLaw/RegistryPatentFeesSpec.lean      # 同上 独立定式
JapanTaxLaw/RegistryPatentFeesTests.lean     # 同上 退行テスト
JapanTaxLaw/RegistryDesignTrademarkFees.lean # 登録免許税法 別表第一（二）十五〜十七 意匠権/商標権/回路配置 L4 モデル
JapanTaxLaw/RegistryDesignTrademarkFeesSpec.lean # 同上 独立定式
JapanTaxLaw/RegistryDesignTrademarkFeesTests.lean # 同上 退行テスト
JapanTaxLaw/RegistryShipFees.lean            # 登録免許税法 別表第一（二）二 船舶の登記 L4 モデル
JapanTaxLaw/RegistryShipFeesSpec.lean        # 同上 独立定式
JapanTaxLaw/RegistryShipFeesTests.lean       # 同上 退行テスト
JapanTaxLaw/RegistryPropertyRightsFees.lean  # 登録免許税法 別表第一（二）四〜四の四 ダム使用権等 L4 モデル
JapanTaxLaw/RegistryPropertyRightsFeesSpec.lean  # 同上 独立定式
JapanTaxLaw/RegistryPropertyRightsFeesTests.lean # 同上 退行テスト
JapanTaxLaw/RegistryCorporateSecurityFees.lean   # 登録免許税法 別表第一（二）六〜九 企業担保権等 L4 モデル
JapanTaxLaw/RegistryCorporateSecurityFeesSpec.lean   # 同上 独立定式
JapanTaxLaw/RegistryCorporateSecurityFeesTests.lean  # 同上 退行テスト
JapanTaxLaw/RegistryMiningFees.lean            # 登録免許税法 別表第一（二）十九〜二十二の二 鉱業権等 L4 モデル
JapanTaxLaw/RegistryMiningFeesSpec.lean        # 同上 独立定式
JapanTaxLaw/RegistryMiningFeesTests.lean       # 同上 退行テスト
JapanTaxLaw/RegistryForeignCompanyFees.lean     # 登録免許税法 別表第一（二）二十二〜二十五 外国会社等 L4 モデル
JapanTaxLaw/RegistryForeignCompanyFeesSpec.lean # 同上 独立定式
JapanTaxLaw/RegistryForeignCompanyFeesTests.lean# 同上 退行テスト
JapanTaxLaw/RegistryTrustMarriageFees.lean      # 登録免許税法 別表第一（二）二十六〜三十一 信託・夫婦財産契約等 L4 モデル
JapanTaxLaw/RegistryTrustMarriageFeesSpec.lean  # 同上 独立定式
JapanTaxLaw/RegistryTrustMarriageFeesTests.lean # 同上 退行テスト
JapanTaxLaw/RegistryQualificationFeesJ1.lean        # 登録免許税法 別表第一（二）三十三〜三十八 L4 モデル
JapanTaxLaw/RegistryQualificationFeesJ1Spec.lean    # 同上 独立定式
JapanTaxLaw/RegistryQualificationFeesJ1Tests.lean   # 同上 退行テスト
JapanTaxLaw/RegistryQualificationFeesJ2.lean        # 登録免許税法 別表第一（二）三十九〜四十九 L4 モデル
JapanTaxLaw/RegistryQualificationFeesJ2Spec.lean    # 同上 独立定式
JapanTaxLaw/RegistryQualificationFeesJ2Tests.lean   # 同上 退行テスト
JapanTaxLaw/RegistryQualificationFeesJ3.lean        # 登録免許税法 別表第一（二）五十〜五十九 L4 モデル
JapanTaxLaw/RegistryQualificationFeesJ3Spec.lean    # 同上 独立定式
JapanTaxLaw/RegistryQualificationFeesJ3Tests.lean   # 同上 退行テスト
JapanTaxLaw/LocalTaxLightOilQuantity.lean          # 地方税法施行令 art. 43の13（軽油引取数量の減少）L4 モデル
JapanTaxLaw/LocalTaxLightOilQuantitySpec.lean      # 同上 独立定式
JapanTaxLaw/LocalTaxLightOilQuantityTests.lean     # 同上 退行テスト
JapanTaxLaw/LocalTaxVehicleSnowRate.lean           # 地方税法施行令 art. 44の3（自動車税の積雪軽減）L4 モデル
JapanTaxLaw/LocalTaxVehicleSnowRateSpec.lean       # 同上 独立定式
JapanTaxLaw/LocalTaxVehicleSnowRateTests.lean      # 同上 退行テスト
JapanTaxLaw/LocalTaxInsuranceEstimate.lean         # 地方税法施行令 art. 56の89の6（国保税額の月割見込）L4 モデル
JapanTaxLaw/LocalTaxInsuranceEstimateSpec.lean     # 同上 独立定式
JapanTaxLaw/LocalTaxInsuranceEstimateTests.lean    # 同上 退行テスト
JapanTaxLaw/LocalTaxOrderRate99A.lean          # 地方税法施行令 art. 9の14/9の18（99%）L4 モデル
JapanTaxLaw/LocalTaxOrderRate99ASpec.lean      # 同上 独立定式
JapanTaxLaw/LocalTaxOrderRate99ATests.lean     # 同上 退行テスト
JapanTaxLaw/LocalTaxOrderRate77.lean           # 地方税法施行令 art. 9の22/35の4の5（99%・7.7%）L4 モデル
JapanTaxLaw/LocalTaxOrderRate77Spec.lean       # 同上 独立定式
JapanTaxLaw/LocalTaxOrderRate77Tests.lean      # 同上 退行テスト
JapanTaxLaw/SpecialOrderCapitalGainDeduction.lean    # 租税特別措置法施行令 art. 24（譲渡所得特別控除5000万円上限）L4 モデル
JapanTaxLaw/SpecialOrderCapitalGainDeductionSpec.lean # 同上 独立定式
JapanTaxLaw/SpecialOrderCapitalGainDeductionTests.lean # 同上 退行テスト
JapanTaxLaw/LocalTaxMedicalIncomeRatio.lean        # 地方税法施行令 art. 21の8（医療収入割合≤3/10）L4 モデル
JapanTaxLaw/LocalTaxMedicalIncomeRatioSpec.lean    # 同上 独立定式
JapanTaxLaw/LocalTaxMedicalIncomeRatioTests.lean   # 同上 退行テスト
JapanTaxLaw/LocalTaxOfficeApportionment.lean       # 地方税法施行令 art. 56の50（事業所税の床面積按分）L4 モデル
JapanTaxLaw/LocalTaxOfficeApportionmentSpec.lean   # 同上 独立定式
JapanTaxLaw/LocalTaxOfficeApportionmentTests.lean  # 同上 退行テスト
JapanTaxLaw/SpecialOrderPensionMinimum.lean        # 租税特別措置法施行令 art. 26の27（公的年金控除最低額118/168/90万円）L4 モデル
JapanTaxLaw/SpecialOrderPensionMinimumSpec.lean    # 同上 独立定式
JapanTaxLaw/SpecialOrderPensionMinimumTests.lean   # 同上 退行テスト
JapanTaxLaw/InheritanceAnnuityValuation.lean        # 相続税法 art. 25（定期金給付契約の権利の評価: 基礎額×90%／解約返戻金）L4 モデル
JapanTaxLaw/InheritanceAnnuityValuationSpec.lean    # 同上 独立定式
JapanTaxLaw/InheritanceAnnuityValuationTests.lean   # 同上 退行テスト
JapanTaxLaw/TaxCollectionNextBid.lean              # 国税徴収法 art. 104の2（次順位買受申込者の決定: 下限＝max(見積, 最高−保証金)）L4 モデル
JapanTaxLaw/TaxCollectionNextBidSpec.lean          # 同上 独立定式
JapanTaxLaw/TaxCollectionNextBidTests.lean         # 同上 退行テスト
JapanTaxLaw/InheritanceAnnuityMaxima.lean          # 相続税法 art. 24(1) 一号〜三号（定期金 max 構造）L4 モデル
JapanTaxLaw/InheritanceAnnuityMaximaSpec.lean      # 同上 独立定式
JapanTaxLaw/InheritanceAnnuityMaximaTests.lean     # 同上 退行テスト
JapanTaxLaw/InheritanceAnnuityMinMax.lean          # 相続税法 art. 24(1)四号/24(3)(4)（一時金・min/max）L4 モデル
JapanTaxLaw/InheritanceAnnuityMinMaxSpec.lean      # 同上 独立定式
JapanTaxLaw/InheritanceAnnuityMinMaxTests.lean     # 同上 退行テスト
JapanTaxLaw/InheritanceAnnuityDeathException.lean  # 相続税法 art. 24(2)(5)（死亡特例・準用は NOT MODELLED）L4 モデル
JapanTaxLaw/InheritanceAnnuityDeathExceptionSpec.lean  # 同上 独立定式
JapanTaxLaw/InheritanceAnnuityDeathExceptionTests.lean # 同上 退行テスト
JapanTaxLaw/RegistrationQualificationFeesP2A.lean        # 登録免許税法 別表第三十二号 五十九〜六十八（信書便・消防検定・債権回収・通関・酒類・たばこ・塩・著作権等 登録/免許/許可）flat fee L4 モデル
JapanTaxLaw/RegistrationQualificationFeesP2ASpec.lean    # 同上 独立定式
JapanTaxLaw/RegistrationQualificationFeesP2ATests.lean   # 同上 退行テスト
JapanTaxLaw/RegistrationQualificationFeesP2B.lean        # 登録免許税法 別表第三十二号 六十九〜七十五（放射性同位元素・研究施設・水道・食品検査・採血・臓器あつせん 登録/認可/許可）flat fee L4 モデル
JapanTaxLaw/RegistrationQualificationFeesP2BSpec.lean    # 同上 独立定式
JapanTaxLaw/RegistrationQualificationFeesP2BTests.lean   # 同上 退行テスト
JapanTaxLaw/RegistrationQualificationFeesP3C.lean        # 登録免許税法 別表第三十二号 七十六〜八十二（精神保健指定医・医薬品医療機器14件・特定細胞加工物・有料職業紹介等）flat fee L4 モデル
JapanTaxLaw/RegistrationQualificationFeesP3CSpec.lean    # 同上 独立定式
JapanTaxLaw/RegistrationQualificationFeesP3CTests.lean   # 同上 退行テスト
JapanTaxLaw/RegistrationQualificationFeesP3D.lean        # 登録免許税法 別表第三十二号 八十三〜八十九（労働安全衛生・作業環境測定・卸売市場・農産物検査・JAS・肥料・特定飼料）flat fee L4 モデル
JapanTaxLaw/RegistrationQualificationFeesP3DSpec.lean    # 同上 独立定式
JapanTaxLaw/RegistrationQualificationFeesP3DTests.lean   # 同上 退行テスト
JapanTaxLaw/RegistrationQualificationFeesP4E.lean        # 登録免許税法 別表第三十二号 九十〜九十六（食品循環資源・農林漁業民宿・木材・馬主・農林中央金庫代理業・電子決済代行・商品取引所等）flat fee L4 モデル
JapanTaxLaw/RegistrationQualificationFeesP4ESpec.lean    # 同上 独立定式
JapanTaxLaw/RegistrationQualificationFeesP4ETests.lean   # 同上 退行テスト
JapanTaxLaw/RegistrationQualificationFeesP4F.lean        # 登録免許税法 別表第三十二号 九十七〜百二（石油パイプライン・石油輸入・揮発油・LPガス・ガス小売・高圧ガス・熱供給）flat fee L4 モデル
JapanTaxLaw/RegistrationQualificationFeesP4FSpec.lean    # 同上 独立定式
JapanTaxLaw/RegistrationQualificationFeesP4FTests.lean   # 同上 退行テスト
JapanTaxLaw/RegistrationQualificationFeesP5G.lean        # 登録免許税法 別表第三十二号 百三〜百十（熱供給・小売電気・登録電気工事・エネルギー消費性能判定・工業用水道・深海底鉱業・アルコール事業等）flat fee L4 モデル
JapanTaxLaw/RegistrationQualificationFeesP5GSpec.lean    # 同上 独立定式
JapanTaxLaw/RegistrationQualificationFeesP5GTests.lean   # 同上 退行テスト
JapanTaxLaw/RegistrationQualificationFeesP5H.lean        # 登録免許税法 別表第三十二号 百十一〜百十九（電気用品検査・JIS認証・計量器校正・工業所有権・前払式割賦販売・フロン類再生・鉄道事業等）flat fee L4 モデル
JapanTaxLaw/RegistrationQualificationFeesP5HSpec.lean    # 同上 独立定式
JapanTaxLaw/RegistrationQualificationFeesP5HTests.lean   # 同上 退行テスト
JapanTaxLaw/RegistrationQualificationFeesP6I.lean        # 登録免許税法 別表第三十二号 百二十〜百二十四（鉄道・索道・軌道・運河開設・港湾技術基準・船舶製造施設等）flat fee L4 モデル
JapanTaxLaw/RegistrationQualificationFeesP6ISpec.lean    # 同上 独立定式
JapanTaxLaw/RegistrationQualificationFeesP6ITests.lean   # 同上 退行テスト
JapanTaxLaw/RegistrationQualificationFeesP6J.lean        # 登録免許税法 別表第三十二号 百二十五〜百二十九（船舶製造工事認定・海洋汚染防止・船舶保安・再資源化・船舶運航事業）flat fee L4 モデル
JapanTaxLaw/RegistrationQualificationFeesP6JSpec.lean    # 同上 独立定式
JapanTaxLaw/RegistrationQualificationFeesP6JTests.lean   # 同上 退行テスト
JapanTaxLaw/RegistrationQualificationFeesP7K.lean        # 登録免許税法 別表第三十二号 百三十〜百三十四（船舶安全法認定・海洋汚染防止・船舶保安・船舶運航・港湾運送）flat fee L4 モデル
JapanTaxLaw/RegistrationQualificationFeesP7KSpec.lean    # 同上 独立定式
JapanTaxLaw/RegistrationQualificationFeesP7KTests.lean   # 同上 退行テスト
JapanTaxLaw/RegistrationQualificationFeesP7L.lean        # 登録免許税法 別表第三十二号 百三十五〜百三十九（内航海運・船舶職員・船員派遣・航空法許可・無人航空機・貨物利用運送）flat fee L4 モデル
JapanTaxLaw/RegistrationQualificationFeesP7LSpec.lean    # 同上 独立定式
JapanTaxLaw/RegistrationQualificationFeesP7LTests.lean   # 同上 退行テスト
JapanTaxLaw/RegistrationQualificationFeesP8M.lean        # 登録免許税法 別表第三十二号 百四十〜百五十一（証券金融・貸金業・資金決済関連・監査法人・宅建業・マンション管理業等）flat fee L4 モデル
JapanTaxLaw/RegistrationQualificationFeesP8MSpec.lean    # 同上 独立定式
JapanTaxLaw/RegistrationQualificationFeesP8MTests.lean   # 同上 退行テスト
JapanTaxLaw/RegistrationQualificationFeesP8N.lean        # 登録免許税法 別表第三十二号 百五十二〜百五十九（測量業・住宅性能評価・建築物エネルギー消費性能・廃棄物再生利用・希少野生動植物登録機関等）flat fee L4 モデル
JapanTaxLaw/RegistrationQualificationFeesP8NSpec.lean    # 同上 独立定式
JapanTaxLaw/RegistrationQualificationFeesP8NTests.lean   # 同上 退行テスト
JapanTaxLaw/LandValueTaxRate.lean              # 地価税法 art. 22/23（課税価格−基礎控除×千分の3、評価の原則は NOT MODELLED）L4 モデル
JapanTaxLaw/LandValueTaxRateSpec.lean          # 同上 独立定式
JapanTaxLaw/LandValueTaxRateTests.lean         # 同上 退行テスト
JapanTaxLaw/LocalCorporationTaxRate.lean       # 地方法人税法 art. 10（課税標準×103/1000、加算額控除）L4 モデル
JapanTaxLaw/LocalCorporationTaxRateSpec.lean   # 同上 独立定式
JapanTaxLaw/LocalCorporationTaxRateTests.lean  # 同上 退行テスト
JapanTaxLaw/SpouseResidenceValuation.lean      # 相続税法 art. 23の2（配偶者居住権の評価）L4 モデル
JapanTaxLaw/SpouseResidenceValuationSpec.lean  # 同上 独立定式
JapanTaxLaw/SpouseResidenceValuationTests.lean # 同上 退行テスト
JapanTaxLaw/PublicPensionWithholding.lean       # 所得税法 art. 203の3（公的年金源泉徴収 5%/超過10%）L4 モデル
JapanTaxLaw/PublicPensionWithholdingSpec.lean   # 同上 独立定式
JapanTaxLaw/PublicPensionWithholdingTests.lean  # 同上 退行テスト
JapanTaxLaw/SpecialLandHoldingTax.lean          # 地方税法 art. 596（特別土地保有税）L4 モデル
JapanTaxLaw/SpecialLandHoldingTaxSpec.lean      # 同上 独立定式
JapanTaxLaw/SpecialLandHoldingTaxTests.lean     # 同上 退行テスト
JapanTaxLaw/RetainedAmountLocalTax.lean         # 法人税法施行令 art. 139の10（留保金額地方税控除）L4 モデル
JapanTaxLaw/RetainedAmountLocalTaxSpec.lean     # 同上 独立定式
JapanTaxLaw/RetainedAmountLocalTaxTests.lean    # 同上 退行テスト
JapanTaxLaw/CounterexampleSweep.lean  # L6: マージ済み L4 全モデル × Spec の有限領域反例バウンド検査（decide）
JapanTaxLaw/TaxProcedure.lean      # 国税通則法 第2条第10号（強制換価手続）
JapanTaxLaw/TaxProcedureSpec.lean  # Act art.2(10) の独立仕様・健全性・整合性定理
JapanTaxLaw/TaxProcedureTests.lean # Act art.2(10) の退行テスト 12件
JapanTaxLaw/BusinessOwnerDeduction.lean       # 地方税法 art.72の49の14（事業主控除290万円・月割）L4 モデル
JapanTaxLaw/BusinessOwnerDeductionSpec.lean   # 同上 独立定式
JapanTaxLaw/BusinessOwnerDeductionTests.lean  # 同上 退行テスト
JapanTaxLaw/StandardRateExcessRatio.lean      # 地方税法施行令 art.35の4の6（標準税率超過率）L4 モデル
JapanTaxLaw/StandardRateExcessRatioSpec.lean  # 同上 独立定式
JapanTaxLaw/StandardRateExcessRatioTests.lean # 同上 退行テスト
JapanTaxLaw/IntermediateSurchargeRefund.lean  # 地方税法施行令 art.26（延滞金還付）L4 モデル
JapanTaxLaw/IntermediateSurchargeRefundSpec.lean  # 同上 独立定式
JapanTaxLaw/IntermediateSurchargeRefundTests.lean # 同上 退行テスト
JapanTaxLaw/IncomeAdjustmentDeduction.lean       # 租税特別措置法 art.41の3の11（所得金額調整控除）L4 モデル
JapanTaxLaw/IncomeAdjustmentDeductionSpec.lean   # 同上 独立定式
JapanTaxLaw/IncomeAdjustmentDeductionTests.lean  # 同上 退行テスト
JapanTaxLaw/SpecialBaselineIncomeTax.lean        # 租税特別措置法 art.41の19（基準所得22.5%特例）L4 モデル
JapanTaxLaw/SpecialBaselineIncomeTaxSpec.lean    # 同上 独立定式
JapanTaxLaw/SpecialBaselineIncomeTaxTests.lean   # 同上 退行テスト
JapanTaxLaw/DiscountBondRefund.lean              # 租税特別措置法施行令 art.26の12（割引債還付）L4 モデル
JapanTaxLaw/DiscountBondRefundSpec.lean          # 同上 独立定式
JapanTaxLaw/DiscountBondRefundTests.lean         # 同上 退行テスト
JapanTaxLaw/IncomeArt205Withholding.lean        # 所得税法 art.205（源泉徴収10%/20%）L4 モデル
JapanTaxLaw/IncomeArt205WithholdingSpec.lean    # 同上 独立定式
JapanTaxLaw/IncomeArt205WithholdingTests.lean   # 同上 退行テスト
JapanTaxLaw/InheritedPropertyTransferGain.lean  # 租税特別措置法施行令 art.25の16（相続財産譲渡所得）L4 モデル
JapanTaxLaw/InheritedPropertyTransferGainSpec.lean  # 同上 独立定式
JapanTaxLaw/InheritedPropertyTransferGainTests.lean # 同上 退行テスト
JapanTaxLaw/LightOilBaseTax.lean               # 軽油引取税法施行令 art.23の2（基準税額11,250円）L4 モデル
JapanTaxLaw/LightOilBaseTaxSpec.lean           # 同上 独立定式
JapanTaxLaw/LightOilBaseTaxTests.lean          # 同上 退行テスト
JapanTaxLaw/ConsolidationCreditLimit.lean       # 法人税法施行令 art.148（通算法人控除限度額）L4 モデル
JapanTaxLaw/ConsolidationCreditLimitSpec.lean   # 同上 独立定式
JapanTaxLaw/ConsolidationCreditLimitTests.lean  # 同上 退行テスト
JapanTaxLaw/TrustPensionReserve.lean            # 法人税法施行令 art.157（信託退職年金積立金）L4 モデル
JapanTaxLaw/TrustPensionReserveSpec.lean        # 同上 独立定式
JapanTaxLaw/TrustPensionReserveTests.lean       # 同上 退行テスト
JapanTaxLaw/ResidentTaxTransitionalRates.lean   # 地方税法施行令 art.12（市町村民税経過措置税率）L4 モデル
JapanTaxLaw/ResidentTaxTransitionalRatesSpec.lean   # 同上 独立定式
JapanTaxLaw/ResidentTaxTransitionalRatesTests.lean  # 同上 退行テスト
JapanTaxLaw/NonTaxSavingsCeiling.lean            # 所得税法施行令 art.40（非課税貯蓄申告書最高限度額）L4 モデル
JapanTaxLaw/NonTaxSavingsCeilingSpec.lean        # 同上 独立定式
JapanTaxLaw/NonTaxSavingsCeilingTests.lean       # 同上 退行テスト
JapanTaxLaw/LandValueTaxBasicDeduction.lean      # 地価税法 art.18（基礎控除）L4 モデル
JapanTaxLaw/LandValueTaxBasicDeductionSpec.lean  # 同上 独立定式
JapanTaxLaw/LandValueTaxBasicDeductionTests.lean # 同上 退行テスト
JapanTaxLaw/SpecialDeliveryTaxMarch.lean        # 特別交付税省令 art.10（東日本大震災道府県三月分）L4 モデル
JapanTaxLaw/SpecialDeliveryTaxMarchSpec.lean    # 同上 独立定式
JapanTaxLaw/SpecialDeliveryTaxMarchTests.lean   # 同上 退行テスト
JapanTaxLaw/ExplorationReserve.lean             # 租税特別措置法施行規則 art.9（探鉱準備金）L4 モデル
JapanTaxLaw/ExplorationReserveSpec.lean         # 同上 独立定式
JapanTaxLaw/ExplorationReserveTests.lean        # 同上 退行テスト
JapanTaxLaw/QualifiedInvoiceTaxAmount.lean      # 消費税法施行令 art.70の10（適格請求書消費税額）L4 モデル
JapanTaxLaw/QualifiedInvoiceTaxAmountSpec.lean  # 同上 独立定式
JapanTaxLaw/QualifiedInvoiceTaxAmountTests.lean # 同上 退行テスト
JapanTaxLaw/CorporateSpecialTaxBase.lean        # 法人特別税法 art.9（課税標準法人税額）L4 モデル
JapanTaxLaw/CorporateSpecialTaxBaseSpec.lean    # 同上 独立定式
JapanTaxLaw/CorporateSpecialTaxBaseTests.lean   # 同上 退行テスト
JapanTaxLaw/AuctionDepositValuation.lean      # 国税徴収法施行令 art.42の5（公売保証金を徴しない見積価額）L4 モデル
JapanTaxLaw/AuctionDepositValuationSpec.lean  # 同上 独立定式
JapanTaxLaw/AuctionDepositValuationTests.lean # 同上 退行テスト
JapanTaxLaw/GasolineTransferRounding.lean     # 地方揮発油譲与税法 art.5（千円未満端数控除）L4 モデル
JapanTaxLaw/GasolineTransferRoundingSpec.lean # 同上 独立定式
JapanTaxLaw/GasolineTransferRoundingTests.lean# 同上 退行テスト
JapanTaxLaw/LegalRatePresentValue.lean        # 相続税法施行令 art.12の4（法定利率現価割合）L4 モデル
JapanTaxLaw/LegalRatePresentValueSpec.lean    # 同上 独立定式
JapanTaxLaw/LegalRatePresentValueTests.lean   # 同上 退行テスト
JapanTaxLaw/RefundRounding.lean              # 国税庁関係政令 art.120（還付金等の端数計算）L4 モデル
JapanTaxLaw/RefundRoundingSpec.lean          # 同上 独立定式
JapanTaxLaw/RefundRoundingTests.lean         # 同上 退行テスト
JapanTaxLaw/CustomsStorageFee.lean            # 関税法施行令 art.70の3（収容に要した費用）L4 モデル
JapanTaxLaw/CustomsStorageFeeSpec.lean        # 同上 独立定式
JapanTaxLaw/CustomsStorageFeeTests.lean       # 同上 退行テスト
JapanTaxLaw/TobaccoTaxFixedAmount.lean        # 地方税法施行規則 art.16の4の4（たばこ税課税定額）L4 モデル
JapanTaxLaw/TobaccoTaxFixedAmountSpec.lean    # 同上 独立定式
JapanTaxLaw/TobaccoTaxFixedAmountTests.lean   # 同上 退行テスト
JapanTaxLaw/RoadGrantAllocation.lean          # 地方税等減収補てん臨時交付金政令 art.5（地方道路譲与税按分）L4 モデル
JapanTaxLaw/RoadGrantAllocationSpec.lean      # 同上 独立定式
JapanTaxLaw/RoadGrantAllocationTests.lean     # 同上 退行テスト
JapanTaxLaw/WeightTaxTransfer.lean            # 自動車重量譲与税法 art.2（市町村譲与の按分）L4 モデル
JapanTaxLaw/WeightTaxTransferSpec.lean        # 同上 独立定式
JapanTaxLaw/WeightTaxTransferTests.lean       # 同上 退行テスト
JapanTaxLaw/TransitionalTariffRate.lean        # 関税定率法改正法 附則 art.2（経過期間の税率）L4 モデル
JapanTaxLaw/TransitionalTariffRateSpec.lean    # 同上 独立定式
JapanTaxLaw/TransitionalTariffRateTests.lean   # 同上 退行テスト
JapanTaxLaw/ProvisionalTariffRate.lean          # 関税暫定措置法 附則 art.2-2（経過期間の税率）L4 モデル
JapanTaxLaw/ProvisionalTariffRateSpec.lean      # 同上 独立定式
JapanTaxLaw/ProvisionalTariffRateTests.lean     # 同上 退行テスト
JapanTaxLaw/ReformDoubleBasicDeduction.lean      # 税制改革関連法 art.9（遺産基礎控除の二倍化）L4 モデル
JapanTaxLaw/ReformDoubleBasicDeductionSpec.lean  # 同上 独立定式
JapanTaxLaw/ReformDoubleBasicDeductionTests.lean # 同上 退行テスト
JapanTaxLaw/TonnageTaxPenalty.lean             # 特別とん税法 art.10（罰則の数値上限）L4 モデル
JapanTaxLaw/TonnageTaxPenaltySpec.lean         # 同上 独立定式
JapanTaxLaw/TonnageTaxPenaltyTests.lean        # 同上 退行テスト
JapanTaxLaw/CertFee.lean                     # 関税法施行令 art.7（証明書類交付手数料）L4 モデル
JapanTaxLaw/CertFeeSpec.lean                 # 同上 独立定式
JapanTaxLaw/CertFeeTests.lean                # 同上 退行テスト
JapanTaxLaw/ForestGrantRounding.lean            # 森林環境譲与税法 art.31（譲与額の千円未満端数処理）L4 モデル
JapanTaxLaw/ForestGrantRoundingSpec.lean        # 同上 独立定式
JapanTaxLaw/ForestGrantRoundingTests.lean       # 同上 退行テスト
JapanTaxLaw/MultiDonorDeduction.lean          # 相続税法施行令 art.5の2（特定贈与者2人以上の控除額）L4 モデル
JapanTaxLaw/MultiDonorDeductionSpec.lean      # 同上 独立定式
JapanTaxLaw/MultiDonorDeductionTests.lean     # 同上 退行テスト
JapanTaxLaw/ExamFee.lean                          # 税理士法施行令 art.6の2（受験手数料）L4 モデル
JapanTaxLaw/ExamFeeSpec.lean                      # 同上 独立定式
JapanTaxLaw/ExamFeeTests.lean                     # 同上 退行テスト
JapanTaxLaw/DutyFreeTransfer.lean                 # 関税法施行令 art.12（免税物品譲渡の18,000円閾値）L4 モデル
JapanTaxLaw/DutyFreeTransferSpec.lean             # 同上 独立定式
JapanTaxLaw/DutyFreeTransferTests.lean            # 同上 退行テスト
JapanTaxLaw/SavingsDepositInterest.lean            # 納税貯蓄組合法 art.8（十万円閾値の非課税例外）L4 モデル
JapanTaxLaw/SavingsDepositInterestSpec.lean        # 同上 独立定式
JapanTaxLaw/SavingsDepositInterestTests.lean       # 同上 退行テスト
JapanTaxLaw/PowderSakeQuantity.lean              # 酒税法施行令 art.12の3（粉末酒数量=重量×0.73）L4 モデル
JapanTaxLaw/PowderSakeQuantitySpec.lean          # 同上 独立定式
JapanTaxLaw/PowderSakeQuantityTests.lean         # 同上 退行テスト
JapanTaxLaw/TobaccoRate.lean                     # たばこ税法 art.11（6802円/千本）L4 モデル
JapanTaxLaw/TobaccoRateSpec.lean                 # 同上 独立定式
JapanTaxLaw/TobaccoRateTests.lean                # 同上 退行テスト
JapanTaxLaw/StampExchangeFee.lean                 # 印紙税法施行規則 art.9（交換手数料）L4 モデル
JapanTaxLaw/StampExchangeFeeSpec.lean             # 同上 独立定式
JapanTaxLaw/StampExchangeFeeTests.lean            # 同上 退行テスト
JapanTaxLaw/RemittanceReportLimit.lean            # 国外送金等調書 上限額 100万円 L4 モデル
JapanTaxLaw/RemittanceReportLimitSpec.lean        # 同上 独立定式
JapanTaxLaw/RemittanceReportLimitTests.lean       # 同上 退行テスト
JapanTaxLaw/OkinawaExamPass.lean                   # 沖縄特例試験 合格基準 60%/40% L4 モデル
JapanTaxLaw/OkinawaExamPassSpec.lean               # 同上 独立定式
JapanTaxLaw/OkinawaExamPassTests.lean              # 同上 退行テスト
JapanTaxLaw/TravelerExemptionLimit.lean           # 関税法施行令 art.40（携帯品関税免除上限20万円）L4 モデル
JapanTaxLaw/TravelerExemptionLimitSpec.lean       # 同上 独立定式
JapanTaxLaw/TravelerExemptionLimitTests.lean      # 同上 退行テスト
JapanTaxLaw/MortgageRegistrationCapital.lean          # 登録免許税法施行令 art.26（資本金5億円閾値）L4 モデル
JapanTaxLaw/MortgageRegistrationCapitalSpec.lean      # 同上 独立定式
JapanTaxLaw/MortgageRegistrationCapitalTests.lean     # 同上 退行テスト
JapanTaxLaw/OilGasGrantTax.lean                    # 石油ガス譲与税法 art.1（収入額の1/2）L4 モデル
JapanTaxLaw/OilGasGrantTaxSpec.lean                # 同上 独立定式
JapanTaxLaw/OilGasGrantTaxTests.lean               # 同上 退行テスト
JapanTaxLaw/SpecialCorporationGrantTax.lean        # 地方税法 art.29（特別法人事業譲与税=収入額）L4 モデル
JapanTaxLaw/SpecialCorporationGrantTaxSpec.lean    # 同上 独立定式
JapanTaxLaw/SpecialCorporationGrantTaxTests.lean   # 同上 退行テスト
JapanTaxLaw/OilCoalTaxRate.lean                    # 石油石炭税法 art.9（2040/1080/700円）L4 モデル
JapanTaxLaw/OilCoalTaxRateSpec.lean                # 同上 独立定式
JapanTaxLaw/OilCoalTaxRateTests.lean               # 同上 退行テスト
JapanTaxLaw/RawMaterialRatio.lean                    # 関税定率法施行規則 art.1の2（原料価額60%）L4 モデル
JapanTaxLaw/RawMaterialRatioSpec.lean                # 同上 独立定式
JapanTaxLaw/RawMaterialRatioTests.lean               # 同上 退行テスト
JapanTaxLaw/LocalTaxShortfallRounding.lean          # 地方税等減収補てん交付金 art.5（500円二帯端数）L4 モデル
JapanTaxLaw/LocalTaxShortfallRoundingSpec.lean      # 同上 独立定式
JapanTaxLaw/LocalTaxShortfallRoundingTests.lean     # 同上 退行テスト
JapanTaxLaw/AntiDumpingRate.lean                    # 不当廉売関税率（韓49.5%/中73.7%）L4 モデル
JapanTaxLaw/AntiDumpingRateSpec.lean                # 同上 独立定式
JapanTaxLaw/AntiDumpingRateTests.lean               # 同上 退行テスト
JapanTaxLaw/AntiDumpingRate53.lean                  # 不当廉売関税率 53.0% L4 モデル
JapanTaxLaw/AntiDumpingRate53Spec.lean              # 同上 独立定式
JapanTaxLaw/AntiDumpingRate53Tests.lean             # 同上 退行テスト
JapanTaxLaw/GasolineTaxCombination.lean          # 揮発油税+地方揮発油税 合算（政令 art.32）L4 モデル
JapanTaxLaw/GasolineTaxCombinationSpec.lean      # 同上 独立定式
JapanTaxLaw/GasolineTaxCombinationTests.lean     # 同上 退行テスト
JapanTaxLaw/PowderCoefficientRounding.lean        # 粉末酒換算係数の端数計算（規則 art.7の8）L4 モデル
JapanTaxLaw/PowderCoefficientRoundingSpec.lean    # 同上 独立定式
JapanTaxLaw/PowderCoefficientRoundingTests.lean   # 同上 退行テスト
JapanTaxLaw/ContainerSpec.lean                    # 大型コンテナ寸法閾値（関税法施行令 art.78）L4 モデル
JapanTaxLaw/ContainerSpecSpec.lean                # 同上 独立定式
JapanTaxLaw/ContainerSpecTests.lean               # 同上 退行テスト
JapanTaxLaw/RoadWidthThreshold.lean                # 石油ガス譲与税施行規則 art.1（幅員2.5m未満）L4 モデル
JapanTaxLaw/RoadWidthThresholdSpec.lean            # 同上 独立定式
JapanTaxLaw/RoadWidthThresholdTests.lean           # 同上 退行テスト
JapanTaxLaw/LandValuePerSquareMeter.lean          # 更地価額÷面積（政令 art.8）L4 モデル
JapanTaxLaw/LandValuePerSquareMeterSpec.lean      # 同上 独立定式
JapanTaxLaw/LandValuePerSquareMeterTests.lean     # 同上 退行テスト
JapanTaxLaw/PassengerCapacity.lean                  # 乗用自動車の範囲（乗車定員10人以下）L4 モデル
JapanTaxLaw/PassengerCapacitySpec.lean              # 同上 独立定式
JapanTaxLaw/PassengerCapacityTests.lean             # 同上 退行テスト
JapanTaxLaw/PowerDevelopmentTaxRate.lean          # 電源開発促進税 税率 375円/千kWh L4 モデル
JapanTaxLaw/PowerDevelopmentTaxRateSpec.lean      # 同上 独立定式
JapanTaxLaw/PowerDevelopmentTaxRateTests.lean     # 同上 退行テスト
JapanTaxLaw/ForestAreaRounding.lean              # 森林面積補正の端数計算（規則 art.4）L4 モデル
JapanTaxLaw/ForestAreaRoundingSpec.lean          # 同上 独立定式
JapanTaxLaw/ForestAreaRoundingTests.lean         # 同上 退行テスト
JapanTaxLaw/AntiDumpingRate308.lean               # 不当廉売関税率 30.8%（政令 art.2）L4 モデル
JapanTaxLaw/AntiDumpingRate308Spec.lean           # 同上 独立定式
JapanTaxLaw/AntiDumpingRate308Tests.lean          # 同上 退行テスト
JapanTaxLaw/AntiDumpingRate694.lean               # 不当廉売関税率 69.4%（政令 art.2）L4 モデル
JapanTaxLaw/AntiDumpingRate694Spec.lean           # 同上 独立定式
JapanTaxLaw/AntiDumpingRate694Tests.lean          # 同上 退行テスト
JapanTaxLaw/TariffQuotaAmount.lean              # 関税割当数量 8000トン（省令 art.5）L4 モデル
JapanTaxLaw/TariffQuotaAmountSpec.lean          # 同上 独立定式
JapanTaxLaw/TariffQuotaAmountTests.lean         # 同上 退行テスト
JapanTaxLaw/TaxJudgeCount.lean                    # 国税審判官等の定数 180/89（政令 art.2）L4 モデル
JapanTaxLaw/TaxJudgeCountSpec.lean                # 同上 独立定式
JapanTaxLaw/TaxJudgeCountTests.lean               # 同上 退行テスト
JapanTaxLaw/TaxExaminerCount.lean                # 国税審査官定数 174人以内（政令 art.3）L4 モデル
JapanTaxLaw/TaxExaminerCountSpec.lean            # 同上 独立定式
JapanTaxLaw/TaxExaminerCountTests.lean           # 同上 退行テスト
JapanTaxLaw/ConsumptionTaxSpecialDate.lean        # 消費税特例の日 令和3年1月31日（政令 art.7）L4 モデル
JapanTaxLaw/ConsumptionTaxSpecialDateSpec.lean    # 同上 独立定式
JapanTaxLaw/ConsumptionTaxSpecialDateTests.lean   # 同上 退行テスト
JapanTaxLaw/PeriodEndDayException.lean            # 期間末日の特例 土曜日（政令 art.21の2）L4 モデル
JapanTaxLaw/PeriodEndDayExceptionSpec.lean        # 同上 独立定式
JapanTaxLaw/PeriodEndDayExceptionTests.lean       # 同上 退行テスト
JapanTaxLaw/PaymentDeadline.lean              # 国税納付期限 20日以内（省令 art.18）L4 モデル
JapanTaxLaw/PaymentDeadlineSpec.lean          # 同上 独立定式
JapanTaxLaw/PaymentDeadlineTests.lean         # 同上 退行テスト
JapanTaxLaw/AntiDumpingRate952.lean               # 不当廉売関税率 95.2%（政令 art.2）L4 モデル
JapanTaxLaw/AntiDumpingRate952Spec.lean           # 同上 独立定式
JapanTaxLaw/AntiDumpingRate952Tests.lean          # 同上 退行テスト
JapanTaxLaw/AntiDumpingRate372.lean               # 不当廉売関税率 37.2%（政令 art.2）L4 モデル
JapanTaxLaw/AntiDumpingRate372Spec.lean           # 同上 独立定式
JapanTaxLaw/AntiDumpingRate372Tests.lean          # 同上 退行テスト
JapanTaxLaw/SpecialUseExemption.lean            # 特定用途免税の範囲 原料用/熱源用（政令 art.7）L4 モデル
JapanTaxLaw/SpecialUseExemptionSpec.lean        # 同上 独立定式
JapanTaxLaw/SpecialUseExemptionTests.lean       # 同上 退行テスト
JapanTaxLaw/ForeignDesignation.lean            # 指定外国 台湾（政令 art.2）L4 モデル
JapanTaxLaw/ForeignDesignationSpec.lean        # 同上 独立定式
JapanTaxLaw/ForeignDesignationTests.lean       # 同上 退行テスト
JapanTaxLaw/ExcludedDutyFreeGoods.lean          # 免税対象外物品4種（規則 art.6）L4 モデル
JapanTaxLaw/ExcludedDutyFreeGoodsSpec.lean      # 同上 独立定式
JapanTaxLaw/ExcludedDutyFreeGoodsTests.lean     # 同上 退行テスト
JapanTaxLaw/FilingRoute.lean                    # 届出経由機関3種（酒税法施行令 art.9）L4 モデル
JapanTaxLaw/FilingRouteSpec.lean                # 同上 独立定式
JapanTaxLaw/FilingRouteTests.lean               # 同上 退行テスト
JapanTaxLaw/AircraftScope.lean                  # 航空機の範囲 発動機付滑空機（令 art.2）L4 モデル
JapanTaxLaw/AircraftScopeSpec.lean              # 同上 独立定式
JapanTaxLaw/AircraftScopeTests.lean             # 同上 退行テスト
JapanTaxLaw/NoticeCopyDocument.lean            # 法人税特例書類 通知書写し（省令 art.2）L4 モデル
JapanTaxLaw/NoticeCopyDocumentSpec.lean        # 同上 独立定式
JapanTaxLaw/NoticeCopyDocumentTests.lean       # 同上 退行テスト
JapanTaxLaw/TrustedAffairsClassification.lean      # 事務の区分 第一号法定受託事務（政令 art.10）L4 モデル
JapanTaxLaw/TrustedAffairsClassificationSpec.lean  # 同上 独立定式
JapanTaxLaw/TrustedAffairsClassificationTests.lean # 同上 退行テスト
JapanTaxLaw/PublicityMatter.lean                # 公示事項 財務大臣指定日（省令 art.1の11）L4 モデル
JapanTaxLaw/PublicityMatterSpec.lean            # 同上 独立定式
JapanTaxLaw/PublicityMatterTests.lean           # 同上 退行テスト
JapanTaxLaw/InspectionCity.lean                # 検査対象市町村2区分（政令 art.3）L4 モデル
JapanTaxLaw/InspectionCitySpec.lean            # 同上 独立定式
JapanTaxLaw/InspectionCityTests.lean           # 同上 退行テスト
JapanTaxLaw/CarnetImportGoods.lean            # 通関手帳輸入物品 第1号・第4号除外（政令 art.2）L4 モデル
JapanTaxLaw/CarnetImportGoodsSpec.lean        # 同上 独立定式
JapanTaxLaw/CarnetImportGoodsTests.lean       # 同上 退行テスト
JapanTaxLaw/FiscalPeriodLength.lean            # 不均一課税の期間 5箇年度（省令 art.4）L4 モデル
JapanTaxLaw/FiscalPeriodLengthSpec.lean        # 同上 独立定式
JapanTaxLaw/FiscalPeriodLengthTests.lean       # 同上 退行テスト
JapanTaxLaw/ElectronicSystemDesignation.lean      # 電子情報処理組織 輸出入等関連（省令 art.7の2）L4 モデル
JapanTaxLaw/ElectronicSystemDesignationSpec.lean  # 同上 独立定式
JapanTaxLaw/ElectronicSystemDesignationTests.lean # 同上 退行テスト
JapanTaxLaw/ClosureFilingDeadline.lean          # 廃止届出期限 1月前（省令 art.3）L4 モデル
JapanTaxLaw/ClosureFilingDeadlineSpec.lean      # 同上 独立定式
JapanTaxLaw/ClosureFilingDeadlineTests.lean     # 同上 退行テスト
JapanTaxLaw/AmamiCurrencyConversion.lean      # 奄美群島税法施行令 art.6（通貨の換算）L4 モデル
JapanTaxLaw/AmamiCurrencyConversionSpec.lean  # 同上 独立定式
JapanTaxLaw/AmamiCurrencyConversionTests.lean # 同上 退行テスト
JapanTaxLaw/TonnageTax.lean                   # とん税法 art.3（課税標準及び税率）L4 モデル
JapanTaxLaw/TonnageTaxSpec.lean               # 同上 独立定式
JapanTaxLaw/TonnageTaxTests.lean              # 同上 退行テスト
JapanTaxLaw/GasolineDeduction.lean            # 揮発油税法施行令 art.2（欠減控除）L4 モデル
JapanTaxLaw/GasolineDeductionSpec.lean        # 同上 独立定式
JapanTaxLaw/GasolineDeductionTests.lean       # 同上 退行テスト
scripts/law_audit/               # 構造監査エンジン（Python）
docs/AUDIT_REPORT.md             # 監査レポート（生成物）
docs/L7_LEDGER.md               # L7 統合レジャー（機械生成・CI 再生成照合）
docs/L7_CANDIDATES_UNREVIEWED.csv  # 候補ごとの一覧＋レビュー状態（全件 unreviewed／機械生成・CI 再生成照合）
data/raw/                        # e-Gov API v2 から取得した適用版XML＋ハッシュ
data/PROVENANCE.json             # 法令ID・履歴ID・施行日・SHA-256
docs/METHODOLOGY.md              # 法令・モデルの対応づけ、発見の査読基準
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
- 参照関係の収集（走査可能な原文からの形式的抽出のみ）：参照抽出 476,500 件（うち内部解決 100,944 / 外部未解決 157,983 / 未対応 250,043）。**外部未解決・未対応を誤りとして断定しません**
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
- 検査件数: 条 42,584（本文＋附則前文を synthetic article として包含）／項 86,403／号 61,672（細目を含む）
- 参照抽出: 461,067 件（内部解決可能 100,565／外部未解決 151,999／未対応構文 240,799）
- **監査結果（verified-anomaly）: 0 件** — 既存の検証済み異常はありません。`candidate` 3,438 件は抽出チェックの候補であり、**確定した欠陥ではない**（独立の法的レビュー待ち）。
  - 候補内訳: かっこ不整合 1,492／参照項目欠落 914／参照条欠落 362／参照項欠落 341／附則参照欠落 95／削除条文参照 67 ほか
- 未対応範囲（明示）: 別表の内容意味、`AppdxStyle`、表の列構造の意味、租税条約・附則の経過措置の参照解決、R1 で除外した住所認定の詳細は対象外。

検証コマンド:

```sh
python scripts/law_audit/inventory/sweep.py            # 全法令スイープ
python scripts/law_audit/inventory/validate_inventory.py  # 台帳整合チェック
```

候補の一覧と根拠は `build/audit_sweep.json`（生成物・未コミット）に出力されます。
**`build/` はコミット対象外**。台帳の再現手順は [docs/INVENTORY.md](docs/INVENTORY.md) を参照。

## Phase E — 法令横断検証（着手・シード）

PHASE E の最初の着手点として、`scripts/law_audit/phase_e/cross_law.py` を実装しました。Lean モジュールのソースピン留めと Phase A 台帳（`data/INVENTORY.json`）の整合を機械的に検査する L1↔L3 横断チェッカーです（2026-11-15 時点・シード。PHASE E 完成ではありません）。

検査内容（すべて機械的・失敗時は非ゼロ終了）：

1. 各 `JapanTaxLaw/*.lean` のピン留めヘッダ（`Law id:` / `Revision:` / `Amendment enforcement date:` / `Raw snapshot sha256:`）を走査
2. `Law id:` が台帳に存在し、`current_revision_status` が `CurrentEnforced`、`audit_ready` が true であること
3. `Revision:` が台帳の `current_revision.law_revision_id` と一致すること
4. `Raw snapshot sha256:` が台帳の `raw_snapshot.source_sha256` と一致すること（Spec モジュールの `Revision:` のみのピンも台帳の現行改正版と照合）
5. 台帳で unresolved（完全未施行）の 2 法令（防衛特別所得税関連の政令・省令）がどの Lean モジュールからもピン留めできないこと（弾かれることをテストで担保）

実行結果（2026-11-15）：スキャン 161 ファイル、ピン留め一致 134 モジュール、失敗 0 件。ピン留めのないモジュール（Verdict / TaxFinance / Tests / CounterexampleSweep 等、法源を持たない共通知識層）は 27 件で、**検証済みにカウントしません**。バイトレベルの原文 SHA-256 照合自体は `validate_inventory.py` の責務です（この横断検査は台帳↔Lean の整合のみ）。

**限界・未完了**: これはピン留め整合の検証であり、条文間の法的意味の矛盾を検出するものではありません。参照グラフは Phase B の候補 3,438 件（すべて**未確定**）のままで、独立レビューなしに欠陥と呼ばず、`verified-anomaly` は 0 件を維持します。PHASE E 完成（重複適用・優先関係の意味的横断検査）は今後の作業です。

```sh
python scripts/law_audit/phase_e/cross_law.py     # 横断ピン留め検査（build/cross_law.json へ出力）
python -m unittest scripts.tests.test_cross_law   # 12 テスト（実リポジトリ整合 + 合成失敗ケース）
```

詳細は [docs/CROSS_LAW.md](docs/CROSS_LAW.md) を参照。

## Phase F — 改正影響検証（着手・シード）

PHASE F の最初の着手点として、`scripts/law_audit/phase_f/revision_impact.py` を実装しました。第 4 層（現行改正版の来歴・整合性）を機械的に測る L1×L5 の橋渡しです。PHASE F 完成ではありません。

検査内容（機械的・失敗時は非ゼロ終了）：

1. 解決済み 325 件の現行改正版ピンについて、`law_revision_id` が台帳の `law_id` 接頭で、3 部構成（`{law_id}_{yyyymmdd}_{amendment_law_id}`）であり、埋め込み改正法 id が `amendment_law_id` と一致すること
2. `amendment_promulgate_date` / `amendment_enforcement_date` が欠落なく解決でき、施行日が `snapshot_date`（2026-11-15）を超えないこと
3. 原法（新規制定・一度も改正を受けていないことを示す `_{000000000000000}` 終端）48 件を特定して記録
4. 189 相異なる改正法を記録し、うち本台帳の対象税法一覧に内在するもの（任意の税法が後続改正として関与）は 3 件のみで、残りは台帳外のため `amendment_laws_outside_tax_ledger` として**記録のみ・判断しない**

実行結果（2026-11-15）：pinned 325 件・0 problems。`build/phase_f_revision_impact.json` に出力（`build/` は gitignore）。

**限界・未完了**: これは「現行改正版の来歴の機械的一貫性」の計測であり、旧条文と新条文の意味論的 diff 伝播（定義・条件・参照の変更が関連規則へ与える影響の解析）ではありません。改正法自体の条文は現在も本基盤で監査対象外であり、改正の「意味」を追ったことにはなりません。新旧 diff 比較エンジンは PHASE F 完成に必要であり、今後の作業です。

```sh
python scripts/law_audit/phase_f/revision_impact.py   # 現行改正版の来歴整合（build/phase_f_revision_impact.json へ）
python -m unittest scripts.tests.test_revision_impact # 8 テスト（実リポジトリ + 合成失敗）
```

## R1 の検証結果（2026-11-15 時点）

- **`lake build`**: 成功（Lean v4.35.0、依存なし）
- **構造監査**: 所得税法 1,286 条文・所得税法施行令 1,142 条文を機械検査
- **意味モデル**: 実装:ジェネラリティを 3 種の網羅パターン（居住者／非居住者／不明）に分解して証明
- **監査結果**: `verified-anomaly` **0 件**、`candidate` **3,438 件**（すべて `review_status=unreviewed`、独立レビュー未実施）
- **詳細**: [docs/AUDIT_REPORT.md](docs/AUDIT_REPORT.md)
- **公理依存**: 主要定理は `propext` のみ（`sorry` 未使用）

## 発見報告のルール

「矛盾」「抜け穴」「誤記」を称する前に、**(1) 法令・施行日時点、(2) 原文の参照箇所、(3) 形式化の前提、(4) 再現可能な証明／反例、(5) 別解釈・適用除外の検討、(6) 人による法的レビュー**を提示します。

**ビルド成功 ≠ 法令の正確な形式化 ≠ 現実の法的問題の発見** です。

## 監査成果物（すべてコードから再生成・gate 化）

| 成果物 | 内容 |
|---|---|
| [docs/COVERAGE.md](docs/COVERAGE.md) | 別軸の機械的網羅率（法・構造単位・意味形式化・人間レビューを混同しない） |
| [docs/LAW_STATUS.md](docs/LAW_STATUS.md) | 台帳の**全 327 法**それぞれの取得・解析・形式化・レビュー状況 |
| [docs/ARTICLE_OBLIGATIONS.md](docs/ARTICLE_OBLIGATIONS.md) | 条文ごとの検証義務（needle / impl / Spec / Tests / 公理 / agree の 6 項目） |
| [docs/BLOCKED.md](docs/BLOCKED.md) | §6 完了に必須の権限外前提条件（有資格レビュー／対象範囲宣言） |
| [docs/ADVERSARIAL_REVIEW.md](docs/ADVERSARIAL_REVIEW.md) | 形式化担当と分離した独立エージェントによる原文照合・反例探索 |
| [docs/RATE_CONSISTENCY.md](docs/RATE_CONSISTENCY.md) | 法令横断の税率整合性（意図的特例は BY-DESIGN と分類し矛盾と誤認しない） |
| [docs/RECURSIVE_DISCOVERY.md](docs/RECURSIVE_DISCOVERY.md) | 参照関係からの対象発見（未一致名・歴史版参照を自動追加せず記録） |

いずれも `python scripts/ci/run_python_gates.py` の regeneration gate で決定的に再生成されます。

**完了判定（§6）は未達**です。`verified-anomaly=0` は独立レビューゼロを意味し、欠陥不在の証拠ではありません。

## コントリビュート

貢献方法と検証基準は [CONTRIBUTING.md](CONTRIBUTING.md) を参照してください。コードは MIT ライセンスです。法的助言の提供を目的としません。

JapanTaxLaw/CustomsOfficerBadgeFormEnforcementDate.lean    # 税関職員証票等書式省令 施行日1977-07-01（附則 art.1）L4
JapanTaxLaw/CustomsOfficerBadgeFormEnforcementDateSpec.lean # 同上 独立定式
JapanTaxLaw/CustomsOfficerBadgeFormEnforcementDateTests.lean # 同上 退行テスト

JapanTaxLaw/TobaccoSpecialTaxEnforcementDate.lean    # たばこ特別税に関する政令 施行日1998-12-01（附則 art.1）L4
JapanTaxLaw/TobaccoSpecialTaxEnforcementDateSpec.lean # 同上 独立定式
JapanTaxLaw/TobaccoSpecialTaxEnforcementDateTests.lean # 同上 退行テスト

JapanTaxLaw/TobaccoSpecialTaxRuleEnforcementDate.lean    # たばこ特別税に関する省令 施行日2004-01-19（附則 art.1）L4
JapanTaxLaw/TobaccoSpecialTaxRuleEnforcementDateSpec.lean # 同上 独立定式
JapanTaxLaw/TobaccoSpecialTaxRuleEnforcementDateTests.lean # 同上 退行テスト

JapanTaxLaw/ReconstructionSpecialCorporationTaxEnforcementDate.lean    # 復興特別法人税に関する省令 施行日2012-04-01（附則 art.1）L4
JapanTaxLaw/ReconstructionSpecialCorporationTaxEnforcementDateSpec.lean # 同上 独立定式
JapanTaxLaw/ReconstructionSpecialCorporationTaxEnforcementDateTests.lean # 同上 退行テスト

JapanTaxLaw/ReconstructionSpecialIncomeTaxEnforcementDate.lean    # 復興特別所得税に関する政令 施行日2016-01-01（附則 art.1）L4
JapanTaxLaw/ReconstructionSpecialIncomeTaxEnforcementDateSpec.lean # 同上 独立定式
JapanTaxLaw/ReconstructionSpecialIncomeTaxEnforcementDateTests.lean # 同上 退行テスト
