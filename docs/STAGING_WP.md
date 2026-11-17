# STAGING — W-P（登録免許税法 別表第一（一）の区分（一）〜（五）の手数料モデル）受け渡しメモ

> 実装担当 W-P からメインセッション（統合担当）への受け渡し用。
> ブランチ操作・add/commit/push/merge は一切していません。
> 書き換えたのは下記 4 ファイルのみです（他は読み取り専用）。

## 0. 対象ファイル

| ファイル | 状態 |
| --- | --- |
| `JapanTaxLaw/RegistryRealEstateFeesP1A.lean` | 新規 |
| `JapanTaxLaw/RegistryRealEstateFeesP1ASpec.lean` | 新規 |
| `JapanTaxLaw/RegistryRealEstateFeesP1ATests.lean` | 新規 |
| `docs/STAGING_WP.md` | 新規（本ファイル） |

pinned source: `data/raw/342AC0000000035_20261101_508AC0000000021.law.json`
law id `342AC0000000035` / revision `342AC0000000035_20261101_508AC0000000021`
amendment enforcement date `2026-11-01`。
担当範囲原文: `registry_app1_1_A.txt`（区分（一）〜（五）、正規化済み・UTF-8、temp）。

Namespace note: 新規モジュールは dedicated sub-namespace
`JapanTaxLaw.RegistryRealEstateFeesP1A` を使用（`Money = Nat` は
`open JapanTaxLaw.TaxFinance` で参照）。他ワーカーの flat namespace と衝突しません。

## 1. 追加した def 一覧

`namespace JapanTaxLaw.RegistryRealEstateFeesP1A`、`open JapanTaxLaw.TaxFinance`。
割合型は税率定数 `TaxRate ⟨X, 1000, by decide⟩` と税額関数 `rate.applyFloor base`
（= 課税標準 × X / 1000、切り捨て）、定額型は `Money` 定数としてモデル化しました。

### 1a. 税率定数（分母すべて 1000）

| # | def 名 | 原文 | 率 |
| --- | --- | --- | --- |
| 1 | `ownershipPreservationRate` | （一） 所有権の保存の登記「不動産の価額千分の四」 | 4/1000 |
| 2 | `ownershipTransferInheritanceOrMergerRate` | （二）イ 相続又は法人の合併による移転「千分の四」 | 4/1000 |
| 3 | `ownershipTransferCoOwnershipDivisionRate` | （二）ロ 共有物の分割による移転「千分の四」 | 4/1000 |
| 4 | `ownershipTransferOtherRate` | （二）ハ その他の原因による移転「千分の二十」 | 20/1000 |
| 5 | `restrictedRealRightEstablishmentOrSubleaseRate` | （三）イ 設定又は転貸「千分の十」 | 10/1000 |
| 6 | `restrictedRealRightInheritanceOrMergerRate` | （三）ロ 相続・合併による移転「千分の二」 | 2/1000 |
| 7 | `restrictedRealRightCoOwnershipDivisionRate` | （三）ハ 共有に係る権利の分割「千分の二」 | 2/1000 |
| 8 | `restrictedRealRightOtherRate` | （三）ニ その他の原因による移転「千分の十」 | 10/1000 |
| 9 | `spousalResidenceRightRate` | （三の二） 配偶者居住権の設定「千分の二」 | 2/1000 |
| 10 | `securityRegistrationRate` | （五） 担保権設定・競売・差押え等「千分の四」 | 4/1000 |

### 1b. 定額定数

| # | def 名 | 原文 | 額 |
| --- | --- | --- | --- |
| 11 | `easementEstablishmentFeePerParcel` | （四） 地役権の設定「一個につき千五百円」 | ¥1,500 / 個 |

### 1c. 税額関数（割合型、`(base : Money) → Money`）

| # | def 名 | 算術 |
| --- | --- | --- |
| 12 | `ownershipPreservationFee` | `ownershipPreservationRate.applyFloor base` |
| 13 | `ownershipTransferInheritanceOrMergerFee` | 同 4/1000 |
| 14 | `ownershipTransferCoOwnershipDivisionFee` | 同 4/1000 |
| 15 | `ownershipTransferOtherFee` | 同 20/1000 |
| 16 | `restrictedRealRightEstablishmentOrSubleaseFee` | 同 10/1000 |
| 17 | `restrictedRealRightInheritanceOrMergerFee` | 同 2/1000 |
| 18 | `restrictedRealRightCoOwnershipDivisionFee` | 同 2/1000 |
| 19 | `restrictedRealRightOtherFee` | 同 10/1000 |
| 20 | `spousalResidenceRightFee` | 同 2/1000 |
| 21 | `securityRegistrationFee` | 同 4/1000（課税標準は債権金額・極度金額・予算金額） |

