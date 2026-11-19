# STAGING NTSC — 所得税法施行令 art.40（非課税貯蓄申告書の最高限度額）bounded L4 モデル

> 実装ワーカー NTSC からメインセッション（統合担当）への受け渡し用。
> commit / push / merge / ブランチ切替は一切していません。
> 本タスクで書き換えたのは下記 4 ファイルのみです（他は読み取り専用）。

## 0. 対象ファイル / pinned source

| ファイル | 状態 |
| --- | --- |
| `JapanTaxLaw/NonTaxSavingsCeiling.lean` | 新規 |
| `JapanTaxLaw/NonTaxSavingsCeilingSpec.lean` | 新規 |
| `JapanTaxLaw/NonTaxSavingsCeilingTests.lean` | 新規 |
| `docs/STAGING_NTSC.md` | 新規（本ファイル） |

pinned source:

- law id `340CO0000000096`（所得税法施行令 / CabinetOrder）
- revision `340CO0000000096_20260522_508CO0000000093`
- Amendment enforcement date: 2026-05-22
- 照合先 JSON: `data/raw/340CO0000000096_20260522_508CO0000000093.law.json`（Article Num `40`）
- 担当範囲原文: `C:\Users\junny\AppData\Local\Temp\opencode\C8_NONTAX40.txt`（UTF-8、本文 186 文字）

原文の本文 186 文字は pinned JSON の art.40 leaf-text flatten と**完全一致**
（`equal: True`、いずれも U+3000 を 1 も含まない）を確認済み。名前空間は
`JapanTaxLaw.NonTaxSavingsCeiling`（独立名前空間）、`Money := Nat` は
`JapanTaxLaw.TaxFinance` を import して利用。

### 原文逐語と数式の導出（coordinator の要約は使わず、原文一字一句のみを根拠とする）

原文（186 文字）:

> （非課税貯蓄申告書）第四十条国内に住所を有する個人が非課税貯蓄申告書を提出する場合には、当該申告書に記載する法第十条第三項第三号（非課税貯蓄申告書の記載事項）に掲げる最高限度額は、一万円に整数を乗じた金額で、かつ、三百万円（当該申告書に記載すべき同項第四号に掲げる最高限度額がある場合には、三百万円から当該最高限度額の合計額を控除した残額）以下の金額としなければならない。

導出（各節を対応させるだけ）:

| 原文の節 | 導かれる数式 | 対応 def |
| --- | --- | --- |
| 「…最高限度額は、**一万円に整数を乗じた金額**で」 | 記載する最高限度額 = `10,000 × units` | `declaredCeiling units = unitYen * units` |
| 「かつ、**三百万円**（…）**以下の金額**としなければならない」 | 制約: 記載額 ≤ 上限 | `ceilingWithinLimit` |
| 括弧内「第四号に掲げる最高限度額がある場合には、**三百万円から当該最高限度額の合計額を控除した残額**」 | 上限 = `3,000,000 − item4Total`（saturating、合計額 ≥ 300 万 → 0） | `residualCeiling item4Total` |

第三号・第四号の具体的記載事項・算式は原文に書かれていないため NOT MODELLED。
「整数」は金額（円）なので非負として自然数で表現する（caller-established）。
該当性（国内に住所、第四号の最高限度額の有無）も caller-established とし、
Bool は金額式に入れない（第四号が無ければ caller が `item4Total = 0` を渡し上限は
3,000,000 になる）。原文には「零を下回る場合には零」の明示句がないが、
「控除した残額」は負になり得ないとの読みで saturating 減算を採用する。

## 1. def 一覧（名前空間 `JapanTaxLaw.NonTaxSavingsCeiling`, Money = Nat）

### 実装（`NonTaxSavingsCeiling.lean`）— 6 def + 14 theorem = **20 本**

| 区分 | 名前 | 内容 |
| --- | --- | --- |
| 定数 | `unitYen` | 一万円 = `10_000` |
| 定数 | `baseCeilingYen` | 三百万円 = `3_000_000` |
| 本文 | `declaredCeiling units` | `unitYen * units`。原文「一万円に整数を乗じた金額」 |
| 本文 | `residualCeiling item4Total` | `if baseCeilingYen ≤ item4Total then 0 else baseCeilingYen - item4Total`。原文「三百万円から…合計額を控除した残額」（saturating） |
| 制約 | `ceilingWithinLimit units item4Total`（abbrev, Prop） | `declaredCeiling units ≤ residualCeiling item4Total`。原文「かつ、…以下の金額」 |
| 派生 | `maxAllowedUnits item4Total` | `residualCeiling item4Total / unitYen`。上限内の最大 unit 数（端数切捨て。原文に直接現れる式ではない） |

verified facts / positivity（14 本、モデル性質のみ）:

- `unitYen_pos`, `baseCeilingYen_pos`（定数の正性）
- `declaredCeiling_zero`（整数 0 → 0）, `declaredCeiling_pos`,
  `declaredCeiling_mod_unitYen`（一万円の整数倍）, `declaredCeiling_mono`
