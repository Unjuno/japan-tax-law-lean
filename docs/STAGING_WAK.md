# STAGING — W-AK（地方税法施行令 第二十一条の八［医療施設の適用除外判定・医療収入割合がおおむね常時十分の三以下］bounded L4）受け渡しメモ

> 実装担当 W-AK からメインセッション（統合担当）への受け渡し用。
> ブランチ操作・add/commit/push/merge は一切していません。
> 本タスクで書き換えたのは下記 4 ファイルのみです（他は読み取り専用）。

## 0. 対象ファイル

| ファイル | 状態 |
| --- | --- |
| `JapanTaxLaw/LocalTaxMedicalIncomeRatio.lean` | 新規 |
| `JapanTaxLaw/LocalTaxMedicalIncomeRatioSpec.lean` | 新規 |
| `JapanTaxLaw/LocalTaxMedicalIncomeRatioTests.lean` | 新規 |
| `docs/STAGING_WAK.md` | 新規（本ファイル） |

pinned source:

- law id `325CO0000000245`
- revision `325CO0000000245_20261101_508CO0000000083`
- 正規化済み原文: `C:\Users\junny\AppData\Local\Temp\opencode\local_order_M1.txt`
  （第二十一条の八、UTF-8、本文 182 文字。本メモの needles はすべてこのファイルから
  一字も変えず抽出）
- 照合先 JSON: `data/raw/325CO0000000245_20261101_508CO0000000083.law.json`
  （flatten テキスト中に原文 182 文字が raw offset 149146 で逐語一致することを確認済み）

名前空間は `JapanTaxLaw.LocalTaxMedicalIncomeRatio`（他モジュールと衝突しない独立名前空間）。
`Money := Nat` は `JapanTaxLaw.TaxFinance` を import して利用。

## 1. 追加した def / theorem 一覧

### 実装（`LocalTaxMedicalIncomeRatio.lean`）— 2 def / 4 theorem

| 条文 | 名前 | 内容 |
| --- | --- | --- |
| 21 の 8 | `medicalIncomeRatioWithin3Tenths` | 割合判定 `decide (medicalIncome * 10 ≤ 3 * totalIncome)`（交差掛け、`total = 0` も安全） |
| 21 の 8 | `medicalFacilityApplicationExcluded` | 適用除外判定 = 割合判定 `&& generallyConstant && governorRecognized`。後者 2 つは caller-established の法的判断 Bool（「おおむね常時」「道府県知事が認めた」） |

theorem 4 本（いずれもモデル性質のみ）:

- `medicalIncomeRatioWithin3Tenths_eq`（rfl）/ `_true_iff`
- `medicalFacilityApplicationExcluded_eq`（rfl）/ `_true_iff`

kernel-decide の `example` は実装 11 件。

### 独立定式（`LocalTaxMedicalIncomeRatioSpec.lean`）— 4 def

| 名前 | 内容 |
| --- | --- |
| `specMedicalIncomeRatioWithin3Tenths` | 独立整数定式 `decide (3 * totalIncome ≥ medicalIncome * 10)`（左右入替・`≤`→`≥`） |
| `specMedicalFacilityApplicationExcluded` | 同上の割合 spec に caller-established Bool を結合した独立定式 |
| `agreeMedicalIncomeRatioWithin3Tenths` | 実装 ≡ spec（11 点、`by decide`） |
| `agreeMedicalFacilityApplicationExcluded` | 実装 ≡ spec（9 点、`by decide`） |

spec の points 7 件 + agree 2 件の `example`。

### 退行テスト（`LocalTaxMedicalIncomeRatioTests.lean`）

`example : ... := by decide` の kernel-decide smoke 19 件。境界:
ちょうど 3/10（`3/10`, `30/100`, `300000/1000000`）→ true、
3/10 超（`4/10`, `31/100`, `300001/1000000`）→ false、
分母零（`0/0` → true, `1/0` → false）、医療収入（分子）零（`0/1`, `0/100` → true）、
小さい割合（`1/100` → true）、および caller-established Bool の 8 通りの結合。

合計: **def 6 本（実装 2 + spec 4）、theorem 4 本、kernel-decide example 39 件**。

### doc-comment に明記した射程