### 1d. 定理名（12 本、すべて axiom-free または propext のみ）

11 本の positivity/well-definedness:
`ownershipPreservationRate_den_pos` /
`ownershipTransferInheritanceOrMergerRate_den_pos` /
`ownershipTransferCoOwnershipDivisionRate_den_pos` /
`ownershipTransferOtherRate_den_pos` /
`restrictedRealRightEstablishmentOrSubleaseRate_den_pos` /
`restrictedRealRightInheritanceOrMergerRate_den_pos` /
`restrictedRealRightCoOwnershipDivisionRate_den_pos` /
`restrictedRealRightOtherRate_den_pos` /
`spousalResidenceRightRate_den_pos` /
`securityRegistrationRate_den_pos` /
`easementEstablishmentFeePerParcel_pos`。
および単調性 `rateFee_mono`（`propext` 依存、許容範囲）。

### 1e. Spec モジュール（独立整数定式 11 + agree 1）

`specOwnershipPreservationFee` / `specOwnershipTransferInheritanceOrMergerFee` /
`specOwnershipTransferCoOwnershipDivisionFee` / `specOwnershipTransferOtherFee` /
`specRestrictedRealRightEstablishmentOrSubleaseFee` /
`specRestrictedRealRightInheritanceOrMergerFee` /
`specRestrictedRealRightCoOwnershipDivisionFee` /
`specRestrictedRealRightOtherFee` / `specSpousalResidenceRightFee` /
`specSecurityRegistrationFee`（以上 `(base : Nat) : Nat = (base * X) / 1000`）/
`specEasementEstablishmentFeePerParcel`（= 1_500）/ `agreeRegistryRealEstateFeesP1A`。

各 def に smoke を付与済み。Spec は impl の `TaxRate.applyFloor` を再利用せず独立整数定式、
`agreeRegistryRealEstateFeesP1A` は 12 点グリッドの `==` 一致を `by decide` で確認。
Tests は kernel-decide smoke のみ（新規定理名なし、0・端数境界 249/250/999/1000/1001・
12345・1_000_000 をカバー）。

**命名上の注意（原文どおりの読み取り）**: （五）の課税標準は「債権金額、極度金額又は
不動産工事費用の予算金額」であり「不動産の価額」ではありません。`base` という共通
パラメータ名を使っていますが、doc-comment で（五）のみ別の課税標準であることを明記しています。
（四）は「承役地の不動産の個数一個につき」なので 1 個あたりの定数のみを与え、
個数を掛ける Nat 掛け算は行いません（個数は caller-established）。

## 2. 転記監査に追加すべき check（JSON 断片）

`scripts/ci/transcription_audit.py` の `checks()` に追加する check の JSON 表現です
（`law_id` / `kind` / `title` / `needles` の 4 キー）。needle 文字列は一字も変えないこと。
**文字正規化・全角／半角変換・異体字変換を行わず、そのまま移してください。**
各 needle は正規化テキスト（空白・全角空白除去）上の連続部分そのもので、
担当範囲原文・pinned JSON の両方で出現回数 1 です。

```json
{
  "law_id": "342AC0000000035",
  "kind": "file",
  "title": null,
  "needles": [
    "（一）所有権の保存の登記不動産の価額千分の四（二）所有権の移転の登記イ相続又は法人の合併による移転の登記不動産の価額千分の四",
    "（二）所有権の移転の登記イ相続又は法人の合併による移転の登記不動産の価額千分の四ロ共有物の分割による移転の登記不動産の価額千分の四",
    "ロ共有物の分割による移転の登記不動産の価額千分の四ハその他の原因による移転の登記不動産の価額千分の二十（三）地上権、永小作権、賃借権又は採石権",
    "ハその他の原因による移転の登記不動産の価額千分の二十（三）地上権、永小作権、賃借権又は採石権の設定、転貸又は移転の登記イ設定又は転貸の登記",
    "（三）地上権、永小作権、賃借権又は採石権の設定、転貸又は移転の登記イ設定又は転貸の登記不動産の価額千分の十ロ相続又は法人の合併による移転の登記不動産の価額千分の二",
    "ロ相続又は法人の合併による移転の登記不動産の価額千分の二ハ共有に係る権利の分割による移転の登記不動産の価額千分の二ニその他の原因による移転の登記",
    "ハ共有に係る権利の分割による移転の登記不動産の価額千分の二ニその他の原因による移転の登記不動産の価額千分の十（三の二）配偶者居住権の設定の登記不動産の価額千分の二",
    "ニその他の原因による移転の登記不動産の価額千分の十（三の二）配偶者居住権の設定の登記不動産の価額千分の二（四）地役権の設定の登記",
    "（三の二）配偶者居住権の設定の登記不動産の価額千分の二（四）地役権の設定の登記承役地の不動産の個数一個につき千五百円（五）先取特権の保存",
    "（四）地役権の設定の登記承役地の不動産の個数一個につき千五百円（五）先取特権の保存、質権若しくは抵当権の設定、強制競売、担保不動産競売（その例による競売を含む。以下単に「競売」という。）、",
    "（五）先取特権の保存、質権若しくは抵当権の設定、強制競売、担保不動産競売（その例による競売を含む。以下単に「競売」という。）、強制管理若しくは担保不動産収益執行に係る差押え"
  ]
}
```

