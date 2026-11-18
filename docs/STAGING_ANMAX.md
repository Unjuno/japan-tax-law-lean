# STAGING — 相続税法 art. 24(1) 一号・二号・三号（定期金に関する権利の評価の max 構造）

> 実装ワーカー ANMAX からメインセッション（統合担当）への受け渡し用。
> add / commit / push / merge / ブランチ切替は**一切していません**。
> 書き換えたのは下記 4 ファイルのみ（新規作成）、他は読み取り専用です。

## 0. 対象ファイル / pinned source

| ファイル | 状態 |
| --- | --- |
| `JapanTaxLaw/InheritanceAnnuityMaxima.lean` | 新規 |
| `JapanTaxLaw/InheritanceAnnuityMaximaSpec.lean` | 新規 |
| `JapanTaxLaw/InheritanceAnnuityMaximaTests.lean` | 新規 |
| `docs/STAGING_ANMAX.md` | 新規（本ファイル） |

pinned source: `data/raw/325AC0000000073_20260401_506AC0000000008.law.json`
（law id `325AC0000000073` / revision `325AC0000000073_20260401_506AC0000000008` /
amendment enforcement date `2026-04-01`）。

担当範囲原文: `C:\Users\junny\AppData\Local\Temp\opencode\inherit_art24.txt`
（UTF-8・正規化済み・1,583 文字、全角空白 U+3000 は 0 個。原文の空白除去後も 1,583 文字で、
pinned JSON の平坦化本文（正規化後 154,766 文字）の offset 36,339 から**全文字が逐語一致**）。

Namespace: `JapanTaxLaw.InheritanceAnnuityMaxima`（専用サブ名前空間、他と衝突なし）。
`open JapanTaxLaw.TaxFinance`（`Money = Nat`）。既存 `InheritanceAnnuityValuation*` /
`InheritanceAssetValuation*` / `data/*` / L7 CSV は**一切触っていません**。

## 1. 追加した宣言一覧

原文を一字も誤らず読み、三号とも「次に掲げる金額のうちいずれか多い金額」＝ 3 値の max として定式化しました。

### 実装 def（`InheritanceAnnuityMaxima.lean`）

| 区分 | def | 定義 |
| --- | --- | --- |
| 一号 有期定期金 | `termAnnuityValue` | `max surrenderValue (max lumpSum annuityPresentValue)` |
| 二号 無期定期金 | `perpetualAnnuityValue` | `max surrenderValue (max lumpSum dividedByRate)` |
| 三号 終身定期金 | `lifetimeAnnuityValue` | `max surrenderValue (max lumpSum annuityPresentValue)`（max 構造は一号と同一。区分名・doc-comment で明示的に区別） |
| 一時金選択 | `selectLumpSum` | `if canReceive then amount else 0`（Bool は max に入れず選択のみ） |
| 一時金選択（Option） | `lumpSumAmount` | `none → 0` / `some v → v` |
| 一号 Option 版 | `termAnnuityValueOpt` | `termAnnuityValue s (lumpSumAmount lumpSum) a` |
| 二号 Option 版 | `perpetualAnnuityValueOpt` | `perpetualAnnuityValue s (lumpSumAmount lumpSum) d` |
| 三号 Option 版 | `lifetimeAnnuityValueOpt` | `lifetimeAnnuityValue s (lumpSumAmount lumpSum) a` |

- 各号の `s` = イ解約返戻金、`l` = ロ一時金、`a` = ハ（平均額×複利年金現価率）、
  `d` = ハ（平均額÷予定利率）。**すべて caller-established Money**。
- 一時金ロの「給付を受けることができる場合」分岐は caller-established の Bool / Option とし、
  **Bool を金額式（max）に入れず**、Money に解決してから渡す設計です
  （該当しない場合は caller が 0 を渡す）。

theorem 16 件: `*_eq` 3（各 def の rfl 展開）、positivity 9
（`*_ge_surrender` / `*_ge_lumpSum` / `*_ge_annuity`（二号は `_ge_divided`）の 3 号分）、
一時金選択 4（`selectLumpSum_false` / `_true`, `lumpSumAmount_none` / `_some`）。
`by decide` の example は実装 25 件。

