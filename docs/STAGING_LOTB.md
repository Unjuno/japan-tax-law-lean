# STAGING — LOTB（軽油引取税法施行令 art. 23の2「軽油引取税の基準税額の算定方法」）受け渡しメモ

> 実装ワーカー LOTB からメインセッション（統合担当）への受け渡し用。
> commit / push / merge / ブランチ切替は一切していません。
> 本タスクで書き換えたのは下記 4 ファイルのみです（他は読み取り専用）。

## 0. 対象ファイル

| ファイル | 状態 |
| --- | --- |
| `JapanTaxLaw/LightOilBaseTax.lean` | 新規 |
| `JapanTaxLaw/LightOilBaseTaxSpec.lean` | 新規 |
| `JapanTaxLaw/LightOilBaseTaxTests.lean` | 新規 |
| `docs/STAGING_LOTB.md` | 新規（本ファイル） |

pinned source:

- law id `337M50000008017`
- revision `337M50000008017_20260724_508M60000008092`
- 担当範囲原文: `C:\Users\junny\AppData\Local\Temp\opencode\C6_fuel.txt`（art. 23の2、UTF-8、238 文字）
- 照合先 JSON: `data/raw/337M50000008017_20260724_508M60000008092.law.json`
  （flatten テキストに対して raw / 正規化の両方で `.find()` FOUND、各 `count = 1` を確認済み）

名前空間は `JapanTaxLaw.LightOilBaseTax`（他モジュールと衝突しない独立名前空間）。
`Money := Nat`、`TaxRate` は `JapanTaxLaw.TaxFinance` を import して利用。

原文（一字も変更せず、全文）:

> 軽油引取税の基準税額は、一一、二五〇円に、前年度における軽油引取税の課税標準となつた数量（一キロリットル未満の端数があるときは、その端数を四捨五入する。）に別表第十一に定める率を乗じて得た数量（一キロリットル未満の端数があるときは、その端数を四捨五入する。）を乗じて得た額とする。ただし、指定都市を包括する都道府県の基準税額は、当該額から当該都道府県の区域内の指定都市ごとに第三十八条の規定によつて算定した額を控除した額とする。

## 1. 追加した def / theorem 一覧

### 実装（`LightOilBaseTax.lean`）— 7 def + 1 abbrev、12 theorem

| 区分 | 名前 | 内容 |
| --- | --- | --- |
| （型） | `Quantity` | `abbrev Quantity := Nat`（キロリットル、caller-established） |
| 基本 | `lightOilBaseAmount` | 原文「一一、二五〇円」= `11_250` |
| 端数 | `roundDiv` | `roundDiv a b = (2*a + b) / (2*b)`（四捨五入 = round half up、0.5 切り上げ） |
| 端数 | `roundKiloliter` | `roundDiv (quantity * rate.num) rate.den`（率適用後の一キロリットル未満を四捨五入） |
| 本則 | `lightOilBaseTax` | `lightOilBaseAmount * roundKiloliter quantity rate`（担当指定の定式そのもの） |
| ただし書 | `designatedCityDeduction` | `amounts.sum`（第 38 条算定額の合計、各額は caller-established） |
| ただし書 | `lightOilBaseTaxAfterDesignatedCityDeduction` | `lightOilBaseTax - designatedCityDeduction`（Nat saturating 減算） |
| ただし書 | `baseTaxFor` | caller-established の Bool で控除あり／なしの関数を選択（Bool は金額式に入れない） |

theorem 12 本（モデル性質のみ）:

- `lightOilBaseAmount_pos`（by decide）/ `roundDiv_den_pos_two_mul`（Nat.mul_pos、率の分母 > 0 より）
- `lightOilBaseAmount_eq` / `roundDiv_eq` / `roundKiloliter_eq` / `lightOilBaseTax_eq` /
  `lightOilBaseTax_eq_literal` / `designatedCityDeduction_eq` /
  `lightOilBaseTaxAfterDesignatedCityDeduction_eq` / `baseTaxFor_true` / `baseTaxFor_false`（いずれも rfl）
- `afterDeduction_eq_zero_of_ge`（控除額 ≥ 基準税額なら 0、`Nat.sub_eq_zero_of_le`）

### 独立定式（`LightOilBaseTaxSpec.lean`）— 10 def（spec 5 + agree 5）

