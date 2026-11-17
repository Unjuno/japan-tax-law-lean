# STAGING — W-T（登録免許税法 別表第一（二）第十三号・第十四号＝特許権・実用新案権の手数料モデル）受け渡しメモ

> 実装担当 W-T からメインセッション（統合担当）への受け渡し用。
> ブランチ操作・add/commit/push/merge は一切していません。
> 書き換えたのは下記 4 ファイルのみです（他は読み取り専用）。

## 0. 対象ファイル

| ファイル | 状態 |
| --- | --- |
| `JapanTaxLaw/RegistryPatentFees.lean` | 新規 |
| `JapanTaxLaw/RegistryPatentFeesSpec.lean` | 新規 |
| `JapanTaxLaw/RegistryPatentFeesTests.lean` | 新規 |
| `docs/STAGING_WT.md` | 新規（本ファイル） |

pinned source: `data/raw/342AC0000000035_20261101_508AC0000000021.law.json`
law id `342AC0000000035` / revision `342AC0000000035_20261101_508AC0000000021`
amendment enforcement date `2026-11-01`。
担当範囲原文: `C:\Users\junny\AppData\Local\Temp\opencode\reg_ip_B.txt`（第十三号・第十四号、UTF-8、raw 1,132 文字／正規化 1,092 文字）。

Namespace note: 新規モジュールは dedicated sub-namespace
`JapanTaxLaw.RegistryPatentFees` を使用（`Money = Nat` は
`open JapanTaxLaw.TaxFinance` で参照）。他ワーカーの flat namespace と衝突しません。

**金額の一字照合（重要）**: 指示文の例示に「ロその他18000円」とありましたが、
pinned 原文は「その他の原因による移転の登録特许権の件数一件につき**一万五千円**」です。
**原文を一字も誤らず**一万五千円 = **¥15,000** を採用しました（18,000 ではありません）。
他もすべて日本語数字から Arabic に変換しています（三千円=3,000／九千円=9,000／
千五百円=1,500／千円=1,000／千分の四=4/1000／千分の二=2/1000）。

## 1. 追加した def 一覧

`namespace JapanTaxLaw.RegistryPatentFees`、`open JapanTaxLaw.TaxFinance`。
定額型は `Money := <額>` 定数、割合型は税率定数 `TaxRate ⟨X, 1000, by decide⟩`
と税額関数 `rate.applyFloor base`（= 課税標準 × X / 1000、切り捨て）としてモデル化しました。

### 1a. 十三 特許権の登録 — 定額定数（8 本）

| # | def 名 | 原文 | 額 |
| --- | --- | --- | --- |
| 1 | `patentTransferInheritanceOrMergerFee` | （一）イ 相続又は法人の合併「特许権の件数一件につき三千円」 | ¥3,000 |
| 2 | `patentTransferOtherFee` | （一）ロ その他「特许権の件数一件につき一万五千円」 | ¥15,000 |
| 3 | `patentExclusiveRightEstablishmentOrPreservationFee` | （二） 専用実施権の設定又は保存「一万五千円」 | ¥15,000 |
| 4 | `patentExclusiveRightOrPledgeTransferInheritanceOrMergerFee` | （四）イ 相続・合併「特许権等…千五百円」 | ¥1,500 |
| 5 | `patentExclusiveRightOrPledgeTransferOtherFee` | （四）ロ その他「特许権等の件数一件につき三千円」 | ¥3,000 |
| 6 | `patentNonPledgeTrustFee` | （五）ロ 質権以外の権利の信託「三千円」 | ¥3,000 |
| 7 | `patentMiscRegistrationFee` | （六） 付記・仮登録・回復・更正／変更「千円」 | ¥1,000 |
| 8 | `patentCancellationFee` | （七） 登録の抹消「千円」 | ¥1,000 |

### 1b. 十三 特許権の登録 — 割合型（税率定数 2 本 + 税額関数 2 本）

| # | def 名 | 原文 | 率 |
| --- | --- | --- | --- |
| 9 | `patentPledgeEstablishmentOrDispositionRestrictionRate` | （三） 質権の設定／処分の制限「債権金額千分の四」 | 4/1000 |
| 10 | `patentPledgeTrustRate` | （五）イ 質権の信託「債権金額千分の二」 | 2/1000 |

| # | 税額関数 | 算術 |
| --- | --- | --- |
| 11 | `patentPledgeEstablishmentOrDispositionRestrictionFee` | `…Rate.applyFloor base` |
| 12 | `patentPledgeTrustFee` | `…Rate.applyFloor base` |

### 1c. 十四 実用新案権の登録 — 定額定数（8 本）

