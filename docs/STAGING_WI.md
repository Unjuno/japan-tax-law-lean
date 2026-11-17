# STAGING — W-I（租税特別措置法施行令 第四十六条の四／カジノ業務収入の割合 の bounded L4 モデル）受け渡しメモ

> 実装担当 W-I からメインセッション（統合担当）への受け渡し用。
> ブランチ操作・add/commit/push/merge は一切していません。
> 書き換えたのは下記 4 ファイルのみです（他は読み取り専用）。
> 本ファイルは **旧 W-I（登録免許税法 第三十二号 百二十〜百二十四／P6I）の受け渡しメモを
> 上書き**したものです。旧 P6I モジュールは既に `JapanTaxLaw.lean` に import 済みで、
> 本タスクでは一切触れていません。

## 0. 対象ファイル

| ファイル | 状態 |
| --- | --- |
| `JapanTaxLaw/SpecialMeasuresCasinoRatio.lean` | 新規 |
| `JapanTaxLaw/SpecialMeasuresCasinoRatioSpec.lean` | 新規 |
| `JapanTaxLaw/SpecialMeasuresCasinoRatioTests.lean` | 新規 |
| `docs/STAGING_WI.md` | 既存（旧 W-I メモ）を本タスク用に overwritten（本ファイル） |

pinned source: `data/raw/332CO0000000043_20261101_507CO0000000127.law.json`
law id `332CO0000000043` / revision `332CO0000000043_20261101_507CO0000000127`
（租税特別措置法施行令、CabinetOrder、revision `CurrentEnforced`、施行日 `2026-11-01`）。
担当範囲の原文: `C:\Users\junny\AppData\Local\Temp\opencode\W_I_special_order.txt`
（第四十六条の四・1 条文・正規化済み・UTF-8・252 文字）。
名前空間は他と衝突しないよう **`JapanTaxLaw.SpecialMeasuresCasino`** を採用（既存モジュールは
`namespace JapanTaxLaw` だが、本タスクは明示的にサブ名前空間を指定されました）。

## 1. スコープ判断

第四十六条の四の原文のうち、明示的な算術条件は「当該カジノ業務収入の合計額の占める割合が
百分の五を超えない場合」のみ。これを交差掛け（除算なし）でモデル化しました。

- 原文の「合計額」（割合の分母）は「資産の譲渡等の対価の額…の合計額に…カジノ業務収入の合計額を
  加算した金額」= `totalConsideration + casinoIncome` であることを doc-comment に明記。
  - `totalConsideration` = 「資産の譲渡等の対価の額…の合計額」
  - `casinoIncome` = 「カジノ業務収入の合計額」
- 境界: ちょうど 5% → `true`（適用）、5% 超 → `false`（非適用）。分母零でも停止（安全）。
- 対価の額・カジノ業務収入額の具体的金額、課税期間の特定、資産の譲渡等・カジノ業務収入の該当性、
  法第八十六条の六第一項ただし書の趣旨、その他の政令要件は **caller-established**（Bool は
  算定式に入れず、本モデルに含めない）。

## 2. 追加した def 一覧

`namespace JapanTaxLaw.SpecialMeasuresCasino`、`open JapanTaxLaw.TaxFinance`、`Money = Nat`。

### 実装モジュール（`SpecialMeasuresCasinoRatio.lean`）— model defs 2 本

| # | 条 | def 名 | 内容 |
| --- | --- | --- | --- |
| 1 | 46の4 | `casinoCombinedTotal` | `Money → Money → Money`、原文の「合計額」= `totalConsideration + casinoIncome` |
| 2 | 46の4 | `casinoRatioWithin5pct` | `Money → Money → Bool`、`decide (casinoIncome * 100 ≤ 5 * (totalConsideration + casinoIncome))`（交差掛け・百分の五） |

定理 3 本: `casinoCombinedTotal_eq`（rfl）、`casinoRatioWithin5pct_eq`（rfl）、
`casinoRatioWithin5pct_true_iff`（Bool=true ⇔ 交差掛け不等式、`simp`）。
impl の kernel-decided smoke 10 件同梱。

### Spec モジュール（`SpecialMeasuresCasinoRatioSpec.lean`）— def 2 本

| # | 条 | def 名 | 内容 |
| --- | --- | --- | --- |
| 1 | 46の4 | `specCasinoRatioWithin5pct` | 独立定式 `decide ((totalConsideration + casinoIncome) * 5 ≥ casinoIncome * 100)`（左右を入れ替え `≤` を `≥` にした形） |
| 2 | 46の4 | `agreeCasinoRatioWithin5pct` | `Bool`（impl ≡ spec の `==` 一致・11 サンプル）、`example … = true := by decide` |

Spec に points 7 件＋agree 1 件。Tests モジュール（`SpecialMeasuresCasinoRatioTests.lean`）は
`example … := by decide` の kernel-decided smoke 12 件のみ。
**def 合計 4 本（impl 2 / Spec 2）**、by decide smoke 合計 29 件（impl 10 / Spec 8 / Tests 12、
うち agree の true 確認 1 件を含む）。

