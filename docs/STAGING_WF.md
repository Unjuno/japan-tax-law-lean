# STAGING — W-F（法人税法 art. 82の13 / art. 82の21 / art. 145の8 GloBE 関連税率計算）受け渡しメモ

> 実装担当 W-F からメインセッション（統合担当）への受け渡し用。
> ブランチ操作・add/commit/push/merge は一切していません。
> 書き換えたのは下記 4 ファイルのみです（他は読み取り専用）。
> 本ファイルは以前の W-F 割当（登録免許税法 P4F）の内容を、本次の割当向けに丸ごと更新したものです
> （`STAGING_WB.md` と同じ状況）。旧割当の受け渡し内容は必要ならメインが別途保管してください。

## 0. 対象ファイル

| ファイル | 状態 |
| --- | --- |
| `JapanTaxLaw/CorporateGlobeRates.lean` | 新規 |
| `JapanTaxLaw/CorporateGlobeRatesSpec.lean` | 新規 |
| `JapanTaxLaw/CorporateGlobeRatesTests.lean` | 新規 |
| `docs/STAGING_WF.md` | 更新（本ファイル） |

pinned source: 法人税法 `340AC0000000034` / revision `340AC0000000034_20261001_508AC0000000012`
（raw: `data/raw/340AC0000000034_20261001_508AC0000000012.law.json`,
施行日 2026-10-01。`CorporateTaxRate.lean` / `CorporateSurtax.lean` / `CorporateMiscRates.lean` と同一ピン。）
担当範囲の正規化原文: `C:\Users\junny\AppData\Local\Temp\opencode\W_F_corporate2.txt`（UTF-8、3 条文／8 行）。

`CorporateMiscRates*` は W-B 作成済みにつき**一切触っていません**（art. 82の5 の 90.7% はそちらが担当）。

## 1. def 一覧

### 1.1 `CorporateGlobeRates.lean`（namespace `JapanTaxLaw`、`Money := Nat`、`TaxRate.applyFloor` は切り捨て）

税率定数（2）:

| def | 値 | 根拠条 |
| --- | --- | --- |
| `globeResidualRate` | `⟨907, 1000, by decide⟩`（百分の九十・七 = 90.7%） | art. 82の13 |
| `globeDomesticRate` | `⟨753, 1000, by decide⟩`（百分の七十五・三 = 75.3%） | art. 82の21 / art. 145の8 |

税率計算関数（3）:

| def | 算式 | 根拠条 |
| --- | --- | --- |
| `internationalMinimumResidualTax base` | `base × 907/1000` | 第八十二条の十三（内国法人・国際最低課税残余額） |
| `domesticMinimumTax base` | `base × 753/1000` | 第八十二条の二十一（内国法人・国内最低課税額） |
| `foreignDomesticMinimumTax base` | `base × 753/1000` | 第百四十五条の八（外国法人・国内最低課税額） |

名前付き定理（8）: `globeResidualRate_den_pos` / `globeDomesticRate_den_pos`（分母の正性）、
`internationalMinimumResidualTax_mono` / `domesticMinimumTax_mono` / `foreignDomesticMinimumTax_mono`（単調性）、
`internationalMinimumResidualTax_pos` / `domesticMinimumTax_pos` / `foreignDomesticMinimumTax_pos`
（正の分母倍数に対して税額 > 0）。

impl smoke: `example := by decide` を 18 本（3 関数 × 6 点: 0 / 1 / 999 / 1000 / 100_000 / 1_000_000、切り捨て境界を含む）。

### 1.2 `CorporateGlobeRatesSpec.lean`（独立整数定式、impl の `TaxRate.applyFloor` を再利用しない）

| def | 算式 |
| --- | --- |
| `specInternationalMinimumResidualTax base` | `(base * 907) / 1000` |
| `specDomesticMinimumTax base` | `(base * 753) / 1000` |
| `specForeignDomesticMinimumTax base` | `(base * 753) / 1000` |
| `agreeCorporateGlobeRates : Bool` | 10 点 `[0,1,99,100,101,999,1000,12345,100000,907123]` で impl 3 関数と `==` 比較、`example : agreeCorporateGlobeRates = true := by decide` |

Spec の `by decide` ポイント 18 本。art. 82の21 と art. 145の8 は税率 literal が同一（753/1000）のため
定式も同一で、納税者（内国／外国）の別は **caller-established**（doc-comment 級）として算術式には
入れていません。

### 1.3 `CorporateGlobeRatesTests.lean`

kernel-decide smoke 18 本（3 関数 × 6 点）。定理名の追加なし。

