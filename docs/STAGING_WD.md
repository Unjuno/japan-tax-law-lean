# STAGING — W-D（関税法 3条文の bounded L4 モデル）受け渡しメモ

> 実装担当 W-D からメインセッション（統合担当）への受け渡し用。
> ブランチ操作・add/commit/push/merge は一切していません。
> 書き換えたのは下記 4 ファイルのみです（他は読み取り専用）。
> 本ファイルは以前の別担当（登録免許税法 P3D）の STAGING を置き換えました
> （旧担当の成果は既に `JapanTaxLaw.lean` へ import 済みで統合済み）。

## 0. 対象ファイル

| ファイル | 状態 |
| --- | --- |
| `JapanTaxLaw/CustomsProcedureRates.lean` | 新規 |
| `JapanTaxLaw/CustomsProcedureRatesSpec.lean` | 新規 |
| `JapanTaxLaw/CustomsProcedureRatesTests.lean` | 新規 |
| `docs/STAGING_WD.md` | 更新（本ファイル、旧メモを置換） |

pinned source: `data/raw/329AC0000000061_20260601_508AC0000000005.law.json`
law id `329AC0000000061` / revision `329AC0000000061_20260601_508AC0000000005`
amendment enforcement date `2026-06-01`。
担当範囲の原文（正規化済み・UTF-8）: `C:\Users\junny\AppData\Local\Temp\opencode\W_D_customs.txt`。

## 1. スコープ判断（明示的な計算式の有無）

原文を読み、計算式（金額×率／控除／上限）が**明示的にある条文だけ**をモデル化しました。

| 条文 | 見出し | 判断 | 根拠 |
| --- | --- | --- | --- |
| 第七条の十七 | 輸入の許可前に引き取られた貨物に係る税額等の通知 | **NOT MODELLED** | 税関長が「申告に係る税額及びその税額を納付すべき旨…その他政令で定める事項を、書面により…通知する」という**通知義務**のみ。通知される「税額」は申告に係る caller-established Money で、金額×率・控除・上限の計算式なし。「政令で定める事項」は委任のみ。def を作らず本メモに明記。 |
| 第十一条 | 関税の徴収 | **NOT MODELLED** | 納期限不完納・繰上請求該当・特例申告貨物等の該当性を列挙したうえで「当該関税の徴収については、**国税徴収の例による**」と指定する**手続の参照規定**のみ。計算式なし。担保提供の有無・通則法38条各号該当性は caller-established。def を作らず本メモに明記。 |
| 第十四条の五 | 換価代金からの充当又は徴収の特例 | **MODELED** | 「充て又は徴収する関税の額は、当該貨物又は物件の公売又は売却による代金の額（公売又は売却の費用その他関税に先だつて徴収される費用がある場合には、**これらの費用を控除した額**）**を限度とする**。」→ **控除**（代金 − 費用）＋**上限**（関税額 ≤ 控除後代金）の明示的な計算構造。 |

架空の計算式は作っていません。税率数値は本3条に存在しないため、どの def も `TaxRate` を使いません
（`TaxFinance` は `Money` 型のために import）。

## 2. 追加した def 一覧

`namespace JapanTaxLaw`、`open JapanTaxLaw.TaxFinance`。`Money := Nat`。
全 def に kernel-decided smoke（`example … := by decide`）を付与済み。

### 実装（`CustomsProcedureRates.lean`）

| def | 式 | 意味（十四条の五） |
| --- | --- | --- |
| `replacementNetProceeds grossProceeds priorCosts` | `grossProceeds - priorCosts` | 公売・売却代金から関税に先だつ費用を控除した額＝充当・徴収額の「限度額」（saturating Nat 減算） |
| `cappedReplacementDuty grossProceeds priorCosts duty` | `min duty (replacementNetProceeds …)` | 限度額に収まる実際の充当・徴収額（「を限度とする」の表現） |
| `replacementDutyWithinCap grossProceeds priorCosts duty` | `decide (duty ≤ replacementNetProceeds …)` | 関税額が限度額以内かの判定（計算式には Bool を入れず、別 helper に分離） |

新規定理（9 本）:
`replacementNetProceeds_exact`（費用≤代金のとき通常減算と一致）,
`replacementNetProceeds_zero_costs`, `replacementNetProceeds_le_gross`,
`replacementNetProceeds_zero_of_over`,
`cappedReplacementDuty_le_cap`, `cappedReplacementDuty_le_duty`,
`cappedReplacementDuty_eq_of_within`, `cappedReplacementDuty_eq_of_over`,
`replacementDutyWithinCap_eq`。

### 独立仕様（`CustomsProcedureRatesSpec.lean`）