| 名前 | 内容 |
| --- | --- |
| `specRoundDiv` | `(2*a + b) / (2*b)`（TaxRate ヘルパを使わない独立整数定式） |
| `specRoundKiloliter` | `specRoundDiv (quantity * num) den` |
| `specLightOilBaseTax` | `11_250 * specRoundKiloliter quantity num den` |
| `specSum` | `List Nat` の自前再帰和（`List.sum` を使わない独立定式） |
| `specDesignatedCityNet` | `specLightOilBaseTax - specSum amounts` |
| `agreeLightOilBaseAmount` | impl ≡ spec（定数値、by decide） |
| `agreeRoundKiloliter` | impl ≡ spec（9 数量 × 5 率 = 45 点、by decide） |
| `agreeLightOilBaseTax` | impl ≡ spec（9 数量 × 4 率 = 36 点、by decide） |
| `agreeDesignatedCityNet` | impl ≡ spec（3 点 × 6 控除リスト = 18 点、by decide） |
| `agreeBaseTaxFor` | Bool 選択が関数選択のみに使われることの有限点確認（by decide） |

### 退行テスト（`LightOilBaseTaxTests.lean`）

`example : ... := by decide` の kernel-decide smoke **34 件**。
境界: 数量 0 → 0、四捨五入の切り捨て（1/3 → 0）／切り上げ（2/3 → 1、0.5 → 1、1.5 → 2）、
指定都市控除で 0（ちょうど 0 と saturating）、Bool 選択（true = 控除あり、false = なし）。
Spec 側にも独立定式の smoke 18 件 + agree 5 件 = 23 件。

### doc-comment に明記した射程

- 数量・率・各指定都市額・（指定都市を包括する都道府県か否かの）該当性は
  **すべて caller-established**。法的判断は自動化していない。**Bool は金額式に入れていない**。
- 原文の四捨五入のうち、率適用後を `roundKiloliter`（round half up）でモデル化。
  率適用前の課税標準数量の四捨五入は呼出側で丸め済みの値を渡す形（caller-established）。
- 控除は Nat の saturating 減算（控除額が基準税額を超える場合は 0）。
- `agree*` は定数値の `==` 一致確認であり、法的意味の等価証明ではない。
  転記監査は fidelity-only（原文 bytes との一致確認）であり法的正しさを保証しない。

## 2. 転記監査に追加すべき check（JSON 断片）

`scripts/ci/transcription_audit.py` の `checks()` に追加する check の JSON 表現です
（`law_id` / `kind` / `title` / `needles` の 4 キー）。needle 文字列は原文の一字一句です。
**文字正規化・全角／半角変換・異体字変換を行わず、そのまま移してください。**
全 needle は全角空白 U+3000 を含みません。

```json
{
  "law_id": "337M50000008017",
  "kind": "file",
  "title": null,
  "needles": [
    "軽油引取税の基準税額は、一一、二五〇円に、前年度における軽油引取税の課税標準となつた数量",
    "（一キロリットル未満の端数があるときは、その端数を四捨五入する。）に別表第十一に定める率を乗じて得た数量",
    "（一キロリットル未満の端数があるときは、その端数を四捨五入する。）を乗じて得た額とする。",
    "ただし、指定都市を包括する都道府県の基準税額は、当該額から当該都道府県の区域内の指定都市ごとに第三十八条の規定によつて算定した額を控除した額とする。"
  ]
}
```

参考変換例:

```python
yield ("軽油引取税法施行令 art. 23の2（軽油引取税の基準税額の算定方法）↔ LightOilBaseTax.lean",
       "337M50000008017",
       "file", None,
       [ ...上記 needles 4 本を一字も変えずに列挙... ])
```

## 3. 期待 literal 増分

- 新規 check **4 needles** なので **+4**。
- `docs/PROGRESS.md` の監査 literal 総数はメインセッションが再確認して加算してください
  （起点値は本メモでは書きません）。

## 4. 検証結果（すべて本セッションで実行済み）

- `lake build JapanTaxLaw.LightOilBaseTax JapanTaxLaw.LightOilBaseTaxSpec JapanTaxLaw.LightOilBaseTaxTests`
  → **成功（5 jobs、warning なし）**。※全体ビルド／CI／`run_python_gates.py` は実行していません。
- `python scripts/ci/check_no_sorry.py` →
  `no forbidden placeholder proofs found in tracked Lean sources`。
  （新規 3 ファイルは未追跡のため走査対象外ですが、人手でも `sorry` / `admit` はありません。）
- `#print axioms`（一時ファイル `LOTB_AxiomProbe.lean` を approved temp dir に作成、
  `lake env lean` で実行後 **削除済み**）:
  - 新规定数 **29 本**（impl def 7 + theorem 12 + spec def 5 + agree def 5）を検査。
    **`Classical.choice` も `sorryAx` も一切なし**。
  - 28 本は `does not depend on any axioms`。
  - 1 本（`afterDeduction_eq_zero_of_ge`）は `propext` に依存（repo 許容範囲、propext 可）。
- 原文逐語検証: **4/4 FOUND、MISS 0 件**（§5）。pinned JSON の flatten テキストが
  原文ファイルと一致することも raw / 正規化の両方で確認済み。

## 5. 逐語検証 FOUND / MISS 一覧（一字も変更せず）