### Spec（`InheritanceAnnuityMaximaSpec.lean`）— 独立定式

- `specMax3`: 「いずれか多い金額」を比較の連鎖 `if` で選ぶ独立表現（入れ子 max とは別定義）。
- `specTermAnnuityValue` / `specPerpetualAnnuityValue` / `specLifetimeAnnuityValue`: 各号の独立定式。
- `specSelectLumpSum` / `specLumpSumAmount`: 一時金選択の独立定式。
- `agreeAnnuityMaxima`: 3 入力の代表グリッド `[0,1,2,3,7,10,99,100,1000]` で impl ≡ spec を `==` 比較。
- `agreeLumpSumSelection`: Bool / Option 選択と Option 版 def の一致を有限点で比較。
- `by decide` の example 9 件。いずれも有限サンプル一致であり、全 `Nat` の普遍同値でも
  法的意味の等価証明でもない（ファイル内に明記）。

### Tests（`InheritanceAnnuityMaximaTests.lean`）

新規定理名なし。`by decide` の smoke example 36 件:
各号のイ / ロ / ハ が最大になる大小パターン、同値、境界 0、一時金選択（Bool / Option）、Option 版。

**名前付き宣言 32 件（実装 def 8 + theorem 16 + Spec def 8）、`by decide` example 70 件（25 + 9 + 36）。**

## 2. NOT MODELLED とその理由（明示）

原文の 3 号はいずれもハで「予定利率」「複利年金現価率」「余命年数」を参照しますが、
これらは次の理由から本 L4 スライスではモデル化しませんでした（呼び出し側が計算済みの
`Money` を渡す前提です）:

- **複利基礎計算**: 原文に算式がなく、複利計算そのものは本モデルの対象外。
- **複利年金現価率**: 原文括弧で「複利の計算で年金現価を算出するための割合として
  **財務省令で定めるもの**」と定義されており、条文に数式がない（一号・三号）。
- **予定利率**: 各契約に係る外部パラメータで、条文に数値も算定手続もない（一号・二号・三号）。
  二号のハは「平均額を予定利率で除して得た金額」だが、除算そのものもモデル化せず
  計算済み `Money` を受け取る。
- **余命年数**: 三号ハの「その目的とされた者に係る余命年数として**政令で定めるもの**」は
  外部パラメータであり、政令依存のため本スライスに含めない。

その他の境界:

- 第24条(2)〜(5)（死亡による給付終了、生存期間付き契約の「少ない金額」「多い金額」、
  契約によらない定期金への準用）は対象外。
- 各区分への該当性・契約の存在・事由発生有無はすべて caller-established。
- 転記監査は fidelity-only（原文 bytes との一致確認）。法的正しさを保証しない。

## 3. 転記監査用 JSON 断片（needle 6 本）

`scripts/ci/transcription_audit.py` の `checks()` に追加する check の JSON 表現です
（`law_id` / `kind` / `title` / `needles` の 4 キー）。
needle は原文から一字も変えず抽出し、**全角空白 U+3000 を含みません**。
文字正規化・全角／半角変換・異体字変換は行わないでください。