doc-comment に明記した射程外（overclaim 防止）:

- 金額の認定・課税期間の特定・資産の譲渡等／カジノ業務収入の該当性・法86条の6ただし書の趣旨・
  その他の政令要件はすべて caller-established。Bool は算定式に混入させていません。
- 除算・丸めは不要な厳密不等式のみ。Money = Nat の全演算は total。
- 分母零（`totalConsideration + casinoIncome = 0`）は交差掛け `0 ≤ 0` で `true` を返すが、
  この退化ケースに法的意味があるとは主張せず、入力の妥当性は caller が担保する。
- `agreeCasinoRatioWithin5pct` は有限サンプルの `==` 一致確認であり、法的意味の等価証明ではありません。

## 3. 転記監査に追加すべき check（JSON 断片）

`scripts/ci/transcription_audit.py` の `checks()` に追加する check の JSON 表現です
（`law_id` / `kind` / `title` / `needles` の 4 キー）。needle は原文から**一字も変えず**抽出し、
正規化（`_norm` = `re.sub(r"[\s　]+", "", …)`）済みの形で記載しています。
全 needle は担当範囲原文・pinned JSON の双方で **出現回数 1（一意）** を確認済みです。

```json
{
  "law_id": "332CO0000000043",
  "kind": "file",
  "title": null,
  "needles": [
    "（カジノ業務収入の割合が僅少である場合）第四十六条の四法第八十六条の六第一項ただし書に規定する政令で定める場合は、当該課税期間における資産の譲渡等",
    "の対価の額（消費税法第二十八条第一項に規定する対価の額をいう。）の合計額に当該課税期間におけるカジノ業務収入",
    "（法第八十六条の六第一項ただし書に規定するカジノ業務収入をいう。以下この条において同じ。）の合計額を加算した金額のうちに",
    "の合計額を加算した金額のうちに当該カジノ業務収入の合計額の占める割合が百分の五を超えない場合とする。"
  ]
}
```

needle とモデルとの対応:

| # | 対応 | 長さ |
| --- | --- | --- |
| 1 | 条題名＋「政令で定める場合は」の規定枠（第四十六条の四の特定） | 73 |
| 2 | 「対価の額…の合計額に…カジノ業務収入」（`totalConsideration` 側＋加算の始まり） | 54 |
| 3 | 「カジノ業務収入…の合計額を加算した金額のうちに」（`casinoCombinedTotal`） | 60 |
| 4 | 「…占める割合が百分の五を超えない場合とする。」（`casinoRatioWithin5pct`） | 50 |

参考：現行スクリプト形式への変換例（name は任意、needles は上記 4 本を一字も変えずに列挙）:

```python
yield ("租税特別措置法施行令 art. 46の4（カジノ業務収入の割合）↔ SpecialMeasuresCasinoRatio.lean",
       "332CO0000000043", "file", None,
       [ ...上記 needles 4 本を一字も変えずに列挙... ])
```

## 4. 期待 literal 増分

- W-I 担当分: 新規 check **4 needles** なので **+4**。
- `docs/PROGRESS.md` の監査 literal 総数はメインセッションが再確認して加算してください
  （起点値は本メモでは書きません）。

## 5. 検証結果（すべて本セッションで実行済み）

- `lake build JapanTaxLaw.SpecialMeasuresCasinoRatio JapanTaxLaw.SpecialMeasuresCasinoRatioSpec JapanTaxLaw.SpecialMeasuresCasinoRatioTests`
  → **成功（5 jobs、warning なし）**。※自作 3 モジュールのみビルド。全体ビルド／CI／
  `run_python_gates.py` は**実行していません**。
- `python scripts/ci/check_no_sorry.py` → `no forbidden placeholder proofs found in tracked Lean sources`。
  （新規 3 ファイルは未追跡のため走査対象外ですが、人力でも `sorry` / `admit` はありません。）
- `#print axioms`（一時ファイル `CasinoAxiomProbe.lean` を approved temp dir に作成、
  `lake env lean` で実行後 **削除済み**、残ファイル数 0）: 4 件を検査。
  - `casinoCombinedTotal_eq` / `casinoRatioWithin5pct_eq` / `agreeCasinoRatioWithin5pct` の
    **3 件は `does not depend on any axioms`**。
  - `casinoRatioWithin5pct_true_iff` は **`propext` のみ**（許可範囲）。
  - **`Classical.choice` も `sorryAx` も一切なし**（出力全文走査で forbidden hits = 0）。
- 原文逐語検証: **4/4 FOUND、MISS 0 件**。needle は一字も変えず原文から抽出。
  - 担当範囲原文 `W_I_special_order.txt` を `_norm` と同一の
    `re.sub(r"[\s　]+", "", …)` で正規化した文字列に `.find()` → 4/4 FOUND、出現回数すべて 1。
  - pinned JSON を `transcription_audit.py` の `text()` と同一ロジックで平坦化・正規化した
    文字列に対しても 4/4 FOUND、出現回数すべて 1（§6）。
  - law id `332CO0000000043` / revision `332CO0000000043_20261101_507CO0000000127` は
    pinned JSON 内に **FOUND**（条文本文ファイルにはメータデータがないため原文側では検索対象外）。