### 1.4 doc-comment に明記した射程外（overclaim 防止）

- **課税標準額**（課税標準国際最低課税残余額 / 課税標準国内最低課税額）は **caller-established**。
  与えられた金額に税率を乗じる算術のみを扱い、算定過程は一切都合せません。
- 内国法人／外国法人の別、対象会計年度の確定、国際最低課税残余額・国内最低課税額の算定
  （GloBE ルールそのもの）等の適用判定も **caller-established** とし、**Bool は式に入れていません**。
- 丸めは `TaxRate.applyFloor`（**切り捨て**）を採用したことを明示（原文は「乗じて計算した金額」で
  端数規定を本条に持たない）。art. 82の5（国際最低課税額 90.7%）、他の法人税特例税率、
  申告・納付手続は **射程外**（art. 82の5 は W-B の `CorporateMiscRates.lean` が担当）。
- 転記監査は fidelity-only（原文 bytes との一致確認）であり法的正しさを保証しません。

## 2. 転記監査に追加すべき check（JSON 断片）

`scripts/ci/transcription_audit.py` の `checks()` に追加する check の JSON 表現です
（`law_id` / `kind` / `title` / `needles` の 4 キー）。needle 文字列は一字も変更しないこと。
**文字正規化・全角／半角変換・異体字変換を行わず、そのまま移してください。**

```json
{
  "law_id": "340AC0000000034",
  "kind": "file",
  "title": null,
  "needles": [
    "第八十二条の十三内国法人に対して課する各対象会計年度の国際最低課税残余額に対する法人税の額は、各対象会計年度の内国法人に係る課税標準国際最低課税残余額に百分の九十・七の税率を乗じて計算した金額とする。",
    "第八十二条の二十一内国法人に対して課する各対象会計年度の国内最低課税額に対する法人税の額は、各対象会計年度の内国法人に係る課税標準国内最低課税額に百分の七十五・三の税率を乗じて計算した金額とする。",
    "第百四十五条の八外国法人に対して課する各対象会計年度の国内最低課税額に対する法人税の額は、各対象会計年度の外国法人に係る課税標準国内最低課税額に百分の七十五・三の税率を乗じて計算した金額とする。"
  ]
}
```

現行スクリプト形式（`yield (name, law_id, kind, title, needles)`）への変換例:

```python
yield ("法人税法 art. 82の13 / 82の21 / 145の8（国際最低課税残余額90.7%・国内最低課税額75.3%・外国国内最低75.3%）↔ CorporateGlobeRates.lean",
       "340AC0000000034",
       "file", None,
       [
         "第八十二条の十三内国法人に対して課する各対象会計年度の国際最低課税残余額に対する法人税の額は、各対象会計年度の内国法人に係る課税標準国際最低課税残余額に百分の九十・七の税率を乗じて計算した金額とする。",
         "第八十二条の二十一内国法人に対して課する各対象会計年度の国内最低課税額に対する法人税の額は、各対象会計年度の内国法人に係る課税標準国内最低課税額に百分の七十五・三の税率を乗じて計算した金額とする。",
         "第百四十五条の八外国法人に対して課する各対象会計年度の国内最低課税額に対する法人税の額は、各対象会計年度の外国法人に係る課税標準国内最低課税額に百分の七十五・三の税率を乗じて計算した金額とする。",
       ])
```

期待 literal 増分: 新規 check 1 件 × needles **3 本** なので **+3 literal / +1 anchor check**
（起点値はメインセッションで再確認してください）。

## 3. 検証結果（すべて本セッションで実行済み）

- `lake build JapanTaxLaw.CorporateGlobeRates JapanTaxLaw.CorporateGlobeRatesSpec JapanTaxLaw.CorporateGlobeRatesTests`
  → **成功（5 jobs、warning なし）**。※自作 3 モジュールのみビルド
  （全体ビルド / CI / `run_python_gates.py` は未実行）。
- `python scripts/ci/check_no_sorry.py` → `no forbidden placeholder proofs found in tracked Lean sources`。
  別途 `grep -nE '\b(sorry|admit|axiom)\b' JapanTaxLaw/CorporateGlobeRates*.lean` は **No matches**。
- `#print axioms`（一時ファイル `WFCorpAxiomProbe.lean` を approved temp dir に作成、
  `lake env lean` で実行後 **削除済み**）: 名前付き定理 8 本 + `agreeCorporateGlobeRates` +
  `spec*` 3 本 = **全 12 件を検査**。
  - 依存公理は **なし** または **`propext` のみ**（`propext` は本プロジェクトの許容ベースライン）。
  - **`Classical.choice` / `sorryAx` / `Quot.sound` は一切なし**。
