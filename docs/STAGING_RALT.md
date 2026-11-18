# STAGING — RALT（法人税法施行令 art. 139の10 留保金額控除税額）受け渡しメモ

> 実装担当からメインセッション（統合担当）への受け渡し用。
> ブランチ操作・add/commit/push/merge は一切していません。
> 書き換えたのは下記 4 ファイルのみです（他は読み取り専用）。

## 0. 対象ファイル

| ファイル | 状態 |
| --- | --- |
| `JapanTaxLaw/RetainedAmountLocalTax.lean` | 新規 |
| `JapanTaxLaw/RetainedAmountLocalTaxSpec.lean` | 新規 |
| `JapanTaxLaw/RetainedAmountLocalTaxTests.lean` | 新規 |
| `docs/STAGING_RALT.md` | 新規（本ファイル） |

pinned source: `data/raw/340CO0000000097_20261001_507CO0000000121.law.json`

- law id `340CO0000000097`
- revision `340CO0000000097_20261001_507CO0000000121`
- amendment enforcement date `2026-10-01`（`revision_info.CurrentEnforced`）

名前空間は `JapanTaxLaw.RetainedAmountLocalTax`（他モジュールと衝突なし）。

## 1. 追加した def / theorem 一覧

### 1.1 `RetainedAmountLocalTax.lean`（namespace `JapanTaxLaw.RetainedAmountLocalTax`）

def（6 本）:

- `def localTaxBaseRate : TaxRate` — 「百分の十・四」= 10.4% = **104/1000**。
  分母 1000（1040/1000 = 104% の **10倍過大バグ**を smoke で検出）。
- `def donationFortyRate : TaxRate` — 「百分の四十」= 40/100。
- `def twentyRate : TaxRate` — 「百分の二十」= 20/100。
- `def baseLocalTax (adjusted : Money) : Money` — 第1項基本額 =
  `localTaxBaseRate.applyFloor adjusted`。`adjusted`（法人税額 − 税額控除額）は caller-established。
- `def specialDonationAdjustment (donationSum adjustedLocalTax : Money) : Money` —
  第1項括弧書の調整額 = `min (donationFortyRate.applyFloor donationSum)
  (twentyRate.applyFloor adjustedLocalTax)`（「いずれか少ない金額」）。
- `def retainedAmountLocalTax (adjusted adjustedLocalTax : Money) (donationSumOpt : Option Money) : Money` —
  控除額。寄附金なしは基本額のみ、ある場合は
  `baseLocalTax adjusted − specialDonationAdjustment donationSum adjustedLocalTax`（saturating）。

caller-established な入力: 法人税額・税額控除額（→ `adjusted`）、調整地方税額
（→ `adjustedLocalTax`）、特定寄附金の額、寄附金該当性（→ `Option Money` の `none` / `some`）。
**Bool は金額式に入れず**、該当性は `Option` の構造で表現。丸めは `TaxRate.applyFloor`。

theorem（21 本、いずれもモデル整合性のみ）:

- 率の転記・正性: `localTaxBaseRate_numDen`, `donationFortyRate_numDen`, `twentyRate_numDen`,
  `localTaxBaseRate_den_pos`, `donationFortyRate_den_pos`, `twentyRate_den_pos`
- 基本額: `baseLocalTax_eq`（104/1000 そのもの）, `baseLocalTax_le`（10.4% < 100%）,
  `baseLocalTax_mono`, `baseLocalTax_mul_thousand`, `baseLocalTax_pos`
- 調整額: `specialDonationAdjustment_eq`, `specialDonationAdjustment_le_donation`,
  `specialDonationAdjustment_le_twenty`, `specialDonationAdjustment_eq_donation_when`,
  `specialDonationAdjustment_eq_twenty_when`, `specialDonationAdjustment_zero_of_donation_zero`
- 控除額: `retainedAmountLocalTax_none`, `retainedAmountLocalTax_le_base`,
  `retainedAmountLocalTax_exact`, `retainedAmountLocalTax_zero_of_over`（over で 0・還付は射程外）