## 6. 逐語検証 FOUND / MISS 一覧（一字も変更せず）

`art@` は担当範囲原文の正規化文字列上の offset、`json@` は pinned JSON の平坦化・正規化文字列上の
offset。各 needle の出現回数は両方とも **1（一意）**。

| # | 結果 | art@ | json@ | 出現回数(art/json) | 長さ |
| --- | --- | --- | --- | --- | --- |
| 1 | FOUND | 0 | 1457553 | 1/1 | 73 |
| 2 | FOUND | 103 | 1457656 | 1/1 | 54 |
| 3 | FOUND | 157 | 1457710 | 1/1 | 60 |
| 4 | FOUND | 202 | 1457755 | 1/1 | 50 |

- **FOUND 4 / MISS 0**。needle の長さは 50〜73 文字、4 本すべて相互に異なることを確認。
  アンカーの勝手な変更・正規化・文字変換はしていません。

## 7. README / PROGRESS に足す 1 行文案

CROSS_LAW の scan/pin 件数や監査 literal 総数はメインセッションが計算するため、ここでは書きません。

- **README.md**（モジュール一覧末尾に追加）:
  ```text
  JapanTaxLaw/SpecialMeasuresCasinoRatio.lean / -Spec.lean / -Tests.lean  # 租税特別措置法施行令 art. 46の4（カジノ業務収入の割合）の bounded L4 モデル（「合計額」= 対価の額の合計額 + カジノ業務収入の合計額、割合が百分の五を超えないかを交差掛けで判定）・独立定式・退行テスト
  ```
- **docs/PROGRESS.md**（L4 着手済みモジュール一覧の末尾に追記）:
  ```text
  租税特別措置法施行令 art. 46の4（SpecialMeasuresCasinoRatio.lean：カジノ業務収入の割合が百分の五を超えない場合を `casinoIncome*100 ≤ 5*(totalConsideration+casinoIncome)` の交差掛けでモデル化、金額認定・他の政令要件は caller-established）
  ```

## 8. インテグレーターへの明示事項

**インテグレーターは `JapanTaxLaw.lean` に以下の 3 つの import を追加すること。**

```lean
import JapanTaxLaw.SpecialMeasuresCasinoRatio
import JapanTaxLaw.SpecialMeasuresCasinoRatioSpec
import JapanTaxLaw.SpecialMeasuresCasinoRatioTests
```

（W-I は `JapanTaxLaw.lean` を書き換えていません。W-E の `SpecialMeasuresMisc*` ほか既存モジュールには
触れていません。メインが統合してください。）

## 9. 範囲・残ブロッカーの正直な申告（最終報告）

- **build**: 自作 3 モジュールのみ `lake build` 成功（5 jobs / warning なし）。全体ビルド・CI・
  `run_python_gates.py` は未実行です。
- **axiom**: 検査 4 件のうち 3 件 axiom-free、`casinoRatioWithin5pct_true_iff` は `propext` のみ。
  `Classical.choice` / `sorryAx` なし（forbidden hits 0、一時ファイルは削除済み）。
- **逐語**: FOUND 4 / MISS 0（担当範囲原文・pinned JSON の両方、出現回数 1、長さ 50〜73）。
  law id / revision も pinned JSON で FOUND。
- **def 数**: 4（impl 2 / Spec 2）。needle 増分 +4。
- **STAGING**: 本ファイル `docs/STAGING_WI.md` を作成（旧 W-I メモを上書き）済みです。
- これは **L4 のごく小さな bounded スライス**です。**完成・網羅を主張しません**。
- 担当は租税特別措置法施行令 **第四十六条の四の 1 条文のみ**。同条のその他の政令要件・
  他条文・他法令は **NOT YET COVERED**。
- 金額の認定・課税期間の特定・カジノ業務収入／資産の譲渡等の該当性はすべて caller-established とし、
  法的判断の自動化はしていません。分母零の退化ケースに法的意味があるとは主張しません。
- `agreeCasinoRatioWithin5pct` は有限サンプルの `==` 一致確認であり、法的意味の等価証明ではありません。
- 転記監査は fidelity-only（原文 bytes との一致確認）であり、法的正しさを保証しません。
- **L7 候補 3,438 件は unreviewed のまま**です（本スライスでは一切レビューしていません）。
- 残ブロッカー: 転記監査 check の `checks()` への組み込み（§3、+4）、`JapanTaxLaw.lean` への
  import 追加（§8）、README / PROGRESS の 1 行追記（§7）、および全体ビルド・CI ゲートの実行は
  **すべてメインセッションの担当**です（W-I は実行していません）。