- 原文逐語検証: 下記 §4 のとおり **3/3 FOUND、MISS 0 件**。
  各 needle の正規化テキスト中出現回数はすべて **1**（一意）。
  law id `340AC0000000034` / revision `340AC0000000034_20261001_508AC0000000012` も
  pinned raw 内で一致確認済み。

## 4. 逐語検証 FOUND / MISS 一覧（一字も変更せず）

担当範囲原文 `W_F_corporate2.txt` の本文行（`====` 見出しを除く）を
`re.sub(r"[\s　]+", "", ...)` で正規化した文字列、および pinned JSON の `law_full_text` を
`transcription_audit.py` の `text()` と同一ロジックで平坦化・正規化した文字列に対して、
各 needle を Python の `.find()` / `.count()` で検索（needle 側も同正規化）。

| # | 根拠条 | def | 結果 | excerpt.offset | pinned.offset(norm) | 出現回数(excerpt/pinned) | len |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 1 | 第八十二条の十三（90.7%） | `internationalMinimumResidualTax` | FOUND | 0 | 243935 | 1/1 | 100 |
| 2 | 第八十二条の二十一（75.3%） | `domesticMinimumTax` | FOUND | 100 | 257298 | 1/1 | 98 |
| 3 | 第百四十五条の八（75.3%） | `foreignDomesticMinimumTax` | FOUND | 198 | 317748 | 1/1 | 97 |

- **FOUND 3 / MISS 0**。needle 長は原文見出しの `LEN`（100 / 98 / 97）と完全一致。
  アンカーの勝手な変更・正規化・文字変換はしていません。

## 5. README / PROGRESS に足す 1 行文案

CROSS_LAW の scan/pin 件数や監査 literal 総数はメインセッションが計算するため、ここでは書きません。

- **README.md**（法人税率モジュール一覧の直後に追加）:
  ```text
  JapanTaxLaw/CorporateGlobeRates.lean / -Spec.lean / -Tests.lean  # 法人税法 art. 82の13・82の21・145の8（国際最低課税残余額90.7%・国内最低課税額75.3%・外国国内最低75.3%）GloBE 関連税率計算 L4 モデル・独立整数定式・退行テスト
  ```
- **docs/PROGRESS.md**（L4 着手済みモジュール一覧の末尾に追記）:
  ```text
  法人税法 art. 82の13 / 82の21 / 145の8 CorporateGlobeRates.lean（国際最低課税残余額90.7%・国内最低課税額75.3%・外国法人国内最低75.3%の税率計算、課税標準額は caller-established、Bool は式外、切り捨て）
  ```

## 6. インテグレーターへの明示事項

**インテグレーターは `JapanTaxLaw.lean` に以下の 3 つの import を追加すること。**

```lean
import JapanTaxLaw.CorporateGlobeRates
import JapanTaxLaw.CorporateGlobeRatesSpec
import JapanTaxLaw.CorporateGlobeRatesTests
```

（W-B の `CorporateMiscRates*` 3 件と併せて計 6 行の追加になる見込みです。
メインが統合してください。W-F は `JapanTaxLaw.lean` を書き換えていません。）

## 7. 範囲・残ブロッカーの正直な申告

- これは **L4 のごく小さなスライス**です。**完成・網羅を主張しません**。
- 担当は 法人税法の **第八十二条の十三 / 第八十二条の二十一 / 第百四十五条の八** の税率算術のみ。
  税率の適用可否・課税標準額の算定（GloBE ルール本体）を含む他条・他制度は **NOT YET COVERED**。
- art. 82の21 と art. 145の8 は同一算式（753/1000）で、内国／外国の別は doc-comment 級の
  caller-established 区分であり、算術式自体は同じ def ではありません（別関数として定義）。
- `agreeCorporateGlobeRates` は 10 点での `==` 一致確認であり、法的意味の等価証明ではありません。
- 転記監査は fidelity-only（原文 bytes との一致確認）であり、法的正しさを保証しません。
- **L7 候補 3,438 件は unreviewed のまま**です（本スライスでは一切レビューしていません）。
- 残ブロッカー: 転記監査 check の `checks()` への組み込み（§2、+3）、`JapanTaxLaw.lean` への
  import 追加（§6）、README / PROGRESS の 1 行追記（§5）、および全体ビルド・CI ゲートの
  実行は**すべてメインセッションの担当**です（W-F は実行していません）。
