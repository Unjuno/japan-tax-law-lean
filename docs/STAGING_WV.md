# STAGING — W-V（登録免許税法 別表第一（二）二「船舶の登記」の手数料モデル）受け渡しメモ

> 実装担当 W-V からメインセッション（統合担当）への受け渡し用。
> ブランチ操作・add/commit/push/merge は一切していません。
> 書き換えたのは下記 4 ファイルのみです（他は読み取り専用）。

## 0. 対象ファイル

| ファイル | 状態 |
| --- | --- |
| `JapanTaxLaw/RegistryShipFees.lean` | 新規 |
| `JapanTaxLaw/RegistryShipFeesSpec.lean` | 新規 |
| `JapanTaxLaw/RegistryShipFeesTests.lean` | 新規 |
| `docs/STAGING_WV.md` | 新規（本ファイル） |

pinned source: `data/raw/342AC0000000035_20261101_508AC0000000021.law.json`
law id `342AC0000000035` / revision `342AC0000000035_20261101_508AC0000000021`
amendment enforcement date `2026-11-01`。
担当範囲原文: `reg_prop_A.txt`（冒頭の前区分末尾を除き「二　船舶の登記」〜
「三　航空機の登録」手前、正規化前 742 文字／正規化後 710 文字、UTF-8、temp）。

Namespace note:  dedicated sub-namespace `JapanTaxLaw.RegistryShipFees` を使用
（`Money = Nat` は `open JapanTaxLaw.TaxFinance` で参照）。他ワーカー
（W-W / W-X ほか、既存 `Registry*` モジュール）と衝突しません。

### 担当範囲の確定（原文一字どおり）

原文（正規化テキスト、710 文字）の全fee string を確認し、以下のように転記しました
（簡体字・digit 誤りに注意して日本語数字を Arabic に変換）:

| 区分 | 原文 fee string | モデル値 |
| --- | --- | --- |
| （一） | 船舶の価額千分の四 | 4/1000 |
| （二）イ | 船舶の価額千分の四 | 4/1000 |
| （二）ロ | 船舶の価額千分の二十 | 20/1000 |
| （二）ハ | 船舶の価額千分の二十八 | 28/1000 |
| （三） | 船舶の価額千分の四 | 4/1000 |
| （四） | 船舶の価額千分の一・五 | 15/10000 (=1.5/1000) |
| （五） | 債権金額又は極度金額千分の四 | 4/1000 |
| （六）イ | 債権金額又は極度金額千分の一 | 1/1000 |
| （六）ロ | 債権金額又は極度金額千分の二 | 2/1000 |
| （七） | 一部譲渡又は分割後の共有者の数で極度金額を除して計算した金額千分の二 | 2/1000 |
| （八） | 抵当権の件数一件につき千円 | ¥1,000/件 |
| （九） | 賃借権及び抵当権の件数一件につき千円 | ¥1,000/件 |
| （十）イ | 船舶の価額千分の四 | 4/1000 |
| （十）ロ | 債権金額又は極度金額千分の二 | 2/1000 |
| （十）ハ | 船舶の価額千分の一・五 | 15/10000 |
| （十一）イ | 船舶の価額千分の四 | 4/1000 |
| （十一）ロ | 船舶の隻数一隻につき二千円 | ¥2,000/隻 |
| （十二） | 船舶の隻数一隻につき千円 | ¥1,000/隻 |
| （十三） | 船舶の隻数一隻につき千円 | ¥1,000/隻 |

「千分の一・五」は分子分母を Nat で表すため `⟨15, 10000, by decide⟩` としました
（1.5/1000 = 15/10000）。「二十八」= 28、「二十」= 20 の digit 誤りはありません。

## 1. 追加した def 一覧

`namespace JapanTaxLaw.RegistryShipFees`、`open JapanTaxLaw.TaxFinance`。
割合型は税率定数 `TaxRate ⟨X, 分母, by decide⟩` と税額関数 `rate.applyFloor base`
（= 課税標準 × X / 分母、切り捨て）、定額型は `Money` 定数（1 隻／1 件あたり）です。
隻数・件数を掛ける Nat 掛け算は行わず、課税標準・隻数・件数・該当性は
caller-established です。Bool は金額計算式に入れていません。

