# STAGING — W-H（所得税法 扶養控除 art. 84／art. 186の2）受け渡しメモ

> 実装担当 W-H からメインセッション（統合担当）への受け渡し用。
> ブランチ操作・add/commit/push/merge は一切していません。
> 書き換えたのは下記 4 ファイルのみです（他は読み取り専用）。

## 0. 対象ファイル

| ファイル | 状態 |
| --- | --- |
| `JapanTaxLaw/IncomeDependentDeductions.lean` | 新規 |
| `JapanTaxLaw/IncomeDependentDeductionsSpec.lean` | 新規 |
| `JapanTaxLaw/IncomeDependentDeductionsTests.lean` | 新規 |
| `docs/STAGING_WH.md` | 上書き（本ファイル。旧内容は別担当 ART の P5H メモでした） |

pinned source: `data/raw/340AC0000000033_20261001_507AC0000000070.law.json`
law id `340AC0000000033` / revision `340AC0000000033_20261001_507AC0000000070`
amendment enforcement date `2026-10-01`（IndividualIncomeTax / IncomeMiscDeductions と同一ピン、
sha256 `94C4A7AD83726CDE60787967ED4E959585AD0AF9279D25DB9AA02264B3FE606B`）。
担当範囲原文: `C:\Users\junny\AppData\Local\Temp\opencode\W_H_income_order.txt`
（第八十四条・第百八十六条の二、正規化済み UTF-8）。

### 原文の金額（重要：指示文と原文が食い違う点）

| 区分 | 原文 | 金額 |
| --- | --- | --- |
| 控除対象扶養親族（一般） | 三十八万円 | 380,000 |
| 特定扶養親族 | 六十三万円 | 630,000 |
| 老人扶養親族 | **四十八万円** | **480,000** |

指示文は「老人控除対象扶養親族は58万円」と記載していましたが、**原文は
「その者が老人扶養親族である場合には四十八万円」** です（用語も「老人扶養親族」）。
指示文自身が「原文を正確に読んで金額を確認すること」と求めているため、
原文に従い **480,000** を採用しました。580,000 は誤りです。

## 1. 追加した def 一覧

`namespace JapanTaxLaw.IncomeDependentDeductions`、`open JapanTaxLaw.TaxFinance`。
flat `JapanTaxLaw` 名前空間の `specificDependentDeduction`（地方税法 art. 34、¥450,000 等）と
衝突しないよう dedicated sub-namespace を採用（`IncomeMiscDeductions` と同じ方針）。

### 実装（`IncomeDependentDeductions.lean`）— 6 def / 2 型 / 12 定理（＋ private 1）

| 区分 | 名前 | 値／意味 |
| --- | --- | --- |
| 定数 | `generalDependentAmount` | `Money := 380_000`（一般・三十八万円） |
| 定数 | `specificDependentAmount` | `Money := 630_000`（特定扶養親族・六十三万円） |
| 定数 | `elderlyDependentAmount` | `Money := 480_000`（老人扶養親族・四十八万円） |
| 型 | `DependentCategory` | `general` / `specific` / `elderly`（区分は caller-established） |
| def | `art84AmountPerDependent (c)` | 区分別一人当たり額（上の定数を返す） |
| 型 | `DependentBreakdown` | `generalCount` / `specificCount` / `elderlyCount`（人数は caller-established） |
| def | `art84TotalDependentDeduction (b)` | `g*380000 + s*630000 + e*480000`（通常の Nat 掛け算、**上限なし**・端数なし） |
| def | `art84IncomeAfterDependentDeduction (totalIncome) (b)` | `totalIncome − 合計`（saturating Nat） |

定理: 各定数の `_pos`（3 本）、区分選択の characterization（3 本）、
合計額の `_zero` / `_eq` / `_eq_sum`（3 本）、saturating 減算の `_of_ge` / `_of_lt`
/ `_le_total`（3 本）＝ 公共 12 本＋ private `natSubEqZeroOfLeFree` 1 本。

### 独立仕様（`IncomeDependentDeductionsSpec.lean`）— 6 def

`spec` 接頭辞で impl 定数を一切参照しない（リテラル直書き）:
`specGeneralDependentAmount` / `specSpecificDependentAmount` /
`specElderlyDependentAmount` / `specArt84Total` / `specArt84IncomeAfter` /
`agreeIncomeDependentDeductions`。`agree` は counts `[0,1,2,3,7,12]` × totals
9 点の有限グリッドで `==` 一致を検査（`by decide`、全称主張ではない）。

### 退行テスト（`IncomeDependentDeductionsTests.lean`）

新規定理名なし、全件 `example ... := by decide` の kernel-decide smoke のみ。

**def 数合計: 実装 6 ＋ 仕様 6 ＝ 12**（＋ 型 2、定理 12＋private 1、agree 1）。

