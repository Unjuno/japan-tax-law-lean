# STAGING SBIT — 租税特別措置法 art.41の19（特定の基準所得金額の課税の特例）受け渡しメモ

> 実装担当からメインセッション（統合担当）への受け渡し用。
> commit / push / merge / ブランチ切替は一切していません。
> 書き換えたのは下記 4 ファイルのみです（他は読み取り専用）。

## 0. 対象ファイル

| ファイル | 状態 |
| --- | --- |
| `JapanTaxLaw/SpecialBaselineIncomeTax.lean` | 新規 |
| `JapanTaxLaw/SpecialBaselineIncomeTaxSpec.lean` | 新規 |
| `JapanTaxLaw/SpecialBaselineIncomeTaxTests.lean` | 新規 |
| `docs/STAGING_SBIT.md` | 新規（本ファイル） |

pinned source: law_id `332AC0000000026` / revision `332AC0000000026_20261101_507AC0000000013`
（租税特別措置法, enforcement 2026-11-01; raw snapshot
`data/raw/332AC0000000026_20261101_507AC0000000013.law.json`）。
担当範囲の原文: `C:\Users\junny\AppData\Local\Temp\opencode\C5_base_income.txt`
（第四十一条の十九, LEN 3353）。
名前空間は `JapanTaxLaw.SpecialBaselineIncomeTax`（他モジュールと衝突なし）。

## 1. def 一覧（namespace `JapanTaxLaw.SpecialBaselineIncomeTax`, Money = Nat）

### 1.1 `SpecialBaselineIncomeTax.lean` — def 6 本 / theorem 10 本

| def | 式 | 根拠 |
| --- | --- | --- |
| `thresholdAmount` | `330_000_000` | 第1項「三億三千万円」の閾値 |
| `specialRate` | `⟨225, 1000, by decide⟩ : TaxRate` | 第1項「百分の二十二・五」= 22.5% = **225/1000**（10 倍過大な 2250/1000 ではない） |
| `applySpecialRate` | `specialRate.applyFloor amount`（= `amount * 225 / 1000`, 切り捨て） | 第1項「百分の二十二・五に相当する金額」。smoke `1000 → 225` で転記確認 |
| `excessAmount` | `baselineIncome - thresholdAmount`（saturating） | 第1項「基準所得金額が三億三千万円を超える」部分の金額。閾値以下なら 0 |
| `specialBaselineIncomeTax` | `applySpecialRate (excessAmount baselineIncome) - baselineTaxAmount`（saturating） | 第1項「超える部分の金額の百分の二十二・五に相当する金額から基準所得税額を控除した金額」 |
| `specialBaselineIncomeTaxSelected` | `if applicable then specialBaselineIncomeTax … else 0` | 第1項「特例対象者」該当性（3億3千万超）を **caller-established Bool** で選択 |

theorem（10 本、いずれもモデル整合性のみ）:

- `thresholdAmount_eq` — 閾値 = 330_000_000（rfl）。
- `specialRate_numDen` — 率 = (225, 1000)（rfl、転記確認）。
- `applySpecialRate_eq` — 率適用 = `amount * 225 / 1000`（rfl）。
- `excessAmount_eq` — 超える部分 = `baselineIncome - thresholdAmount`（rfl）。
- `specialBaselineIncomeTax_eq` — 税額 = `(baselineIncome - thresholdAmount) * 225 / 1000 - baselineTaxAmount`（rfl、**担当範囲の定式**）。
- `specialBaselineIncomeTax_zero_tax` — 基準所得税額 0 なら率適用額そのもの（rfl）。
- `specialBaselineIncomeTax_le_applied` — 結果は率適用額以下（saturating 減算）。
- `specialBaselineIncomeTax_eq_zero_of_applied_le` — 控除 ≥ 課税額なら 0（**控除 > 税額で 0 境界**）。
- `selected_false_eq_zero` — 非該当 Bool なら 0（rfl）。
- `selected_true_eq` — 該当 Bool なら第1項の算術（rfl）。

caller-established な入力: 基準所得金額（`baselineIncome`）、基準所得税額（`baselineTaxAmount`）、
「特例対象者」該当性（`applicable : Bool`）。Bool は金額算術に混入させていない。
丸めは `TaxRate.applyFloor`（切り捨て）を modeling choice として経由させる。

