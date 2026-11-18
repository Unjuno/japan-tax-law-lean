# STAGING — PPW（所得税法 art. 203の3 公的年金等の徴収税額 L4 モデル）受け渡しメモ

> 実装担当 PPW からメインセッション（統合担当）への受け渡し用。
> ブランチ操作・add/commit/push/merge は一切していません。
> 書き換えたのは下記 4 ファイルのみです（他は読み取り専用）。

## 0. 対象ファイル / pinned source

| ファイル | 状態 |
| --- | --- |
| `JapanTaxLaw/PublicPensionWithholding.lean` | 新規 |
| `JapanTaxLaw/PublicPensionWithholdingSpec.lean` | 新規 |
| `JapanTaxLaw/PublicPensionWithholdingTests.lean` | 新規 |
| `docs/STAGING_PPW.md` | 新規（本ファイル） |

pinned source: `data/raw/340AC0000000033_20261001_507AC0000000070.law.json`
law id `340AC0000000033` / revision `340AC0000000033_20261001_507AC0000000070`
law title `所得税法` / amendment enforcement date `2026-10-01`。

担当範囲原文: `C:\Users\junny\AppData\Local\Temp\opencode\T1_income.txt`
（UTF-8、正文 2,300 文字／`[\s　]+` 正規化後 2,299 文字、先頭行は
`==== 第二百三条の三 LEN 2299` の見出しで本文ではない）。
**原文全文を一字も誤らず読み、正規化文字列が pinned JSON 正規化文字列の
offset 219886 から 2,299 文字すべて逐語一致することを確認済み。**

Namespace: `JapanTaxLaw.PublicPensionWithholding`（専用サブ名前空間。
既存モジュールは `JapanTaxLaw` 直下であり衝突しない）。
`open JapanTaxLaw.TaxFinance`（`Money = Nat`、`TaxRate.applyFloor`）。

## 1. 追加した宣言一覧

### 実装（`PublicPensionWithholding.lean`）— def 8 + structure 1 + theorem 11

| 種別 | 名前 | 内容 |
| --- | --- | --- |
| def | `pensionWithholdingBasicRate` | 百分の五 `⟨5, 100⟩` |
| def | `pensionWithholdingExcessRate` | 百分の十 `⟨10, 100⟩` |
| def | `pensionExcessThresholdUnit` | 十六万二千五百円 `162_500` |
| def | `excessThreshold` | `162_500 * months`（月数乗じ） |
| def | `pensionWithholdingTax` | `basicRate.applyFloor netAmount`（5%） |
| def | `pensionWithholdingWithExcess` | `basic(min n thr) + excess(n - thr)`（第三号・第六号、saturating） |
| def | `pensionWithholdingSeventh` | `excessRate.applyFloor netAmount`（第七号・10%） |
| structure | `PensionWithholdingFacts` | `netAmount`, `months`, `isThirdOrSixth`, `isSeventh`（呼出側確定） |
| def | `pensionWithholdingByCategory` | 区分 Bool で 3 関数を選択（第七号が優先） |
| theorem | `pensionWithholdingBasicRate_numDen` / `pensionWithholdingExcessRate_numDen` | 税率リテラル確認（`by decide`） |
| theorem | `pensionExcessThresholdUnit_value` / `excessThreshold_zero` / `excessThreshold_twelve` / `excessThreshold_mono` | threshold値・単調性 |
| theorem | `pensionWithholdingTax_nonneg` / `pensionWithholdingWithExcess_nonneg` / `pensionWithholdingSeventh_nonneg` / `pensionWithholdingByCategory_nonneg` | 正性 |
| theorem | `pensionWithholdingTax_mono` | 5% 税額の単調性 |

### Spec（`PublicPensionWithholdingSpec.lean`）— def 7

`specPensionWithholdingTax`（`n*5/100`）, `specExcessThreshold`（`162500*months`）,
`specPensionWithholdingWithExcess`（独立整数定式の 5% + 10% saturating）,
`specPensionWithholdingSeventh`（`n*10/100`）, `specPensionWithholdingByCategory`,
`agreePensionWithholdingPoints`, `agreePensionWithholdingCategoryPoints`。
**`TaxRate.applyFloor` を再利用せず整数算術で独立定式化**し、両 agree は `by decide`。

