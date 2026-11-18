# STAGING — LCT (地方法人税法 art. 10 税率) 受け渡しメモ

> 実装担当 (S2) からメインセッション（統合担当）への受け渡し用。
> ブランチ操作・add/commit/push/merge は一切していません。
> 書き換えたのは下記 4 ファイルのみです（他は読み取り専用）。

## 0. 対象ファイル

| ファイル | 状態 |
| --- | --- |
| `JapanTaxLaw/LocalCorporationTaxRate.lean` | 新規 |
| `JapanTaxLaw/LocalCorporationTaxRateSpec.lean` | 新規 |
| `JapanTaxLaw/LocalCorporationTaxRateTests.lean` | 新規 |
| `docs/STAGING_LCT.md` | 新規（本ファイル） |

pinned source: `data/raw/426AC0000000011_20260401_507AC0000000013.law.json`
law id `426AC0000000011` / revision `426AC0000000011_20260401_507AC0000000013`。
名前空間は `JapanTaxLaw.LocalCorporationTaxRate`（他モジュールと衝突なし）。

## 1. 追加した def / theorem 一覧

### 1.1 `LocalCorporationTaxRate.lean`（namespace `JapanTaxLaw.LocalCorporationTaxRate`）

def（3 本）:

- `def localCorpTaxRate : TaxRate` — 百分の十・三 = 10.3% = **103/1000**（分母 1000。
  1030/1000 = 103% は 10 倍過大）。
- `def localCorpTax (base : Money) : Money` — 第1項: 地方法人税額 =
  `localCorpTaxRate.applyFloor base`。`base`（課税標準法人税額）は caller-established。
- `def localCorpTaxBase (adjustedBase addition : Money) : Money` — 第2項: 課税標準法人税額 =
  `adjustedBase - addition`（`Nat` の飽和減算）。基準法人税額・加算額は caller-established、
  「加算された金額がある場合」の該当性は caller-established Bool だが **Bool は式に入れない**。

theorem（5 本、いずれもモデル整合性のみ）:

- `localCorpTaxRate_den_pos` — `0 < localCorpTaxRate.den`（`by decide`、axiom 0）。
- `localCorpTax_mono` — 税額は caller-established な課税標準額について単調非減少（propext）。
- `localCorpTaxBase_le_base` — 控除後 ≤ 基準法人税額（axiom 0）。
- `localCorpTaxBase_eq_zero_of_ge` — 加算額 ≥ 基準なら 0（propext）。
- `localCorpTax_pos` — `0 < n → 0 < localCorpTax (n * 1000)`（propext）。

kernel-decide smoke: `localCorpTax 0=0` / `1=0` / `1000=103` / `100_000=10_300`、
`localCorpTaxBase` の境界（`1000-200=800`、`500-500=0`、`200-1000=0` で飽和）。

### 1.2 `LocalCorporationTaxRateSpec.lean`（独立整数定式）

def（4 本）:

- `def specLocalCorpTax (base) : Money` — `(base * 103) / 1000`（`applyFloor` を使わない独立定式）。
- `def specLocalCorpTaxBase (adjustedBase addition) : Money` — `adjustedBase - addition`。
- `def agreeLocalCorpTaxRate : Bool` — `numDen == (103,1000)` と代表格子での spec ≡ impl。
- `def agreeLocalCorpTaxBase : Bool` — 加算 > 基準を含む代表組での spec ≡ impl。

`example : agreeLocalCorpTaxRate = true := by decide` /
`example : agreeLocalCorpTaxBase = true := by decide` ほか境界点を kernel-decide。

### 1.3 `LocalCorporationTaxRateTests.lean`（回帰スモーク）

`example := by decide` のみ（定理名の追加なし）。境界 0 / 1000 / 端数 (`12345`) /
加算 > 基準での飽和 / 第1項・第2項の合成（`localCorpTax (localCorpTaxBase 1000 200) = 82`）。

**合計: def 7 本、theorem 5 本**（+ kernel-decide の `example` 多数）。

## 2. 転記監査に追加すべき check（JSON 断片）

```json
{
  "law_id": "426AC0000000011",
  "kind": "file",
  "title": null,
  "needles": [
    "（税率）第十条基準法人税額に対する地方法人税の額は",
    "各課税事業年度の課税標準法人税額に百分の十・三の税率を乗じて計算した金額とする",
    "法人税法第六十七条第一項の規定により加算された金額がある場合には",
    "前項の課税標準法人税額は、当該基準法人税額から当該加算された金額を控除した金額とする"
  ]
}
```

