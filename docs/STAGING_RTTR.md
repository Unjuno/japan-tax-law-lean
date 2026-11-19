# STAGING RTTR — 地方税法施行令 art. 12（市町村民税に関する経過措置の税率）bounded L4 モデル

Pinned source: law_id `347CO0000000161` / revision `347CO0000000161_20010106_412CO0000000304`
（地方税法施行令, enforcement 2001-01-06; raw snapshot
`data/raw/347CO0000000161_20010106_412CO0000000304.law.json`）。担当範囲の原文は
`C:\Users\junny\AppData\Local\Temp\opencode\C7_localrate.txt`（UTF-8, 5921 文字, art. 12 全体）
とも一致（pinned JSON 第12条 leaf-text を正規化して逐語確認）。

## def 一覧（namespace `JapanTaxLaw.ResidentTaxTransitionalRates`, Money = Nat）

### 実装（10 defs + 15 theorems = 25 名前付き宣言）

| def / theorem | 式 | 根拠 |
|---|---|---|
| `standardPerCapita` | `290` | 一 イ 標準税率 年額二百九十円 |
| `standardPerCapitaSmall` | `150` | 一 イ 人口五万未満の市及び町村 百五十円 |
| `limitPerCapita` | `430` | 一 ロ 制限税率 年額四百三十円 |
| `limitPerCapitaSmall` | `230` | 一 ロ 人口五万未満 二百三十円 |
| `populationUnder50k` | `population < 50_000`（Bool 述語、金額式には不入） | 原文「人口五万未満」の境界。区分の認定は caller-established |
| `percent80Rate` | `⟨80, 100, by decide⟩ : TaxRate` | 二 イ・三「百分の八十」 |
| `oneAndHalfRate` | `⟨15, 10, by decide⟩ : TaxRate` | 二 ロ「一・五」（150/10 ではない） |
| `incomeTaxStandardRate` | `percent80Rate.applyFloor tableRate` = `tableRate * 80 / 100` | 二 イ 314条の3 表の率 × 80/100（floor） |
| `incomeTaxLimitRate` | `oneAndHalfRate.applyFloor (incomeTaxStandardRate tableRate)` = `(tableRate*80/100)*15/10` | 二 ロ イの率 × 一・五（floor） |
| `retirementIncomeTaxStandardRate` | `percent80Rate.applyFloor tableRate` | 三 328条の3 表の率 × 80/100（floor） |
| `standardPerCapita_pos`, `standardPerCapitaSmall_pos`, `limitPerCapita_pos`, `limitPerCapitaSmall_pos` | `0 < …`（`by decide`） | 4 定数の positivity |
| `percent80Rate_den_pos`, `oneAndHalfRate_den_pos` | `0 < ….den`（`by decide`） | 分母の well-definedness |
| `populationUnder50k_boundary` | `49_999 ↦ true ∧ 50_000 ↦ false`（`by decide`） | 五万未満/以上の境界 |
| `incomeTaxStandardRate_zero`, `incomeTaxLimitRate_zero`, `retirementIncomeTaxStandardRate_zero` | `… 0 = 0`（`by decide`） | 零率 smoke |
| `retirementIncomeTaxStandardRate_eq` | `retirement… r = incomeTaxStandardRate r`（`rfl`） | 二 イ と三は同じ 80/100 算術（根拠表のみ別） |
| `incomeTaxLimitRate_no_tenfold_trap` | `incomeTaxLimitRate 2 = 1 ∧ ≠ 30`（`by decide`） | 一・五倍 = 15/10、10 倍過大 150/10 でないことの確認 |
| `incomeTaxStandardRate_mono`, `incomeTaxLimitRate_mono`, `retirementIncomeTaxStandardRate_mono` | 単調性（`Nat.div_le_div_right` 合成） | モデルの性質のみを主張 |

### Spec（独立整数定式, 9 defs）

`TaxRate` / `applyFloor` を再利用せず、素の Nat 算術で再定式化:

- `specStandardPerCapita = 290`, `specStandardPerCapitaSmall = 150`,
  `specLimitPerCapita = 430`, `specLimitPerCapitaSmall = 230`
- `specPopulationUnder50k p = p < 50_000`（金額式には使わない）
- `specIncomeTaxStandardRate t = t * 80 / 100`
- `specIncomeTaxLimitRate t = (t * 80 / 100) * 15 / 10`
- `specRetirementIncomeTaxStandardRate t = t * 80 / 100`
- `agreeResidentTaxTransitionalRates`（4 定数 + 境界 6 点 + 表の率 18 点の `==` 一致、
  `example : … = true := by decide`）

Tests は無名 `example` のみ（名前付き宣言なし）: 定数 4、境界 4（0 / 49,999 / 50,000 /
50,001）、二 イ 7、二 ロ 9（端数・10 倍トラップ含む）、三 5、すべて `by decide`。

**名前付き宣言合計 34 件**（impl 25 + spec 9）。無名 `example` は別途多数。

## Transcription audit JSON fragment

```json
{
  "law_id": "347CO0000000161",
  "kind": "file",
  "title": null,
  "needles": [
    "市町村民税に関する経過措置）第十二条法第百五十五条第三項第三号に規定する政令で定める率は、次の各号に掲げる区分に応じ、当該各号に定めるところによる。",
    "一均等割イ標準税率年額二百九十円（人口五万未満の市及び町村にあつては、百五十円）ロ制限税率年額四百三十円（人口五万未満の市及び町村にあつては、二百三十円）",
    "二所得割イ標準税率地方税法第三百十四条の三第一項の表の上欄に掲げる金額の区分に応ずる同表の下欄に掲げる率にそれぞれ百分の八十を乗じて得た率",
    "ロ制限税率イの率に一・五を乗じて得た率三退職手当等に係る所得割地方税法第三百二十八条の三の表の上欄に掲げる金額の区分に応ずる同表の下欄に掲げる率にそれぞれ百分の八十を乗じて得た率",
    "一地方税法第二百九十四条第一項及び第三百二十八条の規定の適用については、昭和四十七年四月一日に沖縄の市町村に住所を有する者であつても、その者が同年一月一日に本土の市町村に住所を有し"
  ]
}
```

needle はすべて原文（pinned JSON 第12条 leaf-text）から一字も変えず抽出し、
**全角空白 U+3000 を含まない**。第5 needle は第2項以降を NOT MODELLED とする根拠の抜粋。

## 検証結果

1. **build**: `lake build JapanTaxLaw.ResidentTaxTransitionalRates JapanTaxLaw.ResidentTaxTransitionalRatesSpec JapanTaxLaw.ResidentTaxTransitionalRatesTests`
   → `Build completed successfully (5 jobs)`。警告なし。全体ビルド／CI は未実行。
2. **no-sorry gate**: `python scripts/ci/check_no_sorry.py` →
   `no forbidden placeholder proofs found in tracked Lean sources`。
   加えて新規 3 ファイル（未追跡のため gate 対象外）を checker 自身の
   `strip_comments_and_strings` / `FORBIDDEN` で直接走査 → hits 0。
3. **axiom probe**: 一時 Lean ファイルに 3 モジュールの名前付き宣言 **34** 件を列挙し
   `lake env lean`（exit code 0）で `#print axioms`。結果: axiom-free **31** 件、
   `propext` のみ **3** 件（3 つの単調性定理、許容）、`Classical.choice` / `sorryAx` /
   `Quot.sound` は **0** 件。一時ファイルは削除済み。