| # | def 名 | 原文 | 額 |
| --- | --- | --- | --- |
| 13 | `utilityModelTransferInheritanceOrMergerFee` | （一）イ 相続・合併「実用新案権の件数一件につき三千円」 | ¥3,000 |
| 14 | `utilityModelTransferOtherFee` | （一）ロ その他「九千円」 | ¥9,000 |
| 15 | `utilityModelExclusiveRightEstablishmentOrPreservationFee` | （二） 専用実施権の設定又は保存「九千円」 | ¥9,000 |
| 16 | `utilityModelExclusiveRightOrPledgeTransferInheritanceOrMergerFee` | （四）イ 相続・合併「実用新案権等…千五百円」 | ¥1,500 |
| 17 | `utilityModelExclusiveRightOrPledgeTransferOtherFee` | （四）ロ その他「三千円」 | ¥3,000 |
| 18 | `utilityModelNonPledgeTrustFee` | （五）ロ 質権以外の権利の信託「三千円」 | ¥3,000 |
| 19 | `utilityModelMiscRegistrationFee` | （六） 付記・仮登録・回復・更正／変更「千円」 | ¥1,000 |
| 20 | `utilityModelCancellationFee` | （七） 登録の抹消「千円」 | ¥1,000 |

### 1d. 十四 実用新案権の登録 — 割合型（税率定数 2 本 + 税額関数 2 本）

| # | def 名 | 原文 | 率 |
| --- | --- | --- | --- |
| 21 | `utilityModelPledgeEstablishmentOrDispositionRestrictionRate` | （三） 質権の設定／処分の制限「債権金額千分の四」 | 4/1000 |
| 22 | `utilityModelPledgeTrustRate` | （五）イ 質権の信託「債権金額千分の二」 | 2/1000 |

| # | 税額関数 | 算術 |
| --- | --- | --- |
| 23 | `utilityModelPledgeEstablishmentOrDispositionRestrictionFee` | `…Rate.applyFloor base` |
| 24 | `utilityModelPledgeTrustFee` | `…Rate.applyFloor base` |

**合計: 実装 24 def** = 定額 16 + 税率定数 4 + 税額関数 4。

### 1e. 定理名（20 本、すべて axiom-free）

16 本の定額 positivity:
`patentTransferInheritanceOrMergerFee_pos` /
`patentTransferOtherFee_pos` /
`patentExclusiveRightEstablishmentOrPreservationFee_pos` /
`patentExclusiveRightOrPledgeTransferInheritanceOrMergerFee_pos` /
`patentExclusiveRightOrPledgeTransferOtherFee_pos` /
`patentNonPledgeTrustFee_pos` /
`patentMiscRegistrationFee_pos` /
`patentCancellationFee_pos` /
`utilityModelTransferInheritanceOrMergerFee_pos` /
`utilityModelTransferOtherFee_pos` /
`utilityModelExclusiveRightEstablishmentOrPreservationFee_pos` /
`utilityModelExclusiveRightOrPledgeTransferInheritanceOrMergerFee_pos` /
`utilityModelExclusiveRightOrPledgeTransferOtherFee_pos` /
`utilityModelNonPledgeTrustFee_pos` /
`utilityModelMiscRegistrationFee_pos` /
`utilityModelCancellationFee_pos`。

4 本の税率 well-definedness:
`patentPledgeEstablishmentOrDispositionRestrictionRate_den_pos` /
`patentPledgeTrustRate_den_pos` /
`utilityModelPledgeEstablishmentOrDispositionRestrictionRate_den_pos` /
`utilityModelPledgeTrustRate_den_pos`。

割合型は `base` が小さいと 0 になり得るため strict positivity は主張していません
（den_pos + smoke で代用）。単調性定理は意図的に含めていません（axiom を完全に
クリーンに保つため）。

### 1f. Spec モジュール（独立整数定式 20 + agree 1 = 21 def）

