# STAGING — W-A（相続税法 3 条文の bounded L4 モデル化）受け渡しメモ

> 実装担当 W-A からメインセッション（統合担当）への受け渡し用。
> ブランチ操作・add/commit/push/merge は一切していません。
> 本タスクで書き換えたのは下記 4 ファイルのみです（他は読み取り専用）。
> 末尾 §9 に**以前の W-A 担当分（登録免許税法）の STAGING を保全**として添付しています
> （内容は既に `JapanTaxLaw.lean` へ import 済みで統合完了、参考情報のみ）。

## 0. 対象ファイル

| ファイル | 状態 |
| --- | --- |
| `JapanTaxLaw/InheritanceMiscRates.lean` | 新規 |
| `JapanTaxLaw/InheritanceMiscRatesSpec.lean` | 新規 |
| `JapanTaxLaw/InheritanceMiscRatesTests.lean` | 新規 |
| `docs/STAGING_WA.md` | 更新（本ファイル） |

pinned source:

- law id `325AC0000000073`
- revision `325AC0000000073_20260401_506AC0000000008`
- amendment enforcement date `2026-04-01`
- 正規化済み原文: `C:\Users\junny\AppData\Local\Temp\opencode\W_A_inheritance.txt`（UTF-8、3 条文のみ）
  （本メモの needles はすべてこのファイルから一字も変えず抽出）

## 1. 追加した def / theorem 一覧

`namespace JapanTaxLaw`、`open JapanTaxLaw.TaxFinance`。`Money := Nat`。
既存 `InheritanceApportionment.heirApportionedTax` と名前が衝突しないよう、
art. 17 は別名 `heirInheritanceTax`（割合を caller-established `TaxRate` で受け取る表現）とした。

### 実装（`InheritanceMiscRates.lean`）

| 条文 | 名前 | 内容 |
| --- | --- | --- |
| 21 の 13 | `inheritanceSettlementGiftTaxRate` | 税率「百分の二十」= `⟨20,100,by decide⟩` |
| 21 の 13 | `inheritanceSettlementGiftTax` | 控除後課税価格 × 20/100（`applyFloor`） |
| 26 | `standingTimberRate` | 割合「百分の八十五」= `⟨85,100,by decide⟩` |
| 26 | `standingTimberValue` | 時価 × 85/100（`applyFloor`） |
| 17 | `heirInheritanceTax` | 総額 × 割合（`ratio.applyFloor`、割合は caller-established `TaxRate`） |

定理: `inheritanceSettlementGiftTax_eq` / `standingTimberValue_eq` / `heirInheritanceTax_eq`
（いずれも `rfl`）、`inheritanceSettlementGiftTax_zero` / `standingTimberValue_zero` /
`heirInheritanceTax_zero`、`inheritanceSettlementGiftTax_mono` / `standingTimberValue_mono` /
`heirInheritanceTax_mono`。各計算 def に zero 定理・mono 定理・kernel-decide smoke を付与済み。

### 独立定式（`InheritanceMiscRatesSpec.lean`）

`specInheritanceSettlementGiftTax` / `specStandingTimberValue` / `specHeirInheritanceTax`
（整数式 `m * num / den`）、`agreeInheritanceMiscRates : Bool`（`==` 一致、9 項目）、
`example : agreeInheritanceMiscRates = true := by decide`。

### 退行テスト（`InheritanceMiscRatesTests.lean`）

`by decide` の kernel-decide smoke 9 件（小数の切り捨て、ゼロ、1/3 の例を含む）。

### doc-comment に明記した射程

- 適用判定（相続時精算課税適用者・特定贈与者・包括遺贈等の該当性）、
  控除後課税価格、立木の時価、相続税の総額、各相続人の課税価格・合計課税価格は
  **すべて caller-established**。法的判断は自動化していない。
- art. 17 の割合は caller が `⟨課税価格, 合計課税価格, 正性証明⟩ : TaxRate` として渡す。
  分母の正性証明が「合計課税価格 ≠ 0」を担保し、ゼロ除算分岐（`if`）を式に入れない。
  **Bool は計算式に入れていない**。
- 端数は切り捨て（`TaxRate.applyFloor`）。政令の丸め細目・申告手続は射程外。
- 転記監査は fidelity-only であり法的正しさを保証しない。