### 1.2 `SpecialBaselineIncomeTaxSpec.lean` — def 7 本（独立整数定式）

- `specApplyRate amount` = `amount * 225 / 1000`（`TaxRate` を使わない raw リテラル定式）。
- `specExcess baselineIncome` = `baselineIncome - 330000000`（raw リテラル定式）。
- `specSpecialBaselineIncomeTax` = `specApplyRate (specExcess …) - baselineTaxAmount`。
- `specSpecialBaselineIncomeTaxSelected` — Bool 選択の独立定式。
- `agreeApplyRate` / `agreeSpecialBaselineIncomeTax` / `agreeSelected` —
  impl ≡ spec の有限サンプル一致（`==`、合計 9 + 11 + 5 = 25 点）。

いずれも `example : … = true := by decide`。有限サンプルのみで普遍定理は主張しない。

### 1.3 `SpecialBaselineIncomeTaxTests.lean` — kernel-decide smoke のみ

率転記（`1000 → 225`、**2250 でないこと**）、3.3億ちょうど/超の境界、控除 > 税額で 0、
端数切り捨て、Bool 選択。全て `by decide`。

**合計: def 13 本（main 6 + spec 7）、theorem 10 本**（+ kernel-decide の `example` 多数）。

## 2. 転記監査 JSON 断片

```json
{
  "law_id": "332AC0000000026",
  "kind": "file",
  "title": null,
  "needles": [
    "（特定の基準所得金額の課税の特例）第四十一条の十九個人でその者のその年分の基準所得金額が三億三千万円を超えるもの（第四項において「特例対象者」という。）については、",
    "については、当該超える部分の金額の百分の二十二・五に相当する金額からその年分の基準所得税額を控除した金額に相当する所得税を課する。",
    "２前項に規定する基準所得金額とは、次に掲げる金額の合計額をいう。一第八条の五第一項の規定の適用がないものとして計算した所得税法第二十二条",
    "３第一項に規定する基準所得税額とは、次の各号に掲げる者の区分に応じ当該各号に定める所得税の額（国税通則法第二条第四号に規定する附帯税の額を除く。）をいう。",
    "（特別控除に関する規定（第三十三条の四第一項、第三十四条第一項、第三十四条の二第一項、第三十四条の三第一項、第三十五条第一項、第三十五条の二第一項又は第三十五条の三第一項の規定その他政令で定める規定をいう。"
  ]
}
```

needle は原文から一字も変えず抽出し、**全角空白 U+3000 を含みません**。
既存 `transcription_audit.py` は `yield (name, law_id, kind, title, [needles])` 形式なので、
統合時は上記 5 本をそのタプルへ移してください（needle 文字列は一字も変えないこと）。

## 3. 検証結果（すべて本セッションで実行済み）

1. **build**: `lake build JapanTaxLaw.SpecialBaselineIncomeTax JapanTaxLaw.SpecialBaselineIncomeTaxSpec JapanTaxLaw.SpecialBaselineIncomeTaxTests`
   → `Build completed successfully (5 jobs)`。自作 3 モジュールのみ。全体ビルド／CI は未実行。
2. **no-sorry gate**: `python scripts/ci/check_no_sorry.py` →
   `no forbidden placeholder proofs found in tracked Lean sources`。
   加えて新規 3 ファイル（未追跡のため gate 対象外）を checker 自身の
   `strip_comments_and_strings` / `FORBIDDEN` で直接走査 → hits **0**。
3. **axiom probe**: 一時 Lean ファイルに 3 モジュールの名前付き宣言 **23** 件を列挙し
   `lake env lean`（exit code 0）で `#print axioms`。結果: axiom-free **22** 件、
   `propext` のみ **1** 件（`specialBaselineIncomeTax_eq_zero_of_applied_le`、許可）、
   `Classical.choice` / `sorryAx` / `Quot.sound` は **0** 件。
   一時ファイルは削除済み。
