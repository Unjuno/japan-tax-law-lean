# STAGING — LGRB（地方交付税法 art. 14「交付金の百分の七十五相当額を控除」構造）受け渡しメモ

> 実装ワーカー LGRB からメインセッション（統合担当）への受け渡し用。
> commit / push / merge / ブランチ切替は一切していません。
> 本タスクで書き換えたのは下記 4 ファイルのみです（他は読み取り専用）。

## 0. 対象ファイル

| ファイル | 状態 |
| --- | --- |
| `JapanTaxLaw/LocalGrantRevenueBase.lean` | 新規 |
| `JapanTaxLaw/LocalGrantRevenueBaseSpec.lean` | 新規 |
| `JapanTaxLaw/LocalGrantRevenueBaseTests.lean` | 新規 |
| `docs/STAGING_LGRB.md` | 新規（本ファイル） |

pinned source:

- law id `325AC0000000211`
- revision `325AC0000000211_20261102_508AC0000000062`
- 担当範囲原文: `C:\Users\junny\AppData\Local\Temp\opencode\C3_localgrant.txt`（art. 14、UTF-8、約 4982 文字）
- 照合先 JSON: `data/raw/325AC0000000211_20261102_508AC0000000062.law.json`
  （flatten テキストに対して raw / 正規化の両方で `.find()` FOUND、各 `count = 1` を確認済み）

名前空間は `JapanTaxLaw.LocalGrantRevenueBase`（他モジュールと衝突しない独立名前空間）。
`Money := Nat` は `JapanTaxLaw.TaxFinance` を import して利用。

## 1. 追加した def / theorem 一覧

### 実装（`LocalGrantRevenueBase.lean`）— 5 def

| 区分名 | 名前 | 内容 |
| --- | --- | --- |
| （共通） | `grantDeductionRate` | 原文「百分の七十五」= `⟨75, 100, by decide⟩`（75%） |
| （共通） | `netRevenue` | `estimatedTax - grantDeductionRate.applyFloor grant`（`TaxRate.applyFloor` 切り捨て、Nat saturating 減算） |
| 利子割 | `interestSplitNetRevenue` | 共通関数 `netRevenue` を呼ぶ（区分名を doc-comment に明記） |
| 配当割 | `dividendSplitNetRevenue` | 共通関数 `netRevenue` を呼ぶ（同上） |
| 株式等譲渡所得割 | `stockTransferIncomeSplitNetRevenue` | 共通関数 `netRevenue` を呼ぶ（同上） |

theorem 9 本（モデル性質のみ）:

- `grantDeductionRate_numDen`（rfl）/ `grantDeductionRate_den_pos`（by decide）
- `netRevenue_eq`（rfl）/ `netRevenue_le_estimatedTax`（Nat.sub_le）
- `netRevenue_mono_est`（収入見込額について単調、Nat.sub_le_sub_right）
- `netRevenue_eq_zero_of_deduction_ge`（控除≥見込額なら 0）
- `interestSplitNetRevenue_eq` / `dividendSplitNetRevenue_eq` / `stockTransferIncomeSplitNetRevenue_eq`（いずれも rfl、共通関数に委譲）

kernel-decide の `example`: 実装 20 件・Spec 18 件（内 agree 6 件）・Tests 31 件の計 **69 件**。
境界: 0、控除>見込額で 0、端数（`101→75`、`76−75=1`）。

### 独立定式（`LocalGrantRevenueBaseSpec.lean`）— 9 def（spec 3 + agree 6）

| 名前 | 内容 |
| --- | --- |
| `specDeductionRate` | `(75, 100)`（独立整数定式） |
| `specDeduction` | `75 * grant / 100`（impl と乗法順を入れ替えた独立式） |
| `specNetRevenue` | `estimatedTax - specDeduction grant`（3 税目すべての共通関数に対応） |
| `agreeDeductionRate` | impl ≡ spec（numDen、`by decide`） |
| `agreeDeduction` | impl ≡ spec（控除額、12 点、`by decide`） |
| `agreeNetRevenue` | impl ≡ spec（控除後額、15 点、`by decide`） |
| `agreeInterest` / `agreeDividend` / `agreeStock` | 3 税目の各 def ≡ spec（各 6 点、`by decide`） |

### 退行テスト（`LocalGrantRevenueBaseTests.lean`）

`example : ... := by decide` の kernel-decide smoke 31 件。境界: 0、控除>見込額で 0（74/100・75/100）、
端数（101→75、76−75=1）。3 税目が共通関数と一致することも kernel-decide で確認。