### Tests（`PublicPensionWithholdingTests.lean`）— 新規定理名なし／`by decide` smoke 23 件

境界: `netAmount = 0`、`threshold ちょうど`（162,500×1 = 8,125）、
`threshold 超`（162,501 → 8,125／1,162,500 → 108,125）、`months = 0`（threshold 0、
全額が超過分 10%）、ならびに 5%／10% 区分と第三号・第六号・第七号の選択。

**名前付き宣言 27 件（実装 9 + theorem 11 + Spec 7）、`by decide` example 48 件
（実装 13 + Spec 12 + Tests 23）。**

### 原文どおりの読み取り（誠実性の境界）

- 税率は冒頭の「百分の五」を基本 `⟨5,100⟩`、
  「超える部分…及び第七号…については、百分の十」を超過 `⟨10,100⟩` として転記。
  **分母 10000 の 10 倍過大解釈はしていない。**
- thresholdは「十六万二千五百円に…月数を乗じて計算した金額」をそのまま `162500 * months`。
- 丸めは `TaxRate.applyFloor`（切り捨て）。本条は「乗じて計算した金額」とし他方式を
  指定しないため共通 primitive を使用（政令の丸め細目は射程外）。
- `netAmount - threshold` は Nat 減算で saturating（超過が無ければ 0）。
- 2 つの `Bool` は税率区分の**選択にのみ**使用し、**金額式へは一切入れていない**
  （`if` の分岐のみ。Bool の数値化・乗算なし）。第七号が第三号・第六号より優先。
- Pinned evidence is in doc-comments only. 各定理はモデルの性質のみを主張し、
  実法律の意味・解釈の正しさを主張しない。

## 2. 転記監査に追加すべき check（JSON 断片）

`scripts/ci/transcription_audit.py` の `checks()` に追加する check の JSON 表現です
（`law_id` / `kind` / `title` / `needles` の 4 キー）。needle 文字列は一字も変えないこと。
**正規化・全角／半角変換・異体字変換を行わず、そのまま移してください。**
各 needle は正規化テキスト（`re.sub(r"[\s　]+", "", ...)`）上の連続部分そのもので、
U+3000 を含まず、長さ 63〜91 文字。担当範囲原文・pinned JSON の両方で
`.find() >= 0`（MISS 0 件）。

```json
{
  "law_id": "340AC0000000033",
  "kind": "file",
  "title": null,
  "needles": [
    "所得税の額は、公的年金等の金額から、次の各号に掲げる公的年金等の区分に応じ当該各号に定める金額を控除した残額に百分の五（第三号",
    "第三号又は第六号に掲げる公的年金等の当該残額が十六万二千五百円に当該公的年金等の金額に係る月数を乗じて計算した金額を超える場合におけるその超える部分の金額",
    "月数を乗じて計算した金額を超える場合におけるその超える部分の金額及び第七号に掲げる公的年金等の当該残額については、百分の十）の税率を乗じて計算した金額とする。",
    "当該公的年金等の月割額として政令で定める金額の百分の二十五に相当する金額に七万五千円を加算した金額と十万円とのいずれか多い金額",
    "当該申告書に当該公的年金等の受給者が障害者である旨の記載がある場合には、二万二千五百円（当該公的年金等の受給者が特別障害者である旨の記載がある場合には、三万五千円）",
    "当該申告書に当該公的年金等の受給者が寡婦である旨の記載がある場合には、二万二千五百円ニ当該申告書に当該公的年金等の受給者がひとり親である旨の記載がある場合には、三万円",
    "国家公務員共済組合法第七十四条第一号（退職等年金給付の種類）に掲げる退職年金その他の政令で定める公的年金等（以下この号及び第六号において「退職年金等」という。）の支払を受ける居住者で",
    "第三十五条第三項第三号（雑所得）に掲げる年金その他政令で定めるもの（第二百三条の六第一項において「確定給付企業年金等」という。）その公的年金等の金額の百分の二十五に相当する金額"
  ]
}
```

参考：現行スクリプト形式への変換例（name は任意、needles は上記 8 本を一字も変えずに列挙）:

```python
yield ("所得税法 art. 203の3（公的年金等の徴収税額: 百分の五／第三号・第六号の超過分・第七号は百分の十、十六万二千五百円×月数）↔ PublicPensionWithholding.lean",
       "340AC0000000033",
       "file", None,
       [ ...上記 needles 8 本を一字も変えずに列挙... ])
```

## 3. 検証結果（すべて本セッションで実行済み）

- `lake build JapanTaxLaw.PublicPensionWithholding JapanTaxLaw.PublicPensionWithholdingSpec JapanTaxLaw.PublicPensionWithholdingTests`
  → **成功（5 jobs、warning なし）**。※自作 3 モジュールのみビルド（全体ビルド／CI／
  `run_python_gates.py` は実行していません）。
- `python scripts/ci/check_no_sorry.py` →
  `no forbidden placeholder proofs found in tracked Lean sources`。
  （新規 3 ファイルは未追跡のため走査対象外ですが、同一ロジックで個別に確認し、
  `sorry` / `admit` が **0 件**であることを確認済み。）
- `#print axioms`（一時ファイルを approved temp dir に作成、`lake env lean` で実行後
  **削除済み**）:
  - `pensionWithholdingBasicRate` / `pensionWithholdingExcessRate` /
    `pensionExcessThresholdUnit` / `excessThreshold` / `pensionWithholdingTax` /
    `pensionWithholdingWithExcess` / `pensionWithholdingSeventh` /
    `pensionWithholdingByCategory` / `excessThreshold_mono` /
    `agreePensionWithholdingPoints` / `agreePensionWithholdingCategoryPoints`
    → **11 件すべて "does not depend on any axioms"**。
  - `pensionWithholdingTax_mono` → **`[propext]` のみ**（許可対象）。
  - **`Classical.choice` / `sorryAx` は 0 件**。
- 原文逐語検証（needle を `re.sub(r"[\s　]+", "", ...)` 正規化テキストに対して
  Python `.find()`）:
  - 担当範囲原文 `T1_income.txt`（正規化後 2,299 文字）: **8/8 FOUND、MISS 0 件**。
  - pinned JSON `law_full_text`（正規化後 1,095,718 文字。平坦化は
    `transcription_audit.py` と同一ロジック）: **8/8 FOUND、MISS 0 件**。
  - 全 needle で U+3000 なし・空白なし・長さ 63〜91 文字を確認。
  - 参考: 担当範囲原文の正規化文字列は pinned JSON 正規化文字列の
    offset 219886 から 2,299 文字すべて逐語一致。
  - 一時検証スクリプト・axiom probe はすべて削除済み（担当範囲原文は残置）。

### 逐語 FOUND / MISS 一覧（一字も変更せず）

| # | 区分 | len | 原文.find / JSON.find | 結果 |
| --- | --- | --- | --- | --- |
| 1 | 冒頭・控除後残額に百分の五 | 63 | 26 / 219912 | FOUND |
| 2 | 第三号・第六号の超過分（十六万二千五百円×月数） | 77 | 86 / 219972 | FOUND |
| 3 | 第七号は百分の十・税率を乗じて計算 | 79 | 131 / 220017 | FOUND |
| 4 | 第一号イ 月割額 25% + 7.5万 と 10万 の多い方 | 63 | 327 / 220213 | FOUND |
| 5 | 第一号ロ 障害者 22,500／特別障害者 35,000 | 82 | 391 / 220277 | FOUND |
| 6 | 第一号ハ 寡婦 22,500／ニ ひとり親 30,000 | 83 | 474 / 220360 | FOUND |
| 7 | 第三号 退職年金等の該当性（政令） | 91 | 1584 / 221470 | FOUND |
| 8 | 第七号 確定給付企業年金等・25% | 88 | 2211 / 222097 | FOUND |

**FOUND 8 / MISS 0**（両テキスト）。needle のアンカーを勝手に変更・正規化・
文字変換していません（`若しくは` / `に掲げる` 等も保持）。

## 4. README / PROGRESS に足す 1 行文案

CROSS_LAW の scan/pin 件数や監査 literal 総数はメインセッションが計算するため、ここでは書きません。

- **README.md**（所得税関連モジュール一覧の末尾付近に追加）:
  ```text
  JapanTaxLaw/PublicPensionWithholding.lean / -Spec.lean / -Tests.lean  # 所得税法 art. 203の3（公的年金等の徴収税額）: 百分の五／第三号・第六号の超過分・第七号は百分の十、threshold 162,500×月数、控除後残額・月数・区分は caller-established L4 モデル・独立定式・退行テスト
  ```