## 2. 転記監査に追加すべき check（JSON 断片）

`scripts/ci/transcription_audit.py` の `checks()` に追加する check の JSON 表現です
（`law_id` / `kind` / `title` / `needles` の 4 キー）。needle 文字列は正規化原文の一字一句です。
**文字正規化・全角／半角変換・異体字変換を行わず、そのまま移してください。**

```json
{
  "law_id": "325AC0000000073",
  "kind": "file",
  "title": null,
  "needles": [
    "（相続時精算課税に係る贈与税の税率）第二十一条の十三",
    "百分の二十の税率を乗じて計算した金額とする",
    "（立木の評価）第二十六条",
    "立木の時価に百分の八十五の割合を乗じて算出した金額による",
    "（各相続人等の相続税額）第十七条",
    "課税価格の合計額のうちに占める割合を乗じて算出した金額とする"
  ]
}
```

参考：現行スクリプト形式への変換例（name は任意、needles は上記 6 本を一字も変えずに列挙）:

```python
yield ("相続税法 3 条文（21の十三 / 26 / 17）↔ InheritanceMiscRates.lean",
       "325AC0000000073",
       "file", None,
       [ ...上記 needles 6 本を一字も変えずに列挙... ])
```

## 3. 期待 literal 増分

- 新規 check **6 needles**（3 条文 × 2）なので **+6**。
- `docs/PROGRESS.md` の監査 literal 総数はメインセッションが再確認して加算してください
  （起点値は本メモでは書きません）。

## 4. 検証結果（すべて本セッションで実行済み）

- `lake build JapanTaxLaw.InheritanceMiscRates JapanTaxLaw.InheritanceMiscRatesSpec JapanTaxLaw.InheritanceMiscRatesTests`
  → **成功（5 jobs、warning なし）**。※全体ビルド／CI／`run_python_gates.py` は実行していません。
  初回ビルドで 4 件の型エラー（`decide` が自由変数を含む／`applyFloor` は `m * num` なので
  `Nat.mul_le_mul_left` ではなく `Nat.mul_le_mul_right` が必要）が出たため、`_eq` 定理経由の
  `rw` に修正して再ビルド成功。
- `python scripts/ci/check_no_sorry.py` → `no forbidden placeholder proofs found in tracked Lean sources`。
  （新規 3 ファイルは未追跡のため走査対象外ですが、人力でも `sorry` / `admit` はありません。）
- `#print axioms`（一時ファイル `WA_Inheritance_AxiomProbe.lean` を approved temp dir に作成、
  `lake env lean` で実行後 **削除済み**、第 2 探針 `WA_Inheritance_AxiomProbe2.lean` も削除済み）:
  - 新規定理 10 本を検査。**`Classical.choice` も `sorryAx` も一切なし**。
  - `inheritanceSettlementGiftTax_eq` / `standingTimberValue_eq` / `heirInheritanceTax_eq` /
    `inheritanceSettlementGiftTax_zero` / `standingTimberValue_zero` /
    `agreeInheritanceMiscRates` は `does not depend on any axioms`。
  - `heirInheritanceTax_zero` / 3 本の `*_mono` は `propext` に依存（既存
    `InheritanceApportionment.heirApportionedTax_mono` 等と同じ repo 通常パターン）。
- 原文逐語検証: **6/6 FOUND、MISS 0 件**（§5）。

## 5. 逐語検証 FOUND / MISS 一覧（一字も変更せず）

`W_A_inheritance.txt` をそのまま haystack とし、needle も同じ文字列で Python `.find()` を実行。
`norm@` は `re.sub(r"[\s　]+", "", ...)` 正規化后的 offset（transcription_audit.py の
`contains()` と同一条件）、`raw@` は未正規化テキスト上の offset です。

| # | needle（全文） | 結果 | norm@ | raw@ |
| --- | --- | --- | --- | --- |
| 1 | （相続時精算課税に係る贈与税の税率）第二十一条の十三 | **FOUND** | 183 | 189 |
| 2 | 百分の二十の税率を乗じて計算した金額とする | **FOUND** | 342 | 348 |
| 3 | （立木の評価）第二十六条 | **FOUND** | 373 | 383 |
| 4 | 立木の時価に百分の八十五の割合を乗じて算出した金額による | **FOUND** | 447 | 457 |
| 5 | （各相続人等の相続税額）第十七条 | **FOUND** | 8 | 10 |
| 6 | 課税価格の合計額のうちに占める割合を乗じて算出した金額とする | **FOUND** | 140 | 142 |