| def | 独立定式 |
| --- | --- |
| `specNetProceeds` | `if priorCosts ≤ grossProceeds then grossProceeds - priorCosts else 0`（impl の Nat.sub に対し if-case-split） |
| `specCappedDuty` | `let cap := specNetProceeds …; if duty ≤ cap then duty else cap`（impl の min に対し if-case-split） |
| `specWithinCap` | `decide (duty ≤ specNetProceeds …)` |
| `agreeCustomsProcedureRates : Bool` | 7 サンプル点で 3 def すべて `==` 一致、`example … = true := by decide` |

### 退行テスト（`CustomsProcedureRatesTests.lean`）

`by decide` のスモーク 14 件（控除 6／上限 4／within-cap 4、境界含む）。

### doc-comment に明記した射程外（overclaim 防止）

- 「公売・売却による代金の額」(grossProceeds) と「公売・売却の費用その他関税に先だつて徴収される費用」
  (priorCosts) は **caller-established Money**。費用の算定方法・明細は条文に数式がなく射程外。
- 第八十五条第一項・第八十八条（準用）・第百三十四条第五項/第六項の
  「充て又は徴収する関税」（「不足額」の算定等）は本条の前提で別条・caller-established。
  本モジュールは「代金（費用控除後）を限度とする」という**上限構造のみ**を固定する。
- 「不足額がある場合に…」の適用判定、担保の有無、国税通則法第三十八条第一項各号該当性は
  法的判断 — caller-established。Bool は計算式に入れない。
- Underflow（費用 > 代金）では 0 を返す（saturating）。`replacementNetProceeds_exact` は
  費用 ≤ 代金のときだけ正確。0 を返すことが実務上の額を主張するものではなく、入力の妥当性は
  caller が担保する。
- 第七条の十七・第十一条は NOT MODELLED（§1）。

## 3. 転記監査に追加すべき check（JSON 断片）

`scripts/ci/transcription_audit.py` の `checks()` に追加する check の JSON 表現です
（`law_id` / `kind` / `title` / `needles` の 4 キー）。needle 文字列は一字も変えないこと。
**文字正規化・全角／半角変換・異体字変換を行わず、そのまま移してください。**

needle 1・2 は MODELED 条文（十四条の五）の計算構造の根拠、needle 3〜5 は
NOT MODELLED 判定（七条の十七・十一条）の逐語根拠です（§6 で全件 FOUND 確認済み）。

```json
{
  "law_id": "329AC0000000061",
  "kind": "file",
  "title": null,
  "needles": [
    "充て又は徴収する関税の額は、当該貨物又は物件の公売又は売却による代金の額",
    "公売又は売却の費用その他関税に先だつて徴収される費用がある場合には、これらの費用を控除した額）を限度とする。",
    "当該申告に係る税額及びその税額を納付すべき旨",
    "その他政令で定める事項を、書面により、当該引取りの承認を受けた者に通知する。",
    "当該関税の徴収については、国税徴収の例による。"
  ]
}
```

参考：現行スクリプト形式への変換例（name は任意、needles は上記 5 本を一字も変えずに列挙）:

```python
yield ("関税法 art. 7の17 / 11 / 14の5 ↔ CustomsProcedureRates.lean (十四条の五: 代金−費用 を限度とする)",
       "329AC0000000061",
       "file", None,
       [ ...上記 needles 5 本を一字も変えずに列挙... ])
```

## 4. 期待 literal 増分

- W-D 担当分: 新規 check **5 needles** なので **+5**。
- `docs/PROGRESS.md` の監査 literal 総数はメインセッションが再確認して加算してください
  （起点値は本メモでは書きません）。

## 5. 検証結果（すべて本セッションで実行済み）

- `lake build JapanTaxLaw.CustomsProcedureRates JapanTaxLaw.CustomsProcedureRatesSpec JapanTaxLaw.CustomsProcedureRatesTests`
  → **成功（5 jobs、warning なし）**。※自作 3 モジュールのみビルド（全体ビルド／CI／`run_python_gates.py` は実行していません）。
- `python scripts/ci/check_no_sorry.py` → `no forbidden placeholder proofs found in tracked Lean sources`。
  （新規 3 ファイルは未追跡のため走査対象外ですが、人力でも `sorry` / `admit` はありません。）
- `#print axioms`（一時ファイル `WDAxiomProbe.lean` を approved temp dir に作成、`lake env lean` で実行後 **削除済み**）:
  - 新規定理 9 本＋`agreeCustomsProcedureRates = true` の計 **10 件**を検査。
  - **`Classical.choice` も `sorryAx` も一切なし**。
  - 6 件は `does not depend on any axioms`、
    4 件（`replacementNetProceeds_zero_of_over`, `cappedReplacementDuty_le_cap`,
    `cappedReplacementDuty_le_duty`, `cappedReplacementDuty_eq_of_over`）は
    `[propext]` のみ（課題指定で `propext` は許容）。
