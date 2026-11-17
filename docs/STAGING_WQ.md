# STAGING — W-Q（登録免許税法 別表第一（一）の区分（六）〜（十）の手数料モデル）受け渡しメモ

> 実装担当 W-Q からメインセッション（統合担当）への受け渡し用。
> ブランチ操作・add/commit/push/merge は一切していません。
> 書き換えたのは下記 4 ファイルのみです（他は読み取り専用）。

## 0. 対象ファイル

| ファイル | 状態 |
| --- | --- |
| `JapanTaxLaw/RegistryRealEstateFeesP1B.lean` | 新規 |
| `JapanTaxLaw/RegistryRealEstateFeesP1BSpec.lean` | 新規 |
| `JapanTaxLaw/RegistryRealEstateFeesP1BTests.lean` | 新規 |
| `docs/STAGING_WQ.md` | 新規（本ファイル） |

pinned source: `data/raw/342AC0000000035_20261101_508AC0000000021.law.json`
law id `342AC0000000035` / revision `342AC0000000035_20261101_508AC0000000021`
amendment enforcement date `2026-11-01`（既存 `RegistrationTax*` / `RegistrationQualificationFees*` と同一ピン）。
担当範囲原文: `registry_app1_1_B.txt`（UTF-8・正規化済み、区分（六）〜（十）、310 bytes / 正規化 296 文字）。

Namespace note: 新規モジュールは dedicated namespace
`JapanTaxLaw.RegistryRealEstateFeesP1B` を使用しています。既存の `RegistrationTax.lean` は
flat namespace `JapanTaxLaw` に（六）（十）の一部を含むため、衝突を避けるためです。
`open JapanTaxLaw.TaxFinance` のみ（`Money = Nat`）。

## 1. 追加した def 一覧

`namespace JapanTaxLaw.RegistryRealEstateFeesP1B`、`open JapanTaxLaw.TaxFinance`。

### 実装（`RegistryRealEstateFeesP1B.lean`）: def 16 本

| # | def 名 | 型 / 意味 |
| --- | --- | --- |
| 1 | `milleTransferInheritanceOrMerger` | `Money := 1` —（六）イ 相続・法人の合併 千分の一 |
| 2 | `milleTransferOther` | `Money := 2` —（六）ロ その他 千分の二 |
| 3 | `milleRootMortgagePartialTransfer` | `Money := 2` —（七）千分の二 |
| 4 | `milleTrustOwnership` | `Money := 4` —（十）イ 千分の四 |
| 5 | `milleTrustSecurity` | `Money := 2` —（十）ロ 千分の二 |
| 6 | `milleTrustOtherRights` | `Money := 2` —（十）ハ 千分の二 |
| 7 | `flatFeePerCase` | `Money := 1_000` —（八）（九）一件につき千円 |
| 8 | `transferInheritanceOrMergerFee` | `(base : Money) → Money` = `base * 1 / 1000` |
| 9 | `transferOtherFee` | `(base : Money) → Money` = `base * 2 / 1000` |
| 10 | `rootMortgagePartialTransferFee` | `(base : Money) → Money` = `base * 2 / 1000`（`base` は共有者数で除した後の金額） |
| 11 | `trustOwnershipFee` | `(base : Money) → Money` = `base * 4 / 1000` |
| 12 | `trustSecurityFee` | `(base : Money) → Money` = `base * 2 / 1000` |
| 13 | `trustOtherRightsFee` | `(base : Money) → Money` = `base * 2 / 1000` |
| 14 | `mortgageRankChangeFee` | `(cases : Money) → Money` = `cases * 1_000` —（八） |
| 15 | `leaseholdPriorityConsentFee` | `(cases : Money) → Money` = `cases * 1_000` —（九） |
| 16 | `registryFee` | `(RegistryFeeKind → Money → Money → Money)` — 全 8 区分の统一的な税額関数（flat は `base` を無視、割合型は `cases` を無視） |

