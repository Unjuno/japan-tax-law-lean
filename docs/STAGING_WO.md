# STAGING — W-O（所得税法 第七十四条（社会保険料控除）の bounded L4 モデル）受け渡しメモ

> 実装担当 W-O からメインセッション（統合担当）への受け渡し用。
> ブランチ操作・add/commit/push/merge は一切していません。
> 書き換えたのは下記 4 ファイルのみです（他は読み取り専用）。

## 0. 対象ファイル

| ファイル | 状態 |
| --- | --- |
| `JapanTaxLaw/IncomeSocialInsuranceDeduction.lean` | 新規 |
| `JapanTaxLaw/IncomeSocialInsuranceDeductionSpec.lean` | 新規 |
| `JapanTaxLaw/IncomeSocialInsuranceDeductionTests.lean` | 新規 |
| `docs/STAGING_WO.md` | 新規（本ファイル） |

pinned source: `data/raw/340AC0000000033_20261001_507AC0000000070.law.json`
law id `340AC0000000033` / revision `340AC0000000033_20261001_507AC0000000070`
amendment enforcement date `2026-10-01`
（IndividualIncomeTax / IncomeBasicDeduction / IncomeDependentDeductions /
IncomeWithholdingRates / IncomeMiscDeductions と同一ピン）。
担当範囲原文: `W_O_income_social.txt`（第七十四条(1)、正規化済み・UTF-8）。

Namespace note: 新規モジュールは dedicated sub-namespace
`JapanTaxLaw.IncomeSocialInsuranceDeduction` を使用しています。これは
地方税法 art. 34 の flat namespace `socialInsuranceDeduction`
（SocialInsuranceMutualAidDeduction.lean）との衝突を避けるためです。

## 1. 追加した def 一覧

`namespace JapanTaxLaw.IncomeSocialInsuranceDeduction`、`open JapanTaxLaw.TaxFinance`
（`Money = Nat`）。原文に上限・率はなく、控除額は支払額そのものです。

| # | ファイル | def 名 | 型 / 意味 |
| --- | --- | --- | --- |
| 1 | `.lean` | `socialInsuranceDeduction` | `(paidAmount : Money) → Money` = `paidAmount`（支払つた金額／給与から控除される金額そのもの。上限・率なし） |
| 2 | `.lean` | `taxableAfterSocialInsurance` | `(totalIncome paid : Money) → Money` = `totalIncome - paid`（saturating Nat 減算） |
| 3 | `.lean`（private） | `natSubEqZeroOfLeFree` | `a ≤ b → a - b = 0` の axiom-free 自前証明（`propext` 回避） |
| 4 | `Spec.lean` | `specSocialInsuranceDeduction` | `(paidAmount : Nat) → Nat` = `paidAmount`（impl 定数を参照しない独立定式） |
| 5 | `Spec.lean` | `specTaxableAfterSocialInsurance` | `(totalIncome paid : Nat) → Nat` = `if paid ≤ totalIncome then totalIncome - paid else 0`（アンダーフローを明示的に回避） |
| 6 | `Spec.lean` | `agreeIncomeSocialInsuranceDeduction` | `Bool`（impl ↔ spec の有限グリッド一致、`==` 比較） |

定理（`example := by decide` のスモークは別途）:
`socialInsuranceDeduction_eq` / `_mono` /
`taxableAfterSocialInsurance_eq_sub_of_le` /
`taxableAfterSocialInsurance_add_paid_of_le`（paid ≤ totalIncome で exact、
`(所得−支払)＋支払＝所得`）/
`taxableAfterSocialInsurance_of_lt` / `_le_income`。

各 def に smoke を付与済み。Spec は独立定式 + `agreeIncomeSocialInsuranceDeduction`
（`by decide`）。Tests は kernel-decide smoke のみ（新規定理名なし）。
Tests のスモークは 0・端数（101→98, 1_000→999）・paid > total のアンダーフロー
（100_000 に対し 250_000 → 0、0 に対し 1 → 0）をカバー。

### 原文どおりの読み取り

- 第七十四条(1): 「…その支払つた金額又はその控除される金額を、その居住者のその年分の
  総所得金額、退職所得金額又は山林所得金額から控除する。」→ 控除額 = 支払額そのもの、
  控除後 = 総所得 − 支払額。金額の上限・率は原文に存在しません。
