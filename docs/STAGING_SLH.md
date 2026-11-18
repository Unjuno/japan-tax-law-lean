# STAGING SLH — 地方税法 art. 596（特別土地保有税の税額）受け渡しメモ

> 実装担当からメインセッション（統合担当）への受け渡し用。
> commit / push / merge / ブランチ切替は一切していません。
> 書き換えたのは下記 4 ファイルのみです（他は読み取り専用）。

## 0. 対象ファイル

| ファイル | 状態 |
| --- | --- |
| `JapanTaxLaw/SpecialLandHoldingTax.lean` | 新規 |
| `JapanTaxLaw/SpecialLandHoldingTaxSpec.lean` | 新規 |
| `JapanTaxLaw/SpecialLandHoldingTaxTests.lean` | 新規 |
| `docs/STAGING_SLH.md` | 新規（本ファイル） |

pinned source: law_id `325AC0000000226` / revision `325AC0000000226_20261101_508AC0000000002`
（地方税法, enforcement 2026-11-01; raw snapshot
`data/raw/325AC0000000226_20261101_508AC0000000002.law.json`）。
担当範囲の原文: `C:\Users\junny\AppData\Local\Temp\opencode\T2_landhold.txt`（第五百九十六条 LEN 480）。
名前空間は `JapanTaxLaw.SpecialLandHoldingTax`（他モジュールと衝突なし）。

## 1. def 一覧（namespace `JapanTaxLaw.SpecialLandHoldingTax`, Money = Nat）

### 1.1 `SpecialLandHoldingTax.lean` — def 6 本 / theorem 5 本

| def | 式 | 根拠 |
| --- | --- | --- |
| `fixedAssetDeductionRate` | `⟨14, 1000, by decide⟩` | 一号「百分の一・四」= 1.4% = **14/1000**（10 倍過大な 14/100 ではない） |
| `realEstateDeductionRate` | `⟨4, 100, by decide⟩` | 二号/三号「百分の四」= 4% = **4/100**（10 倍過小な 4/1000 ではない） |
| `landHoldingTax taxRate base deductionRate deductionBase` | `taxRate.applyFloor base − min (taxRate.applyFloor base) (deductionRate.applyFloor deductionBase)` | art. 596 共通構造。`tax = 課税標準額 × art.594 税率`、`控除 = min(税額, 控除基準価格 × 控除率)`（「当該額を限度として」）、結果 = `税額 − 控除` |
| `landHoldingTaxI taxRate taxableBase fixedAssetBase` | `landHoldingTax taxRate taxableBase fixedAssetDeductionRate fixedAssetBase` | 一号（第五百九十九条第一項第一号） |
| `landHoldingTaxII taxRate taxableBase realEstateBase` | `landHoldingTax taxRate taxableBase realEstateDeductionRate realEstateBase` | 二号（同項第二号） |
| `landHoldingTaxIII taxRate taxableBase realEstateBase` | `landHoldingTax taxRate taxableBase realEstateDeductionRate realEstateBase` | 三号（同項第三号、控除率は二号と同じ） |

theorem（5 本、いずれもモデル整合性のみ）:

- `landHoldingTax_deduction_le_tax` — 控除額は常に税額以下（「当該額を限度として」）。
- `landHoldingTax_le_tax` — 結果は元の税額以下。
- `landHoldingTax_zero_deduction` — 控除基準 0 なら控除 0、結果 = 税額（**控除 0 境界**）。
- `landHoldingTax_eq_zero_of_deduction_ge_tax` — 控除 ≥ 税額なら結果 0（**控除 ≥ 税額で 0 境界**）。
- `landHoldingTax_exact_sub` — 結果 = `tax − min(税額, 控除)`（rfl; `控除 ≤ 税額` なので飽和減算は正確）。

caller-established な入力: art. 594 の税率（`taxRate : TaxRate`、別条文の税率表）、
固定資産税の課税標準価格、不動産取得税の課税標準価格／政令で定める額
（いずれも `Money`）、一号/二号/三号の該当区分（def 選択）。
`Bool` は金額の算術に入れていない。「政令額を適用するか」「確定額か政令額か」も
caller-established（`realEstateBase` にどちらを入れるかは呼び出し側）。
原文の「合計額」は複数土地の (価格 × 控除率) の和だが、本モデルは caller が集約した
価格 1 件に控除率を一度適用する（集約後に切り捨てる modeling choice）。
丸めは全て `TaxRate.applyFloor`（切り捨て）。

### 1.2 `SpecialLandHoldingTaxSpec.lean` — def 7 本（独立整数定式）

- `specLandHoldingTax taxRate base deductionRate deductionBase` —
  `(base * taxRate.num / taxRate.den) − min (…) (deductionBase * deductionRate.num / deductionRate.den)`
  （`applyFloor` を再利用せず Nat 演算で書き直し）。
- `specLandHoldingTaxI / II / III` — 各号の控除率を固定した独立定式。
- `slhCheckGrid` — 3 税率 × 9 課税標準額 × 7 控除基準額 × 2 控除率 = 378 点の有限一致グリッド。
- `slhCaseCheckGrid` — 各号 def に対する有限一致グリッド。
- `agreeSpecialLandHoldingTax` — 税率 binding + 2 グリッド + 境界/端数点の有限一致。

いずれも `example : … = true := by decide`。有限サンプルのみで普遍定理は主張しない。

### 1.3 `SpecialLandHoldingTaxTests.lean` — kernel-decide smoke のみ

控除 0 / 控除 ≥ 税額（結果 0）/ 端数 / 一号 14/1000 と二号/三号 4/100 の転記確認
（`fixedAssetDeductionRate.applyFloor 1000 = 14`）/ 各号 def。全て `by decide`。