### 1a. 割合型の税率定数（14 本）

| # | def 名 | 原文区分 | 率（num/den） |
| --- | --- | --- | --- |
| 1 | `shipOwnershipPreservationRate` | （一） | 4/1000 |
| 2 | `shipOwnershipTransferInheritanceOrMergerRate` | （二）イ | 4/1000 |
| 3 | `shipOwnershipTransferGratuitousRate` | （二）ロ | 20/1000 |
| 4 | `shipOwnershipTransferOtherRate` | （二）ハ | 28/1000 |
| 5 | `shipAbandonmentRate` | （三） | 4/1000 |
| 6 | `shipLeaseholdRate` | （四） | 15/10000 |
| 7 | `shipMortgageSecurityRate` | （五） | 4/1000 |
| 8 | `shipMortgageTransferInheritanceOrMergerRate` | （六）イ | 1/1000 |
| 9 | `shipMortgageTransferOtherRate` | （六）ロ | 2/1000 |
| 10 | `shipSweepMortgagePartialTransferOrDivisionRate` | （七） | 2/1000 |
| 11 | `shipOwnershipTrustRate` | （十）イ | 4/1000 |
| 12 | `shipMortgageTrustRate` | （十）ロ | 2/1000 |
| 13 | `shipOtherRightTrustRate` | （十）ハ | 15/10000 |
| 14 | `shipOwnershipTransferProvisionalRate` | （十一）イ | 4/1000 |

### 1b. 定額型 `Money` 定数（5 本、1 隻／1 件あたり）

| # | def 名 | 原文区分 | 額 |
| --- | --- | --- | --- |
| 15 | `shipMortgageRankChangeFeePerCase` | （八） | 1,000 |
| 16 | `shipLeaseholdPriorityConsentFeePerCase` | （九） | 1,000 |
| 17 | `shipOtherProvisionalFeePerVessel` | （十一）ロ | 2,000 |
| 18 | `shipSupplementaryRegistrationFeePerVessel` | （十二） | 1,000 |
| 19 | `shipCancellationFeePerVessel` | （十三） | 1,000 |

### 1c. 割合型の税額関数（14 本、`(base : Money) → Money`）

`shipOwnershipPreservationFee` / `shipOwnershipTransferInheritanceOrMergerFee` /
`shipOwnershipTransferGratuitousFee` / `shipOwnershipTransferOtherFee` /
`shipAbandonmentFee` / `shipLeaseholdFee` / `shipMortgageSecurityFee` /
`shipMortgageTransferInheritanceOrMergerFee` / `shipMortgageTransferOtherFee` /
`shipSweepMortgagePartialTransferOrDivisionFee` / `shipOwnershipTrustFee` /
`shipMortgageTrustFee` / `shipOtherRightTrustFee` /
`shipOwnershipTransferProvisionalFee`。

### 1d. 定理名（20 本、すべて axiom-free または propext のみ）

14 本の税率分母正性: `shipOwnershipPreservationRate_den_pos` /
`shipOwnershipTransferInheritanceOrMergerRate_den_pos` /
`shipOwnershipTransferGratuitousRate_den_pos` /
`shipOwnershipTransferOtherRate_den_pos` / `shipAbandonmentRate_den_pos` /
`shipLeaseholdRate_den_pos` / `shipMortgageSecurityRate_den_pos` /
`shipMortgageTransferInheritanceOrMergerRate_den_pos` /
`shipMortgageTransferOtherRate_den_pos` /
`shipSweepMortgagePartialTransferOrDivisionRate_den_pos` /
`shipOwnershipTrustRate_den_pos` / `shipMortgageTrustRate_den_pos` /
`shipOtherRightTrustRate_den_pos` /
`shipOwnershipTransferProvisionalRate_den_pos`。

