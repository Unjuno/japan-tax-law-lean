# STAGING — W-L（法人税法 第百四十五条の四／外国法人 国際最低課税残余額の税率 90.7%）受け渡しメモ

> 実装担当 W-L からメインセッション（統合担当）への受け渡し用。
> ブランチ操作・add/commit/push/merge は一切していません。
> 書き換えたのは下記 4 ファイルのみです（他は読み取り専用）。
> ※本ファイルは、先前の W-L 担当（登録免許税法 P7L）の受け渡しメモを、現担当の指示により
>   法人税法 art. 145の4 スライスのメモに差し替えたものです。

## 0. 対象ファイル

| ファイル | 状態 |
| --- | --- |
| `JapanTaxLaw/ForeignCorpResidualRate.lean` | 新規 |
| `JapanTaxLaw/ForeignCorpResidualRateSpec.lean` | 新規 |
| `JapanTaxLaw/ForeignCorpResidualRateTests.lean` | 新規 |
| `docs/STAGING_WL.md` | 差し替え（本ファイル） |

pinned source:
  law_id `340AC0000000034` / revision `340AC0000000034_20261001_508AC0000000012`
  （`data/raw/340AC0000000034_20261001_508AC0000000012.law.json` を確認）。
  amendment enforcement date `2026-10-01`。
担当範囲原文: `W_L_corporate145_4.txt`（UTF-8、`==== 第百四十五条の四 LEN 100` ヘッダ + 本文 1 行、
正規化後 100 文字）。原文は一字も変更せず doc-comment と needle に転記しました。

名前空間は他モジュールと衝突しないよう **`JapanTaxLaw.ForeignCorpResidualRate`** としました
（`CorporateGlobeRates*` / `CorporateMiscRates*` は読むだけ、**触っていません**）。

## 1. 原文とモデル化

第百四十五条の四（原文）:
> 外国法人に対して課する各対象会計年度の国際最低課税残余額に対する法人税の額は、
> 各対象会計年度の外国法人に係る課税標準国際最低課税残余額に百分の九十・七の税率を
> 乗じて計算した金額とする。

- 税率: **百分の九十・七 = 90.7% = 907/1000**。
- 税額算式: `外国法人 課税標準国際最低課税残余額 × 907 / 1000`（floor / 切り捨て）。
- 端数処理: 原文は「乗じて計算した金額」で端数規定を本条に持たないため、
  `TaxRate.applyFloor`（切り捨て）を per-law business data として採用（明示済み）。

射程外（overclaim 防止、doc-comment に明記済み）:
- 課税標準国際最低課税残余額（`base`）は **caller-established**。算定方法は一切都合せず、
  **Bool を式に入れていません**。
- 外国法人該当性・対象会計年度の確定・国際最低課税残余額そのものの算定（GloBE ルール）も
  caller-established。
- 内国法人の同種規定（art. 82の13）・外国法人の国内最低課税額（art. 145の8, 75.3%）・
  GloBE ルール全体は未対応（後者は `CorporateGlobeRates.lean` 側に既存、本スライスでは未変更）。

## 2. 追加した def / 定理一覧

`namespace JapanTaxLaw.ForeignCorpResidualRate`、`open JapanTaxLaw.TaxFinance`。

| ファイル | 種別 | 名前 | 内容 |
| --- | --- | --- | --- |
| main | def | `foreignCorpResidualRate : TaxRate` | `⟨907, 1000, by decide⟩`（90.7%） |
| main | def | `foreignCorpResidualTax (base : Money) : Money` | `foreignCorpResidualRate.applyFloor base`（切り捨て） |
| main | theorem | `foreignCorpResidualRate_den_pos` | `0 < foreignCorpResidualRate.den` |
| main | theorem | `foreignCorpResidualTax_mono` | `a ≤ b → tax a ≤ tax b`（`simp` + `Nat.div_le_div_right`） |
| spec | def | `specForeignCorpResidualTax (base : Money) : Money` | `(base * 907) / 1000`（独立整数定式、`applyFloor` 非利用） |
| spec | def | `agreeForeignCorpResidualRate : Bool` | 実装 ≡ spec の `==` 一致（10 点） |
| tests | — | （`example` のみ、def/定理名は追加せず） | レート 3 件 + 税額 11 件の `by decide` スモーク |

**公開 def 数: 4**（main 2 + spec 2）、**定理数: 2**、Tests は `example` のみ。