## 2. NOT MODELLED — 第百八十六条の二（源泉控除対象配偶者に係る控除の適用）

原文を全文精読しましたが、本条は **金額・率・算定式などの明確な計算規則を含みません**。
内容は、扶養控除等申告書に源泉控除対象配偶者として記載された配偶者が、当該居住者を
自らの申告書等に源泉控除対象配偶者として記載して第185条1項1号・2号／第186条1項1号・
2項1号／第203条の3第1号〜第3号の適用を受ける場合に、**当該居住者の申告書には
記載がなかったものとして**これらの規定を適用する、という **重複申告を排除するための
法的擬制・適用順位の規定** です。

数値モデルを立てるには第185条・第186条・第203条の3の源泉徴収税額計算と、
申告書記載という事実変数（caller-established）のモデル化が別途必要であり、
本スライス（art. 84 の控除額算出）の範囲外です。よって **NOT MODELLED** と明記し、
計算 def・spec・test は作っていません（原文を読んだ証拠として needle 2 本を保持）。

## 3. 転記監査に追加すべき check（JSON 断片）

`scripts/ci/transcription_audit.py` の `checks()` に追加する check の JSON 表現です
（`law_id` / `kind` / `title` / `needles` の 4 キー）。needle 文字列は一字も変えず原文から
抽出しました。**文字正規化・全角／半角変換・異体字変換を行っていません。**

```json
{
  "law_id": "340AC0000000033",
  "kind": "file",
  "title": null,
  "needles": [
    "居住者が控除対象扶養親族を有する場合には、その居住者のその年分の総所得金額、退職所得金額又は山林所得金額から、その控除対象扶養親族一人につき三十八万円",
    "その者が特定扶養親族である場合には六十三万円",
    "その者が老人扶養親族である場合には四十八万円",
    "前項の規定による控除は、扶養控除という。",
    "（源泉控除対象配偶者に係る控除の適用）第百八十六条の二",
    "に源泉控除対象配偶者である旨の記載がされていないものとして、第百八十五条第一項第一号及び第二号並びに前条第一項第一号及び第二項第一号の規定を適用する。"
  ]
}
```

参考：現行スクリプト形式への変換例（name は任意、needles は上記 6 本をそのまま使用）:

```python
yield ("所得税法 art. 84（扶養控除 38万/63万/48万）↔ IncomeDependentDeductions.lean; art. 186の2 は NOT MODELLED",
       "340AC0000000033",
       "file", None,
       [ ...上記 needles 6 本を一字も変えずに列挙... ])
```

## 4. 期待 literal 増分

- W-H 担当分: 新規 check **6 needles** なので **+6**。
- `docs/PROGRESS.md` の監査 literal 総数はメインセッションが再確認して加算してください
  （起点値は本メモでは書きません）。

## 5. 検証結果（すべて本セッションで実行済み）

- `lake build JapanTaxLaw.IncomeDependentDeductions JapanTaxLaw.IncomeDependentDeductionsSpec JapanTaxLaw.IncomeDependentDeductionsTests`
  → **成功（5 jobs、warning なし）**。※自作 3 モジュールのみビルド（全体ビルド／CI／
  `run_python_gates.py` は実行していません）。
- `python scripts/ci/check_no_sorry.py` →
  `no forbidden placeholder proofs found in tracked Lean sources`。
  （新規 3 ファイルは未追跡のため走査対象外ですが、人力でも `sorry` / `admit` はありません。）
- `#print axioms`（一時ファイル `WHAxiomProbe.lean` を approved temp dir に作成、
  `lake env lean` で実行後 **削除済み**）:
  - 公共定理 **12 本** ＋ `agreeIncomeDependentDeductions` の計 **13 件**が
    `does not depend on any axioms`。
  - **`Classical.choice` も `sorryAx` も `propext` も一切なし**（出力 13 行を全文走査）。
- 原文逐語検証: 担当範囲原文・pinned JSON の両方に対して
  `re.sub(r"[\s　]+", "", ...)` 正規化後、各 needle を Python `.find()` で検索し
  **6/6 FOUND、MISS 0 件**（§6）。各 needle の出現回数は両テキストで **1**（一意）。
  law id `340AC0000000033` … FOUND / revision `340AC0000000033_20261001_507AC0000000070` … FOUND。
- 金額一致: 三十八万円=380,000 / 六十三万円=630,000 / 四十八万円=480,000、
  原文の日本語数字と全件一致（58 万円は采用していません）。

## 6. 逐語検証 FOUND / MISS 一覧（一字も変更せず）

`art@` は担当範囲原文 `W_H_income_order.txt` の正規化文字列上の offset、
`json@` は pinned JSON `law_full_text` を `transcription_audit.py` と同一ロジックで
平坦化・正規化した文字列上の offset。各 needle の出現回数は両方とも **1**。

