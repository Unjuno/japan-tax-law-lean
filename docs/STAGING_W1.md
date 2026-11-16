# STAGING — W1 (消費税法 art. 28 課税標準) 受け渡しメモ

> 実装担当 W1 からメインセッション（統合担当）への受け渡し用。
> ブランチ操作・add/commit/push/merge は一切していません。
> 書き換えたのは下記 4 ファイルのみです（他は読み取り専用）。

## 0. 対象ファイル

| ファイル | 状態 |
| --- | --- |
| `JapanTaxLaw/ConsumptionTaxableBase.lean` | 既存（未追跡・ビルド途中）をビルド可能に修正 |
| `JapanTaxLaw/ConsumptionTaxableBaseSpec.lean` | 新規 |
| `JapanTaxLaw/ConsumptionTaxableBaseTests.lean` | 新規 |
| `docs/STAGING_W1.md` | 新規（本ファイル） |

pinned source: `data/raw/363AC0000000108_20261101_507AC0000000013.law.json`
law id `363AC0000000108` / revision `363AC0000000108_20261101_507AC0000000013`
（ConsumptionTaxRate.lean と同一ピン）。

## 1. 追加／修正した def・theorem 一覧

### 1.1 `ConsumptionTaxableBase.lean`（namespace `JapanTaxLaw`）
既存の定義はそのまま維持し、証明のみを修正しました。

- `structure TaxableTransferFacts`（既存）— `consideration` / `isOfficerTransfer` / `markedlyLow` / `assetValue`
- `def taxableTransferBase (f)`（既存）— `if f.isOfficerTransfer && f.markedlyLow then f.assetValue else f.consideration`
- `def specifiedPurchaseBase (paid)`（既存）— `paid`
- `inductive DeemedSupplyAct`（既存）— `consumptionOrUse` / `gift`
- `def deemedSupplyBase (_act) (assetValue)`（既存）— `assetValue`

定理（いずれも既存名を維持、**証明を差し替え**）：

- `theorem taxableTransferBase_of_not_officer` — `rw [h]; rfl`（**axiom 0 件**）
- `theorem taxableTransferBase_of_not_markedly_low` — `cases` + `rw` + `rfl`（**axiom 0 件**）
- `theorem taxableTransferBase_of_officer_markedly_low` — `rw [h1, h2]; rfl`（**axiom 0 件**）
- `theorem taxableTransferBase_le_max` — `cases` 4 分岐 + `change` + `exact Nat.le_max_left/right`（`propext` のみ。理由は §4）
  - 修正内容：不正だった `split <;> exact ... <|> exact ...`（`Unknown identifier exact`）を除去。
- `theorem specifiedPurchaseBase_eq` — `rfl`（**axiom 0 件**）
- `theorem deemedSupplyBase_consumption_eq` — `rfl`（**axiom 0 件**）
- `theorem deemedSupplyBase_gift_eq` — `rfl`（**axiom 0 件**）

### 1.2 `ConsumptionTaxableBaseSpec.lean`（新規、独立定式）
- `def specTaxableTransferBase (f) : Money` — art. 28(1) を**入れ子 if** で独立定式（impl の `&&` ガードと意図的に別形）。
- `def specSpecifiedPurchaseBase (paid) : Money` — art. 28(2)。
- `def specDeemedSupplyBase (act) (assetValue) : Money` — art. 28(3) を `match` で独立定式。
- `def agreeConsumptionTaxableBase : Bool` — 代表サンプル格子で spec ≡ impl を `==` 比較。
- `example : agreeConsumptionTaxableBase = true := by decide` ほか kernel-decide 例 8 件。

### 1.3 `ConsumptionTaxableBaseTests.lean`（新規）
`example := by decide` のスモークのみ（定理名の追加なし）。
正常例／ただし書適用／非適用（片方フラグのみ）／ロ flags（両フラグ true）／金額 0／
art. 28(2) 支払対価／art. 28(3) 一号・二号。

## 2. 転記監査に追加すべき check（JSON 断片）

`scripts/ci/transcription_audit.py` の `checks()` に追加する check の完全な JSON 表現です
（`law_id` / `kind` / `title` / `needles` の 4 キー）。
なお現行スクリプトは Python の `yield (name, law_id, kind, title, [needles])` 形式なので、
統合時は同名 6 本の needle をそのタプルへ移してください（needle 文字列は一字も変えないこと）。

```json
{
  "law_id": "363AC0000000108",
  "kind": "article",
  "title": "第二十八条",
  "needles": [
    "課税資産の譲渡等に係る消費税の課税標準は、課税資産の譲渡等の対価の額",
    "当該消費税額を課税標準として課されるべき地方消費税額に相当する額を含まないものとする",
    "対価の額が当該譲渡の時における当該資産の価額に比し著しく低いときは、その価額に相当する金額をその対価の額とみなす",
    "特定課税仕入れに係る消費税の課税標準は、特定課税仕入れに係る支払対価の額",
    "当該消費し、又は使用した資産の価額に相当する金額",
    "当該贈与をした資産の価額に相当する金額"
  ]
}
```

参考：現行スクリプト形式への変換例（name は任意）：