- **FOUND 6 / MISS 0**。アンカーの勝手な変更・正規化・文字変換はしていません。
- MISS が出ていた場合はここで作業を止めて報告する手順でしたが、該当なしです。

## 6. README / PROGRESS に足す 1 行文案

CROSS_LAW の scan/pin 件数や監査 literal 総数はメインセッションが計算するため、ここでは書きません。

- **README.md**（モジュール一覧の該当付近に追加）:
  ```text
  JapanTaxLaw/InheritanceMiscRates.lean / -Spec.lean / -Tests.lean  # 相続税法 第21条の十三（相続時精算課税20%）・第26条（立木 時価×85%）・第17条（相続税額=総額×課税価格比率）の L4 計算スライス・独立定式・退行テスト
  ```
- **docs/PROGRESS.md**（L4 着手済みモジュール一覧の末尾に追記）:
  ```text
  相続税法 第21条の十三 / 第26条 / 第17条（InheritanceMiscRates.lean：20%・85%・割合適用を TaxRate.applyFloor でモデル化、割合・課税価格・総額・適用判定は caller-established。art.17 は既存 InheritanceApportionment と別表現）
  ```

## 7. インテグレーターへの明示事項

**インテグレーターは `JapanTaxLaw.lean` に以下の 3 つの import を追加すること。**

```lean
import JapanTaxLaw.InheritanceMiscRates
import JapanTaxLaw.InheritanceMiscRatesSpec
import JapanTaxLaw.InheritanceMiscRatesTests
```

（W-A は `JapanTaxLaw.lean` を書き換えていません。メインが統合してください。）

## 8. 範囲・残ブロッカーの正直な申告

- これは **L4 のごく小さなスライス**です。**完成・網羅を主張しません**。
- 担当は 3 条文のみ。第16条（税率表・総額計算）、第15条（控除）、第21条の十一の二
  （控除後課税価格の算定）、申告・納付手続は NOT YET COVERED。
- art. 17 は既存 `InheritanceApportionment.heirApportionedTax`（`if totalTaxable = 0` 表現）と
  **別の表現**（caller-established `TaxRate` 表現）です。統合時に重複・方針統一を判断してください。
- `agreeInheritanceMiscRates` は定数同士の `==` 一致確認であり、法的意味の等価証明ではありません。
- 転記監査は fidelity-only（原文 bytes との一致確認）であり、法的正しさを保証しません。
- **L7 候補 3,438 件は unreviewed のまま**です（本スライスでは一切レビューしていません）。
- 残ブロッカー: 転記監査 check の `checks()` への組み込み（§2、+6）、`JapanTaxLaw.lean` への
  import 追加（§7）、README / PROGRESS の 1 行追記（§6）、および全体ビルド・CI ゲートの
  実行は**すべてメインセッションの担当**です（W-A は実行していません）。

## 9. 付録（保全）：以前の W-A 担当分（登録免許税法）の STAGING

> 以下は**別タスク**（`RegistrationQualificationFeesP2A`）の旧受け渡しメモを一字も改ずに保全したものです。
> 当該 3 モジュールは既に `JapanTaxLaw.lean` に import 済みで**統合完了**。参考情報のみとして扱ってください。
> （本タスクの正式な成果物は §0〜§8 です。）

<!-- PRIOR_STAGING_WA_BEGIN -->

# STAGING — W-A (登録免許税法 別表第一（二）第三十二号 五十九〜六十八 の flat fee) 受け渡しメモ

> 実装担当 W-A からメインセッション（統合担当）への受け渡し用。
> ブランチ操作・add/commit/push/merge は一切していません。
> 書き換えたのは下記 4 ファイルのみです（他は読み取り専用）。

## 0. 対象ファイル

| ファイル | 状態 |
| --- | --- |
| `JapanTaxLaw/RegistrationQualificationFeesP2A.lean` | 新規 |
| `JapanTaxLaw/RegistrationQualificationFeesP2ASpec.lean` | 新規 |
| `JapanTaxLaw/RegistrationQualificationFeesP2ATests.lean` | 新規 |
| `docs/STAGING_WA.md` | 新規（本ファイル） |