| # | 条 | def／用途 | 結果 | art@ | json@ | 出現回数 | len |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 1 | 84 | `generalDependentAmount` | FOUND | 11 | 100647 | 1/1 | 75 |
| 2 | 84 | `specificDependentAmount` | FOUND | 87 | 100723 | 1/1 | 22 |
| 3 | 84 | `elderlyDependentAmount` | FOUND | 112 | 100748 | 1/1 | 22 |
| 4 | 84 | 扶養控除の名称 | FOUND | 146 | 100782 | 1/1 | 20 |
| 5 | 186の2 | NOT MODELLED 記録 | FOUND | 166 | 201410 | 1/1 | 27 |
| 6 | 186の2 | NOT MODELLED 記録 | FOUND | 560 | 201804 | 1/1 | 75 |

- **FOUND 6 / MISS 0**。needle の長さは 20〜75 文字、6 本すべて相互に異なることを確認。
  アンカーの勝手な変更・正規化・文字変換はしていません。

## 7. README / PROGRESS に足す 1 行文案

CROSS_LAW の scan/pin 件数や監査 literal 総数はメインセッションが計算するため、ここでは書きません。

- **README.md**（モジュール一覧・`IncomeMiscDeductions*` 行の直後に追加）:
  ```text
  JapanTaxLaw/IncomeDependentDeductions.lean / -Spec.lean / -Tests.lean  # 所得税法 art. 84（扶養控除: 一般38万／特定63万／老人48万、区分別額×人数、上限なし）の bounded L4 モデル・独立定式・退行テスト（art. 186の2 は NOT MODELLED）
  ```
- **docs/PROGRESS.md**（L4 着手済みモジュール一覧の末尾に追記）:
  ```text
  所得税法 art. 84 扶養控除（IncomeDependentDeductions.lean：3区分の一人当たり額を Money 定数化、区分別額×人数で合計、art. 186の2 は計算規則不在のため NOT MODELLED、他の所得控除条 NOT YET COVERED）
  ```

## 8. インテグレーターへの明示事項

**インテグレーターは `JapanTaxLaw.lean` に以下の 3 つの import を追加すること。**

```lean
import JapanTaxLaw.IncomeDependentDeductions
import JapanTaxLaw.IncomeDependentDeductionsSpec
import JapanTaxLaw.IncomeDependentDeductionsTests
```

（他ワーカーの import と併せてメインが行数を確認してください。
W-H は `JapanTaxLaw.lean` を書き換えていません。`IncomeMiscDeductions*` namespace にも
触れていません。）

## 9. 範囲・残ブロッカーの正直な申告（最終報告）

- **build**: 自作 3 モジュールのみ `lake build` 成功（5 jobs / warning なし）。全体ビルド・CI・
  `run_python_gates.py` は未実行です。
- **axiom**: 公共定理 12 本＋agree 1 本の計 13 件すべて axiom-free、
  `Classical.choice` / `sorryAx` / `propext` なし（一時ファイルは削除済み）。
- **逐語**: FOUND 6 / MISS 0（担当範囲原文・pinned JSON の両方、出現回数 1、長さ 20〜75）。
- **def 数**: 実装 6 ＋ 仕様 6 ＝ 12（＋ 型 2、定理 12＋private 1、agree 1）。
- **STAGING**: 本ファイル `docs/STAGING_WH.md` を作成済みです（旧内容を上書き）。
- これは **L4 のごく小さなスライス**です。**完成・網羅を主張しません**。
- 担当は 所得税法 **第84条・第186条の2 のみ**。他の所得控除条（配偶者控除・基礎控除等）は
  NOT YET COVERED。第186条の2 は明確な計算規則がないため **NOT MODELLED**。
- 扶養親族の該当性（控除対象扶養親族／特定扶養親族／老人扶養親族であること）と人数は
  すべて caller-established とし、法的判断の自動化はしていません。上限なし・端数処理なし。
- 指示文の「58万円」は原文と異なるため采用せず、原文の「四十八万円」＝480,000 を使用しました。
- `agreeIncomeDependentDeductions` は有限点での `==` 一致確認であり、法的意味の等価証明ではありません。
- 転記監査は fidelity-only（原文 bytes との一致確認）であり、法的正しさを保証しません。
- **L7 候補 3,438 件は unreviewed のまま**です（本スライスでは一切レビューしていません）。
- 残ブロッカー: 転記監査 check の `checks()` への組み込み（§3、+6）、`JapanTaxLaw.lean` への
  import 追加（§8）、README / PROGRESS の 1 行追記（§7）、および全体ビルド・CI ゲートの
  実行は**すべてメインセッションの担当**です（W-H は実行していません）。