`specPatentTransferInheritanceOrMergerFee`(3_000) /
`specPatentTransferOtherFee`(15_000) /
`specPatentExclusiveRightEstablishmentOrPreservationFee`(15_000) /
`specPatentPledgeEstablishmentOrDispositionRestrictionFee`(`(base*4)/1000`) /
`specPatentExclusiveRightOrPledgeTransferInheritanceOrMergerFee`(1_500) /
`specPatentExclusiveRightOrPledgeTransferOtherFee`(3_000) /
`specPatentPledgeTrustFee`(`(base*2)/1000`) /
`specPatentNonPledgeTrustFee`(3_000) /
`specPatentMiscRegistrationFee`(1_000) /
`specPatentCancellationFee`(1_000) /
`specUtilityModelTransferInheritanceOrMergerFee`(3_000) /
`specUtilityModelTransferOtherFee`(9_000) /
`specUtilityModelExclusiveRightEstablishmentOrPreservationFee`(9_000) /
`specUtilityModelPledgeEstablishmentOrDispositionRestrictionFee`(`(base*4)/1000`) /
`specUtilityModelExclusiveRightOrPledgeTransferInheritanceOrMergerFee`(1_500) /
`specUtilityModelExclusiveRightOrPledgeTransferOtherFee`(3_000) /
`specUtilityModelPledgeTrustFee`(`(base*2)/1000`) /
`specUtilityModelNonPledgeTrustFee`(3_000) /
`specUtilityModelMiscRegistrationFee`(1_000) /
`specUtilityModelCancellationFee`(1_000) /
`agreeRegistryPatentFees`。

Spec は impl の `TaxRate.applyFloor` を再利用せず独立整数定式、
`agreeRegistryPatentFees` は 12 点グリッド `[0,1,99,100,249,250,999,1000,1001,12345,100000,1000000]`
の `==` 一致を `by decide` で確認（法的等価証明ではありません）。
各 def に kernel-decide smoke を付与済み。Tests は新規定理名なしの
`example := by decide` のみ（全定額・全 rate literal・端数境界 249/250/499/500/
999/1000/1001・12345・100_000・1_000_000 をカバー）。

**命名・意味上の注意（原文どおりの読み取り）**:
- 十三（二）の専用実施権には「仮専用実施権を含む。以下この号において同じ。）…除く。）」
  の但在書がありますが、金額は「専用実施権の件数一件につき一万五千円」で確定。
  該当性判定は caller-established とし Bool は式に入れていません。
- （三）／（五）イ の課税標準は「債権金額」です（件数ではありません）。
- （四）イ の「特许権等」は十三では「特许権又は専用実施権」、十四では
  「実用新案権又は専用実施権」を指する原文の定義を doc-comment に明記しています。
- 定額は「件数一件につき」の 1 件あたり定数。件数を掛ける Nat 掛け算は行いません。

## 2. 転記監査に追加すべき check（JSON 断片）

`scripts/ci/transcription_audit.py` の `checks()` に追加する check の JSON 表現です
（`law_id` / `kind` / `title` / `needles` の 4 キー）。needle 文字列は一字も変えないこと。
**文字正規化・全角／半角変換・異体字変換を行わず、そのまま移してください。**
各 needle は正規化テキスト（空白・全角空白除去）上の連続部分そのもので、
担当範囲原文・pinned JSON の両方で出現回数 1 です。下記配列は
`wt_needles.json` からプログラム生成して貼り付けたものです（手打ちなし）。

```json
{
  "law_id": "342AC0000000035",
  "kind": "file",
  "title": null,
  "needles": [
    "十三特許権の登録（特許権の信託の登録を含む。）（一）特許権の移転の登録イ相続又は法人の合併による移転の登録特許権の件数一件につき三千円ロその他の原因による移転の登録特許権の件数一件につき一万五千円",
    "（二）専用実施権（仮専用実施権を含む。以下この号において同じ。）の設定又は保存の登録（仮専用実施権に係る特許出願について特許権の設定の登録があつたことに伴い当該仮専用実施権の設定行為で定めた範囲内において受けるものを除く。）専用実施権の件数一件につき一万五千円",
    "（三）特許権若しくは専用実施権を目的とする質権の設定又は特許権、専用実施権若しくは当該質権の処分の制限の登録債権金額千分の四",
    "（四）専用実施権の移転又は特許権若しくは専用実施権を目的とする質権の移転の登録イ相続又は法人の合併による移転の登録特許権又は専用実施権（以下この号において「特許権等」という。）の件数一件につき千五百円ロその他の原因による移転の登録特許権等の件数一件につき三千円",
    "千五百円ロその他の原因による移転の登録特許権等の件数一件につき三千円（五）信託の登録イ質権の信託の登録債権金額千分の二ロ質権以外の権利の信託の登録特許権等の件数一件につき三千円（六）",
    "（六）付記登録、仮登録、抹消した登録の回復の登録又は登録の更正若しくは変更の登録（これらの登録のうち（一）から（五）までに掲げるものを除く。）特許権等の件数一件につき千円（七）登録の抹消特許権等の件数一件につき千円",
    "十四実用新案権の登録（実用新案権の信託の登録を含む。）（一）実用新案権の移転の登録イ相続又は法人の合併による移転の登録実用新案権の件数一件につき三千円ロその他の原因による移転の登録実用新案権の件数一件につき九千円（二）",
    "（二）専用実施権の設定又は保存の登録専用実施権の件数一件につき九千円（三）実用新案権若しくは専用実施権を目的とする質権の設定又は実用新案権、専用実施権若しくは当該質権の処分の制限の登録債権金額千分の四（四）",
    "質権の移転の登録イ相続又は法人の合併による移転の登録実用新案権又は専用実施権（以下この号において「実用新案権等」という。）の件数一件につき千五百円ロその他の原因による移転の登録実用新案権等の件数一件につき三千円（五）",
    "千五百円ロその他の原因による移転の登録実用新案権等の件数一件につき三千円（五）信託の登録イ質権の信託の登録債権金額千分の二ロ質権以外の権利の信託の登録実用新案権等の件数一件につき三千円（六）",
    "（六）付記登録、仮登録、抹消した登録の回復の登録又は登録の更正若しくは変更の登録（これらの登録のうち（一）から（五）までに掲げるものを除く。）実用新案権等の件数一件につき千円（七）登録の抹消実用新案権等の件数一件につき千円"
  ]
}
```