- `residualCeiling_zero`（第四号なし → 三百万円）, `residualCeiling_saturate`
  （合計額 ≥ 300 万 → 0）, `residualCeiling_eq`, `residualCeiling_le_base`,
  `residualCeiling_pos`
- `ceilingWithinLimit_zero_units`（整数 0 は常に上限内）
- `maxAllowedUnits_zero`（= 300）, `maxAllowedUnits_saturate`（= 0）

各 def に positivity 定理と kernel-decide の smoke を付与済み。
impl の kernel-decide smoke は **19 件**。

### 独立定式（`NonTaxSavingsCeilingSpec.lean`）— 5 def

| 名前 | 内容 |
| --- | --- |
| `specDeclaredCeiling units` | `10_000 * units`（impl の定数・def を参照しない独立整数定式） |
| `specResidualCeiling item4Total` | `if 3_000_000 ≤ item4Total then 0 else 3_000_000 - item4Total`（整数リテラル直接） |
| `specCeilingWithinLimit units item4Total`（abbrev, Prop） | `specDeclaredCeiling units ≤ specResidualCeiling item4Total` |
| `specMaxAllowedUnits item4Total` | `specResidualCeiling item4Total / 10_000` |
| `agreeNonTaxSavingsCeiling` | impl ≡ spec の定数値 `==` 一致確認（15 点の有限グリッド、`by decide`） |

Spec の kernel-decide smoke は **14 件**（agree の例を含む）。

### 退行テスト（`NonTaxSavingsCeilingTests.lean`）

`example : ... := by decide` の kernel-decide smoke **26 件**。境界:
合計額 ≥ 300 万で 0（equal / greater）、整数 0、上限ちょうど（300 unit）、
1 unit 超過、第四号なし、控除後残額、端数（残額が一万円の整数倍でない場合の
切り捨て: `residualCeiling 1 = 2_999_999`、`maxAllowedUnits 55_555 = 294`）。

**名前付き宣言合計 25 本**（impl 6 def + 14 theorem, spec 5 def）。
無名 `example` は無名宣言のため数に含めない
（impl smoke 19 / spec smoke 14 / tests 26 = kernel-decide smoke 計 59 件）。

## 2. 転記監査に追加すべき check（JSON 断片）

`scripts/ci/transcription_audit.py` の `checks()` に追加する check の JSON 表現です
（`law_id` / `kind` / `title` / `needles` の 4 キー）。needle 文字列は原文の一字一句です。
**文字正規化・全角／半角変換・異体字変換を行わず、そのまま移してください。**
全 needle は全角空白 U+3000 を含みません。

```json
{
  "law_id": "340CO0000000096",
  "kind": "file",
  "title": null,
  "needles": [
    "国内に住所を有する個人が非課税貯蓄申告書を提出する場合には、当該申告書に記載する法第十条第三項第三号（非課税貯蓄申告書の記載事項）に掲げる最高限度額は、",
    "最高限度額は、一万円に整数を乗じた金額で、かつ、三百万円（当該申告書に記載すべき同項第四号に掲げる最高限度額がある場合には、三百万円から当該最高限度額の合計額を控除した残額）以下の金額としなければならない。",
    "当該申告書に記載すべき同項第四号に掲げる最高限度額がある場合には、三百万円から当該最高限度額の合計額を控除した残額）以下の金額としなければならない。"
  ]
}
```

参考変換例:

```python
yield ("所得税法施行令 art.40（非課税貯蓄申告書の最高限度額）↔ NonTaxSavingsCeiling.lean",
       "340CO0000000096",
       "file", None,
       [ ...上記 needles 3 本を一字も変えずに列挙... ])
```

## 3. 検証結果（すべて本セッションで実行済み）

1. **build**:
   `lake build JapanTaxLaw.NonTaxSavingsCeiling JapanTaxLaw.NonTaxSavingsCeilingSpec JapanTaxLaw.NonTaxSavingsCeilingTests`
   → **成功（5 jobs、warning なし）**。※全体ビルド／CI／`run_python_gates.py` は未実行。
2. **no-sorry gate**: `python scripts/ci/check_no_sorry.py` →
   `no forbidden placeholder proofs found in tracked Lean sources`。
   （新規 3 ファイルは未追跡のため走査対象外ですが、人手でも `sorry` / `admit` はありません。）
3. **axiom probe**: 一時ファイル `NTSC_AxiomProbe.lean` を approved temp dir に作成し
   `lake env lean`（exit code 0）で **25 本の名前付き宣言すべて**に `#print axioms` を実行、
   **削除済み**。結果:
   - `Classical.choice` / `sorryAx` / `Quot.sound` は **0 件**。
   - axiom-free **21 本**、`propext` のみ **4 本**（repo 許容範囲、propext 可）。
   - propext 依存: `declaredCeiling_mod_unitYen`, `residualCeiling_pos`,
     `ceilingWithinLimit_zero_units`, `maxAllowedUnits_saturate`。