**合計: def 13 本（main 6 + spec 7）、theorem 5 本**（+ kernel-decide の `example` 多数）。

## 2. 転記監査 JSON 断片

```json
{
  "law_id": "325AC0000000226",
  "kind": "file",
  "title": null,
  "needles": [
    "（特別土地保有税の税額）第五百九十六条特別土地保有税の税額は、次の各号に掲げる区分に応じ、当該各号に定める額とする。",
    "同条第二項第一号の課税標準額に第五百九十四条の税率を乗じて得た額から、当該額を限度として、",
    "固定資産税の課税標準となるべき価格に百分の一・四を乗じて得た額の合計額を控除した額",
    "当該不動産取得税の課税標準となるべき価格として政令で定める額",
    "に百分の四を乗じて得た額の合計額を控除した額"
  ]
}
```

needle は原文から一字も変えず抽出し、**全角空白 U+3000 を含みません**。
既存 `transcription_audit.py` は `yield (name, law_id, kind, title, [needles])` 形式なので、
統合時は上記 5 本をそのタプルへ移してください（needle 文字列は一字も変えないこと）。

## 3. 検証結果（すべて本セッションで実行済み）

1. **build**: `lake build JapanTaxLaw.SpecialLandHoldingTax JapanTaxLaw.SpecialLandHoldingTaxSpec JapanTaxLaw.SpecialLandHoldingTaxTests`
   → `Build completed successfully (5 jobs)`。自作 3 モジュールのみ。全体ビルド／CI は未実行。
2. **no-sorry gate**: `python scripts/ci/check_no_sorry.py` →
   `no forbidden placeholder proofs found in tracked Lean sources`。
   加えて新規 3 ファイル（未追跡のため gate 対象外）を checker 自身の
   `strip_comments_and_strings` / `FORBIDDEN` で直接走査 → hits **0**。
3. **axiom probe**: 一時 Lean ファイルに 3 モジュールの名前付き宣言 **18** 件を列挙し
   `lake env lean`（exit code 0）で `#print axioms`。結果: axiom-free **16** 件、
   `propext` のみ **2** 件（`landHoldingTax_deduction_le_tax`, `landHoldingTax_zero_deduction`、
   いずれも許可）、`Classical.choice` / `sorryAx` / `Quot.sound` は **0** 件。
   一時ファイルは削除済み。
4. **逐語（needle）**: 5 needle について、pinned JSON の `MainProvision` 配下
   `Article Num == 596` の本文 leaf-text を連結し `re.sub(r"[\s　]+", "", …)` で正規化
   （正規化後 480 字）。各 needle に Python `.find()` を実行。

   | # | needle（先頭） | 文字数 | U+3000 | `.find()`（正規化） | 原文 T2 での `.find()` |
   |---|---|---|---|---|---|
   | 1 | （特別土地保有税の税額）第五百九十六条… | 58 | なし | 0 | 21 |
   | 2 | 同条第二項第一号の課税標準額に… | 45 | なし | 80 | 101 |
   | 3 | 固定資産税の課税標準となるべき価格に百分の一・四… | 41 | なし | 170 | 191 |
   | 4 | 当該不動産取得税の課税標準となるべき価格として政令で定める額 | 30 | なし | 427 | 448 |
   | 5 | に百分の四を乗じて得た額の合計額を控除した額 | 22 | なし | 458 | 479 |

   law_id `325AC0000000226` / revision `325AC0000000226_20261101_508AC0000000002` 一致確認。
   **MISS 0**; アンカーの勝手な変更なし。

## 4. Integration — 3 imports 明示

Integrator adds these 3 imports to `JapanTaxLaw.lean`（本ワーカーは同ファイルを変更しない）:

```lean
import JapanTaxLaw.SpecialLandHoldingTax
import JapanTaxLaw.SpecialLandHoldingTaxSpec
import JapanTaxLaw.SpecialLandHoldingTaxTests
```

## 5. README / PROGRESS 1行文案

- README: `SpecialLandHoldingTax — 地方税法 art.596 の税額算術（税額=課税標準額×art.594税率、控除=min(税額, 控除基準価格×控除率)、結果=税額−控除; 一号14/1000, 二号/三号4/100）を切り捨てで計算（bounded L4, caller-established Money/TaxRate, saturating subtraction）。`
- PROGRESS: `Added SpecialLandHoldingTax{,,Spec,,Tests}: art.596 一号 14/1000・二号/三号 4/100 控除率 + 当該額限度の min 控除 + 税額−控除; 18 named decls axiom-probed (propext only 2); 5 verbatim needles; integration 3 imports pending.`

## 6. Honest scope

小さな L4 スライスであり、**完成・網羅を主張しない**。人間の法的レビューではない。

- art. 594 の税率は別条文（税率表）なので固定せず `TaxRate` として caller-established に受け取る。
- 課税標準額・固定資産税/不動産取得税の課税標準価格・政令額・該当区分はすべて
  caller-established な入力とし、法的判断の自動化はしていない。
- 「合計額」を集約価格 1 件への一律適用とするのは modeling choice（各土地ごとの端数は再現しない）。
- 丸めは `TaxRate.applyFloor`（切り捨て）を採用した modeling choice。
- `agree*` は代表サンプル上の一致確認であり、全入力域での等価証明ではない。
- **L7 候補 3438 件は LEGAL_REVIEW_PENDING / unreviewed のまま**（本スライスでは一切レビューしていない）。
  `docs/L7_CANDIDATES_UNREVIEWED.csv` / `docs/RECURSIVE_DISCOVERY.md` は変更していない。
- commit / push / merge / ブランチ切替は行っていない。