4. **逐語（needle）**: 5 needle について、pinned JSON の `MainProvision` 配下
   `Article Num == '41_19'` の本文 leaf-text を連結し `re.sub(r"[\s　]+", "", …)` で正規化
   （正規化後 3353 字、原文 C5 と一致）。各 needle に Python `.find()` を実行。

   | # | needle（先頭） | 文字数 | U+3000 | `.find()`（正規化） | 原文 C5 での `.find()` |
   |---|---|---|---|---|---|
   | 1 | （特定の基準所得金額の課税の特例）第四十一条の十九… | 82 | なし | 0 | 0 |
   | 2 | については、当該超える部分の金額の百分の二十二・五… | 65 | なし | 76 | 76 |
   | 3 | ２前項に規定する基準所得金額とは、… | 68 | なし | 141 | 141 |
   | 4 | ３第一項に規定する基準所得税額とは、… | 77 | なし | 861 | 861 |
   | 5 | （特別控除に関する規定（第三十三条の四第一項、… | 103 | なし | 443 | 443 |

   law_id `332AC0000000026` / revision `332AC0000000026_20261101_507AC0000000013` 一致確認。
   **FOUND 5 / MISS 0**; アンカーの勝手な変更なし。

## 4. Integration — 3 imports 明示

Integrator adds these 3 imports to `JapanTaxLaw.lean`（本ワーカーは同ファイルを変更しない）:

```lean
import JapanTaxLaw.SpecialBaselineIncomeTax
import JapanTaxLaw.SpecialBaselineIncomeTaxSpec
import JapanTaxLaw.SpecialBaselineIncomeTaxTests
```

## 5. README / PROGRESS 1行文案

- README: `SpecialBaselineIncomeTax — 租税特別措置法 art.41の19 の第1項算術（超える部分 = 基準所得金額 − 3.3億, 率「百分の二十二・五」= 225/1000 切り捨て, 税額 = 超える部分×率 − 基準所得税額, saturating）を bounded L4 でモデル化（caller-established 基準所得金額/基準所得税額/該当性 Bool）。`
- PROGRESS: `Added SpecialBaselineIncomeTax{,,Spec,,Tests}: art.41の19 第1項 3.3億閾値 + 22.5%=225/1000 (floor) + saturating 控除 + caller-established 該当 Bool; 23 named decls axiom-probed (22 axiom-free, propext only 1); 5 verbatim needles FOUND/MISS 0; integration 3 imports pending.`

## 6. Honest scope / NOT MODELLED

小さな L4 スライスであり、**完成・網羅を主張しない**。人間の法的レビューではない。

- **NOT MODELLED（第2項の基準所得金額算定）**: 第2項の「基準所得金額」は一号から九号まで
  にわたる各所得（総所得金額・退職所得金額・山林所得金額、上場株式等に係る配当所得等、
  土地の譲渡等に係る事業所得等、長期/短期譲渡所得、一般株式等・上場株式等の譲渡所得等、
  国内源泉所得、先物取引に係る雑所得等）の合計額として定義され、さらに特別控除に関する規定
  （第三十三条の四第一項ほか多数）や「政令で定める規定」への参照が含まれる。これらは
  他条文・政令にまたがる大規模な算定であり、本 L4 スライスの対象外とした。
  `baselineIncome` は caller が集約した値として受け取る。
- **NOT MODELLED（第3項の基準所得税額算定）**: 居住者区分（非永住者/非居住者）ごとの
  所得税額の算定、附帯税の除外、政令で定める規定による調整は他条文依存のため対象外。
  `baselineTaxAmount` は caller-established。
- **NOT MODELLED（特例対象者該当性の自動判定）**: 「3億3千万超」の認定は行わず、
  `applicable : Bool` として caller-established に受け取る（金额から自動判定しない）。
- **NOT MODELLED（第4項・第5項）**: 利子等・配当等への第八条の五等の不適用、
  所得税法各条の読替え規定は対象外。
- 丸めは `TaxRate.applyFloor`（切り捨て）を modeling choice として採用した。
- `agree*` は代表サンプル上の一致確認であり、全入力域での等価証明ではない。
- **L7 候補 3438 件は LEGAL_REVIEW_PENDING / unreviewed のまま**（本スライスでは一切レビューしていない）。
  `docs/L7_CANDIDATES_UNREVIEWED.csv` / `docs/RECURSIVE_DISCOVERY.md` は変更していない。
- commit / push / merge / ブランチ切替は行っていない。