4. **逐語（needle）**: 3 needle すべてについて pinned JSON の art.40 leaf-text flatten
   （186 文字、U+3000 不包含、原文ファイル本文と完全一致）を haystack として Python
   `.find()` を実行 → **FOUND 3 / MISS 0**。needle の正規化テキスト／原文テキストは同一。

## 4. 逐語検証 FOUND / MISS 一覧（一字も変更せず）

| # | 原文箇所 | len | 全角空白 | pos | count | 結果 |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | 適用場面・対象（国内に住所／法第十条第三項第三号） | 76 | なし | 14 | 1 | **FOUND** |
| 2 | 本文全体（一万円の整数倍・三百万円・控除後残額・以下） | 103 | なし | 83 | 1 | **FOUND** |
| 3 | 第四号の合計額を控除した残額（括弧内） | 74 | なし | 112 | 1 | **FOUND** |

- **FOUND 3 / MISS 0**。needle の勝手な変更・正規化・文字変換はしていません。
- MISS が出ていた場合はここで作業を止めて報告する手順でしたが、該当なしです。
- 全 needle は 74〜103 文字の範囲内（指定 60〜130 文字を満たす）、U+3000 不包含。

## 5. README / PROGRESS に足す 1 行文案

CROSS_LAW の scan/pin 件数や監査 literal 総数はメインセッションが計算するため、ここでは書きません。

- **README.md**（モジュール一覧の該当付近に追加）:
  ```text
  JapanTaxLaw/NonTaxSavingsCeiling.lean / -Spec.lean / -Tests.lean  # 所得税法施行令 art.40（非課税貯蓄申告書の最高限度額）の L4 計算スライス。記載最高限度額 = 一万円 × 整数(unit 数)、上限 = 三百万円（第四号の最高限度額がある場合は三百万円 − 合計額、saturating で負なら0）、制約 = 記載額 ≤ 上限。法10条3項3号/4号の具体的記載事項・算式 NOT MODELLED、各額・整数・該当性 caller-established、Bool は金額式に入れない
  ```
- **docs/PROGRESS.md**（L4 着手済みモジュール一覧の末尾に追記）:
  ```text
  所得税法施行令 art.40（NonTaxSavingsCeiling.lean：非課税貯蓄申告書の最高限度額。記載額 = 一万円×整数、上限 = if 三百万円≤第四号合計額 then 0 else 三百万円−合計額、制約 = 記載額≤上限。端数は unit 数を切り捨てる派生量で表現。法10条3項3号/4号の具体的記載事項 NOT MODELLED、各額・整数・該当性 caller-established、Bool は金額式に入れない）
  ```

## 6. インテグレーターへの明示事項

**インテグレーターは `JapanTaxLaw.lean` に以下の 3 つの import を追加すること。**

```lean
import JapanTaxLaw.NonTaxSavingsCeiling
import JapanTaxLaw.NonTaxSavingsCeilingSpec
import JapanTaxLaw.NonTaxSavingsCeilingTests
```

（NTSC は `JapanTaxLaw.lean` を書き換えていません。メインが統合してください。）

## 7. 範囲・残ブロッカーの正直な申告

- これは **L4 のごく小さな計算スライス**です。**完成・網羅を主張しません**。
- 対象は art.40 のうち、「最高限度額が一万円の整数倍であること」と
  「上限（三百万円／第四号合計額控除後の残額）以下であること」という
  数式部分のみです。
- **NOT MODELLED（明示）**:
  - **法第十条第三項第三号（非課税貯蓄申告書の記載事項）の具体的記載事項・算式** —
    原文は「法第十条第三項第三号…に掲げる最高限度額」と参照するだけで、
    第三号の記載事項の内容は本条文にない。本モジュールは参照先の「最高限度額」を
    caller-established な unit 数として受け取るだけ。
  - **同項第四号に掲げる最高限度額の具体的記載事項・算出** — 原文は「合計額」を
    控除すると述べるだけで、第四号の内訳・算定は別条文（法10条3項4号）にあり、
    本モジュールの外にある。`item4Total` は caller-established な完成済み金額。
  - 「国内に住所を有する個人」該当性、非課税貯蓄申告書の提出手続・記載様式、
    適用除外・経過措置・附則。
  - 「残額」が負になり得ないとの読みで saturating を採ったが、原文に明示句はなく、
    合計額が三百万円を超える場合の法的取扱いの詳細は主張しない。
- `agree*` は定数値の `==` 一致確認であり、法的意味の等価証明ではありません。
- 転記監査は fidelity-only（原文 bytes との一致確認）であり、法的正しさを保証しません。
- **L7 候補 3,438 件は LEGAL_REVIEW_PENDING（unreviewed）のまま**です（本スライスでは一切レビューしていません）。
- 残ブロッカー: 転記監査 check の `checks()` への組み込み（§2、+1）、
  `JapanTaxLaw.lean` への import 追加（§6）、README / PROGRESS の 1 行追記（§5）、
  および全体ビルド・CI ゲートの実行は**すべてメインセッションの担当**です
  （NTSC は実行していません）。
- commit / push / merge / ブランチ切替は行っていません。