```json
{
  "law_id": "325AC0000000073",
  "kind": "file",
  "title": null,
  "needles": [
    "一有期定期金次に掲げる金額のうちいずれか多い金額イ当該契約に関する権利を取得した時において当該契約を解約するとしたならば支払われるべき解約返戻金の金額ロ定期金に代えて一時金の給付を",
    "ハ当該契約に関する権利を取得した時における当該契約に基づき定期金の給付を受けるべき残りの期間に応じ、当該契約に基づき給付を受けるべき金額の一年当たりの平均額に、当該契約に係る予定利率による複利年金現価率（複利の計算で年金",
    "二無期定期金次に掲げる金額のうちいずれか多い金額イ当該契約に関する権利を取得した時において当該契約を解約するとしたならば支払われるべき解約返戻金の金額ロ定期金に代えて一時金の給付を受けることができる場合には、当",
    "ハ当該契約に関する権利を取得した時における、当該契約に基づき給付を受けるべき金額の一年当たりの平均額を、当該契約に係る予定利率で除して得た金額三終身定期金次に掲げる金額のうちいずれか多い金額",
    "三終身定期金次に掲げる金額のうちいずれか多い金額イ当該契約に関する権利を取得した時において当該契約を解約するとしたならば支払われるべき解約返戻金の金額ロ定期金に代えて一時金の給付を受けることができる場合には、当",
    "ハ当該契約に関する権利を取得した時におけるその目的とされた者に係る余命年数として政令で定めるものに応じ、当該契約に基づき給付を受けるべき金額の一年当たりの平均額に、当該契約に係る予定利率による複利年金"
  ]
}
```

現行スクリプト形式への変換例（`name` は任意、needles は上記 6 本を一字も変えず列挙）:

```python
yield ("相続税法 art. 24(1)（定期金に関する権利の評価）↔ InheritanceAnnuityMaxima.lean",
       "325AC0000000073", "file", None,
       [ ...上記 needles 6 本を一字も変えずに列挙... ])
```

## 4. 検証結果（すべて本セッションで実行済み）

- **build**: `lake build JapanTaxLaw.InheritanceAnnuityMaxima JapanTaxLaw.InheritanceAnnuityMaximaSpec JapanTaxLaw.InheritanceAnnuityMaximaTests`
  → **成功（5 jobs、warning なし）**。※自作 3 モジュールのみ。全体ビルド／CI／
  `run_python_gates.py` は**実行していません**。
- **no-sorry**: `python scripts/ci/check_no_sorry.py` →
  `no forbidden placeholder proofs found in tracked Lean sources`。
  （新規 3 ファイルは未追跡のため走査対象外ですが、同一ロジックで個別に確認し、
  `sorry` / `admit` が **0 件**であることを確認済み。）
- **axiom**: 一時ファイル `AnmaxAxiomProbe.lean` を approved temp dir に作成し、
  `lake env lean` で全 **32** 件の名前付き宣言に `#print axioms` を実行 →
  `Classical.choice` **0 件** / `sorryAx` **0 件** / `propext` 9 件（許可対象）。
  23 件は `does not depend on any axioms`、残り 9 件は `propext` のみに依存。
  **一時 lean ファイルは削除済み**です。
- **逐語**: 正規化は `re.sub(r"[\s\u3000]+", "", ...)`（transcription_audit.py と同一）。
  - 担当範囲原文 `inherit_art24.txt`（正規化後 1,583 文字）: **6/6 FOUND、MISS 0**、各出現回数 1。
  - pinned JSON の平坦化本文（`law_full_text`、正規化後 154,766 文字）:
    **6/6 FOUND、MISS 0**、各出現回数 1。
  - 原文全体が pinned JSON 本文 offset 36,339 から 1,583 文字すべて逐語一致。
  - needle 長 90 / 110 / 105 / 95 / 105 / 100 文字（60〜130 の範囲）、U+3000 は 0 個。
  - 検証用の一時スクリプト・出力は削除済み（担当範囲原文 `inherit_art24.txt` は残置）。

逐語 FOUND / MISS 一覧（一字も変更せず）:

| # | 区分 | len | 原文@/count | JSON@/count | 結果 |
| --- | --- | --- | --- | --- | --- |
| 1 | 一号 見出し＋イ・ロ | 90 | 111/1 | 36450/1 | FOUND |
| 2 | 一号 ハ（残りの期間・複利年金現価率） | 110 | 268/1 | 36607/1 | FOUND |
| 3 | 二号 見出し＋イ・ロ | 105 | 427/1 | 36766/1 | FOUND |
| 4 | 二号 ハ（予定利率で除）＋三号見出し | 95 | 584/1 | 36923/1 | FOUND |
| 5 | 三号 見出し＋イ・ロ | 105 | 655/1 | 36994/1 | FOUND |
| 6 | 三号 ハ（余命年数・政令・複利年金現価率） | 100 | 812/1 | 37151/1 | FOUND |

