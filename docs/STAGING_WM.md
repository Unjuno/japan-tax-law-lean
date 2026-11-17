# STAGING — W-M（租税特別措置法施行令 第二十五条の十八／第四十条の五の二 の按分計算）受け渡しメモ

> 実装担当 W-M からメインセッション（統合担当）への受け渡し用。
> ブランチ操作・add/commit/push/merge は一切していません。
> 書き換えたのは下記 4 ファイルのみです（他は読み取り専用）。
> ※本ファイルは、先前の W-M 担当（登録免許税法 P8M）の受け渡しメモを、現担当の指示により
>   租税特別措置法施行令 2 条文（按分計算）のメモに差し替えたものです。

## 0. 対象ファイル

| ファイル | 状態 |
| --- | --- |
| `JapanTaxLaw/SpecialMeasuresApportionment.lean` | 新規 |
| `JapanTaxLaw/SpecialMeasuresApportionmentSpec.lean` | 新規 |
| `JapanTaxLaw/SpecialMeasuresApportionmentTests.lean` | 新規 |
| `docs/STAGING_WM.md` | 差し替え（本ファイル） |

pinned source:
  law_id `332CO0000000043` / revision `332CO0000000043_20261101_507CO0000000127`
  （`data/raw/332CO0000000043_20261101_507CO0000000127.law.json` を確認）。
  amendment enforcement date `2026-11-01`。
担当範囲原文: `W_M_special_order.txt`（2 条文、UTF-8、正規化後 430 文字、
`==== … LEN …` ヘッダ 2 行 + 本文 2 行）。原文は一字も変更せず doc-comment と needle に転記。

名前空間は他モジュールと衝突しないよう **`JapanTaxLaw.SpecialMeasuresApportionment`** としました
（`SpecialMeasuresMisc*` / `SpecialMeasuresCasinoRatio*` は読むだけ、**触っていません**）。

## 1. 原文とモデル化

- 第二十五条の十八（物納による譲渡所得等の非課税）:
  「政令で定める額が当該財産の価額のうちに占める割合を、当該財産の価額に乗じて計算した金額に相当する部分」
  → 割合を分子/分母ペア `(政令額, 財産価額)` で表現し、
    `nonTaxablePortion pv pa = apportion pv pa pv = pv * pa / pv`（切り捨て）。
    `pv > 0` なら結果は `pa`（政令額）に等しい。
- 第四十条の五の二（特定赠与者ごとの控除額）:
  「百十万円に、特定贈与者ごとの贈与税の課税価格が当該課税価格の合計額のうちに占める割合を乗じて計算」
  → `perDonorDeduction tp total = 1_100_000 * tp / total`（切り捨て、`total = 0` なら 0）。
    割合はペア `(tp, total)`。百十万円は `specifiedGiftBasicDeduction` として定数化。

按分共通 `apportion base numerator denominator = base * numerator / denominator` を置き、
両条ともこれを経由して計算する。Nat 除算の性質で分母 0 は 0 を返す（安全版を兼ねる）。

射程外（overclaim 防止、doc-comment に明記済み）:
- 財産価額・政令額・各贈与者の課税価格・合計課税価格はすべて **caller-established**。
  金額の認定・該当性判定は本モジュールの外で行い、Bool は算定式に入れていません。
- 二人以上の特定贈与者からの贈与の該当性、相続時精算課税適用者の特定、
  死亡により効力を生ずる贈与の除外、その他の政令要件は **caller-established / NOT MODELLED**。
- 原文は按分の割合を示し端数規定を持たない。Money = Nat の除算による**切り捨て**を
  丸め規則として明示（他モジュールの applyFloor と同一慣例）。解釈を保証するものではありません。
- 財産価額 = 0 / 合計課税価格 = 0 の退化ケースに法的意味があるとは主張しません
  （入力の妥当性・分母が正であることは caller が担保）。

## 2. 追加した def / 定理一覧

`namespace JapanTaxLaw.SpecialMeasuresApportionment`、`open JapanTaxLaw.TaxFinance`。

| ファイル | 種別 | 名前 | 内容 |
| --- | --- | --- | --- |
| main | def | `apportion` | `base * numerator / denominator`（分母 0 → 0） |
| main | def | `nonTaxablePortionRatio` | `(prescribedAmount, propertyValue)` |
| main | def | `nonTaxablePortion` | `apportion propertyValue prescribedAmount propertyValue` |
| main | def | `specifiedGiftBasicDeduction` | `1_100_000`（百十万円） |
| main | def | `perDonorRatio` | `(taxablePrice, totalTaxablePrice)` |
| main | def | `perDonorDeduction` | `apportion 1_100_000 taxablePrice totalTaxablePrice`（合計 0 → 0） |
| spec | def | `specApportion` | `(numerator * base) / denominator`（独立整数定式） |
| spec | def | `specNonTaxablePortion` | `(prescribedAmount * propertyValue) / propertyValue` |
| spec | def | `specPerDonorDeduction` | `(taxablePrice * 1_100_000) / totalTaxablePrice` |
| spec | def | `agreeApportion` / `agreeNonTaxablePortion` / `agreePerDonorDeduction` | 実装 ≡ spec の有限サンプル `==` 一致（各 8 / 7 / 8 点） |
| tests | — | （`example` のみ、def/定理名は追加せず） | 分母零・按分 1:1・端数切り捨ての `by decide` スモーク |