各 def の smoke:
- `foreignCorpResidualRate`: `.num = 907` / `.den = 1000`（main + tests）。
- `foreignCorpResidualTax`: main に `0/1/999/1000/100_000/1_000_000` の 6 点、
  tests に `0/1/2/99/100/999/1000/1001/12345/100_000/1_000_000` の 11 点（すべて `by decide`）。
  `999 → 906`, `1000 → 907` で切捨て境界を確認。
- `specForeignCorpResidualTax`: 6 点 + `agreeForeignCorpResidualRate = true`（`by decide`）。

## 3. 転記監査に追加すべき check（JSON 断片）

`scripts/ci/transcription_audit.py` の `checks()` に追加する check の JSON 表現です
（`law_id` / `kind` / `title` / `needles` の 4 キー）。needle は原文から一字も変えず抽出。
**文字正規化・全角／半角変換・異体字変換を行わず、そのまま移してください。**
各 needle は担当範囲原文・pinned JSON の両方で出現回数 **1**（一意）を確認済みです。

```json
{
  "law_id": "340AC0000000034",
  "kind": "file",
  "title": null,
  "needles": [
    "第百四十五条の四外国法人に対して課する各対象会計年度の国際最低課税残余額に対する法人税の額は、各対象会計年度の外国法人に係る課税標準国際最低課税残余額に百分の九十・七の税率を乗じて計算した金額とする。",
    "外国法人に対して課する各対象会計年度の国際最低課税残余額に対する法人税の額は",
    "各対象会計年度の外国法人に係る課税標準国際最低課税残余額に百分の九十・七の税率を乗じて計算した金額とする"
  ]
}
```

参考：現行スクリプト形式への変換例（name は任意、needles は上記 3 本をそのまま使用）:

```python
yield ("法人税法 art. 145の4（外国法人 国際最低課税残余額 百分の九十・七）↔ ForeignCorpResidualRate.lean",
       "340AC0000000034",
       "file", None,
       [ ...上記 needles 3 本を一字も変えずに列挙... ])
```

## 4. 期待 literal 増分

- W-L 担当分: 新規 check **3 needles** なので **+3**。
- `docs/PROGRESS.md` の監査 literal 総数はメインセッションが再確認して加算してください
  （起点値は本メモでは書きません）。

## 5. 検証結果（すべて本セッションで実行済み）

- `lake build JapanTaxLaw.ForeignCorpResidualRate JapanTaxLaw.ForeignCorpResidualRateSpec JapanTaxLaw.ForeignCorpResidualRateTests`
  → **成功（5 jobs、warning なし）**。※自作 3 モジュールのみビルド（全体ビルド／CI／
  `run_python_gates.py` は実行していません）。
- `python scripts/ci/check_no_sorry.py` → `no forbidden placeholder proofs found in tracked Lean sources`。
  （新規 3 ファイルは未追跡のため走査対象外ですが、人力でも `sorry` / `admit` はありません。）
- `#print axioms`（一時ファイル `WL_AxiomProbe.lean` を approved temp dir に作成、
  `lake env lean` で実行後 **削除済み**）:
  - `foreignCorpResidualRate`, `foreignCorpResidualRate_den_pos`, `foreignCorpResidualTax`,
    `specForeignCorpResidualTax`, `agreeForeignCorpResidualRate` の **5 件**は
    `does not depend on any axioms`。
  - `foreignCorpResidualTax_mono` は **`[propext]` のみ**（`simp` 由来。許可範囲）。
  - **`Classical.choice` も `sorryAx` も一切なし**（出力 6 行を全文走査、いずれも 0 回）。
- 原文逐語検証（担当範囲原文・pinned JSON を正規化テキストに対して `.find()`）:
  **3/3 FOUND、MISS 0 件**。各 needle は両テキストで出現回数 **1**（一意）、
  長さ 38〜100 文字、3 本すべて相互に異なることを確認（§6）。

## 6. 逐語検証 FOUND / MISS 一覧（一字も変更せず）

担当範囲原文 `W_L_corporate145_4.txt` を、転記監査と同じ `re.sub(r"[\s\u3000]+", "", ...)`
で正規化した文字列に対して各 needle を Python の `.find()` で検索（`art@`）。
`json@` は pinned JSON `law_full_text` を `transcription_audit.py` と同一ロジックで平坦化・
正規化した文字列上の offset。各 needle の出現回数は両方とも **1**（一意）。