kernel-decide smoke: 基本額 `0=0` / `1=0` / `999=103` / `1000=104` / `100000=10400`、
調整額の min 両方（`1000/1000→200`、`1000/10000→400`）と境界（寄附金 0 / 調整地方税額 0）、
控除額（寄附金なし、控除あり、控除 > 基本で saturating 0）。

### 1.2 `RetainedAmountLocalTaxSpec.lean`（独立整数定式）

def（6 本）:

- `def specBaseLocalTax (adjusted) : Money` — `adjusted * 104 / 1000`（`applyFloor` を使わない）。
- `def specSpecialDonationAdjustment (donationSum adjustedLocalTax) : Money` —
  `let d := ds * 40 / 100; let t := alt * 20 / 100; if d ≤ t then d else t`（`Nat.min` を使わない）。
- `def specRetainedAmountLocalTax (adjusted adjustedLocalTax) (donationSumOpt) : Money` —
  `none` は基本額、`some ds` は基本 − spec 調整額。
- `def agreeBaseLocalTax : Bool` — 代表格子（0, 1, 999, 1000, 1001, 12345, 100000, 1000000）。
- `def agreeSpecialDonationAdjustment : Bool` — min 両方・寄附金 0・調整地方税額 0 を含む 9 組。
- `def agreeRetainedAmountLocalTax : Bool` — 寄附金なし・控除 > 基本の saturating を含む 8 組。

`example : agree* = true := by decide` 3 本＋独立定式の境界点を kernel-decide。

### 1.3 `RetainedAmountLocalTaxTests.lean`（回帰スモーク）

`example := by decide` / `rfl` のみ（定理名追加なし）。率の numDen（104/1000, 40/100, 20/100）、
基本額の 10倍過大検出、min の両方と境界、控除額の saturating。

**合計: def 12 本、theorem 21 本**（+ kernel-decide の `example` 多数）。

## 2. 転記監査に追加すべき check（JSON 断片）

```json
{
  "law_id": "340CO0000000097",
  "kind": "file",
  "title": null,
  "needles": [
    "第百三十九条の十法第六十七条第三項（特定同族会社の特別税率）に規定する政令で定めるところにより計算した金額は",
    "法人税額から当該法人税額に係る税額控除額を控除した金額に百分の十・四を乗じて計算した金額",
    "当該特定寄附金の額（当該事業年度の所得の金額の計算上損金の額に算入されるものに限る。）の合計額の百分の四十に相当する金額",
    "調整地方税額（当該計算した金額に次項第二号イに掲げる規定により法人税の額から控除をされるべき金額に百分の十・四を乗じて計算した金額を加算した金額から同項第一号イに掲げる金額に百分の十・四を乗じて計算した金額を控除した金額をいう。）",
    "に百分の二十を乗じて計算した金額とのうちいずれか少ない金額を控除した金額"
  ]
}
```

needle は原文から一字も変えず抽出し、**全角空白 U+3000 を含みません**。
現行 `transcription_audit.py` は `yield (name, law_id, kind, title, [needles])` 形式なので、
統合時は上記 5 本をそのタプルへ移してください（needle 文字列は一字も変えないこと）。

## 3. 検証結果（すべて本セッションで実行済み）

- `lake build JapanTaxLaw.RetainedAmountLocalTax JapanTaxLaw.RetainedAmountLocalTaxSpec JapanTaxLaw.RetainedAmountLocalTaxTests`
  → **成功（5 jobs、warning なし）**。
- `python scripts/ci/check_no_sorry.py` → `no forbidden placeholder proofs found in tracked Lean sources`。
  加えて新規 3 ファイルへ同じ `strip_comments_and_strings` を直接適用したスキャンも **CLEAN**
  （未追跡ファイルは `git ls-files` では走査されないための補完確認）。