- 割合を構成する二つの金額（分子・分母）と、原文の「同項に規定する金額」/
  「医療に関する収入金額」をどの引数に当てるかの対応づけは **caller-established**。
- 金額の認定・医療施設の該当性・法第七十二条の二十三第二項の適用の有無・
  「総務省令で定める医療施設」の具体内容・その他の政令要件は
  **すべて caller-established**。法的判断は自動化していない。
- 「おおむね常時」「道府県知事が認めた」は法的判断の **caller-established Bool** として受け取り、
  **Bool は金額式に入れず**、割合判定の Bool と `&&` で結合するのみ。
- `Money = Nat`。除算・丸めは不要。分母零の退化ケースに法的意味があるとは主張しない。
- `agree*` は定数同士の `==` 一致確認であり、法的意味の等価証明ではない。
  転記監査は fidelity-only（原文 bytes との一致確認）であり法的正しさを保証しない。

## 2. 転記監査に追加すべき check（JSON 断片）

`scripts/ci/transcription_audit.py` の `checks()` に追加する check の JSON 表現です
（`law_id` / `kind` / `title` / `needles` の 4 キー）。needle 文字列は原文の一字一句です。
**文字正規化・全角／半角変換・異体字変換を行わず、そのまま移してください。**
全 needle は 60〜130 文字、全角空白 U+3000 を含みません。

```json
{
  "law_id": "325CO0000000245",
  "kind": "file",
  "title": null,
  "needles": [
    "（法第七十二条の二十三第二項の規定を適用しない医療施設）第二十一条の八法第七十二条の二十三第二項に規定する政令で定めるものは、農業協同組合連合会が設置した医療施設のうち、",
    "農業協同組合連合会が設置した医療施設のうち、その支払を受ける同項に規定する金額の当該医療施設に係る医療に関する収入金額中に占める割合がおおむね常時十分の三以下",
    "当該医療施設に係る医療に関する収入金額中に占める割合がおおむね常時十分の三以下であるものとして道府県知事が認めた医療施設",
    "収入金額中に占める割合がおおむね常時十分の三以下であるものとして道府県知事が認めた医療施設その他総務省令で定める医療施設とする。"
  ]
}
```

needle 1 は見出し・導入（政令で定めるもの）、needle 2 は支払金額と医療収入割合、
needle 3 は「十分の三以下」と「道府県知事が認めた」、needle 4 は総務省令で定める医療施設
（条末）を、それぞれ一字も変えず押さえています。

## 3. 期待 literal 増分

- 新規 check **4 needles** なので **+4**。
- `docs/PROGRESS.md` の監査 literal 総数はメインセッションが再確認して加算してください
  （起点値は本メモでは書きません）。

## 4. 検証結果（すべて本セッションで実行済み）

- `lake build JapanTaxLaw.LocalTaxMedicalIncomeRatio JapanTaxLaw.LocalTaxMedicalIncomeRatioSpec JapanTaxLaw.LocalTaxMedicalIncomeRatioTests`
  → **成功（5 jobs、warning なし）**。※全体ビルド／CI／`run_python_gates.py` は実行していません。
- `python scripts/ci/check_no_sorry.py` →
  `no forbidden placeholder proofs found in tracked Lean sources`。
  （新規 3 ファイルは未追跡のため走査対象外ですが、人力でも `sorry` / `admit` はありません。）
- `#print axioms`（一時ファイル `WAK_AxiomProbe.lean` を approved temp dir に作成、
  `lake env lean` で実行後 **削除済み**）:
  - 新規宣言 10 本（def 6 + theorem 4）を検査。**`Classical.choice` も `sorryAx` も一切なし**。
  - 8 本は `does not depend on any axioms`。
  - 2 本（`medicalIncomeRatioWithin3Tenths_true_iff` /
    `medicalFacilityApplicationExcluded_true_iff`）は `propext` に依存
    （repo 通常パターン、許容範囲）。
- 原文逐語検証: **4/4 FOUND、MISS 0 件**（§5）。pinned JSON の flatten テキストが
  `local_order_M1.txt` の本文 182 文字と一致することも確認済み。

## 5. 逐語検証 FOUND / MISS 一覧（一字も変更せず）