- 原文逐語検証（正規化テキストに対して `.find()`）: **5/5 FOUND、MISS 0 件**（§6）。
  raw JSON 内に law id `329AC0000000061` … FOUND / revision `329AC0000000061_20260601_508AC0000000005` … FOUND。

## 6. 逐語検証 FOUND / MISS 一覧（一字も変更せず）

`transcription_audit.py` の `_norm` と同じ `re.sub(r"[\s　]+", "", ...)` で正規化した
(a) 担当範囲の正規化済み原文 `W_D_customs.txt` と (b) pinned JSON の `law_full_text` 平坦化文字列に
対し、各 needle を Python の `.find()` で検索（needle 側も同正規化）。

| # | 条文 | 結果 | excerpt@ | json@ | json 出現回数 |
| --- | --- | --- | --- | --- | --- |
| 1 | 十四条の五（限度額・代金） | FOUND | 672 | 40288 | 1 |
| 2 | 十四条の五（費用控除・限度） | FOUND | 709 | 40325 | 1 |
| 3 | 七条の十七（通知する税額） | FOUND | 133 | 13911 | 1 |
| 4 | 七条の十七（書面通知義務） | FOUND | 174 | 13952 | 1 |
| 5 | 十一条（国税徴収の例による） | FOUND | 433 | 21196 | 1 |

- **FOUND 5 / MISS 0**。needle は一字も変えず原文から抽出（正規化・文字変換なし）。
  すべて両テキストで一意（出現回数 1）。
- MISS が出ていればここで停止して報告する手順でしたが、MISS は 0 件です。

## 7. README / PROGRESS に足す 1 行文案

CROSS_LAW の scan/pin 件数や監査 literal 総数はメインセッションが計算するため、ここでは書きません。

- **README.md**（モジュール一覧・関税系モジュール行の末尾付近に追加）:
  ```text
  JapanTaxLaw/CustomsProcedureRates.lean / -Spec.lean / -Tests.lean  # 関税法 art. 14の5（換価代金からの充当額は公売・売却代金−関税に先だつ費用を限度とする）の控除＋上限 L4 モデル・独立定式・退行テスト（art. 7の17 / 11 は計算式なしで NOT MODELLED）
  ```
- **docs/PROGRESS.md**（L4 着手済みモジュール一覧の末尾に追記。現状「関税法は未着手」とある行もメインが更新してください）:
  ```text
  関税法 art. 14の5（CustomsProcedureRates.lean：充当・徴収額＝公売・売却代金−先立つ費用 を限度とする、控除＋上限、saturating Nat 減算。art. 7の17 / 11 は計算式なしで NOT MODELLED）
  ```

## 8. インテグレーターへの明示事項

**インテグレーターは `JapanTaxLaw.lean` に以下の 3 つの import を追加すること。**

```lean
import JapanTaxLaw.CustomsProcedureRates
import JapanTaxLaw.CustomsProcedureRatesSpec
import JapanTaxLaw.CustomsProcedureRatesTests
```

（W-D は `JapanTaxLaw.lean` を書き換えていません。）

## 9. 範囲・残ブロッカーの正直な申告

- これは **L4 のごく小さなスライス**です。**完成・網羅を主張しません**。
- 担当は関税法 **第七条の十七・第十一条・第十四条の五の 3 条文のみ**。うち実際に def 化したのは
  **第十四条の五の「費用控除後代金を限度とする」構造だけ**です。
- 第七条の十七（通知義務）・第十一条（国税徴収の例による参照規定）は計算式がないため
  **NOT MODELLED**（§1）。税率数値も本3条にないため `TaxRate` は未使用。
- 代金・費用の額、充当する関税額の算定、適用判定、担保・通則法38条該当性は
  すべて caller-established とし、法的判断の自動化はしていません。
- `agreeCustomsProcedureRates` は有限サンプル点の `==` 一致確認であり、法的意味の等価証明ではありません。
- 転記監査は fidelity-only（原文 bytes との一致確認）であり、法的正しさを保証しません。
- **L7 候補 3,438 件は unreviewed のまま**です（本スライスでは一切レビューしていません）。
- 残ブロッカー: 転記監査 check の `checks()` への組み込み（§3、+5）、`JapanTaxLaw.lean` への
  import 追加（§8）、README / PROGRESS の 1 行追記（§7）、および全体ビルド・CI ゲートの
  実行は**すべてメインセッションの担当**です（W-D は実行していません）。