### doc-comment に明記した射程

- 基準税率・収入見込額・交付金見込額・（どの税目に該当するか）の該当性は**すべて caller-established**。
  法的判断は自動化していない。**Bool は金額式に入れていない**。
- 端数処理は `TaxRate.applyFloor`（切り捨て）に委ねる。原文は「…に相当する額」とし丸め細目の明記はなく、
  他モジュールと同じ慣例を採用したことを明示済み。
- 減算は `Nat` の saturating 減算（控除額が収入見込額を超える場合は 0）。
- `agree*` は定数値の `==` 一致確認であり、法的意味の等価証明ではない。
  転記監査は fidelity-only（原文 bytes との一致確認）であり法的正しさを保証しない。

## 2. 転記監査に追加すべき check（JSON 断片）

`scripts/ci/transcription_audit.py` の `checks()` に追加する check の JSON 表現です
（`law_id` / `kind` / `title` / `needles` の 4 キー）。needle 文字列は原文の一字一句です。
**文字正規化・全角／半角変換・異体字変換を行わず、そのまま移してください。**
全 needle は全角空白 U+3000 を含みません。

```json
{
  "law_id": "325AC0000000211",
  "kind": "file",
  "title": null,
  "needles": [
    "利子割の収入見込額については基準税率をもつて算定した当該道府県の利子割の収入見込額から利子割交付金の交付見込額の百分の七十五に相当する額を控除した額とし、",
    "当該道府県の配当割の収入見込額から地方税法第七十一条の四十七の規定により市町村に対し交付するものとされる配当割に係る交付金（以下この項及び第三項において「配当割交付金」という。）の交付見込額の百分の七十五に相当する額を控除した額とし、",
    "当該道府県の株式等譲渡所得割の収入見込額から同法第七十一条の六十七の規定により市町村に対し交付するものとされる株式等譲渡所得割に係る交付金（以下この項及び第三項において「株式等譲渡所得割交付金」という。）の交付見込額の百分の七十五に相当する額を控除した額とし、"
  ]
}
```

参考変換例:

```python
yield ("地方交付税法 art. 14（基準財政収入額の算定方法・利子割／配当割／株式等譲渡所得割の交付金75%控除）↔ LocalGrantRevenueBase.lean",
       "325AC0000000211",
       "file", None,
       [ ...上記 needles 3 本を一字も変えずに列挙... ])
```

## 3. 期待 literal 増分

- 新規 check **3 needles** なので **+3**。
- `docs/PROGRESS.md` の監査 literal 総数はメインセッションが再確認して加算してください
  （起点値は本メモでは書きません）。

## 4. 検証結果（すべて本セッションで実行済み）

- `lake build JapanTaxLaw.LocalGrantRevenueBase JapanTaxLaw.LocalGrantRevenueBaseSpec JapanTaxLaw.LocalGrantRevenueBaseTests`
  → **成功（5 jobs、warning なし）**。※全体ビルド／CI／`run_python_gates.py` は実行していません。
- `python scripts/ci/check_no_sorry.py` →
  `no forbidden placeholder proofs found in tracked Lean sources`。
  （新規 3 ファイルは未追跡のため走査対象外ですが、人手でも `sorry` / `admit` はありません。）
- `#print axioms`（一時ファイル `LGRB_AxiomProbe.lean` を approved temp dir に作成、
  `lake env lean` で実行後 **削除済み**）:
  - 新规定数 **15 本**（theorem 9 + agree def 6）を検査。**`Classical.choice` も `sorryAx` も一切なし**。
  - 14 本は `does not depend on any axioms`。
  - 1 本（`netRevenue_eq_zero_of_deduction_ge`）は `propext` に依存（repo 許容範囲、propext 可）。
- 原文逐語検証: **3/3 FOUND、MISS 0 件**（§5）。pinned JSON の flatten テキストが
  原文ファイルと一致することも raw / 正規化の両方で確認済み。

## 5. 逐語検証 FOUND / MISS 一覧（一字も変更せず）

pinned JSON の flatten テキストをそのまま haystack とし、needle も同じ文字列で Python
`.find()` を実行。`norm@` は `re.sub(r"[\s　]+", "", ...)` 正規化後の offset
（transcription_audit.py の `contains()` と同一条件）、`raw@` は未正規化テキスト上の offset。