- 第七十四条(2): 社会保険料の定義（健康保険・国民健康保険・介護保険・雇用保険・
  国民年金・厚生年金等の列挙、「政令で定めるもの」、「第九条第一項第七号に掲げる
  給与に係るものを除く」）は列挙どおりですが、**該当性判定は caller-established** とし、
  Bool を金額計算式に入れていません（支払と給与控除で別の式も作っていません）。

## 2. 転記監査に追加すべき check（JSON 断片）

`scripts/ci/transcription_audit.py` の `checks()` に追加する check の JSON 表現です
（`law_id` / `kind` / `title` / `needles` の 4 キー）。needle 文字列は一字も変えないこと。
**文字正規化・全角／半角変換・異体字変換を行わず、そのまま移してください。**
各 needle は正規化テキスト（空白・全角空白除去）上の連続部分そのもので、
担当範囲原文・pinned JSON の両方で出現回数 1 です。

```json
{
  "law_id": "340AC0000000033",
  "kind": "file",
  "title": null,
  "needles": [
    "居住者が、各年において、自己又は自己と生計を一にする配偶者その他の親族の負担すべき社会保険料を支払つた場合又は給与から控除される場合には、その支払つた金額又はその控除される金額を、その居住者のその年分の総所得金額、退職所得金額又は山林所得金額から控除する。",
    "前項に規定する社会保険料とは、次に掲げるものその他これらに準ずるもので政令で定めるもの（第九条第一項第七号（在勤手当の非課税）に掲げる給与に係るものを除く。）をいう。",
    "一健康保険法（大正十一年法律第七十号）の規定により被保険者として負担する健康保険の保険料",
    "五国民年金法の規定により被保険者として負担する国民年金の保険料及び国民年金基金の加入員として負担する掛金"
  ]
}
```

参考：現行スクリプト形式への変換例（name は任意、needles は上記 4 本をそのまま使用）:

```python
yield ("所得税法 art. 74（社会保険料控除）↔ IncomeSocialInsuranceDeduction.lean",
       "340AC0000000033",
       "file", None,
       [ ...上記 needles 4 本を一字も変えずに列挙... ])
```

## 3. 検証結果（すべて本セッションで実行済み）

- `lake build JapanTaxLaw.IncomeSocialInsuranceDeduction JapanTaxLaw.IncomeSocialInsuranceDeductionSpec JapanTaxLaw.IncomeSocialInsuranceDeductionTests`
  → **成功（5 jobs、warning なし）**。※自作 3 モジュールのみビルド（全体ビルド／CI／
  `run_python_gates.py` は実行していません）。
- `python scripts/ci/check_no_sorry.py` →
  `no forbidden placeholder proofs found in tracked Lean sources`。
  （新規 3 ファイルは未追跡のため走査対象外ですが、人力でも `sorry` / `admit` はありません。）
- `#print axioms`（一時ファイル `WOAxiomProbe.lean` を approved temp dir に作成、
  `lake env lean` で実行後 **削除済み**）:
  - 6 本の定理 + `agreeIncomeSocialInsuranceDeduction` の計 **7 件**を走査。
  - `Classical.choice` / `sorryAx` は **0 件**。
  - `taxableAfterSocialInsurance_add_paid_of_le` のみ `propext` に依存
    （`Nat.sub_add_cancel` 由来）。**`propext` は許容**のため問題なし。
    他 6 件は `does not depend on any axioms`。
- 原文逐語検証（needle を正規化テキストに対して Python `.find()`）:
  - 担当範囲原文 `W_O_income_social.txt`（正規化後 2,146 文字）:
    **4/4 FOUND、MISS 0 件**、各出現回数 1。
  - pinned JSON `law_full_text`（正規化後 1,095,718 文字）:
    **4/4 FOUND、MISS 0 件**、各出現回数 1。

### 逐語 FOUND / MISS 一覧（一字も変更せず）

| # | 条号 | 結果(原文) | art@ | count | len | 結果(JSON) | json@ | count |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| N1 | art. 74(1) 本文 | FOUND | 29 | 1 | 128 | FOUND | 89081 | 1 |
| N2 | art. 74(2) 定義 | FOUND | 158 | 1 | 83 | FOUND | 89210 | 1 |
| N3 | art. 74(2) 一（健康保険） | FOUND | 241 | 1 | 44 | FOUND | 89293 | 1 |
| N4 | art. 74(2) 五（国民年金） | FOUND | 480 | 1 | 52 | FOUND | 89532 | 1 |