5 本の定額正性: `shipMortgageRankChangeFeePerCase_pos` /
`shipLeaseholdPriorityConsentFeePerCase_pos` /
`shipOtherProvisionalFeePerVessel_pos` /
`shipSupplementaryRegistrationFeePerVessel_pos` /
`shipCancellationFeePerVessel_pos`。

単調性 `rateFee_mono`（`propext` 依存、許容範囲）。

### 1e. Spec / Tests

Spec モジュール: 独立整数定式 14 本（`specShip*Fee`, `(base : Nat) : Nat`、
`(base * X) / 分母`）＋ 定額 5 本（`specShip*FeePerCase` / `specShip*FeePerVessel`）＋
一致確認 `agreeRegistryShipFees : Bool`（14 基底グリッドの `==` 一致を `by decide` で確認）。
Spec は impl の `TaxRate.applyFloor` を再利用していません。
Tests モジュール: kernel-decide smoke のみ（新規定理名なし、0・端数境界
249/250/666/667/999/1000/1001・12,345・1,000,000 をカバー）。

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
    "二船舶の登記（船舶の信託の登記を含む。）（一）所有権の保存の登記船舶の価額千分の四（二）所有権の移転の登記イ相続又は法人の合併による移転の登記船舶の価額千分の四ロ遺贈、贈与その他無償名義による移転の登記船舶の価額千分の二十ハその他の原因による移転の登記船舶の価",
    "償名義による移転の登記船舶の価額千分の二十ハその他の原因による移転の登記船舶の価額千分の二十八（三）委付の登記船舶の価額千分の四（四）賃借権の設定、転貸又は移転の登記船舶の価額千分の一・五（五）抵当権の設定、強制競売若しくは競売に係る差押え、仮差押え、仮処分又",
    "の一・五（五）抵当権の設定、強制競売若しくは競売に係る差押え、仮差押え、仮処分又は抵当付債権の差押えその他権利の処分の制限の登記債権金額又は極度金額千分の四（六）抵当権の移転の登記イ相続又は法人の合併による移転の登記債権金額又は極度金額千分の一ロその他の原因に",
    "による移転の登記一部譲渡又は分割後の共有者の数で極度金額を除して計算した金額千分の二（八）抵当権の順位の変更の登記抵当権の件数一件につき千円（九）賃借権の先順位抵当権に優先する同意の登記賃借権及び抵当権の件数一件につき千円（十）信託の登記イ所有権の信託の登記船",
    "の登記賃借権及び抵当権の件数一件につき千円（十）信託の登記イ所有権の信託の登記船舶の価額千分の四ロ抵当権の信託の登記債権金額又は極度金額千分の二ハその他の権利の信託の登記船舶の価額千分の一・五（十一）仮登記イ所有権の移転の仮登記又は所有権の移転請求権の保全のた",
    "千分の一・五（十一）仮登記イ所有権の移転の仮登記又は所有権の移転請求権の保全のための仮登記船舶の価額千分の四ロその他の仮登記船舶の隻数一隻につき二千円（十二）付記登記、抹消された登記の回復の登記又は登記事項の更正若しくは変更の登記（これらの登記のうち（一）から",
    "記の回復の登記又は登記事項の更正若しくは変更の登記（これらの登記のうち（一）から（十一）までに掲げるものを除く。）船舶の隻数一隻につき千円（十三）登記の抹消船舶の隻数一隻につき千円"
  ]
}
```

参考：現行スクリプト形式への変換例（name は任意、needles は上記 7 本を一字も変えずに列挙）:

```python
yield ("登録免許税法 別表第一（二）二（船舶の登記）↔ RegistryShipFees.lean",
       "342AC0000000035",
       "file", None,
       [ ...上記 needles 7 本を一字も変えずに列挙... ])