| # | 区分名 | len | 全角空白 | raw@ | norm@ | count | 結果 |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 1 | 利子割 | 77 | なし | 21443 | 21015 | 1 | **FOUND** |
| 2 | 配当割 | 117 | なし | 21546 | 21118 | 1 | **FOUND** |
| 3 | 株式等譲渡所得割 | 130 | なし | 21694 | 21266 | 1 | **FOUND** |

- **FOUND 3 / MISS 0**。needle の勝手な変更・正規化・文字変換はしていません。
- MISS が出ていた場合はここで作業を止めて報告する手順でしたが、該当なしです。
- 全 needle は 60〜130 文字の範囲内（77 / 117 / 130）。

## 6. README / PROGRESS に足す 1 行文案

CROSS_LAW の scan/pin 件数や監査 literal 総数はメインセッションが計算するため、ここでは書きません。

- **README.md**（モジュール一覧の該当付近に追加）:
  ```text
  JapanTaxLaw/LocalGrantRevenueBase.lean / -Spec.lean / -Tests.lean  # 地方交付税法 art.14 のうち利子割・配当割・株式等譲渡所得割の「交付金の百分の七十五相当額を控除」構造の L4 計算スライス。控除率 75/100、netRevenue = 収入見込額 − 交付金×75/100（切り捨て・Nat saturating）。基準税率・見込額・交付金見込額・該当性は caller-established
  ```
- **docs/PROGRESS.md**（L4 着手済みモジュール一覧の末尾に追記）:
  ```text
  地方交付税法 art.14（LocalGrantRevenueBase.lean：利子割／配当割／株式等譲渡所得割の交付金 75% 控除。控除率 = 75/100、netRevenue = 収入見込額 − 交付金×75/100、3 税目は共通関数を呼ぶ。控除>見込額なら 0。基準税率・見込額・交付金見込額・該当性は caller-established、丸めは TaxRate.applyFloor 切り捨て）
  ```

## 7. インテグレーターへの明示事項

**インテグレーターは `JapanTaxLaw.lean` に以下の 3 つの import を追加すること。**

```lean
import JapanTaxLaw.LocalGrantRevenueBase
import JapanTaxLaw.LocalGrantRevenueBaseSpec
import JapanTaxLaw.LocalGrantRevenueBaseTests
```

（LGRB は `JapanTaxLaw.lean` を書き換えていません。メインが統合してください。）

## 8. 範囲・残ブロッカーの正直な申告

- これは **L4 のごく小さなスライス**です。**完成・網羅を主張しません**。
- 対象は art. 14(1) の 3 税目（利子割・配当割・株式等譲渡所得割）における
  「交付金の 75% 相当額を控除」という算術構造のみです。
- **NOT MODELLED（明示）**:
  - 本文 art. 14 の他の税目・控除: 法人事業税交付金（75% ではなく別算式）、
    地方消費税・ゴルフ場利用税・軽油引取税・市町村たばこ税の各 75% 控除、
    市町村たばこ税都道府県交付金／特別法人事業譲与税の「75% の額」、
    各種譲与税（地方揮発油・石油ガス・自動車重量・航空機燃料・森林環境・特別とん）の合算、
    国有資産等所在都道府県／市町村交付金の合算、基準税率・基準率自体の算定、
    第 2 項（基準税率＝標準税率の 75%）、第 3 項の算定基礎表。
  - 市町村・指定市に係る同種の算定（75% の額を単純加算する構造）も含め、
    上記以外の条項はすべて NOT MODELLED。
  - **経過措置・附則は一切モデル化していません**。
- 基準税率・収入見込額・交付金見込額・該当性は caller-established（本モジュールは算術のみ）。
- 端数処理は原文に丸め細目の明記がないため `TaxRate.applyFloor`（切り捨て）を採用した（per-law business data）。
- `agree*` は定数値の `==` 一致確認であり、法的意味の等価証明ではありません。
- 転記監査は fidelity-only（原文 bytes との一致確認）であり、法的正しさを保証しません。
- **L7 候補 3,438 件は LEGAL_REVIEW_PENDING（unreviewed）のまま**です（本スライスでは一切レビューしていません）。
- 残ブロッカー: 転記監査 check の `checks()` への組み込み（§2、+3）、`JapanTaxLaw.lean` への
  import 追加（§7）、README / PROGRESS の 1 行追記（§6）、および全体ビルド・CI ゲートの
  実行は**すべてメインセッションの担当**です（LGRB は実行していません）。