pinned JSON の flatten テキストをそのまま haystack とし、needle も同じ文字列で Python
`.find()` を実行。`norm@` は `re.sub(r"[\s　]+", "", ...)` 正規化后的 offset
（transcription_audit.py の `contains()` と同一条件）、`raw@` は未正規化テキスト上の offset、
`task@` は `local_order_M1.txt` 本文上の offset。

| # | 条文 | len | 全角空白 | raw@ | norm@ | task@ | 結果 |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 1 | 21 の 8（見出し・導入） | 85 | なし | 149146 | 149110 | 0 | **FOUND** |
| 2 | 21 の 8（支払金額・医療収入割合） | 79 | なし | 149209 | 149173 | 63 | **FOUND** |
| 3 | 21 の 8（十分の三以下・知事認定） | 60 | なし | 149249 | 149213 | 103 | **FOUND** |
| 4 | 21 の 8（総務省令・条末） | 64 | なし | 149264 | 149228 | 118 | **FOUND** |

- **FOUND 4 / MISS 0**。needle の勝手な変更・正規化・文字変換はしていません。
- MISS が出ていた場合はここで作業を止めて報告する手順でしたが、該当なしです。

## 6. README / PROGRESS に足す 1 行文案

CROSS_LAW の scan/pin 件数や監査 literal 総数はメインセッションが計算するため、ここでは書きません。

- **README.md**（モジュール一覧の該当付近に追加）:
  ```text
  JapanTaxLaw/LocalTaxMedicalIncomeRatio.lean / -Spec.lean / -Tests.lean  # 地方税法施行令 第21条の8（医療施設の適用除外判定・医療収入割合がおおむね常時十分の三以下 = 交差掛け medicalIncome×10 ≤ 3×totalIncome、知事認定等は caller-established Bool）の L4 計算スライス・独立定式・退行テスト
  ```
- **docs/PROGRESS.md**（L4 着手済みモジュール一覧の末尾に追記）:
  ```text
  地方税法施行令 第21条の8（LocalTaxMedicalIncomeRatio.lean：医療収入割合≤3/10 を交差掛け medicalIncome×10 ≤ 3×totalIncome で判定、「おおむね常時」「道府県知事が認めた」は caller-established Bool として金額式外で && 結合、金額・該当性は caller-established）
  ```

## 7. インテグレーターへの明示事項

**インテグレーターは `JapanTaxLaw.lean` に以下の 3 つの import を追加すること。**

```lean
import JapanTaxLaw.LocalTaxMedicalIncomeRatio
import JapanTaxLaw.LocalTaxMedicalIncomeRatioSpec
import JapanTaxLaw.LocalTaxMedicalIncomeRatioTests
```

（W-AK は `JapanTaxLaw.lean` を書き換えていません。メインが統合してください。）

## 8. 範囲・残ブロッカーの正直な申告

- これは **L4 のごく小さなスライス**です。**完成・網羅を主張しません**。
- 対象は第二十一条の八の「割合が十分の三以下」という明示的な算術条件と、
  その割合 Bool に caller-established の法的判断 Bool を結合する判定のみ。
  「おおむね常時」「道府県知事が認めた」の内容、法第七十二条の二十三第二項の趣旨、
  医療施設の該当性、「総務省令で定める医療施設」の具体、適用判定手続は
  NOT YET COVERED（すべて caller-established）。
- 原文の「同項に規定する金額」/「医療に関する収入金額」のどちらを引数
  `medicalIncome` / `totalIncome` に当てるかの対応づけも caller-established であり、
  本モジュールは与えられた二金額に対する算術判定しかしない。
- `agree*` は定数同士の `==` 一致確認であり、法的意味の等価証明ではありません。
- 転記監査は fidelity-only（原文 bytes との一致確認）であり、法的正しさを保証しません。
- **L7 候補 3,438 件は unreviewed のまま**です（本スライスでは一切レビューしていません）。
- 残ブロッカー: 転記監査 check の `checks()` への組み込み（§2、+4）、`JapanTaxLaw.lean` への
  import 追加（§7）、README / PROGRESS の 1 行追記（§6）、および全体ビルド・CI ゲートの
  実行は**すべてメインセッションの担当**です（W-AK は実行していません）。