参考：現行スクリプト形式への変換例（name は任意、needles は上記 11 本を一字も変えずに列挙）:

```python
yield ("登録免許税法 別表第一（二）第十三号・第十四号（特許権・実用新案権）↔ RegistryPatentFees.lean",
       "342AC0000000035",
       "file", None,
       [ ...上記 needles 11 本を一字も変えずに列挙... ])
```

## 3. 検証結果（すべて本セッションで実行済み）

- `lake build JapanTaxLaw.RegistryPatentFees JapanTaxLaw.RegistryPatentFeesSpec JapanTaxLaw.RegistryPatentFeesTests`
  → **成功（5 jobs、warning なし）**。※自作 3 モジュールのみビルド（全体ビルド／CI／
  `run_python_gates.py` は実行していません）。
- `python scripts/ci/check_no_sorry.py` →
  `no forbidden placeholder proofs found in tracked Lean sources`。
  （新規 3 ファイルは未追跡のため走査対象外ですが、人力でも `sorry` / `admit` はありません。）
- `#print axioms`（一時ファイル `WTAxiomProbe.lean` を approved temp dir に作成、
  `lake env lean` で実行、**exit 0**、実行後に削除済み）:
  - 走査 21 件（20 定理 + `agreeRegistryPatentFees`）。
  - `Classical.choice` / `sorryAx` / `propext` は **いずれも 0 件**。
  - 21 件すべて `does not depend on any axioms`（完全に axiom-free）。
- 原文逐語検証（needle を正規化テキストに対して Python `.find()`、出現回数も確認）:
  - 担当範囲原文 `reg_ip_B.txt`（正規化後 1,092 文字）:
    **11/11 FOUND、MISS 0 件**、各出現回数 1。
  - pinned JSON `law_full_text`（正規化後 211,508 文字）:
    **11/11 FOUND、MISS 0 件**、各出現回数 1。
  - 参考: 原文 1,092 文字全体が pinned JSON 正規化テキストの offset 128525 に
    連続部分として存在（= 原文が pinned JSON の逐語スライスであることを確認）。

### 逐語 FOUND / MISS 一覧（一字も変更せず）

| # | 区分 | 結果(原文) | art@ | count | len | 結果(JSON) | json@ | count |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| N1 | 十三（一）（イ・ロ） | FOUND | 0 | 1 | 98 | FOUND | 128525 | 1 |
| N2 | 十三（二） 専用実施権 | FOUND | 98 | 1 | 130 | FOUND | 128623 | 1 |
| N3 | 十三（三） 質権 4/1000 | FOUND | 228 | 1 | 62 | FOUND | 128753 | 1 |
| N4 | 十三（四） イ・ロ | FOUND | 290 | 1 | 130 | FOUND | 128815 | 1 |
| N5 | 十三（四）ロ〜（五） | FOUND | 386 | 1 | 91 | FOUND | 128911 | 1 |
| N6 | 十三（六）（七） | FOUND | 474 | 1 | 107 | FOUND | 128999 | 1 |
| N7 | 十四（一）（イ・ロ） | FOUND | 581 | 1 | 109 | FOUND | 129106 | 1 |
| N8 | 十四（二）（三） | FOUND | 687 | 1 | 103 | FOUND | 129212 | 1 |
| N9 | 十四（四） イ・ロ | FOUND | 820 | 1 | 108 | FOUND | 129345 | 1 |
| N10 | 十四（四）ロ〜（五） | FOUND | 889 | 1 | 95 | FOUND | 129414 | 1 |
| N11 | 十四（六）（七） | FOUND | 981 | 1 | 111 | FOUND | 129506 | 1 |