| # | needle（先頭抜粋） | 結果 | art@ | json@ | 出現回数(art/json) | len |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | 第百四十五条の四外国法人に対して…金額とする。（全文） | FOUND | 0 | 316167 | 1/1 | 100 |
| 2 | 外国法人に対して課する各対象会計年度の国際最低課税残余額に対する法人税の額は | FOUND | 8 | 316175 | 1/1 | 38 |
| 3 | 各対象会計年度の外国法人に係る課税標準国際最低課税残余額に百分の九十・七の税率を乗じて計算した金額とする | FOUND | 47 | 316214 | 1/1 | 52 |

- **FOUND 3 / MISS 0**。needle の勝手な変更・正規化・文字変換はしていません
  （原文の `九十・七` の中黒や `係る` の文字使いも保持）。
- 3 本はいずれも `外国法人` を含むため、同一税率 90.7% の内国法人規定（art. 82の13）と
  区別され、pinned JSON 全体で一意です。

## 7. README / PROGRESS に足す 1 行文案

CROSS_LAW の scan/pin 件数や監査 literal 総数はメインセッションが計算するため、ここでは書きません。

- **README.md**（モジュール一覧・`CorporateGlobeRates*` 行の直後に追加）:
  ```text
  JapanTaxLaw/ForeignCorpResidualRate.lean / -Spec.lean / -Tests.lean  # 法人税法 第百四十五条の四（外国法人 国際最低課税残余額 × 百分の九十・七 = 907/1000, floor）L4 モデル・独立定式・退行テスト
  ```
- **docs/PROGRESS.md**（L4 着手済みモジュール一覧の末尾に追記）:
  ```text
  法人税法 art. 145の4（ForeignCorpResidualRate.lean：外国法人の国際最低課税残余額 × 907/1000、課税標準額は caller-established、floor、内国法人 art. 82の13 や art. 145の8 等は NOT YET COVERED）
  ```

## 8. インテグレーターへの明示事項

**インテグレーターは `JapanTaxLaw.lean` に以下の 3 つの import を追加すること。**

```lean
import JapanTaxLaw.ForeignCorpResidualRate
import JapanTaxLaw.ForeignCorpResidualRateSpec
import JapanTaxLaw.ForeignCorpResidualRateTests
```

（W-A〜W-K, W-M, W-N の各 3 件と併せてメインが行数を確認してください。
W-L は `JapanTaxLaw.lean` を書き換えていません。`CorporateGlobeRates*` /
`CorporateMiscRates*` には触れていません。）

## 9. 範囲・残ブロッカーの正直な申告（最終報告）

- **build**: 自作 3 モジュールのみ `lake build` 成功（5 jobs / warning なし）。全体ビルド・CI・
  `run_python_gates.py` は未実行です。
- **axiom**: 公開 def/定理 6 件のうち 5 件が axiom-free、`foreignCorpResidualTax_mono` のみ
  `propext` 依存（許可範囲）。`Classical.choice` / `sorryAx` なし（一時ファイルは削除済み）。
- **逐語**: FOUND 3 / MISS 0（担当範囲原文・pinned JSON の両方、出現回数 1、長さ 38〜100）。
- **def 数**: 4（main 2 + spec 2）。定理 2。Tests は `example` のみ。
- **STAGING**: 本ファイル `docs/STAGING_WL.md` を作成（差し替え）済みです。
- これは **L4 のごく小さなスライス**です。**完成・網羅を主張しません**。
- 担当は 法人税法 **第百四十五条の四のみ**。**art. 82の13・145の8 を含む他の税率規定、
  GloBE ルール全体は NOT YET COVERED**（本スライスでは既存モジュールを変更していません）。
- 課税標準国際最低課税残余額・外国法人該当性・対象会計年度はすべて caller-established とし、
  法的判断の自動化はしていません。丸めは floor を採用したことを明示していますが、
  原文に端数規定がないため解釈を保証するものではありません。
- `agreeForeignCorpResidualRate` は定数同士の `==` 一致確認であり、法的意味の等価証明ではありません。
- 転記監査は fidelity-only（原文 bytes との一致確認）であり、法的正しさを保証しません。
- **L7 候補 3,438 件は unreviewed のまま**です（本スライスでは一切レビューしていません）。
- 残ブロッカー: 転記監査 check の `checks()` への組み込み（§3、+3）、`JapanTaxLaw.lean` への
  import 追加（§8）、README / PROGRESS の 1 行追記（§7）、および全体ビルド・CI ゲートの
  実行は**すべてメインセッションの担当**です（W-L は実行していません）。