pinned source: `data/raw/342AC0000000035_20261101_508AC0000000021.law.json`
law id `342AC0000000035` / revision `342AC0000000035_20261101_508AC0000000021`
amendment enforcement date `2026-11-01`（RegistrationQualificationFees.lean / P2B と同一ピン）。
section 開始マーカー: `"三十二　人の資格の登録若しくは認定又は技能証明"`（`\u3000` は全角空白）。
pinned bytes から金額を日本語数字で読み取り Arabic に変換（九万円→90,000 等、全件一致確認済み）。

## 1. 追加した def 一覧（名前 → 金額）

`namespace JapanTaxLaw`、`open JapanTaxLaw.TaxFinance`。各 def は `Money := <額>` の flat 定数
（課税標準は一件につき。六十五（三）ハ のみ一箇所につき）。各 def に
`<name>_pos : <name> > 0 := by decide` と `example : <name> = <額> := by decide` を付与済み。

| # | 原文 | def 名 | 金額 |
| --- | --- | --- | --- |
| 1 | 五十九（一）一般信書便事業の許可 | `generalMailBusinessPermitFee` | 90,000 |
| 2 | 五十九（二）特定信書便事業の許可 | `specifiedMailBusinessPermitFee` | 30,000 |
| 3 | 六十 消防の設備等に係る登録検定機関の登録 | `fireEquipmentInspectionRegFee` | 150,000 |
| 4 | 六十一 債権管理回収業の許可 | `debtCollectionBusinessPermitFee` | 150,000 |
| 5 | 六十二 会社の電子公告に係る調査機関の登録 | `companyElectronicNoticeRegFee` | 90,000 |
| 6 | 六十三 技能実習監理団体の許可／事業区分変更の許可 | `foreignTraineeMonitorPermitFee` | 15,000 |
| 7 | 六十四 通関業の許可 | `customsBrokeragePermitFee` | 90,000 |
| 8 | 六十五（一）酒類の製造免許 | `liquorManufactureLicenseFee` | 150,000 |
| 9 | 六十五（二）イ 酒母の製造免許 | `sakeSeedMashLicenseFee` | 90,000 |
| 10 | 六十五（二）ロ もろみの製造免許 | `moromiProductionLicenseFee` | 120,000 |
| 11 | 六十五（三）イ 酒類販売業（小売のみ条件） | `liquorRetailOnlyLicenseFee` | 30,000 |
| 12 | 六十五（三）ロ 酒類販売業／代理業／媒介業 | `liquorRetailLicenseFee` | 90,000 |
| 13 | 六十五（三）ハ 小売条件の解除（**1 箇所あたり**） | `liquorRetailConditionRemovalFeePerPlace` | 60,000 |
| 14 | 六十六（一）製造たばこの特定販売業の登録 | `tobaccoSpecificRetailRegFee` | 150,000 |
| 15 | 六十六（二）製造たばこの卸売販売業の登録 | `tobaccoWholesaleRegFee` | 90,000 |
| 16 | 六十六（三）製造たばこの小売販売業の許可 | `tobaccoRetailPermitFee` | 15,000 |
| 17 | 六十六（四）製造たばこの出張販売の小売販売許可 | `tobaccoMobileSalesPermitFee` | 3,000 |
| 18 | 六十七（一）塩製造業の登録 | `saltManufacturerRegFee` | 150,000 |
| 19 | 六十七（二）塩特定販売業の登録 | `saltSpecifiedSellerRegFee` | 150,000 |
| 20 | 六十七（三）塩卸売業の登録 | `saltWholesalerRegFee` | 90,000 |
| 21 | 六十八 著作権等管理事業者の登録 | `copyrightManagementBusinessRegFee` | 90,000 |

補足（doc-comment に明記済み）:

- **六十二** は `会社法第九百四十一条（調査機関の登録）` を参照。**法律番号なし**。原文の文言を一字も変えていません。
- **六十五（注）**「…（三）イに規定する条件の全部又は一部の解除は、新たな当該免許とみなす。」は
  デーミング規定で金額なし。doc-comment に記載するが fee def は作っていません。