**FOUND 4 / MISS 0**（両テキストで出現回数 1、一意）。needle の長さは 44〜128 文字。
アンカーの勝手な変更・正規化・文字変換はしていません。N1 は第七十四条(1) の
控除ルール本文、N2 は同条(2) の「社会保険料」定義、N3/N4 は同条(2) の
列挙項目（健康保険・国民年金）から一字も変えず抽出しています。

## 4. README / PROGRESS に足す 1 行文案

CROSS_LAW の scan/pin 件数や監査 literal 総数はメインセッションが計算するため、ここでは書きません。

- **README.md**（モジュール一覧・`IncomeBasicDeductions*` 行の直後に追加）:
  ```text
  JapanTaxLaw/IncomeSocialInsuranceDeduction.lean   # 所得税法 art. 74（社会保険料控除 支払額そのものを控除・上限率なし）L4 モデル
  JapanTaxLaw/IncomeSocialInsuranceDeductionSpec.lean # 同上 独立定式
  JapanTaxLaw/IncomeSocialInsuranceDeductionTests.lean# 同上 退行テスト
  ```
- **docs/PROGRESS.md**（L4 着手済みモジュール一覧の末尾に追記）:
  ```text
  所得税法 art. 74（社会保険料控除：支払つた金額／給与から控除される金額そのものを総所得等から控除、上限・率なし、社会保険料該当性は caller-established — IncomeSocialInsuranceDeduction.lean）
  ```

## 5. インテグレーターへの明示事項

**インテグレーターは `JapanTaxLaw.lean` に以下の 3 つの import を追加すること。**

```lean
import JapanTaxLaw.IncomeSocialInsuranceDeduction
import JapanTaxLaw.IncomeSocialInsuranceDeductionSpec
import JapanTaxLaw.IncomeSocialInsuranceDeductionTests
```

（W-A〜W-N の各 3 件と併せてメインが行数を確認してください。
W-O は `JapanTaxLaw.lean` を書き換えていません。他ワーカーのファイルには触れていません。）

## 6. 範囲・残ブロッカーの正直な申告（最終報告）

- **build**: 自作 3 モジュールのみ `lake build` 成功（5 jobs / warning なし）。全体ビルド・CI・
  `run_python_gates.py` は未実行です。
- **axiom**: 走査 7 件、`Classical.choice` / `sorryAx` なし。1 件が `propext` 依存
  （許容範囲）。一時ファイルは削除済み。
- **逐語**: FOUND 4 / MISS 0（担当範囲原文・pinned JSON の両方、出現回数 1、長さ 44〜128）。
- **def 数**: 実装 2 + Spec 3（独立定式 2 + agree 1）= **5 本**（private 補助定理 1 本は
  別途）。Tests は新規定理名なしの `example := by decide` のみ。
- **STAGING**: 本ファイル `docs/STAGING_WO.md` を作成済みです。
- これは **L4 のごく小さなスライス**です。**完成・網羅を主張しません**。
- 担当は 所得税法 **第七十四条(1) のみ**。第七十四条(2) の社会保険料の具体的列挙
  （健康保険・国民健康保険・高齢者の医療・介護保険・雇用保険・国民年金・農業者年金・
  厚生年金・船員保険・各種共済等）は原文どおり doc-comment に needle を載せていますが、
  **該当性判定の自動化・政令で定めるものの列挙・第九条第一項第七号の除外判定は
  非モデル化（caller-established）** です。第七十五条以降も NOT YET COVERED。
- 総所得金額・支払額は caller-established な入力です。税額計算・他の所得控除との
  調整控除の適用順序・総所得自体の算定・端数処理（通則法 art. 118/119）は非モデル化。
- `agreeIncomeSocialInsuranceDeduction` は有限点の `==` 一致確認であり、法的意味の
  等価証明ではありません。
- 転記監査は fidelity-only（原文 bytes との一致確認）であり、法的正しさを保証しません。
- **L7 候補 3,438 件は unreviewed のまま**です（本スライスでは一切レビューしていません）。
- 残ブロッカー: 転記監査 check の `checks()` への組み込み（§2、+4 needles）、
  `JapanTaxLaw.lean` への import 追加（§5）、README / PROGRESS の 1 行追記（§4）、
  および全体ビルド・CI ゲートの実行は**すべてメインセッションの担当**です
  （W-O は実行していません）。