補助: `inductive RegistryFeeKind`（8  constructors、Sep なし）。定理 10 本:
`*_pos` 7 本（税率定数・定額の正性、`by decide`）、
`rateFee_mono` / `registryFee_mono_base` / `registryFee_mono_cases`（単調性、
`Nat.div_le_div_right` / `Nat.mul_le_mul_right` ベース、`simp` 不使用）。

### Spec（`RegistryRealEstateFeesP1BSpec.lean`）: def 13 本

| # | def 名 | 型 / 意味 |
| --- | --- | --- |
| 17 | `specTransferInheritanceOrMergerFee` | `(Nat) → Nat` = `TaxRate ⟨1,1000,_⟩.applyFloor`（独立経路） |
| 18 | `specTransferOtherFee` | 同上 `2/1000` |
| 19 | `specRootMortgagePartialTransferFee` | 同上 `2/1000` |
| 20 | `specTrustOwnershipFee` | 同上 `4/1000` |
| 21 | `specTrustSecurityFee` | 同上 `2/1000` |
| 22 | `specTrustOtherRightsFee` | 同上 `2/1000` |
| 23 | `specFlatFeePerCase` | `Nat := 1_000`（impl 定数を参照しないリテラル） |
| 24 | `specMortgageRankChangeFee` | `(Nat) → Nat` = `cases * 1_000` |
| 25 | `specLeaseholdPriorityConsentFee` | `(Nat) → Nat` = `cases * 1_000` |
| 26 | `agreeRateFeesP1B` | `Bool` — 割合型 6 区分 × 8 課税標準点（0 / 999 / 1000 / 1001 含む） |
| 27 | `agreeFlatFeesP1B` | `Bool` — 定額型 2 区分 × 6 件数点 |
| 28 | `agreeRegistryFeeP1B` | `Bool` — `registryFee` 全 8 区分 × 3×3 点 |
| 29 | `agreeRegistryRealEstateFeesP1B` | `Bool` — 26〜28 の AND |

**合計 def 数: 29 本**（実装 16 + Spec 13）。`agree*` はすべて `by decide` で
`= true` を検証済み（有限点の一致確認であり、法的等価の証明ではありません）。
Tests は新規定理名なしの `example := by decide` のみ（全 8 区分・端点・
flat の `base` 非依存／割合型の `cases` 非依存をカバー）。

### 原文どおりの読み取り

- （六）イ: 「相続又は法人の合併による移転の登記 債権金額又は極度金額千分の一」→ `1/1000`、
  ロ: 「その他の原因による移転の登記 … 千分の二」→ `2/1000`。
- （七）: 「根抵当権の一部譲渡又は法人の分割による移転の登記 一部譲渡又は分割後の
  共有者の数で極度金額を除して計算した金額千分の二」→ `2/1000`。割り算はあるが、
  **入力 `base` を「除した後の金額」として caller-established** にしました
  （doc-comment 明記）。共有者数・極度金額・割り算の丸めは非モデル化。
- （八）: 「抵当権の順位の変更の登記 抵当権の件数 一件につき千円」、
  （九）: 「賃借権の先順位抵当権に優先する同意の登記 賃借権及び抵当権の件数 一件につき千円」
  → いずれも定額 `1_000` × 件数。
- （十）イ: 「所有権の信託の登記 不動産の価額千分の四」→ `4/1000`、
  ロ: 「先取特権、質権又は抵当権の信託の登記 債権金額又は極度金額千分の二」→ `2/1000`、
  ハ: 「その他の権利の信託の登記 不動産の価額千分の二」→ `2/1000`。

## 2. 転記監査に追加すべき check（JSON 断片）

`scripts/ci/transcription_audit.py` の `checks()` に追加する check の JSON 表現です
（`law_id` / `kind` / `title` / `needles` の 4 キー）。needle 文字列は一字も変えないこと。
**文字正規化・全角／半角変換・異体字変換を行わず、そのまま移してください。**
各 needle は正規化テキスト（空白・全角空白除去）上の連続部分そのもので、
担当範囲原文・pinned JSON の両方で出現回数 1 です（後述 §3）。
pinned JSON には船舶の平行表があり短い needle は重複するため、各 needle を
「先取特権、質権又は…」（= 不動産表のみ）または「…不動産の価額千分の四」まで
延長して一意化しています。