- **六十五（三）ハ** は件数ではなく「販売場の数一箇所につき ¥60,000」。`...FeePerPlace` 定数を渡す形とし、
  doc-comment に「販売場の数 × 本額（箇所数は caller-established）」と明記。Nat 掛け算はモジュール内で行っていません。
- 六十五（一）の政令で定める製造免許を除く点、六十五（三）・六十六（三）（四）の期限付き免許／許可を除く点、
  各「更新の登録を除く。」は適用判定ゲートで、金額定数には反映せず caller-established としました。

`RegistrationQualificationFeesP2ASpec.lean` は `spec` 接頭辞の独立定式 21 本 + `agreeRegistrationQualificationFeesP2A : Bool`
（実装 ≡ spec の `==` 一致）+ `example : agreeRegistrationQualificationFeesP2A = true := by decide`。
`RegistrationQualificationFeesP2ATests.lean` は `example := by decide` のスモーク 21 件のみ。

## 2. 転記監査に追加すべき check（JSON 断片）

`scripts/ci/transcription_audit.py` の `checks()` に追加する check の JSON 表現です
（`law_id` / `kind` / `title` / `needles` の 4 キー）。needle 文字列は pinned bytes の一字一句です。
**文字正規化・全角／半角変換・異体字変換を行わず、そのまま移してください。**

```json
{
  "law_id": "342AC0000000035",
  "kind": "file",
  "title": null,
  "needles": [
    "一般信書便事業の許可許可件数一件につき九万円",
    "特定信書便事業の許可許可件数一件につき三万円",
    "第二十一条の三第一項（登録検定機関の登録）の登録（更新の登録を除く。）登録件数一件につき十五万円",
    "の債権管理回収業の許可許可件数一件につき十五万円",
    "会社法第九百四十一条（調査機関の登録）の登録（更新の登録を除く。）登録件数一件につき九万円",
    "一般監理事業への事業の区分の変更に係るものに限る。）許可件数一件につき一万五千円",
    "の通関業の許可許可件数一件につき九万円",
    "その他政令で定める製造免許を除く。）免許件数一件につき十五万円",
    "酒母の製造免許免許件数一件につき九万円",
    "もろみの製造免許免許件数一件につき十二万円",
    "小売に限る旨の条件の付されたもの免許件数一件につき三万円",
    "酒類の販売業又は販売の代理業若しくは媒介業の免許（イ又はハに該当する販売業の免許を除く。）免許件数一件につき九万円",
    "イに掲げる免許に付された小売に限る旨の条件の解除販売場の数一箇所につき六万円",
    "製造たばこの特定販売業の登録登録件数一件につき十五万円",
    "製造たばこの卸売販売業の登録登録件数一件につき九万円",
    "製造たばこの小売販売業の許可（同法第二十四条第一項（許可の条件等）の規定による期限が付された許可を除く。）許可件数一件につき一万五千円",
    "製造たばこの小売販売の許可（同条第二項において準用する同法第二十四条第一項の規定による期限が付された許可を除く。）許可件数一件につき三千円",
    "塩製造業者の登録登録件数一件につき十五万円",
    "塩特定販売業者の登録登録件数一件につき十五万円",
    "塩卸売業者の登録登録件数一件につき九万円",
    "著作権等管理事業者の登録登録件数一件につき九万円"
  ]
}
```

> **41 件のうち担当分すべて**: 新規 check の needles 全体は W-A 21 本（本断片）＋ W-B 20 本
> （`RegistrationQualificationFeesP2B.lean` 六十九〜七十五、担当 W-B）＝ **41 本**の予定です。
> 本断片はそのうち **W-A 担当の 21 本すべて**です。残り 20 本は W-B の STAGING／成果物を統合してください。

参考：現行スクリプト形式への変換例（name は任意、needles は上記 21 本をそのまま使用）:

```python
yield ("登録免許税法 別表第一（二）第三十二号 五十九〜六十八 ↔ RegistrationQualificationFeesP2A.lean",
       "342AC0000000035",
       "file", None,
       [ ...上記 needles 21 本を一字も変えずに列挙... ])
```

## 3. 期待 literal 増分