- `#print axioms`（一時ファイル・実行後に削除済み）: 21 theorem 中
  **12 本は axiom 0 件**、**9 本は `propext` のみ**（参照する core の `Nat.*` 補題由来）。
  **`Classical.choice` も `sorryAx` も一切なし**（propext は許可扱い）。
- 原文逐語検証（pinned JSON を正規化テキストに `.find()` 相当で確認）: **5/5 FOUND**。

## 4. 逐語検証 FOUND / MISS 一覧

`MainProvision` 配下で `ArticleTitle == 第百三十九条の十` の Article を 1 件特定し、
その本文テキストを `re.sub(r"[\s　]+", "", s)` で正規化した文字列に対して各 needle を検索
（`law_info.law_id` / `revision_info.law_revision_id` も一致確認）。

| # | needle（先頭） | 結果 |
| --- | --- | --- |
| 1 | 第百三十九条の十法第六十七条第三項（特定同族会社の特別税率）に規定する… | **FOUND** |
| 2 | 法人税額から当該法人税額に係る税額控除額を控除した金額に百分の十・四を… | **FOUND** |
| 3 | 当該特定寄附金の額（当該事業年度の所得の金額の計算上損金の額に算入される… | **FOUND** |
| 4 | 調整地方税額（当該計算した金額に次項第二号イに掲げる規定により… | **FOUND** |
| 5 | に百分の二十を乗じて計算した金額とのうちいずれか少ない金額を控除した金額 | **FOUND** |

- law id `340CO0000000097` … **FOUND**
- revision `340CO0000000097_20261001_507CO0000000121` … **FOUND**
- Article 第百三十九条の十 の一致件数 … **1**（想定どおり）
- 全 needle に U+3000 なし。**MISS は 1 件もなし。** アンカーの勝手な変更はしていません。

## 5. README / PROGRESS に足す 1 行文案

- **README.md**（モジュール一覧に追加）:
  ```text
  JapanTaxLaw/RetainedAmountLocalTax.lean / -Spec.lean / -Tests.lean  # 法人税法施行令 第139条の10（留保金額の計算上控除する道府県民税・市町村民税額: 10.4% 基本・40%/20% min 調整・saturating）L4 モデル・独立定式・退行テスト
  ```
- **docs/PROGRESS.md**（L4 着手済みモジュール一覧に追記）:
  ```text
  法人税法施行令 art. 139の10（留保金額控除税額）RetainedAmountLocalTax.lean（104/1000 の基本額と 40%/20% の min 調整・saturating 控除を形式化、法人税額/税額控除額/調整地方税額/寄附金該当性は caller-established）
  ```

## 6. インテグレーターへの明示事項

**インテグレーターは `JapanTaxLaw.lean` に以下の 3 つの import を追加すること。**

```lean
import JapanTaxLaw.RetainedAmountLocalTax
import JapanTaxLaw.RetainedAmountLocalTaxSpec
import JapanTaxLaw.RetainedAmountLocalTaxTests
```

## 7. 範囲・残ブロッカーの正直な申告

- これは **L4 のごく小さなスライス**です。**完成・網羅を主張しません**。
- 「百分の十・四」を 104/1000 として転記し、10 倍過大な 1040/1000 ではないことを smoke で確認
  しています（必要な法的判断・解釈は行っていません）。
- 法人税額・税額控除額・調整地方税額・特定寄附金の額・寄附金該当性はすべて
  caller-established な入力とし、法的判断の自動化はしていません。第2項の用語定義
  （法人税額・税額控除額の細目）および調整地方税額の算定自体は未モデル化です。
- 丸めは `TaxRate.applyFloor`（切り捨て）を採用した **modeling choice** であり、
  申告計算における端数処理の適用関係は本スライスの射程外です。
- 控除 > 基本で 0 を返すのは Nat の saturating subtraction であり、還付を主張するものではありません。
- `agree*` は代表サンプル上の一致確認であり、全入力域での等価証明ではありません。
- **L7 候補 3,438 件は LEGAL_REVIEW_PENDING / unreviewed のまま**です（本スライスでは一切レビューしていません）。