4. **逐語（needle）**: pinned JSON の `law_full_text` を `flat()` で展開し
   `re.sub(r"[\s\u3000]+", "", …)` で正規化したテキスト（23,916 文字、U+3000 不包含）に
   対して 5 needle すべて `.find() >= 0` → **FOUND**（位置 11253 / 11327 / 11404 /
   11473 / 11725）。文字数 74 / 77 / 69 / 89 / 90（すべて 60〜130 の範囲、原文一字不改、
   U+3000 不包含）。**MISS なし**。第12条の原文は U+3000 を 1 も含まないため
   正規化テキストの当該部分＝原文。
5. **def 数**: 名前付き宣言 **34** 件（impl 10 defs + 15 theorems, spec 9 defs）。
   無名 `example` は別途多数（smoke / points / agree / tests）。

## Integration — 3 imports 明示

Integrator adds these 3 imports to `JapanTaxLaw.lean`（本ワーカーは同ファイルを変更しない）:

```lean
import JapanTaxLaw.ResidentTaxTransitionalRates
import JapanTaxLaw.ResidentTaxTransitionalRatesSpec
import JapanTaxLaw.ResidentTaxTransitionalRatesTests
```

## README / PROGRESS 1行文案

- README: `ResidentTaxTransitionalRates — 地方税法施行令 art.12 の市町村民税経過措置税率（均等割 290/150/430/230 円、所得割×80%、制限税率×一・五）bounded L4 モデル。表の率・人口区分・該当性は caller-established、Bool は金額式に入れない。`
- PROGRESS: `Added ResidentTaxTransitionalRates{,,Spec,,Tests}: art.12 第1項 均等割 4 定数 + 所得割 80% / 制限 15/10 / 退職 80%（floor); 34 named decls axiom-probed (31 axiom-free, 3 propext-only); 5 verbatim needles FOUND; integration 3 imports pending.`

## Honest scope / NOT MODELLED

- 表の率（地方税法 314 条の3 / 328 条の3 の表の下欄の率）・その金額区分・該当性は
  すべて caller-established。`tableRate` は確定済みの数値として受け取り、
  **Bool は金額式に入れない**（判定は呼出側で行う）。
- 人口区分（「人口五万未満」）も caller-established。`populationUnder50k` は原文の境界
  50,000 を表す述語にすぎず、金額式には現れない。実際の市町村の人口・区分の認定は
  呼び出し側が行い、4 つの年額定数（standard/limit × small/通常）を選ぶ。
- **第2項以降は NOT MODELLED**: 第2項は「法第百五十五条第九項に規定する政令で定める規定」
  として地方税法 294 条2〜4項・294条の4・314条・314条の4・附則4条の**他条文準用**を
  列挙するのみで、本スライスの税率・年額算術とは無関係。第3項以降は沖縄県の区域内の
  市町村に関する昭和47年度分の経過措置（住所のみなし、法の適用除外、沖縄法令の読み替え表、
  医療費控除額・生命保険料控除額の特例、累進税率の区分適用、簡易税額表、税額控除の
  按分、四分の三特例等）、第4項以降は純損失の繰越し・多数の読み替え規定であり、
  いずれも他条文参照と法認定に依存するため**本 bounded L4 スライスの射程外**。
  これらをモデル化するには当該条文群の取得と別スライスが必要。
- 端数処理は `TaxRate.applyFloor`（Nat 切り捨て）を per-law business data として明示。
  原文は「乗じて得た率」とし本条に端数規定を持たず、法的に正しい丸め単位・方向は
  pinned 原文のみでは決定不能（**human legal review 待ち**）。有理数での率の厳密保持や
  課税所得への税率適用（314条の3の区分ごとの累進計算）も NOT MODELLED。
- 転記監査は fidelity-only であり法的正しさを保証しない。

小さな L4 スライスであり、完成・網羅を主張しない。人間の法的レビューではない。
L7 候補 **3438 件は LEGAL_REVIEW_PENDING / unreviewed のまま**（本スライスでは一切レビューしていない）。
`docs/RECURSIVE_DISCOVERY.md` / `L7_CANDIDATES_UNREVIEWED.csv` は変更していない。
commit / push / merge / ブランチ切替は行っていない。