- W-A 担当分: 新規 check **21 needles** なので **+21**。
- バッチ全体では W-B の +20 と合わせ **+41**。
- `docs/PROGRESS.md` の監査 literal 総数はメインセッションが再確認して加算してください
  （起点値は本メモでは書きません）。

## 4. 検証結果（すべて本セッションで実行済み）

- `lake build JapanTaxLaw.RegistrationQualificationFeesP2A JapanTaxLaw.RegistrationQualificationFeesP2ASpec JapanTaxLaw.RegistrationQualificationFeesP2ATests`
  → **成功（5 jobs、warning なし）**。※全体ビルド／CI／`run_python_gates.py` は実行していません。
- `python scripts/ci/check_no_sorry.py` → `no forbidden placeholder proofs found in tracked Lean sources`。
  （新規 3 ファイルは未追跡のため走査対象外ですが、人力でも `sorry` / `admit` はありません。）
- `#print axioms`（一時ファイル `WA_AxiomProbe.lean` を approved temp dir に作成、`lake env lean` で実行後 **削除済み**）:
  - 新規 positivity 定理 **21 本すべて** `does not depend on any axioms`。
  - **`Classical.choice` も `sorryAx` も `propext` も一切なし**。
- 原文逐語検証（pinned JSON を正規化テキストに対して `.find()`）: **21/21 FOUND、MISS 0 件**（§5）。
  law id `342AC0000000035` … FOUND / revision `342AC0000000035_20261101_508AC0000000021` … FOUND /
  amendment enforcement date `2026-11-01` … FOUND / 開始マーカー … FOUND（offset 142594）。

## 5. 逐語検証 FOUND / MISS 一覧（一字も変更せず）

`MainProvision` 配下の該当表について、full flatten テキストを `re.sub(r"[\s　]+", "", ...)` で正規化し、
各 needle も同様に正規化して Python `.find()` で検索（transcription_audit.py の `contains()` と同一条件）。
`norm@` は正規化文字列上の offset、`raw@` は未正規化テキスト上の offset です。

| # | needle（全文） | 結果 | norm@ | raw@ |
| --- | --- | --- | --- | --- |
| 1 | 一般信書便事業の許可許可件数一件につき九万円 | **FOUND** | 157691 | 159296 |
| 2 | 特定信書便事業の許可許可件数一件につき三万円 | **FOUND** | 157748 | 159354 |
| 3 | 第二十一条の三第一項（登録検定機関の登録）の登録（更新の登録を除く。）登録件数一件につき十五万円 | **FOUND** | 157831 | 159438 |
| 4 | の債権管理回収業の許可許可件数一件につき十五万円 | **FOUND** | 157937 | 159545 |
| 5 | 会社法第九百四十一条（調査機関の登録）の登録（更新の登録を除く。）登録件数一件につき九万円 | **FOUND** | 157981 | 159590 |
| 6 | 一般監理事業への事業の区分の変更に係るものに限る。）許可件数一件につき一万五千円 | **FOUND** | 158190 | 159800 |
| 7 | の通関業の許可許可件数一件につき九万円 | **FOUND** | 158273 | 159884 |
| 8 | その他政令で定める製造免許を除く。）免許件数一件につき十五万円 | **FOUND** | 158460 | 160073 |
| 9 | 酒母の製造免許免許件数一件につき九万円 | **FOUND** | 158529 | 160146 |
| 10 | もろみの製造免許免許件数一件につき十二万円 | **FOUND** | 158549 | 160167 |
| 11 | 小売に限る旨の条件の付されたもの免許件数一件につき三万円 | **FOUND** | 158676 | 160298 |
| 12 | 酒類の販売業又は販売の代理業若しくは媒介業の免許（イ又はハに該当する販売業の免許を除く。）免許件数一件につき九万円 | **FOUND** | 158705 | 160328 |
| 13 | イに掲げる免許に付された小売に限る旨の条件の解除販売場の数一箇所につき六万円 | **FOUND** | 158763 | 160387 |
| 14 | 製造たばこの特定販売業の登録登録件数一件につき十五万円 | **FOUND** | 158874 | 160500 |
| 15 | 製造たばこの卸売販売業の登録登録件数一件につき九万円 | **FOUND** | 158936 | 160563 |
| 16 | 製造たばこの小売販売業の許可（同法第二十四条第一項（許可の条件等）の規定による期限が付された許可を除く。）許可件数一件につき一万五千円 | **FOUND** | 159001 | 160629 |
| 17 | 製造たばこの小売販売の許可（同条第二項において準用する同法第二十四条第一項の規定による期限が付された許可を除く。）許可件数一件につき三千円 | **FOUND** | 159097 | 160726 |
| 18 | 塩製造業者の登録登録件数一件につき十五万円 | **FOUND** | 159228 | 160859 |
| 19 | 塩特定販売業者の登録登録件数一件につき十五万円 | **FOUND** | 159275 | 160907 |
| 20 | 塩卸売業者の登録登録件数一件につき九万円 | **FOUND** | 159322 | 160955 |
| 21 | 著作権等管理事業者の登録登録件数一件につき九万円 | **FOUND** | 159394 | 161028 |