pinned JSON の flatten テキストをそのまま haystack とし、needle も同じ文字列で Python
`.find()` を実行。`norm@` は `re.sub(r"[\s　]+", "", ...)` 正規化後の offset
（transcription_audit.py の `contains()` と同一条件）、`raw@` は未正規化テキスト上の offset。
両方とも原文ファイル（`C6_fuel.txt` の本文行）上でも `.find() >= 0`、`count = 1` を確認済み。

| # | 区分 | len | 全角空白 | raw@ | norm@ | count | 結果 |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 1 | 基準額・課税標準数量 | 44 | なし | 505227 | 493152 | 1 | **FOUND** |
| 2 | 別表第十一の率適用後 | 52 | なし | 505271 | 493196 | 1 | **FOUND** |
| 3 | 乗じて得た額 | 44 | なし | 505323 | 493248 | 1 | **FOUND** |
| 4 | ただし書（指定都市控除） | 74 | なし | 505367 | 493292 | 1 | **FOUND** |

- **FOUND 4 / MISS 0**。needle の勝手な変更・正規化・文字変換はしていません。
- MISS が出ていた場合はここで作業を止めて報告する手順でしたが、該当なしです。
- 全 needle は全角空白 U+3000 を含みません（原文本文にも U+3000 は存在しません）。

## 6. README / PROGRESS に足す 1 行文案

CROSS_LAW の scan/pin 件数や監査 literal 総数はメインセッションが計算するため、ここでは書きません。

- **README.md**（モジュール一覧の該当付近に追加）:
  ```text
  JapanTaxLaw/LightOilBaseTax.lean / -Spec.lean / -Tests.lean  # 軽油引取税法施行令 art.23の2（軽油引取税の基準税額）の L4 計算スライス。基準額 11,250円 × roundKiloliter(数量×率)（四捨五入 = round half up）、ただし書は指定都市ごとの第38条算定額の合計を saturating 控除。数量・率・指定都市額・該当性は caller-established
  ```
- **docs/PROGRESS.md**（L4 着手済みモジュール一覧の末尾に追記）:
  ```text
  軽油引取税法施行令 art.23の2（LightOilBaseTax.lean：基準税額 = 11,250円 × 四捨五入後数量、roundKiloliter は (2a+b)/(2b) の round half up、ただし書は指定都市額合計を Nat saturating 控除、Bool は関数選択のみ。数量・率・指定都市額・該当性は caller-established、別表率・第38条算定は NOT MODELLED）
  ```

## 7. インテグレーターへの明示事項

**インテグレーターは `JapanTaxLaw.lean` に以下の 3 つの import を追加すること。**

```lean
import JapanTaxLaw.LightOilBaseTax
import JapanTaxLaw.LightOilBaseTaxSpec
import JapanTaxLaw.LightOilBaseTaxTests
```

（LOTB は `JapanTaxLaw.lean` を書き換えていません。メインが統合してください。）

## 8. 範囲・残ブロッカーの正直な申告

- これは **L4 のごく小さなスライス**です。**完成・網羅を主張しません**。
- 対象は art. 23の2 の「11,250 円 ×（数量 × 率を四捨五入した数量）」という算術構造と、
  ただし書の「指定都市ごとの算定額を控除する」という構造のみです。
- **NOT MODELLED（明示）**:
  - **別表第十一条の率**: 本政令の別表第十一条に定める率の具体的な値・適用区分は原文に
    数値がなく、caller-established の `TaxRate` として受け取るのみでモデル化していません。
  - **第三十八条の指定都市額算定**: ただし書が参照する「第三十八条の規定によつて算定した額」
    の算定方法自体は本担当範囲外であり、各指定都市額は caller-established の `Money` として
    受け取るのみでモデル化していません。
  - 前年度課税標準数量の確定、指定都市の該当性・一覧、率適用前の四捨五入（呼出側に委譲）、
    他の条項・経過措置・附則は一切モデル化していません。
- 数量・率・各指定都市額・該当性は caller-established（本モジュールは算術のみ）。
- 四捨五入は原文「四捨五入」を round half up（0.5 切り上げ）として整数モデル化したもので、
  別の丸め慣行を断定するものではありません。
- `agree*` は定数値の `==` 一致確認であり、法的意味の等価証明ではありません。
- 転記監査は fidelity-only（原文 bytes との一致確認）であり、法的正しさを保証しません。
- **L7 候補 3,438 件は LEGAL_REVIEW_PENDING（unreviewed）のまま**です（本スライスでは一切レビューしていません）。
- 残ブロッカー: 転記監査 check の `checks()` への組み込み（§2、+4）、`JapanTaxLaw.lean` への
  import 追加（§7）、README / PROGRESS の 1 行追記（§6）、および全体ビルド・CI ゲートの
  実行は**すべてメインセッションの担当**です（LOTB は実行していません）。
