# STAGING — W-B（法人税法 art. 87 / art. 82の5 / art. 145の12 税率計算）受け渡しメモ

> 実装担当 W-B からメインセッション（統合担当）への受け渡し用。
> ブランチ操作・add/commit/push/merge は一切していません。
> 書き換えたのは下記 4 ファイルのみです（他は読み取り専用）。
> 本ファイルは以前の W-B 割当（登録免許税法 P2B）の内容を、本次の割当向けに丸ごと更新したものです。

## 0. 対象ファイル

| ファイル | 状態 |
| --- | --- |
| `JapanTaxLaw/CorporateMiscRates.lean` | 新規 |
| `JapanTaxLaw/CorporateMiscRatesSpec.lean` | 新規 |
| `JapanTaxLaw/CorporateMiscRatesTests.lean` | 新規 |
| `docs/STAGING_WB.md` | 更新（本ファイル） |

pinned source: 法人税法 `340AC0000000034` / revision `340AC0000000034_20261001_508AC0000000012`
（raw: `data/raw/340AC0000000034_20261001_508AC0000000012.law.json`,
施行日 2026-10-01。`CorporateTaxRate.lean` / `CorporateSurtax.lean` と同一ピン。）
担当範囲の正規化原文: `C:\Users\junny\AppData\Local\Temp\opencode\W_B_corporate.txt`（HTML タグ除去・空白圧縮済み UTF-8、全 8 行）。

## 1. def 一覧

### 1.1 `CorporateMiscRates.lean`（namespace `JapanTaxLaw`、`Money := Nat`、`TaxRate.applyFloor` は切り捨て）

税率定数（2）:

| def | 値 | 根拠条 |
| --- | --- | --- |
| `pensionReserveRate` | `⟨1, 100, by decide⟩`（百分の一 = 1%） | art. 87 / art. 145の12 |
| `internationalMinimumTaxRate` | `⟨907, 1000, by decide⟩`（百分の九十・七 = 90.7%） | art. 82の5 |

税率計算関数（3）:

| def | 算式 | 根拠条 |
| --- | --- | --- |
| `retirementPensionReserveTax reserve` | `reserve × 1/100` | 第八十七条（内国法人・退職年金等積立金） |
| `internationalMinimumTax base` | `base × 907/1000` | 第八十二条の五（国際最低課税額） |
| `foreignPensionReserveTax reserve` | `reserve × 1/100` | 第百四十五条の十二（外国法人・退職年金等積立金） |

名前付き定理（8）: `pensionReserveRate_den_pos` / `internationalMinimumTaxRate_den_pos`（分母の正性）、
`retirementPensionReserveTax_mono` / `internationalMinimumTax_mono` / `foreignPensionReserveTax_mono`（単調性）、
`retirementPensionReserveTax_pos` / `internationalMinimumTax_pos` / `foreignPensionReserveTax_pos`（正の分母倍数に対して税額 > 0）。

impl smoke: `example := by decide` を 10 本（0 / 境界 / 端数切り捨てを含む）。

### 1.2 `CorporateMiscRatesSpec.lean`（独立整数定式、impl の `TaxRate.applyFloor` を再利用しない）

| def | 算式 |
| --- | --- |
| `specRetirementPensionReserveTax reserve` | `(reserve * 1) / 100` |
| `specInternationalMinimumTax base` | `(base * 907) / 1000` |
| `specForeignPensionReserveTax reserve` | `(reserve * 1) / 100` |
| `agreeCorporateMiscRates : Bool` | 10 点 `[0,1,99,100,101,999,1000,12345,100000,907123]` で impl 3 関数と `==` 比較、`example : agreeCorporateMiscRates = true := by decide` |

Spec の `by decide` ポイント 10 本。art. 87 と art. 145の12 は原文が同一（1/100）のため定式も同一で、
納税者（内国／外国）の別は **caller-established**（doc-comment 級）として算術式には入れていません。

### 1.3 `CorporateMiscRatesTests.lean`

kernel-decide smoke 17 本（art. 87: 6 / art. 82の5: 6 / art. 145の12: 5）。定理名の追加なし。

### 1.4 doc-comment に明記した射程外（overclaim 防止）