参考：現行スクリプト形式への変換例（name は任意、needles は上記 11 本を一字も変えずに列挙）:

```python
yield ("登録免許税法 別表第一（一）区分（一）〜（五）↔ RegistryRealEstateFeesP1A.lean",
       "342AC0000000035",
       "file", None,
       [ ...上記 needles 11 本を一字も変えずに列挙... ])
```

## 3. 検証結果（すべて本セッションで実行済み）

- `lake build JapanTaxLaw.RegistryRealEstateFeesP1A JapanTaxLaw.RegistryRealEstateFeesP1ASpec JapanTaxLaw.RegistryRealEstateFeesP1ATests`
  → **成功（5 jobs、warning なし）**。※自作 3 モジュールのみビルド（全体ビルド／CI／
  `run_python_gates.py` は実行していません）。
- `python scripts/ci/check_no_sorry.py` →
  `no forbidden placeholder proofs found in tracked Lean sources`。
  （新規 3 ファイルは未追跡のため走査対象外ですが、人力でも `sorry` / `admit` はありません。）
- `#print axioms`（一時ファイル `WPAxiomProbe.lean` を approved temp dir に作成、
  `lake env lean` で実行後 **削除済み**）:
  - 13 件（11 positivity + `rateFee_mono` + `agreeRegistryRealEstateFeesP1A`）を走査。
  - `Classical.choice` / `sorryAx` は **0 件**。
  - `rateFee_mono` のみ `propext` に依存（`simp` 由来）。**`propext` は許容**のため問題なし。
  - 他 12 件は `does not depend on any axioms`。
- 原文逐語検証（needle を正規化テキストに対して Python `.find()`、出現回数も確認）:
  - 担当範囲原文 `registry_app1_1_A.txt`（正規化後 453 文字）:
    **11/11 FOUND、MISS 0 件**、各出現回数 1。
  - pinned JSON `law_full_text`（正規化後 211,508 文字）:
    **11/11 FOUND、MISS 0 件**、各出現回数 1。

### 逐語 FOUND / MISS 一覧（一字も変更せず）

| # | 区分 | 結果(原文) | art@ | count | len | 結果(JSON) | json@ | count |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| N1 | （一）所有権の保存 | FOUND | 0 | 1 | 62 | FOUND | 119824 | 1 |
| N2 | （二）イ 相続・合併 | FOUND | 22 | 1 | 65 | FOUND | 119846 | 1 |
| N3 | （二）ロ 共有分割 | FOUND | 62 | 1 | 71 | FOUND | 119886 | 1 |
| N4 | （二）ハ その他 | FOUND | 87 | 1 | 69 | FOUND | 119911 | 1 |
| N5 | （三）イ 設定・転貸 | FOUND | 113 | 1 | 81 | FOUND | 119937 | 1 |
| N6 | （三）ロ 相続・合併 | FOUND | 166 | 1 | 72 | FOUND | 119990 | 1 |
| N7 | （三）ハ 共有分割 | FOUND | 194 | 1 | 81 | FOUND | 120018 | 1 |
| N8 | （三）ニ その他 | FOUND | 223 | 1 | 64 | FOUND | 120047 | 1 |
| N9 | （三の二）配偶者居住権 | FOUND | 248 | 1 | 68 | FOUND | 120072 | 1 |
| N10 | （四）地役権設定 | FOUND | 275 | 1 | 94 | FOUND | 120099 | 1 |
| N11 | （五）担保権設定等 | FOUND | 306 | 1 | 86 | FOUND | 120130 | 1 |