```json
{
  "law_id": "342AC0000000035",
  "kind": "file",
  "title": null,
  "needles": [
    "先取特権、質権又は抵当権の移転の登記イ相続又は法人の合併による移転の登記債権金額又は極度金額千分の一ロその他の原因による移転の登記債権金額又は極度金額千分の二（七）根抵当権の一部譲渡",
    "一部譲渡又は分割後の共有者の数で極度金額を除して計算した金額千分の二（八）抵当権の順位の変更の登記抵当権の件数一件につき千円（九）賃借権の先順位抵当権に優先する同意の登記賃借権及び抵当権の件数一件につき千円（十）信託の登記イ所有権の信託の登記不動産の価額千分",
    "（十）信託の登記イ所有権の信託の登記不動産の価額千分の四ロ先取特権、質権又は抵当権の信託の登記債権金額又は極度金額千分の二ハその他の権利の信託の登記不動産の価額千分の二"
  ]
}
```

参考：現行スクリプト形式への変換例（name は任意、needles は上記 3 本をそのまま使用）:

```python
yield ("登録免許税法 別表第一（一）（六）〜（十）↔ RegistryRealEstateFeesP1B.lean",
       "342AC0000000035",
       "file", None,
       [ ...上記 needles 3 本を一字も変えずに列挙... ])
```

## 3. 検証結果（すべて本セッションで実行済み）

- `lake build JapanTaxLaw.RegistryRealEstateFeesP1B JapanTaxLaw.RegistryRealEstateFeesP1BSpec JapanTaxLaw.RegistryRealEstateFeesP1BTests`
  → **成功（5 jobs、warning なし）**。※自作 3 モジュールのみビルド（全体ビルド／CI／
  `run_python_gates.py` は実行していません）。
- `python scripts/ci/check_no_sorry.py` →
  `no forbidden placeholder proofs found in tracked Lean sources`。
  （新規 3 ファイルは未追跡のため走査対象外ですが、人力でも `sorry` / `admit` はありません。）
- `#print axioms`（一時ファイル `WQAxiomProbe.lean` を approved temp dir に作成、
  `lake env lean` で実行後 **削除済み**）:
  - 7 本の `*_pos` + `rateFee_mono` / `registryFee_mono_base` / `registryFee_mono_cases`
    + `agree*` 4 本の計 **14 件**を走査。
  - `Classical.choice` / `sorryAx` / `Quot.sound` は **0 件**。
  - `rateFee_mono` と `registryFee_mono_base` のみ `propext` に依存（`Nat.div_le_div_right`
    由来）。**`propext` は許容**のため問題なし。他 12 件は
    `does not depend on any axioms`。
  - 当初 `simp [registryFee]` を用いた単調性証明に `Quot.sound` が入ったため、
    `Nat.le_refl 0` による直接証明に置き換えて除去済み。
- 原文逐語検証（needle を正規化テキストに対して Python `.find()`）:
  - 担当範囲原文 `registry_app1_1_B.txt`（正規化後 296 文字）:
    **3/3 FOUND、MISS 0 件**、各出現回数 1。
  - pinned JSON `law_full_text`（正規化後 211,508 文字）:
    **3/3 FOUND、MISS 0 件**、各出現回数 1。

### 逐語 FOUND / MISS 一覧（一字も変更せず）

| # | 区分 | 結果(原文) | 原文 idx | count | len | 結果(JSON) | json idx | count |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| N1 | （六）イ/ロ +（七）見出し | FOUND | 3 | 1 | 91 | FOUND | 120280 | 1 |
| N2 | （七）課税標準 +（八）（九）+（十）イ | FOUND | 109 | 1 | 129 | FOUND | 120386 | 1 |
| N3 | （十）ロ/ハ | FOUND | 212 | 1 | 84 | FOUND | 120489 | 1 |

**FOUND 3 / MISS 0**（両テキストで出現回数 1、一意）。needle の長さは 84〜129 文字
（60〜130 文字程度の指定内）。アンカーの勝手な変更・正規化・文字変換はしていません。