- **FOUND 21 / MISS 0**。アンカーの勝手な変更・正規化・文字変換はしていません。
- 金額の日本語数字との対応も全件一致（九万円=90,000 / 三万円=30,000 / 十五万円=150,000 /
  一万五千円=15,000 / 十二万円=120,000 / 六万円=60,000 / 三千円=3,000）。

## 6. README / PROGRESS に足す 1 行文案

CROSS_LAW の scan/pin 件数や監査 literal 総数はメインセッションが計算するため、ここでは書きません。

- **README.md**（モジュール一覧・`RegistrationQualificationFeesTests.lean` 行［362〜364 行目］の直後に追加）:
  ```text
  JapanTaxLaw/RegistrationQualificationFeesP2A.lean / -Spec.lean / -Tests.lean  # 登録免許税法 別表第一（二）第三十二号 五十九〜六十八（信書便・登録検定機関・債権管理回収・電子公告調査・技能実習監理団体・通関・酒類免許・たばこ・塩・著作権等管理事業者）の flat fee L4 モデル・独立定式・退行テスト
  ```
- **docs/PROGRESS.md**（L4 着手済みモジュール一覧の末尾に追記）:
  ```text
  登録免許税法 別表第一（二）第三十二号 五十九〜六十八（RegistrationQualificationFeesP2A.lean：各 flat fee 額を Money 定数化、六十五（三）ハ は販売場 1 箇所あたり ¥60,000 の PerPlace 定数、六十五（注）デーミング規定は金額なし・fee def なし）
  ```

## 7. インテグレーターへの明示事項

**インテグレーターは `JapanTaxLaw.lean` に以下の 3 つの import を追加すること。**

```lean
import JapanTaxLaw.RegistrationQualificationFeesP2A
import JapanTaxLaw.RegistrationQualificationFeesP2ASpec
import JapanTaxLaw.RegistrationQualificationFeesP2ATests
```

（W-B の `RegistrationQualificationFeesP2B*` 3 件と併せて、計 6 行の追加になる見込みです。メインが統合してください。）

## 8. 範囲・残ブロッカーの正直な申告

- これは **L4 のごく小さなスライス**です。**完成・網羅を主張しません**。
- 対象は 別表第一（二）第三十二号 の **五十九〜六十八 のみ**。**五十八 以前・六十九 以降（W-B スライス）は NOT YET COVERED**。
- 登録・免許・許可・認可の要件・適用・更新の有無、政令で定めるものの該当性、六十五（三）ハ の箇所数、
  期限付き免許／許可の該当性はすべて caller-established とし、法的判断の自動化はしていません。
- 六十五（注）のデーミング規定（条件解除は新たな免許とみなす）は金額がないため fee def を作っていません。
- `agreeRegistrationQualificationFeesP2A` は定数同士の `==` 一致確認であり、法的意味の等価証明ではありません。
- 転記監査は fidelity-only（原文 bytes との一致確認）であり、法的正しさを保証しません。
- **L7 候補 3,438 件は unreviewed のまま**です（本スライスでは一切レビューしていません）。
- 残ブロッカー: 転記監査 check の `checks()` への組み込み（§2、+21、W-B の +20 と合わせ +41）、
  `JapanTaxLaw.lean` への import 追加（§7）、README / PROGRESS の 1 行追記（§6）、および全体ビルド・CI ゲートの
  実行は**すべてメインセッションの担当**です（W-A は実行していません）。

<!-- PRIOR_STAGING_WA_END -->
