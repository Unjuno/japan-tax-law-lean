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
JapanTaxLaw/RegistrationQualificationFees.lean      # 登録免許税法 別表第一（二）第三十二号 (一)〜(九)（人の資格の登録若しくは認定又は技能証明： 公認会計士・行政書士・弁護士・司法書士・土地家屋調査士・税理士・技術士・公認心理師・医師歯科医師・薬剤師・保健師等 他 affiliates flat fee）L4 モデル
JapanTaxLaw/RegistrationQualificationFeesSpec.lean  # 同上 独立定式
JapanTaxLaw/RegistrationQualificationFeesTests.lean # 同上 退行テスト
JapanTaxLaw/CounterexampleSweep.lean  # L6: マージ済み L4 全モデル × Spec の有限領域反例バウンド検査（decide）
JapanTaxLaw/TaxProcedure.lean      # 国税通則法 第2条第10号（強制換価手続）
JapanTaxLaw/TaxProcedureSpec.lean  # Act art.2(10) の独立仕様・健全性・整合性定理
JapanTaxLaw/TaxProcedureTests.lean # Act art.2(10) の退行テスト 12件
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

実行結果（2026-11-15）：スキャン 158 ファイル、ピン留め一致 131 モジュール、失敗 0 件。ピン留めのないモジュール（Verdict / TaxFinance / Tests / CounterexampleSweep 等、法源を持たない共通知識層）は 27 件で、**検証済みにカウントしません**。バイトレベルの原文 SHA-256 照合自体は `validate_inventory.py` の責務です（この横断検査は台帳↔Lean の整合のみ）。

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
- **監査結果**: `verified-anomaly` **0 件**、`candidate` 24 件（すべて**未確定**、独立レビュー未実施）
- **詳細**: [docs/AUDIT_REPORT.md](docs/AUDIT_REPORT.md)
- **公理依存**: 主要定理は `propext` のみ（`sorry` 未使用）

## 発見報告のルール

「矛盾」「抜け穴」「誤記」を称する前に、**(1) 法令・施行日時点、(2) 原文の参照箇所、(3) 形式化の前提、(4) 再現可能な証明／反例、(5) 別解釈・適用除外の検討、(6) 人による法的レビュー**を提示します。

**ビルド成功 ≠ 法令の正確な形式化 ≠ 現実の法的問題の発見** です。

## コントリビュート

貢献方法と検証基準は [CONTRIBUTING.md](CONTRIBUTING.md) を参照してください。コードは MIT ライセンスです。法的助言の提供を目的としません。