- **課税標準額**（各事業年度の退職年金等積立金の額 / 各対象会計年度の課税標準国際最低課税額）は
  **caller-established**。与えられた金額に税率を乗じる算術のみを扱い、算定過程は一切都合せません。
- 内国法人／外国法人の別、対象会計年度・事業年度の確定、積立金の存在判定等の適用判定も
  **caller-established** とし、**Bool は式に入れていません**。
- 端数処理は `TaxRate.applyFloor`（切り捨て）を採用したことを明示（原文は「乗じて計算した金額」で
  端数規定を本条に持たない）。art. 82の5 の国際最低課税額そのものの算定（GloBE ルール）、
  他の法人税特例税率、申告・納付手続は **射程外**。
- 転記監査は fidelity-only（原文 bytes との一致確認）であり法的正しさを保証しません。

## 2. 転記監査に追加すべき check（JSON 断片）

`scripts/ci/transcription_audit.py` の `checks()` に追加する check の JSON 表現です
（`law_id` / `kind` / `title` / `needles` の 4 キー）。needle 文字列は一字も変更しないこと。

```json
{
  "law_id": "340AC0000000034",
  "kind": "file",
  "title": null,
  "needles": [
    "第八十二条の五内国法人に対して課する各対象会計年度の国際最低課税額に対する法人税の額は、各対象会計年度の課税標準国際最低課税額に百分の九十・七の税率を乗じて計算した金額とする。",
    "（退職年金等積立金に対する法人税の税率）第八十七条内国法人に対して課する退職年金等積立金に対する法人税の額は、各事業年度の退職年金等積立金の額に百分の一の税率を乗じて計算した金額とする。",
    "（外国法人に係る退職年金等積立金に対する法人税の税率）第百四十五条の十二外国法人に対して課する退職年金等積立金に対する法人税の額は、各事業年度の退職年金等積立金の額に百分の一の税率を乗じて計算した金額とする。"
  ]
}
```

現行スクリプト形式（`yield (name, law_id, kind, title, needles)`）への変換例:

```python
yield ("法人税法 art. 87 / art. 82の5 / art. 145の12（退職年金等積立金1%・国際最低課税額90.7%・外国法人退職年金積立金1%）↔ CorporateMiscRates.lean",
       "340AC0000000034",
       "file", None,
       [
         "第八十二条の五内国法人に対して課する各対象会計年度の国際最低課税額に対する法人税の額は、各対象会計年度の課税標準国際最低課税額に百分の九十・七の税率を乗じて計算した金額とする。",
         "（退職年金等積立金に対する法人税の税率）第八十七条内国法人に対して課する退職年金等積立金に対する法人税の額は、各事業年度の退職年金等積立金の額に百分の一の税率を乗じて計算した金額とする。",
         "（外国法人に係る退職年金等積立金に対する法人税の税率）第百四十五条の十二外国法人に対して課する退職年金等積立金に対する法人税の額は、各事業年度の退職年金等積立金の額に百分の一の税率を乗じて計算した金額とする。",
       ])
```

> **重要（統合時の注意）**: needle は正規化原文の一字一句です。
> 文字正規化・全角／半角変換・異体字変換を行わず、そのまま移してください。
> §5 で実際に `.find()` したのは、まさに上記 3 文字列です（`norm` は空白・全角空白を除去するだけ）。

期待 literal 増分: 新規 check 1 件 × needles **3 本** なので **+3 literal / +1 anchor check**。
（起点値はメインセッションで再確認してください。）

## 3. 検証結果（すべて本セッションで実行済み）

- `lake build JapanTaxLaw.CorporateMiscRates JapanTaxLaw.CorporateMiscRatesSpec JapanTaxLaw.CorporateMiscRatesTests`
  → **成功（5 jobs、warning なし）**。※自作 3 モジュールのみビルド（全体ビルド / CI / `run_python_gates` は未実行）。
- `python scripts/ci/check_no_sorry.py` → `no forbidden placeholder proofs found in tracked Lean sources`。
  （新規 3 ファイルは未追跡のため本スクリプトの走査対象外。別途 `grep -nE '\b(sorry|admit)\b' JapanTaxLaw/CorporateMiscRates*.lean` を実行し **No matches** を確認済み。）