**FOUND 11 / MISS 0**（両テキストで出現回数 1、一意）。needle の長さは 62〜94 文字。
アンカーの勝手な変更・正規化・文字変換はしていません。各 needle は担当範囲原文の
当該区分（および隣接区分の開始）から一字も変えず抽出しています。

## 4. README / PROGRESS に足す 1 行文案

CROSS_LAW の scan/pin 件数や監査 literal 総数はメインセッションが計算するため、ここでは書きません。

- **README.md**（モジュール一覧・`RegistrationQualificationFees*` 行の直後に追加）:
  ```text
  JapanTaxLaw/RegistryRealEstateFeesP1A.lean       # 登録免許税法 別表第一（一）区分（一）〜（五）（所有権保存4/1000・移転4/20/1000・地上権等10/2/1000・配偶者居住権2/1000・地役権¥1,500/個・担保権設定等4/1000）L4 モデル
  JapanTaxLaw/RegistryRealEstateFeesP1ASpec.lean   # 同上 独立整数定式
  JapanTaxLaw/RegistryRealEstateFeesP1ATests.lean  # 同上 退行テスト
  ```
- **docs/PROGRESS.md**（L4 着手済みモジュール一覧の末尾に追記）:
  ```text
  登録免許税法 別表第一（一）区分（一）〜（五）（所有権保存4/1000・移転4/20/1000・地上権等10/2/1000・配偶者居住権2/1000・地役権¥1,500/個・担保権設定等4/1000、課税標準は caller-established、丸めは切り捨て — RegistryRealEstateFeesP1A.lean）
  ```

## 5. インテグレーターへの明示事項

**インテグレーターは `JapanTaxLaw.lean` に以下の 3 つの import を追加すること。**

```lean
import JapanTaxLaw.RegistryRealEstateFeesP1A
import JapanTaxLaw.RegistryRealEstateFeesP1ASpec
import JapanTaxLaw.RegistryRealEstateFeesP1ATests
```

（W-A〜W-O の各 3 件と併せてメインが行数を確認してください。
W-P は `JapanTaxLaw.lean` を書き換えていません。他ワーカーのファイルには触れていません。）

## 6. 範囲・残ブロッカーの正直な申告（最終報告）

- **build**: 自作 3 モジュールのみ `lake build` 成功（5 jobs / warning なし）。全体ビルド・CI・
  `run_python_gates.py` は未実行です。
- **axiom**: 走査 13 件、`Classical.choice` / `sorryAx` なし。1 件が `propext` 依存
  （許容範囲）。一時ファイルは削除済み。
- **逐語**: FOUND 11 / MISS 0（担当範囲原文・pinned JSON の両方、出現回数 1、長さ 62〜94）。
- **def 数**: 実装 21 def + 12 定理 = 33 本、Spec 11 def + agree 1 = 12 本
  （合計 45 本の名前付き宣言）。Tests は新規定理名なしの `example := by decide` のみ。
- **STAGING**: 本ファイル `docs/STAGING_WP.md` を作成済みです。
- これは別表第一（一）の区分（一）〜（五）に限る **小さなスライス**です。
  **完成・網羅を主張しません**。
- 担当は区分（一）〜（五）のみ。別表第一（一）の他の区分・他の号、および
  登録免許税法全体（免税・軽減規定、納税義務者、税率の特例、他の別表）は
  **NOT YET COVERED / 非モデル化** です。
- 課税標準（不動産の価額、債権金額・極度金額・不動産工事費用の予算金額）は
  caller-established な入力です。その算定・評価、登記の該当性判定、
  「承役地の不動産の個数」の数え方、個数掛け算、端数処理の詳細（通則法含む）は
  非モデル化です。
- `agreeRegistryRealEstateFeesP1A` は有限点の `==` 一致確認であり、法的意味の
  等価証明ではありません。
- 転記監査は fidelity-only（原文 bytes との一致確認）であり、法的正しさを保証しません。
- **L7 候補 3,438 件は unreviewed のまま**です（本スライスでは一切レビューしていません）。
- 残ブロッカー: 転記監査 check の `checks()` への組み込み（§2、+11 needles）、
  `JapanTaxLaw.lean` への import 追加（§5）、README / PROGRESS の 1 行追記（§4）、
  および全体ビルド・CI ゲートの実行は**すべてメインセッションの担当**です
  （W-P は実行していません）。