```

## 3. 検証結果（すべて本セッションで実行済み）

- `lake build JapanTaxLaw.RegistryShipFees JapanTaxLaw.RegistryShipFeesSpec JapanTaxLaw.RegistryShipFeesTests`
  → **成功（5 jobs、warning なし）**。※自作 3 モジュールのみビルド（全体ビルド／CI／
  `run_python_gates.py` は実行していません）。
- `python scripts/ci/check_no_sorry.py` →
  `no forbidden placeholder proofs found in tracked Lean sources`。
  （新規 3 ファイルは未追跡のため走査対象外ですが、人力でも `sorry` / `admit` はありません。）
- `#print axioms`（一時ファイル `WVAxiomProbe.lean` を approved temp dir に作成、
  `lake env lean` で実行後 **削除済み**）:
  - 21 件（19 positivity / well-definedness + `rateFee_mono` + `agreeRegistryShipFees`）を走査。
  - `Classical.choice` / `sorryAx` は **0 件**。
  - `rateFee_mono` のみ `propext` に依存（`simp` 由来）。**`propext` は許容**のため問題なし。
  - 他 20 件は `does not depend on any axioms`。
- 原文逐語検証（needle を正規化テキストに対して Python `.find()`、出現回数も確認、
  `transcription_audit.py` の `_norm` / `contains` と同一条件）:
  - 担当範囲原文 `reg_prop_A.txt` の「二　船舶の登記」〜「三　航空機の登録」手前
    （正規化後 710 文字）: **7/7 FOUND、MISS 0 件**、各出現回数 1。
  - pinned JSON `law_full_text`（正規化後 211,508 文字）:
    **7/7 FOUND、MISS 0 件**、各出現回数 1。
  - さらに担当範囲 710 文字全体を pinned JSON 正規化テキストに対して `.find()`
    → offset **121782** に **1 回だけ**出現（セクション全体の逐語一致を確認）。

### 逐語 FOUND / MISS 一覧（一字も変更せず）

| # | 区分（おおよそ） | len | 結果(原文) | src@ | count | 結果(JSON) | json@ | count |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| N1 | 見出し・（一）〜（二）ハ | 130 | FOUND | 0 | 1 | FOUND | 121782 | 1 |
| N2 | （二）ロ〜（五）途中 | 130 | FOUND | 90 | 1 | FOUND | 121872 | 1 |
| N3 | （四）末尾〜（六）ロ途中 | 130 | FOUND | 180 | 1 | FOUND | 121962 | 1 |
| N4 | （七）途中〜（十）イ | 130 | FOUND | 350 | 1 | FOUND | 122132 | 1 |
| N5 | （九）末尾〜（十一）イ途中 | 130 | FOUND | 440 | 1 | FOUND | 122222 | 1 |
| N6 | （十）ハ〜（十二）途中 | 130 | FOUND | 530 | 1 | FOUND | 122312 | 1 |
| N7 | （十二）〜（十三）末尾 | 90 | FOUND | 620 | 1 | FOUND | 122402 | 1 |

**FOUND 7 / MISS 0**（両テキストで出現回数 1、一意）。needle の長さは 90〜130 文字
（指定の 60〜130 の範囲内）。needle は担当範囲原文の正規化文字列から
オフセット指定で一字も変えず抽出し、その後 pinned JSON に対して `.find()` しました。
アンカーの勝手な変更・正規化・文字変換はしていません。

なお原文オフセット 310〜349（（六）ロ末尾〜（七）根抵当権の一部）は、不動産の登記
区分（一）および航空機の登録区分（三）と文言が同一で、60〜130 文字の範囲では
pinned JSON 上で一意な needle を構成できません。この 40 文字は上記の
「担当範囲 710 文字全体が JSON に 1 回だけ出現する」という確認で逐語を担保しています
（needle を勝手に延長したり文字を変えたりはしていません）。

## 4. README / PROGRESS に足す 1 行文案

CROSS_LAW の scan/pin 件数や監査 literal 総数はメインセッションが計算するため、ここでは書きません。