**FOUND 6 / MISS 0**（両テキストで出現回数 1、一意）。needle のアンカーを勝手に変更・
正規化・文字変換していません。

## 5. README / PROGRESS に足す 1 行文案

- **README.md**（モジュール一覧の末尾付近に追加）:
  ```text
  JapanTaxLaw/InheritanceAnnuityMaxima.lean / -Spec.lean / -Tests.lean  # 相続税法 art. 24(1) 一号・二号・三号の「いずれか多い金額」= 3 値の max（有期/無期/終身、解約返戻金・一時金・ハは caller-established Money、一時金選択は Bool/Option で金額式外、複利現価率・予定利率・余命年数は NOT MODELLED）L4 モデル・独立定式・退行テスト
  ```
- **docs/PROGRESS.md**（L4 着手済みモジュール一覧の末尾に追記）:
  ```text
  相続税法 art. 24(1)（InheritanceAnnuityMaxima.lean：一号有期・二号無期・三号終身の「多い金額」を max 構造としてモデル化、ハの複利年金現価率/予定利率除算/政令余命年数とその基礎計算は NOT MODELLED で caller-established Money、一時金ロの選択は Bool/Option のみ、24(2)〜(5) は対象外）
  ```

## 6. インテグレーターへの明示事項

**インテグレーターは `JapanTaxLaw.lean` に以下の 3 つの import を追加すること。**

```lean
import JapanTaxLaw.InheritanceAnnuityMaxima
import JapanTaxLaw.InheritanceAnnuityMaximaSpec
import JapanTaxLaw.InheritanceAnnuityMaximaTests
```

（ANMAX は `JapanTaxLaw.lean` を書き換えていません。他ワーカーのファイルにも触れていません。）

## 7. 範囲・残ブロッカーの正直な申告（最終報告）

- **build**: 自作 3 モジュールのみ `lake build` 成功（5 jobs / warning なし）。全体ビルド・
  CI・`run_python_gates.py` は未実行です。
- **axiom**: 走査 32 件（実装 def 8 + theorem 16 + Spec def 8）、
  `Classical.choice` / `sorryAx` なし、`propext` 9 件のみ（許可対象）。一時ファイルは削除済み。
- **逐語**: FOUND 6 / MISS 0（担当範囲原文・pinned JSON の両方、出現回数 1、
  長さ 90〜110 文字、U+3000 なし）。
- **def 数**: 実装 8 def + 16 theorem + Spec 8 def = **名前付き宣言 32**
  （＋ `by decide` example 70 件）。Tests は新規定理名なし。
- **STAGING**: 本ファイル `docs/STAGING_ANMAX.md` を作成済みです。
- これは **L4 のごく小さなスライス**です。**完成・網羅を主張しません**。
- 担当は **art. 24(1) 一号・二号・三号の max 構造のみ**です。号のハで参照される
  複利計算・複利年金現価率（財務省令）・予定利率（契約依存）・余命年数（政令）は
  NOT MODELLED で、呼び出し側が計算済み `Money` を渡す前提です。
  24(2)〜(5) および他条文・端数処理の通則法的詳細は **NOT YET COVERED**。
- 一時金ロの「給付を受けることができる場合」分岐は caller-established Bool / Option で、
  Bool を金額式（max）に入れていません。各入力・各号への該当性もすべて caller-established。
- `agree*` は有限サンプルの `==` 一致確認であり、法的意味の等価証明ではありません。
- 転記監査は fidelity-only（原文 bytes との一致確認）であり、法的正しさを保証しません。
- **L7 候補 3,438 件は unreviewed のまま**です（本スライドでは一切レビューしていません）。
- 残ブロッカー: 転記監査 check の `checks()` への組み込み（§3、+6 needles）、
  `JapanTaxLaw.lean` への import 追加（§6）、README / PROGRESS の 1 行追記（§5）、
  および全体ビルド・CI ゲートの実行は**すべてメインセッションの担当**です
  （ANMAX は実行していません）。