**公開 def 数: 11**（main 6 + spec 5）。定理数: 12（main）。Tests は `example` のみ。

定理一覧（いずれもモデル性質のみ）:
`apportion_eq`, `apportion_zero_denominator`, `apportion_zero_numerator`,
`apportion_one_to_one`, `nonTaxablePortion_eq`, `nonTaxablePortion_eq_prescribedAmount`,
`nonTaxablePortion_zero_propertyValue`, `specifiedGiftBasicDeduction_pos`,
`specifiedGiftBasicDeduction_eq`, `perDonorDeduction_eq`, `perDonorDeduction_zero_total`,
`perDonorDeduction_full`, `perDonorDeduction_mono`。

各 def の smoke:
- `apportion`: 1:1 / 零 / 分母零 / 端数切り捨て（main + tests + spec agree）。
- `nonTaxablePortion`: `pv > 0` → `pa`、`pv = 0` → 0、端数（main + tests + spec agree）。
- `perDonorDeduction`: 按分 1:1 → 1_100_000、合計 0 → 0、`1/3` の切り捨て
  （`366_666`、main + tests + spec agree）。

## 3. 転記監査に追加すべき check（JSON 断片）

`scripts/ci/transcription_audit.py` の `checks()` に追加する check の JSON 表現です
（`law_id` / `kind` / `title` / `needles` の 4 キー）。needle は原文から一字も変えず抽出。
**文字正規化・全角／半角変換・異体字変換を行わず、そのまま移してください。**
各 needle は担当範囲原文・pinned JSON の両方で出現回数 **1**（一意）を確認済みです。

```json
{
  "law_id": "332CO0000000043",
  "kind": "file",
  "title": null,
  "needles": [
    "政令で定める額が当該財産の価額のうちに占める割合を、当該財産の価額に乗じて計算した金額に相当する部分とする",
    "百十万円に、特定贈与者ごとの贈与税の課税価格が当該課税価格の合計額のうちに占める割合を乗じて計算するものとする",
    "（物納による譲渡所得等の非課税）第二十五条の十八法第四十条の三に規定する政令で定める部分は、同条に規定する財産のうち、同条に規定する納付を困難とする金額として政令で定める額が当該財産の価額のうちに占める割合を、当該財産の価額に乗じて計算した金額に相当する部分とする。"
  ]
}
```

参考：現行スクリプト形式への変換例（name は任意、needles は上記 3 本をそのまま使用）:

```python
yield ("租税特別措置法施行令 art. 25の18 / 40の5の2（按分計算）↔ SpecialMeasuresApportionment.lean",
       "332CO0000000043",
       "file", None,
       [ ...上記 needles 3 本を一字も変えずに列挙... ])
```

## 4. 期待 literal 増分

- W-M 担当分: 新規 check **3 needles** なので **+3**。
- `docs/PROGRESS.md` の監査 literal 総数はメインセッションが再確認して加算してください
  （起点値は本メモでは書きません）。

## 5. 検証結果（すべて本セッションで実行済み）

- `lake build JapanTaxLaw.SpecialMeasuresApportionment JapanTaxLaw.SpecialMeasuresApportionmentSpec JapanTaxLaw.SpecialMeasuresApportionmentTests`
  → **成功（5 jobs、warning なし）**。※自作 3 モジュールのみビルド（全体ビルド／CI／
  `run_python_gates.py` は実行していません）。
- `python scripts/ci/check_no_sorry.py` → `no forbidden placeholder proofs found in tracked Lean sources`。
  （新規 3 ファイルは未追跡のため走査対象外ですが、人力でも `sorry` / `admit` はありません。）
- `#print axioms`（一時ファイル `WMAxiomProbe.lean` を approved temp dir に作成、
  `lake env lean` で実行後 **削除済み**）:
  - 公開 def/定理 **25 件**を走査。**17 件は axiom-free**。
  - 残り **8 件**（`apportion_zero_denominator`, `apportion_zero_numerator`,
    `apportion_one_to_one`, `nonTaxablePortion_eq_prescribedAmount`,
    `nonTaxablePortion_zero_propertyValue`, `perDonorDeduction_zero_total`,
    `perDonorDeduction_full`, `perDonorDeduction_mono`）は **`[propext]` のみ**（許可範囲）。
  - **`Classical.choice` も `sorryAx` も一切なし**（出力 25 行を全文走査、いずれも 0 回）。
- 原文逐語検証: 担当範囲原文を `re.sub(r"[\s\u3000]+", "", ...)` で正規化した文字列、
  および pinned JSON `law_full_text` を `transcription_audit.py` と同一ロジックで平坦化・
  正規化した文字列に対し各 needle を Python `.find()` で検索 → **3/3 FOUND、MISS 0 件**
  （各 needle は両テキストで出現回数 **1**、§6）。