- **README.md**（モジュール一覧・`RegistryRealEstateFees*` / `RegistryDesignTrademarkFees*` 行の付近に追加）:
  ```text
  JapanTaxLaw/RegistryShipFees.lean       # 登録免許税法 別表第一（二）二 船舶の登記（所有権4/20/28・委付4・賃借権1.5・抵当権4/1/2・根抵当2・信託4/2/1.5・仮登記4/2000円・付記/抹消1000円、価額・債権金額・隻数・件数は caller-established、丸めは切り捨て）L4 モデル
  JapanTaxLaw/RegistryShipFeesSpec.lean   # 同上 独立整数定式
  JapanTaxLaw/RegistryShipFeesTests.lean  # 同上 退行テスト
  ```
- **docs/PROGRESS.md**（L4 着手済みモジュール一覧の末尾に追記）:
  ```text
  登録免許税法 別表第一（二）二 船舶の登記（RegistryShipFees.lean：14 割合型（船舶の価額 4/20/28/1.5・債権金額又は極度金額 4/1/2・共有者数除算額 2・千分の一・五は 15/10000）＋5 定額型（順位変更1000・優先同意1000・他仮登記2000・付記1000・抹消1000、単位は隻/件）、課税標準・隻数・件数・該当性は caller-established）
  ```

## 5. インテグレーターへの明示事項

**インテグレーターは `JapanTaxLaw.lean` に以下の 3 つの import を追加すること。**

```lean
import JapanTaxLaw.RegistryShipFees
import JapanTaxLaw.RegistryShipFeesSpec
import JapanTaxLaw.RegistryShipFeesTests
```

（W-W / W-X を含む他ワーカーの 3 件ずつと併せてメインが行数を確認してください。
W-V は `JapanTaxLaw.lean` を書き換えていません。他ワーカーのファイルには触れていません。）

## 6. 範囲・残ブロッカーの正直な申告（最終報告）

- **build**: 自作 3 モジュールのみ `lake build` 成功（5 jobs / warning なし）。全体ビルド・CI・
  `run_python_gates.py` は未実行です。
- **axiom**: 走査 21 件、`Classical.choice` / `sorryAx` なし。1 件が `propext` 依存
  （許容範囲）。一時ファイルは削除済み。
- **逐語**: FOUND 7 / MISS 0（担当範囲原文・pinned JSON の両方、出現回数 1、長さ 90〜130）、
  加えて担当範囲 710 文字全体が JSON に 1 回だけ出現。
- **def 数**: 実装 33 def（14 税率 + 5 定額 + 14 税額関数）+ 20 定理 =
  53 本、Spec 20 def（14 独立定式 + 5 定額 + agree 1）、
  Tests は新規定理名なしの `example := by decide` のみ。名前付き宣言の合計は **73 本**。
- **STAGING**: 本ファイル `docs/STAGING_WV.md` を作成済みです。
- これは別表第一（二）の二 船舶の登記に限る **小さなスライス**です。
  **完成・網羅を主張しません**。
- 別表第一（二）の他の区分（例: 三 航空機の登録 ほか）、他の号、登録免許税法全体
  （免税・軽減規定、納税義務者、税率の特例、他の別表）は **NOT YET COVERED / 非モデル化** です。
- 課税標準（「船舶の価額」「債権金額又は極度金額」、根抵当権の「共有者の数で
  極度金額を除して計算した金額」）・隻数・件数・登記の該当性・原因判定は
  caller-established な入力です。その算定・評価、除算、隻数・件数掛け算、端数処理の
  詳細（通則法含む）は非モデル化です。
- `agreeRegistryShipFees` は有限点（14 基底）の `==` 一致確認であり、法的意味の
  等価証明ではありません。
- 転記監査は fidelity-only（原文 bytes との一致確認）であり、法的正しさを保証しません。
- **L7 候補 3,438 件は unreviewed のまま**です（本スライスでは一切レビューしていません）。
- 残ブロッカー: 転記監査 check の `checks()` への組み込み（§2、+7 needles）、
  `JapanTaxLaw.lean` への import 追加（§5）、README / PROGRESS の 1 行追記（§4）、
  および全体ビルド・CI ゲートの実行は**すべてメインセッションの担当**です
  （W-V は実行していません）。