## 4. README / PROGRESS に足す 1 行文案

CROSS_LAW の scan/pin 件数や監査 literal 総数はメインセッションが計算するため、ここでは書きません。

- **README.md**（モジュール一覧・`RegistrationTax*` 行の直後に追加）:
  ```text
  JapanTaxLaw/RegistryRealEstateFeesP1B.lean      # 登録免許税法 別表第一（一）（六）〜（十）（抵当権等移転・根抵当権一部譲渡・順位変更・賃借権先順位同意・信託）L4 手数料モデル
  JapanTaxLaw/RegistryRealEstateFeesP1BSpec.lean  # 同上 独立整数定式（TaxRate.applyFloor 経由）・agree 有限グリッド一致
  JapanTaxLaw/RegistryRealEstateFeesP1BTests.lean # 同上 kernel-decide smoke
  ```
- **docs/PROGRESS.md**（L4 着手済みモジュール一覧の末尾に追記）:
  ```text
  登録免許税法 別表第一（一）（六）〜（十）（抵当権等の移転 1/1000・2/1000／根抵当権一部譲渡 2/1000／抵当権順位変更・賃借権先順位同意 一件千円／信託 4/1000・2/1000・2/1000、課税標準・件数は caller-established — RegistryRealEstateFeesP1B.lean）
  ```

## 5. インテグレーターへの明示事項

**インテグレーターは `JapanTaxLaw.lean` に以下の 3 つの import を追加すること。**

```lean
import JapanTaxLaw.RegistryRealEstateFeesP1B
import JapanTaxLaw.RegistryRealEstateFeesP1BSpec
import JapanTaxLaw.RegistryRealEstateFeesP1BTests
```

（W-A〜W-P, W-R の各 3 件と併せてメインが行数を確認してください。
W-Q は `JapanTaxLaw.lean` を書き換えていません。他ワーカーのファイルには触れていません。）

## 6. 範囲・残ブロッカーの正直な申告（最終報告）

- **build**: 自作 3 モジュールのみ `lake build` 成功（5 jobs / warning なし）。全体ビルド・CI・
  `run_python_gates.py` は未実行です。
- **axiom**: 走査 14 件、`Classical.choice` / `sorryAx` / `Quot.sound` なし。2 件が
  `propext` 依存（許容範囲）。一時ファイルは削除済み。
- **逐語**: FOUND 3 / MISS 0（担当範囲原文・pinned JSON の両方、出現回数 1、長さ 84〜129）。
- **def 数**: 実装 16 + Spec 13 = **29 本**（另有 `RegistryFeeKind` 型 1 本、定理 10 本）。
  Tests は新規定理名なしの `example := by decide` のみ。
- **STAGING**: 本ファイル `docs/STAGING_WQ.md` を作成済みです。
- これは **L4 のごく小さなスライス**です。**完成・網羅を主張しません**。
- 担当は 別表第一（一）の **区分（六）〜（十）のみ**です。（一）〜（五）・（十一）以降、
  船舶以下の表、商業登記以下の号は NOT YET COVERED。
- 課税標準（債権金額／極度金額／不動産の価額／件数）は caller-established な入力です。
  区分の該当性・金額の認定・共有者数での除算・価額の算定は非モデル化。
  通則法 art. 15 / 18 / 19 の最低課税標準・複数登記の合計・最低税額、art. 118/119 の
  端数処理も本スライスの対象外です。
- `agree*` は有限点の `==` 一致確認であり、法的意味の等価証明ではありません。
- 転記監査は fidelity-only（原文 bytes との一致確認）であり、法的正しさを保証しません。
- **L7 候補 3,438 件は unreviewed のまま**です（本スライスでは一切レビューしていません）。
- 残ブロッカー: 転記監査 check の `checks()` への組み込み（§2、+3 needles）、
  `JapanTaxLaw.lean` への import 追加（§5）、README / PROGRESS の 1 行追記（§4）、
  および全体ビルド・CI ゲートの実行は**すべてメインセッションの担当**です
  （W-Q は実行していません）。