**FOUND 11 / MISS 0**（両テキストで出現回数 1、一意）。needle の長さは 62〜130 文字。
アンカーの勝手な変更・正規化・文字変換はしていません。各 needle は担当範囲原文の
当該区分（および隣接区分の開始）から一字も変えず抽出しています。

## 4. README / PROGRESS に足す 1 行文案

CROSS_LAW の scan/pin 件数や監査 literal 総数はメインセッションが計算するため、ここでは書きません。

- **README.md**（モジュール一覧・`RegistryRealEstateFeesP1*` 行の直後に追加）:
  ```text
  JapanTaxLaw/RegistryPatentFees.lean       # 登録免許税法 別表第一（二）第十三号・第十四号（特許権・実用新案権）の登録手数料（移転3,000/15,000/9,000・専用実施権15,000/9,000・質権設定4/1000・質権信託2/1000・特许権等1,500/3,000・信託3,000・付記等1,000・抹消1,000）L4 モデル
  JapanTaxLaw/RegistryPatentFeesSpec.lean   # 同上 独立整数定式
  JapanTaxLaw/RegistryPatentFeesTests.lean  # 同上 退行テスト
  ```
- **docs/PROGRESS.md**（L4 着手済みモジュール一覧の末尾に追記）:
  ```text
  登録免許税法 別表第一（二）第十三号・第十四号（特許権・実用新案権、件数一件あたり定額＋質権設定4/1000・質権信託2/1000、課税標準は caller-established、丸めは切り捨て — RegistryPatentFees.lean）
  ```

## 5. インテグレーターへの明示事項

**インテグレーターは `JapanTaxLaw.lean` に以下の 3 つの import を追加すること。**

```lean
import JapanTaxLaw.RegistryPatentFees
import JapanTaxLaw.RegistryPatentFeesSpec
import JapanTaxLaw.RegistryPatentFeesTests
```

（W-A〜W-S の各 3 件と併せてメインが行数を確認してください。
W-T は `JapanTaxLaw.lean` を書き換えていません。他ワーカーのファイルには触れていません。）

## 6. 範囲・残ブロッカーの正直な申告（最終報告）

- **build**: 自作 3 モジュールのみ `lake build` 成功（5 jobs / warning なし）。全体ビルド・CI・
  `run_python_gates.py` は未実行です。
- **axiom**: 走査 21 件、`Classical.choice` / `sorryAx` / `propext` なし（全件 axiom-free）。
  一時ファイルは削除済み。
- **逐語**: FOUND 11 / MISS 0（担当範囲原文・pinned JSON の両方、出現回数 1、長さ 62〜130）。
- **def 数**: 実装 24 def + 20 定理 = 44 本、Spec 21 def = 21 本（合計 65 本の名前付き宣言）。
  Tests は新規定理名なしの `example := by decide` のみ。
- **STAGING**: 本ファイル `docs/STAGING_WT.md` を作成済みです。
- これは別表第一（二）の第十三号・第十四号に限る **小さなスライス**です。
  **完成・網羅を主張しません**。
- 担当は第十三号・第十四号のみ。別表第一（二）の他の号、
  および登録免許税法全体（免税・軽減規定、納税義務者、税率の特例、他の別表）は
  **NOT YET COVERED / 非モデル化** です。
- 登録件数・課税標準（債権金額）は caller-established な入力です。その算定、
  登録の該当性判定（相続／合併／その他、質権／質権以外等）、件数掛け算、
  端数処理の詳細（通則法含む）は非モデル化です。
- 十三（二）の仮専用実施権に係る但在書、各号の定義規定（「特许権等」「実用新案権等」）、
  および（六）の「（一）から（五）までに掲げるものを除く。」の除外判定は原文どおり
  doc-comment に記録していますが、適用判定ロジックはモデル化していません（caller-established）。
- `agreeRegistryPatentFees` は有限点の `==` 一致確認であり、法的意味の等価証明ではありません。
- 転記監査は fidelity-only（原文 bytes との一致確認）であり、法的正しさを保証しません。
- **L7 候補 3,438 件は unreviewed のまま**です（本スライスでは一切レビューしていません）。
- 残ブロッカー: 転記監査 check の `checks()` への組み込み（§2、+11 needles）、
  `JapanTaxLaw.lean` への import 追加（§5）、README / PROGRESS の 1 行追記（§4）、
  および全体ビルド・CI ゲートの実行は**すべてメインセッションの担当**です
  （W-T は実行していません）。