- `#print axioms`（一時ファイル `WBCorpAxiomProbe.lean` を approved temp dir に作成、
  `lake env lean` で実行後 **削除済み**）:
  - 8 本の名前付き定理 + `agreeCorporateMiscRates` + 3 本の `spec*` = **全 12 件を検査**。
  - 依存公理は **なし** または **`propext` のみ**（`propext` は本プロジェクトの許容ベースライン）。
  - **`Classical.choice` / `sorryAx` / `Quot.sound` は一切なし**。
- 原文逐語検証: 下記 §5 のとおり **3/3 FOUND、MISS 0 件**。各 needle の正規化テキスト中
  出現回数はすべて **1**（一意）。非正規化の pinned JSON テキストにもそのまま存在します。

## 4. 逐語検証 FOUND / MISS 一覧（一字も変更せず）

提供された正規化原文 `W_B_corporate.txt` の本文行（`====` 見出しを除く）を
`re.sub(r"[\s　]+", "", ...)` で正規化した文字列、および pinned JSON の `law_full_text` を
`transcription_audit.py` の `text()` と同一ロジックで平坦化・正規化した文字列に対して、
各 needle を Python の `.find()` / `.count()` で検索（needle 側も同正規化）。

| # | 根拠条 | 結果 | excerpt.offset | pinned.offset(norm) | 出現回数(norm) | raw pinned.find |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | 第八十二条の五（90.7%） | FOUND | 0 | 236384 | 1 | 236571 |
| 2 | 第八十七条（1%） | FOUND | 88 | 267274 | 1 | 267475 |
| 3 | 第百四十五条の十二（1%） | FOUND | 181 | 318537 | 1 | 318769 |

- law id `340AC0000000034` … pinned JSON 内で一致確認済み。
- revision `340AC0000000034_20261001_508AC0000000012`（source_file 名）… 実在確認済み。
- **FOUND 3 件 / MISS 0 件。** アンカーの勝手な変更・正規化はしていません。

## 5. README / PROGRESS に足す 1 行文案

CROSS_LAW の scan/pin 件数はメインセッションが計算するため、ここでは書きません。

- **README.md**（法人税率モジュール一覧の直後に追加）:
  ```text
  JapanTaxLaw/CorporateMiscRates.lean / -Spec.lean / -Tests.lean  # 法人税法 art. 87・82の5・145の12（退職年金等積立金1%・国際最低課税額90.7%・外国法人退職年金積立金1%）税率計算 L4 モデル・独立整数定式・退行テスト
  ```
- **docs/PROGRESS.md**（L4 着手済みモジュール一覧の末尾に追記）:
  ```text
  法人税法 art. 87 / 82の5 / 145の12 CorporateMiscRates.lean（退職年金等積立金・国際最低課税額・外国法人退職年金積立金の税率計算 1% / 90.7% / 1%、課税標準額は caller-established、Bool は式外）
  ```

## 6. インテグレーターへの明示事項

**インテグレーターは `JapanTaxLaw.lean` に以下の 3 つの import を追加すること。**

```lean
import JapanTaxLaw.CorporateMiscRates
import JapanTaxLaw.CorporateMiscRatesSpec
import JapanTaxLaw.CorporateMiscRatesTests
```

（W-B は `JapanTaxLaw.lean` を書き換えていません。メインが統合してください。）

## 7. 範囲・残ブロッカーの正直な申告

- これは **L4 のごく小さなスライス**です。**完成・網羅を主張しません**。
- 担当は 法人税法の **第八十七条 / 第八十二条の五 / 第百四十五条の十二条** の税率算術のみ。
  税率の適用可否・課税標準額の算定を含む他条・他制度は **NOT YET COVERED**。
- 転記監査は fidelity-only（原文 bytes との一致確認）であり、法的正しさを保証しません。
- **L7 候補 3,438 件は unreviewed のまま**です（本スライスでは一切レビューしていません）。
- 残ブロッカー: 転記監査 check の `checks()` への組み込み（§2）、`JapanTaxLaw.lean` への
  import 追加（§6）、README / PROGRESS の 1 行追記（§5）、および全体ビルド・CI ゲートの
  実行は**すべてメインセッションの担当**です（W-B は実行していません）。