## 6. 逐語検証 FOUND / MISS 一覧（一字も変更せず）

| # | needle（先頭抜粋） | 結果 | 原文@ | json@ | 出現回数(原文/json) | len |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | 政令で定める額が当該財産の価額のうちに占める割合を…相当する部分とする（全文 53 字） | FOUND | 97 | 507277 | 1/1 | 53 |
| 2 | 百十万円に、特定贈与者ごとの贈与税の課税価格が…計算するものとする（全文 55 字） | FOUND | 374 | 1209554 | 1/1 | 55 |
| 3 | （物納による譲渡所得等の非課税）第二十五条の十八法第四十条の三に…部分とする。（全文 133 字） | FOUND | 18 | 507198 | 1/1 | 133 |

- **FOUND 3 / MISS 0**。needle の勝手な変更・正規化・文字変換はしていません
  （原文の `占める割合を、` の読点、`百十万円` の文字使い、
  `（以下この条において「特定贈与者」という。）` を含む本文も一字どおり保持）。
- 3 本はいずれも相互に異なる文字列で、pinned JSON 全体で一意です。

## 7. README / PROGRESS に足す 1 行文案

CROSS_LAW の scan/pin 件数や監査 literal 総数はメインセッションが計算するため、ここでは書きません。

- **README.md**（モジュール一覧に追加）:
  ```text
  JapanTaxLaw/SpecialMeasuresApportionment.lean / -Spec.lean / -Tests.lean  # 租税特別措置法施行令 art. 25の18（非課税部分=財産価額×政令額/財産価額）・art. 40の5の2（控除額=1,100,000×各課税価格/合計）の按分 L4 モデル・独立定式・退行テスト
  ```
- **docs/PROGRESS.md**（L4 着手済みモジュール一覧の末尾に追記）:
  ```text
  租税特別措置法施行令 art. 25の18 / 40の5の2（SpecialMeasuresApportionment.lean：按分共通 apportion、非課税部分、百十万円の贈与者別按分控除。金額は caller-established、切り捨て、分母零は 0、他の按分・特例規定は NOT YET COVERED）
  ```

## 8. インテグレーターへの明示事項

**インテグレーターは `JapanTaxLaw.lean` に以下の 3 つの import を追加すること。**

```lean
import JapanTaxLaw.SpecialMeasuresApportionment
import JapanTaxLaw.SpecialMeasuresApportionmentSpec
import JapanTaxLaw.SpecialMeasuresApportionmentTests
```

（W-A〜W-O の各 3 件と併せてメインが行数を確認してください。
W-M は `JapanTaxLaw.lean` を書き換えていません。`SpecialMeasuresMisc*` /
`SpecialMeasuresCasinoRatio*` / `data/*` / L7 CSV には触れていません。）

## 9. 範囲・残ブロッカーの正直な申告（最終報告）

- **build**: 自作 3 モジュールのみ `lake build` 成功（5 jobs / warning なし）。全体ビルド・CI・
  `run_python_gates.py` は未実行です。
- **axiom**: 公開 def/定理 25 件のうち 17 件が axiom-free、8 件が `propext` 依存（許可範囲）。
  `Classical.choice` / `sorryAx` なし（一時ファイルは削除済み）。
- **逐語**: FOUND 3 / MISS 0（担当範囲原文・pinned JSON の両方、出現回数 1、長さ 53〜133）。
- **def 数**: 11（main 6 + spec 5）。定理 12。Tests は `example` のみ。
- **STAGING**: 本ファイル `docs/STAGING_WM.md` を作成（差し替え）済みです。
- これは **L4 のごく小さなスライス**です。**完成・網羅を主張しません**。
- 担当は 租税特別措置法施行令 **第百二十五条の十八・第百四十条の五の二 の 2 条文のみ**。
  他の按分計算・租税特別措置法施行令のその他の条规定は **NOT YET COVERED**
  （本スライスでは既存モジュールを変更していません）。
- 財産価額・政令額・課税価格・合計額はすべて caller-established とし、法的判断の自動化は
  していません。丸めは切り捨てを採用したことを明示していますが、原文に端数規定がないため
  解釈を保証するものではありません。
- `agreeApportion` / `agreeNonTaxablePortion` / `agreePerDonorDeduction` は定数同士の `==`
  一致確認であり、法的意味の等価証明ではありません。
- 転記監査は fidelity-only（原文 bytes との一致確認）であり、法的正しさを保証しません。
- **L7 候補 3,438 件は unreviewed のまま**です（本スライスでは一切レビューしていません）。
- 残ブロッカー: 転記監査 check の `checks()` への組み込み（§3、+3）、`JapanTaxLaw.lean` への
  import 追加（§8）、README / PROGRESS の 1 行追記（§7）、および全体ビルド・CI ゲートの
  実行は**すべてメインセッションの担当**です（W-M は実行していません）。