```python
yield ("消費税法 art. 28（課税標準）↔ ConsumptionTaxableBase.lean",
       "363AC0000000108",
       "article", "第二十八条",
       [
         "課税資産の譲渡等に係る消費税の課税標準は、課税資産の譲渡等の対価の額",
         "当該消費税額を課税標準として課されるべき地方消費税額に相当する額を含まないものとする",
         "対価の額が当該譲渡の時における当該資産の価額に比し著しく低いときは、その価額に相当する金額をその対価の額とみなす",
         "特定課税仕入れに係る消費税の課税標準は、特定課税仕入れに係る支払対価の額",
         "当該消費し、又は使用した資産の価額に相当する金額",
         "当該贈与をした資産の価額に相当する金額",
       ])
```

## 3. 期待 literal 増分

- 新規 check 1 件 × needles **6 本** なので **+6**。
- `docs/PROGRESS.md` の現在の監査 literal 総数が **396** なら、加算後は **402**。
  （起点 396 は文書記載値。実際の現在値はメインセッションで再確認してください。）

## 4. 検証結果（すべて本セッションで実行済み）

- `lake build JapanTaxLaw.ConsumptionTaxableBase` … 当初エラー
  `Unknown identifier exact`（旧 `<|>` 記法）を修正 → **成功（warning なし）**。
- `lake build JapanTaxLaw.ConsumptionTaxableBase JapanTaxLaw.ConsumptionTaxableBaseSpec JapanTaxLaw.ConsumptionTaxableBaseTests`
  → **成功（5 jobs、warning なし）**。
- `python scripts/ci/check_no_sorry.py` → `no forbidden placeholder proofs found in tracked Lean sources`。
- `#print axioms`（一時ファイル・実行後に削除済み）:
  - 7 定理中 **6 定理は axiom 0 件**。
  - `taxableTransferBase_le_max` のみ `[propext]`。
    原因は参照先の core 補題自体が `propext` に依存するため
    （`Nat.le_max_left` / `Nat.le_max_right` を直接確認済み）。
  - **`Classical.choice` も `sorryAx` も一切なし**。
- 原文逐語検証（pinned JSON を `.find()` 相当で確認）: 下記 §5 のとおり **6/6 FOUND**。

## 5. 逐語検証 FOUND / MISS 一覧

`MainProvision` 配下で `ArticleTitle == 第二十八条` の Article を 1 件特定し、
その本文テキストに対して各 needle を検索（`law_info` / `revision_info` の id・revision も一致確認）。

| # | needle（先頭） | 結果 |
| --- | --- | --- |
| 1 | 課税資産の譲渡等に係る消費税の課税標準は、課税資産の譲渡等の対価の額 | **FOUND** |
| 2 | 当該消費税額を課税標準として課されるべき地方消費税額に相当する額を含まないものとする | **FOUND** |
| 3 | 対価の額が当該譲渡の時における当該資産の価額に比し著しく低いときは、その価額に相当する金額をその対価の額とみなす | **FOUND** |
| 4 | 特定課税仕入れに係る消費税の課税標準は、特定課税仕入れに係る支払対価の額 | **FOUND** |
| 5 | 当該消費し、又は使用した資産の価額に相当する金額 | **FOUND** |
| 6 | 当該贈与をした資産の価額に相当する金額 | **FOUND** |

- law id `363AC0000000108` … **FOUND**
- revision `363AC0000000108_20261101_507AC0000000013` … **FOUND**
- Article 第二十八条 の一致件数 … **1**（想定どおり）
- **MISS は 1 件もなし。** アンカーの勝手な変更はしていません。

## 6. README / PROGRESS に足す 1 行文案

CROSS_LAW の scan/pin 件数はメインセッションが計算するため、ここでは書きません。

- **README.md**（モジュール一覧・ConsumptionTaxRate 3 行の直後に追加）:
  ```text
  JapanTaxLaw/ConsumptionTaxableBase.lean / -Spec.lean / -Tests.lean  # 消費税法 第28条（課税標準）L4 モデル・独立定式・退行テスト
  ```
- **docs/PROGRESS.md**（L4 着手済みモジュール一覧の末尾に追記）:
  ```text
  消費税法 art. 28（課税標準）ConsumptionTaxableBase.lean（1項ただし書・2項特定課税仕入れ・3項みなし譲渡を形式化、4項/5項は NOT YET COVERED）
  ```

## 7. インテグレーターへの明示事項

**インテグレーターは `JapanTaxLaw.lean` に以下の 3 つの import を追加すること。**

```lean
import JapanTaxLaw.ConsumptionTaxableBase
import JapanTaxLaw.ConsumptionTaxableBaseSpec
import JapanTaxLaw.ConsumptionTaxableBaseTests
```

## 8. 範囲・残ブロッカーの正直な申告

- これは **L4 のごく小さなスライス**です。完成・網羅を主張しません。
- art. 28 の **4 項（保税地域から引き取られる課税貨物の価格計算）と 5 項（政令細目）は NOT YET COVERED**。
- 「著しく低い」「役員該当性」「税込／税抜」「時価」はすべて caller-established な入力とし、
  法的判断の自動化はしていません。
- **L7 候補 3,438 件は unreviewed のまま**です（本スライスでは一切レビューしていません）。
- `agreeConsumptionTaxableBase` は代表サンプル上の一致確認であり、全入力域での等価証明ではありません。