- **docs/PROGRESS.md**（L4 着手済みモジュール一覧の末尾に追記）:
  ```text
  所得税法 art. 203の3（PublicPensionWithholding.lean：公的年金等の徴収税額の 5%／超過分・第七号 10% と 162,500×月数の税率ロジックのみをモデル化、各号の控除額・政令月割額・該当性判定は caller-established／NOT MODELLED、他の条は NOT YET COVERED）
  ```

## 5. インテグレーターへの明示事項

**インテグレーターは `JapanTaxLaw.lean` に以下の 3 つの import を追加すること。**

```lean
import JapanTaxLaw.PublicPensionWithholding
import JapanTaxLaw.PublicPensionWithholdingSpec
import JapanTaxLaw.PublicPensionWithholdingTests
```

（他ワーカーの 3 件ずつと併せてメインが行数を確認してください。
PPW は `JapanTaxLaw.lean` を書き換えていません。他ワーカーのファイルには触れていません。）

## 6. NOT MODELLED の理由（スコープ境界）

政令依存のため本スライドでは**計算せず、外部確定（caller-established）の入力として受け取る**:

- **各号の控除額**: 政令で定める月割額の 25% + 7.5 万 と 10 万 の多い方、
  障害者 22,500／特別障害者 35,000、寡婦 22,500、ひとり親 30,000、
  源泉控除対象配偶者 32,500／老人控除対象配偶者 40,000、
  源泉控除対象親族 32,500／特定扶養親族・特定親族 52,500／老人扶養親族 40,000、
  同一生計配偶者・扶養親族の障害者 22,500／同居特別障害者 62,500／その他特別障害者 35,000。
  → 政令の月割額算定・各号の該当性判定は原文が「政令で定める」と委任しており、
  pinned 原文には数値が無い。**勝手な数値確定は逐語監査に通らないため非モデル化。**
- **第二号・第五号・第六号**の「政令で定める金額を控除した金額」— 同上。
- **第七号の 25%** を含む各号の控除額そのもの — 控除後残額 `netAmount` に吸収。
- **前条（art. 203の2）の徴収手続、復興特別所得税の附帯徴収、納付期限** — 本条の範囲外。

## 7. 範囲・残ブロッカーの正直な申告（最終報告）

- **build**: 自作 3 モジュールのみ `lake build` 成功（5 jobs / warning なし）。全体ビルド・CI・
  `run_python_gates.py` は未実行です。
- **axiom**: 走査 12 件、11 件が axiom-free、`pensionWithholdingTax_mono` のみ `[propext]`。
  `Classical.choice` / `sorryAx` なし。一時ファイルは削除済み。
- **逐語**: FOUND 8 / MISS 0（担当範囲原文・pinned JSON の両方、長さ 63〜91、U+3000 なし）。
- **def 数**: 実装 9（def 8 + structure 1）+ theorem 11 + Spec def 7 =
  **名前付き宣言 27**（＋ `by decide` example 48）。Tests は新規定理名なし。
- **STAGING**: 本ファイル `docs/STAGING_PPW.md` を作成済みです。
- これは **L4 のごく小さなスライド**です。**完成・網羅を主張しません**。
- 担当は **所得税法 art. 203の3（公的年金等の徴収税額）の税率ロジックのみ**。
  各号の控除額算定・政令月割額・該当性判定、他の条・他の税目は **NOT YET COVERED**。
- 転記監査は fidelity-only（原文 bytes との一致確認）であり、法的正しさを保証しません。
- **`agree*` は独立整数定式との `==` 一致確認であり、法的意味の等価証明ではありません。**
- **L7 候補 3,438 件は `LEGAL_REVIEW_PENDING` / unreviewed のまま**です
  （本スライドでは一切レビューしていません）。
- 残ブロッカー: 転記監査 check の `checks()` への組み込み（§2、+8 needles）、
  `JapanTaxLaw.lean` への import 追加（§5）、README / PROGRESS の 1 行追記（§4）、
  および全体ビルド・CI ゲートの実行は**すべてメインセッションの担当**です
  （PPW は実行していません）。