needle は原文から一字も変えず抽出し、**全角空白 U+3000 を含みません**。
現行 `transcription_audit.py` は `yield (name, law_id, kind, title, [needles])` 形式なので、
統合時は上記 4 本をそのタプルへ移してください（needle 文字列は一字も変えないこと）。

## 3. 検証結果（すべて本セッションで実行済み）

- `lake build JapanTaxLaw.LocalCorporationTaxRate JapanTaxLaw.LocalCorporationTaxRateSpec JapanTaxLaw.LocalCorporationTaxRateTests`
  → **成功（5 jobs、warning なし）**。
- `python scripts/ci/check_no_sorry.py` → `no forbidden placeholder proofs found in tracked Lean sources`。
- `#print axioms`（一時ファイル・実行後に削除済み）:
  - 5 theorem 中 2 本は **axiom 0 件**（`localCorpTaxRate_den_pos`, `localCorpTaxBase_le_base`）。
  - 3 本は **`propext` のみ**（`localCorpTax_mono`, `localCorpTaxBase_eq_zero_of_ge`, `localCorpTax_pos`；
    参照する core の `Nat.*` 補題由来）。
  - **`Classical.choice` も `sorryAx` も一切なし**（propext は許可扱い）。
- 原文逐語検証（pinned JSON を正規化テキストに `.find()` 相当で確認）: **4/4 FOUND**。

## 4. 逐語検証 FOUND / MISS 一覧

`MainProvision` 配下で `ArticleTitle == 第十条` の Article を 1 件特定し、
その本文テキストを `re.sub(r"[\s　]+", "", s)` で正規化した文字列に対して各 needle を検索
（`law_info.law_id` / `revision_info.law_revision_id` も一致確認）。

| # | needle（先頭） | 結果 |
| --- | --- | --- |
| 1 | （税率）第十条基準法人税額に対する地方法人税の額は | **FOUND** |
| 2 | 各課税事業年度の課税標準法人税額に百分の十・三の税率を乗じて計算した金額とする | **FOUND** |
| 3 | 法人税法第六十七条第一項の規定により加算された金額がある場合には | **FOUND** |
| 4 | 前項の課税標準法人税額は、当該基準法人税額から当該加算された金額を控除した金額とする | **FOUND** |

- law id `426AC0000000011` … **FOUND**
- revision `426AC0000000011_20260401_507AC0000000013` … **FOUND**
- Article 第十条 の一致件数 … **1**（想定どおり）
- 全 needle に U+3000 なし。**MISS は 1 件もなし。** アンカーの勝手な変更はしていません。

## 5. README / PROGRESS に足す 1 行文案

- **README.md**（モジュール一覧に追加）:
  ```text
  JapanTaxLaw/LocalCorporationTaxRate.lean / -Spec.lean / -Tests.lean  # 地方法人税法 第10条（税率 百分の十・三）L4 モデル・独立定式・退行テスト
  ```
- **docs/PROGRESS.md**（L4 着手済みモジュール一覧に追記）:
  ```text
  地方法人税法 art. 10（税率）LocalCorporationTaxRate.lean（103/1000 の税率と第2項の加算額控除・飽和減算を形式化、加算額/基準額の算定は caller-established）
  ```

## 6. インテグレーターへの明示事項

**インテグレーターは `JapanTaxLaw.lean` に以下の 3 つの import を追加すること。**

```lean
import JapanTaxLaw.LocalCorporationTaxRate
import JapanTaxLaw.LocalCorporationTaxRateSpec
import JapanTaxLaw.LocalCorporationTaxRateTests
```

## 7. 範囲・残ブロッカーの正直な申告

- これは **L4 のごく小さなスライス**です。**完成・網羅を主張しません**。
- 税率「百分の十・三」を 103/1000 として転記したものであり、10 倍過大な 1030/1000 ではないことを
  smoke で確認しています（必要な法的判断・解釈は行っていません）。
- 課税標準法人税額・基準法人税額・加算額、および「加算された金額がある場合」の該当性は
  すべて caller-established な入力とし、法的判断の自動化はしていません。
- 丸めは `TaxRate.applyFloor`（切り捨て）を採用した **modeling choice** であり、
  申告計算における端数処理の適用関係は本スライスの射程外です。
- **L7 候補 3,438 件は LEGAL_REVIEW_PENDING / unreviewed のまま**です（本スライスでは一切レビューしていません）。
- `agree*` は代表サンプル上の一致確認であり、全入力域での等価証明ではありません。
