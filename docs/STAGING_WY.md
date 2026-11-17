# STAGING — W-Y（登録免許税法 別表第一（二）十九〜二十二の二・鉱業権系手数料 L4 モデル）受け渡しメモ

> 実装担当 W-Y からメインセッション（統合担当）への受け渡し用。
> ブランチ操作・add/commit/push/merge は一切していません。
> 書き換えたのは下記 4 ファイルのみです（他は読み取り専用）。

## 0. 対象ファイル / pinned source

| ファイル | 状態 |
| --- | --- |
| `JapanTaxLaw/RegistryMiningFees.lean` | 新規 |
| `JapanTaxLaw/RegistryMiningFeesSpec.lean` | 新規 |
| `JapanTaxLaw/RegistryMiningFeesTests.lean` | 新規 |
| `docs/STAGING_WY.md` | 新規（本ファイル） |

pinned source: `data/raw/342AC0000000035_20261101_508AC0000000021.law.json`
law id `342AC0000000035` / revision `342AC0000000035_20261101_508AC0000000021`
amendment enforcement date `2026-11-01`（RegistrationTax / RegistryCopyrightFees /
RegistryPropertyRightsFees / RegistryShipFees / RegistryCorporateSecurityFees 各モジュールと同一ピン）。
担当範囲原文: `C:\Users\junny\AppData\Local\Temp\opencode\reg_rem_A.txt`
（十九 鉱業権又は租鉱権 〜 二十二の二 試掘権又は貯留権、UTF-8、raw 4,550 文字 /
正規化後 4,248 文字。冒頭の育成者権の末尾は前区分のため対象外。二十二の二（十三）は
原文が文中で途切れており fee string は W-Z モデル化済み（重複回避）ため対象外）。

Namespace: `JapanTaxLaw.RegistryMiningFees`（専用サブ名前空間。
`JapanTaxLaw` 直下の `realEstateMilleRate`（RegistrationTax.lean）や
`RegistryPropertyRightsFees` / `RegistryShipFees` / `RegistryCorporateSecurityFees` と衝突しません）。
`open JapanTaxLaw.TaxFinance`（`Money = Nat`、`TaxRate`、`applyFloor`）。

## 1. 追加した宣言一覧

原文を一字も誤らず読み、金額・率を確定（日本語数字 → Arabic、全 99 件をスクリプトで
元原文の fee 文言との一致および Japanese→Arabic 変換値との一致を検証済み）:

- **割合型 9 件**（税率定数 `TaxRate` + 税額関数 `base.applyFloor` =
  課税標準 × num / den、切り捨て）。**すべて整数千分率で分母 1000**:
  - 千分の四 → `⟨4, 1000⟩`: 十九（十三）、二十（九）、二十二（十）、二十二の二（七）
  - 千分の二 → `⟨2, 1000⟩`: 十九（十八）イ、二十（十四）イ、二十二（十四）イ、二十二の二（十二）イ
  - 千分の一 → `⟨1, 1000⟩`: 二十一（一） 新規登録（損害賠償の支払金額）
- **面積型 `Money` 定数 14 件**（十万平方メートル 1 単位あたり。面積の単位換算は caller-established）:
  - 二十（一）4,500 / （二）イ 3,000 / （五）450 / （六）イ 300
  - 二十二（一）300 / （三）イ 30 / （三）ロ 150 / （五）2,400 / （六）240 /
    （八）イ 240 / （八）ロ 1,200 / （十二）イ 60 / （十二）ロ 120 / （十四）ロ 120
- **定額型 `Money` 定数 76 件**（一件／一個／一区画あたり。件数掛けは行わない）:
  - 十九 29 件（3,000〜180,000）、二十 18 件（1,000〜13,500）、二十一 2 件（1,000）、
    二十二 9 件（20,000〜240,000）、二十二の二 18 件（3,000〜180,000）

**小数点率（千分の二・五＝25/10000 等）は本担当範囲に存在しません。**
分母を 10000 と誤る 10 倍過大の過去バグ（W-X で coordinator 修正済み）を避け、
すべての率定数で `num`/`den` を smoke により厳重に検証しています。
原文の率・金額文字列は各 doc-comment に一字も変えず保持しています。

| ファイル | def | theorem | example |
| --- | --- | --- | --- |
| `RegistryMiningFees.lean` | 108（税率 9 + 税額関数 9 + 面積 14 + 定額 76） | 100（率分母正性 9 + 定数正性 90 + 単調性 1） | 126 |
| `RegistryMiningFeesSpec.lean` | 100（独立税額定式 9 + 独立定数定式 90 + agree 1） | 0 | 100 |
| `RegistryMiningFeesTests.lean` | 0 | 0 | 334 |

**名前付き宣言総数 308（実装 def 108 + theorem 100 + Spec def 100）。**

### 実装 def 一覧（`.lean`）

税率定数 `TaxRate`（分母 1000）9 本 + 対応する税額関数 `Money → Money` 9 本:
- `miningMortgageEstablishment` = `⟨4, 1000⟩`（十九（十三） 債権金額又は極度金額千分の四）→ 税額関数 `miningMortgageEstablishmentFee`
- `miningMortgageTrust` = `⟨2, 1000⟩`（十九（十八）イ 債権金額又は極度金額千分の二）→ 税額関数 `miningMortgageTrustFee`
- `placerMortgageEstablishment` = `⟨4, 1000⟩`（二十（九） 債権金額又は極度金額千分の四）→ 税額関数 `placerMortgageEstablishmentFee`
- `placerMortgageTrust` = `⟨2, 1000⟩`（二十（十四）イ 債権金額又は極度金額千分の二）→ 税額関数 `placerMortgageTrustFee`
- `damagesRegistration` = `⟨1, 1000⟩`（二十一（一） 損害賠償の支払金額千分の一）→ 税額関数 `damagesRegistrationFee`
- `specialMiningMortgageEstablishment` = `⟨4, 1000⟩`（二十二（十） 債権金額又は極度金額千分の四）→ 税額関数 `specialMiningMortgageEstablishmentFee`
- `specialMiningMortgageTrust` = `⟨2, 1000⟩`（二十二（十四）イ 債権金額又は極度金額千分の二）→ 税額関数 `specialMiningMortgageTrustFee`
- `storageMortgageEstablishment` = `⟨4, 1000⟩`（二十二の二（七） 債権金額又は極度金額千分の四）→ 税額関数 `storageMortgageEstablishmentFee`
- `storageMortgageTrust` = `⟨2, 1000⟩`（二十二の二（十二）イ 債権金額又は極度金額千分の二）→ 税額関数 `storageMortgageTrustFee`

面積型 `Money` 定数 14 本（十万平方メートルあたり）:
`placerRightEstablishmentPerArea`, `placerIncreasedAreaChangePerArea`, `placerRoyaltyEstablishmentPerArea`, `placerIncreasedRoyaltyAreaChangePerArea`, `specialExplorationEstablishmentPerArea`, `specialExplorationTransferInheritanceOrMergerPerArea`, `specialExplorationTransferOtherPerArea`, `specialMiningRightEstablishmentPerArea`, `specialMiningTermExtensionPerArea`, `specialMiningTransferInheritanceOrMergerPerArea`, `specialMiningTransferOtherPerArea`, `specialMortgageTransferInheritanceOrMergerPerArea`, `specialMortgageTransferOtherPerArea`, `specialNonMortgageRightTrustPerArea`。

定額型 `Money` 定数 76 本（一件／一個／一区画あたり）:
`miningTrialMiningRightEstablishment`, `miningTrialAreaIncreaseChange`, `miningTrialAreaDecreaseChange`, `miningTrialTransferInheritanceOrMerger`, `miningTrialTransferOther`, `miningTrialAbandonmentExtinction`, `miningMiningRightEstablishment`, `miningMiningAreaIncreaseChange`, `miningMiningAreaDecreaseChange`, `miningMiningAreaMergerChange`, `miningMiningAreaDivisionChange`, `miningMiningTransferInheritanceOrMerger`, `miningMiningTransferOther`, `miningMiningAbandonmentExtinction`, `miningRoyaltyRightEstablishment`, `miningRoyaltyAreaIncreaseChange`, `miningRoyaltyAreaDecreaseChange`, `miningRoyaltyTransferInheritanceOrMerger`, `miningRoyaltyTransferOther`, `miningRoyaltyExtinctionBeforeExpiry`, `miningMortgageChangeByMiningLaw51Consent`, `miningMortgageRankChangeByOrderChange`, `miningMortgageTransferInheritanceOrMerger`, `miningMortgageTransferOther`, `miningMortgageRankChange`, `miningNonMortgageRightTrust`, `miningCoOwnerWithdrawal`, `miningIncidentalOrRestorationOrCorrection`, `miningCancellation`, `placerAreaDecreaseChange`, `placerAreaMergerChange`, `placerAreaDivisionChange`, `placerTransferInheritanceOrMerger`, `placerTransferOther`, `placerAbandonmentExtinction`, `placerRoyaltyAreaDecreaseChange`, `placerRoyaltyTransfer`, `placerRoyaltyExtinctionBeforeExpiry`, `placerMortgageChangeByMiningLaw51Consent`, `placerMortgageRankChangeByOrderChange`, `placerMortgageTransferInheritanceOrMerger`, `placerMortgageTransferOther`, `placerMortgageRankChange`, `placerNonMortgageRightTrust`, `placerCoOwnerWithdrawal`, `placerIncidentalOrRestorationOrCorrection`, `placerCancellation`, `damagesRestorationOrCorrection`, `damagesCancellation`, `specialExplorationAreaDecrease`, `specialExplorationAbandonmentExtinction`, `specialMiningAreaDecrease`, `specialMiningAbandonmentExtinction`, `specialMortgageRankChangeByOrderChange`, `specialMortgageRankChange`, `specialCoOwnerWithdrawal`, `specialIncidentalOrRestorationOrCorrection`, `specialCancellation`, `storageExplorationRightEstablishment`, `storageExplorationAreaIncreaseChange`, `storageExplorationAreaDecreaseChange`, `storageExplorationTransferInheritanceOrMerger`, `storageExplorationTransferOther`, `storageRightEstablishment`, `storageAreaIncreaseChange`, `storageAreaDecreaseChange`, `storageAreaMergerChange`, `storageAreaDivisionChange`, `storageTransferInheritanceOrMerger`, `storageTransferOther`, `storageMortgageChangeByCO2LawConsent`, `storageMortgageRankChangeByOrderChange`, `storageMortgageTransferInheritanceOrMerger`, `storageMortgageTransferOther`, `storageMortgageRankChange`, `storageNonMortgageRightTrust`。

Spec: 上記税額関数に対応する独立整数定式 `spec*Fee`（`(base * X) / 1000`）9 本、独立定数定式 `spec*` 90 本、一致確認 `agreeRegistryMiningFees : Bool` 1 本
（基底 `[0, 1, 99, 249, 250, 499, 500, 999, 1000, 1001, 12_345, 100_000, 1_000_000]` で impl ≡ spec を `==` 比較）。

Tests: 新規定理名なし、各税率定数の分子・分母・正性、各定数の金額・正性、
各割合型の 0→0 / den→num / 999→floor 境界、独立定式と agree フラグの smoke（全て `by decide`）。

### 原文どおりの読み取り（誠実性の境界）

- 課税標準（「鉱区の数」「租鉱区の数」「共同開発鉱区の数」「抵当権の件数」「不動産の個数」、
  「債権金額又は極度金額」「損害賠償の支払金額」）、面積、件数・個数は **caller-established**。
  本モジュールは与えられた値に率・単価を適用する算術のみを扱い、価額の算定・評価、
  面積の十万平方メートル単位への換算・端数処理は扱わない。
- 各区分への該当性（十九〜二十一・二十二・二十二の二の別、設定／変更／移転／消滅／信託／
  抵当権、相続／法人の合併／その他、鉱区の増加／減少／合併／分割、砂鉱の別、
  二酸化炭素の貯留事業等）は **caller-established** とし、**Bool を金額式に入れていない**。
- 定額・面積型は一件／一個／一区画／十万平方メートルあたり単価のみを定義し、
  件数・個数・面積を掛ける Nat 掛け算は行わない。
- 割合型の丸めは `TaxRate.applyFloor`（切り捨て）を採用（per-law business data として明示）。
  割合型は `base` が小さいと 0 になり得るため strict positivity は主張せず、
  率定数の `den_pos`・各定数の正性・各税額関数の smoke を付与した。
- 二十二の二（十三）は原文が途中で切れており fee string がないため対象外。
  担当範囲外の号・他の別表・条文、登録免許税の納付手続・端数処理の通則法的詳細は
  **NOT YET COVERED**。
- Pinned evidence is in doc-comments only; 各定理はモデルの性質のみを主張し、
  実法律の意味を主張しない（誠実性の原則）。

## 2. 転記監査に追加すべき check（JSON 断片）

`scripts/ci/transcription_audit.py` の `checks()` に追加する check の JSON 表現です
（`law_id` / `kind` / `title` / `needles` の 4 キー）。needle 文字列は一字も変えないこと。
**文字正規化・全角／半角変換・異体字変換を行わず、そのまま移してください。**
各 needle は正規化テキスト（空白・全角空白除去）上の連続部分そのもので、
担当範囲原文・pinned JSON の両方で出現回数 **1**（一意）、長さ 60〜130 文字です。

```json
{
  "law_id": "342AC0000000035",
  "kind": "file",
  "title": null,
  "needles": [
    "十九鉱業権又は租鉱権（砂鉱を目的とするものを除く。以下この号において同じ。）の登録（鉱業権又は租鉱権の信託の登録を含む。）（一）試掘権の設定の登録鉱区の数一個につき九万円（二）鉱区の増減による試掘権の変更の登録イ鉱区の増加又は鉱区の増加及び減少による変更の",
    "（五）採掘権の設定の登録鉱区の数一個につき十八万円（六）鉱区の増減、合併又は分割による採掘権の変更の登録イ鉱区の増加又は鉱区の増加及び減少による変更の登録鉱区の数一個につき九万円ロ鉱区の減少による変更の登録鉱区の数一個につき一万二千円ハ鉱区の合併による変更",
    "（九）租鉱権の設定の登録鉱区の数一個につき一万八千円（十）租鉱区の増減による租鉱権の変更の登録イ租鉱区の増加又は租鉱区の増加及び減少による変更の登録租鉱区の数一個につき六千円ロ租鉱区の減少による変更の登録租鉱区の数一個につき千二百円（十一）租鉱権の移転の登",
    "（十三）抵当権の設定又は鉱業権若しくは抵当権の処分の制限の登録債権金額又は極度金額千分の四（十四）鉱業法第五十一条（鉱区の分割及び合併についての抵当権者の承諾及び協定）の承諾及び協定に係る抵当権の変更の登録鉱区の数一個につき三千円（十五）順位の変更による抵",
    "（十八）信託の登録イ抵当権の信託の登録債権金額又は極度金額千分の二ロ抵当権以外の権利の信託の登録鉱区又は租鉱区の数一個につき九千円（十九）共同鉱業権者又は共同租鉱権者の脱退の登録鉱区又は租鉱区の数一個につき四千五百円（二十）付記登録、仮登録、抹消した登録の",
    "二十砂鉱権（砂鉱を目的とする鉱業権をいう。以下この号において同じ。）又は租鉱権（砂鉱に係るものに限る。以下この号において同じ。）の登録（砂鉱権又は租鉱権の信託の登録を含む。）（一）砂鉱権の設定の登録鉱区の面積十万平方メートルにつき四千五百円（二）鉱区の増減",
    "（三）砂鉱権の移転の登録イ相続又は法人の合併による移転の登録鉱区の数一個につき四千五百円ロその他の原因による移転の登録鉱区の数一個につき一万三千五百円（四）放棄による砂鉱権の消滅の登録鉱区の数一個につき千円（五）租鉱権の設定の登録租鉱区の面積十万平方メート",
    "（七）租鉱権の移転の登録租鉱区の数一個につき千五百円（八）存続期間満了前の租鉱権の消滅の登録租鉱区の数一個につき千円（九）抵当権の設定又は砂鉱権若しくは抵当権の処分の制限の登録債権金額又は極度金額千分の四（十）鉱業法第五十一条（鉱区の分割及び合併についての",
    "（十五）共同砂鉱権者又は共同租鉱権者の脱退の登録鉱区又は租鉱区の数一個につき四千五百円（十六）付記登録、仮登録、抹消した登録の回復の登録又は登録の更正若しくは変更の登録（これらの登録のうち（一）から（十五）までに掲げるものを除く。）鉱区又は租鉱区の数一個に",
    "二十一鉱業法第百十四条第二項（予定された損害賠償額の登録）の規定による登録（一）新規登録損害賠償の支払金額千分の一（二）抹消した登録の回復又は登録の更正若しくは変更の登録不動産の個数一個につき千円（三）登録の抹消不動産の個数一個につき千円二十二特定鉱業権の",
    "二十二特定鉱業権の登録（特定鉱業権の信託の登録を含む。）（一）探査権の設定の登録共同開発鉱区の面積十万平方メートルにつき三百円（二）探査権の共同開発鉱区の減少の登録共同開発鉱区の減少をする部分の数一個につき十二万円（三）探査権の移転の登録イ相続又は法人の合",
    "（五）採掘権の設定の登録共同開発鉱区の面積十万平方メートルにつき二千四百円（六）採掘権の存続期間の延長の登録共同開発鉱区の面積十万平方メートルにつき二百四十円（七）採掘権の共同開発鉱区の減少の登録共同開発鉱区の減少をする部分の数一個につき二十四万円（八）採",
    "（十）抵当権の設定又は特定鉱業権若しくは抵当権の処分の制限の登録債権金額又は極度金額千分の四（十一）順位の変更による抵当権の変更の登録共同開発鉱区の数一個につき十二万円（十二）抵当権の移転の登録イ相続又は法人の合併による移転の登録共同開発鉱区の面積十万平方",
    "ロ抵当権以外の権利の信託の登録共同開発鉱区の面積十万平方メートルにつき百二十円（十五）特定鉱業権共有者の脱退の登録共同開発鉱区の数一個につき九万円（十六）付記登録、仮登録、抹消した登録の回復の登録又は登録の更正若しくは変更の登録（これらの登録のうち（一）か",
    "二十二の二試掘権又は貯留権の登録（試掘権又は貯留権の信託の登録を含む。）（一）試掘権の設定の登録試掘区域の数一個につき九万円（二）試掘区域の増減による試掘権の変更の登録イ試掘区域の増加又は試掘区域の増加及び減少による変更の登録試掘区域の数一個につき四万五千",
    "（四）貯留権の設定の登録貯留区域の数一個につき十八万円（五）貯留区域の増減、合併又は分割による貯留権の変更の登録イ貯留区域の増加又は貯留区域の増加及び減少による変更の登録貯留区域の数一個につき九万円ロ貯留区域の減少による変更の登録貯留区域の数一個につき一万",
    "（七）抵当権の設定又は試掘権、貯留権若しくは抵当権の処分の制限の登録債権金額又は極度金額千分の四（八）二酸化炭素の貯留事業に関する法律第十六条第五項（許可貯留区域の分割及び合併の許可の申請）の承諾及び協定に係る抵当権の変更の登録貯留区域の数一個につき三千円",
    "（十二）信託の登録イ抵当権の信託の登録債権金額又は極度金額千分の二ロ抵当権以外の権利の信託の登録試掘区域又は貯留区域の数一個につき九千円（十三）付記登録、仮登録、抹消した登録の回復の登録又は登録の更正若しくは"
  ]
}
```

## 3. 検証結果（本セッションで実行済み）

- `lake build JapanTaxLaw.RegistryMiningFees JapanTaxLaw.RegistryMiningFeesSpec JapanTaxLaw.RegistryMiningFeesTests`
  → **成功（5 jobs、warning なし）**。※自作 3 モジュールのみビルド（全体ビルド／CI／
  `run_python_gates.py` は実行していません）。
- `python scripts/ci/check_no_sorry.py` →
  `no forbidden placeholder proofs found in tracked Lean sources`。
  （新規 3 ファイルは未追跡のため走査対象外ですが、リポジトリの
  `strip_comments_and_strings` と同一ロジックで個別に走査し、
  `sorry` / `admit` が **0 件**であることを別途確認済み。）
- `#print axioms`（一時ファイル `WY_AxiomProbe.lean` を approved temp dir に作成、
  `lake env lean` で実行後 **削除済み**）:
  - 名前付き宣言 **308 件**（実装 def 108 + theorem 100 + Spec def 100）を走査。
  - `Classical.choice` / `sorryAx` は **0 件**。
  - 307 件が `does not depend on any axioms`。残り 1 件
    `miningRateFeeMono` のみ `[propext]` に依存（**propext は許可**）。
- 原文逐語検証（needle を `re.sub(r"[\s　]+", "", ...)` 正規化テキストに対して Python `.find()` / `.count()`）:
  - 担当範囲原文 `reg_rem_A.txt`（正規化後 4248 文字）: **18/18 FOUND、MISS 0 件**、各出現回数 1。
  - pinned JSON `law_full_text`（正規化後 211508 文字。平坦化は `transcription_audit.py` と同一ロジック）:
    **18/18 FOUND、MISS 0 件**、各出現回数 1。
  - 参考: 担当範囲原文の正規化文字列は pinned JSON 正規化文字列の offset 131760 から
    そのまま一致（4248 文字すべて逐語一致）。
  - 一時検証スクリプト・axiom probe はすべて削除済み（担当範囲原文 `reg_rem_A.txt` は残置）。

### 逐語 FOUND / MISS 一覧（一字も変更せず）

| # | 区分 | len | 原文@/count | JSON@/count | 結果 |
| --- | --- | --- | --- | --- | --- |
| 1 | needle 1 | 128 | 0/1 | 131760/1 | FOUND |
| 2 | needle 2 | 128 | 270/1 | 132030/1 | FOUND |
| 3 | needle 3 | 128 | 551/1 | 132311/1 | FOUND |
| 4 | needle 4 | 128 | 774/1 | 132534/1 | FOUND |
| 5 | needle 5 | 128 | 1039/1 | 132799/1 | FOUND |
| 6 | needle 6 | 128 | 1262/1 | 133022/1 | FOUND |
| 7 | needle 7 | 128 | 1542/1 | 133302/1 | FOUND |
| 8 | needle 8 | 128 | 1778/1 | 133538/1 | FOUND |
| 9 | needle 9 | 128 | 2165/1 | 133925/1 | FOUND |
| 10 | needle 10 | 128 | 2322/1 | 134082/1 | FOUND |
| 11 | needle 11 | 128 | 2441/1 | 134201/1 | FOUND |
| 12 | needle 12 | 128 | 2673/1 | 134433/1 | FOUND |
| 13 | needle 13 | 128 | 2924/1 | 134684/1 | FOUND |
| 14 | needle 14 | 128 | 3164/1 | 134924/1 | FOUND |
| 15 | needle 15 | 128 | 3351/1 | 135111/1 | FOUND |
| 16 | needle 16 | 128 | 3585/1 | 135345/1 | FOUND |
| 17 | needle 17 | 128 | 3863/1 | 135623/1 | FOUND |
| 18 | needle 18 | 104 | 4144/1 | 135904/1 | FOUND |

**FOUND 18 / MISS 0**（両テキストで出現回数 1、一意）。needle の長さは 128 文字（最終のみ 104）。
アンカーの勝手な変更・正規化・文字変換はしていません（原文の `若しくは` / `に掲げる` 等も保持）。

## 4. README / PROGRESS に足す 1 行文案

- **README.md**（登録免許税モジュール一覧の末尾付近に追加）:
  ```text
  JapanTaxLaw/RegistryMiningFees.lean / -Spec.lean / -Tests.lean  # 登録免許税法 別表第一（二）の鉱業権・租鉱権・砂鉱権・特定鉱業権・試掘権／貯留権の登録手数料（定額 76 件 1,000〜240,000 円 + 面積 14 件 30〜4,500 円/100,000m² + 割合型 9 件 4/2/1 千分率、課税標準・面積・件数・該当性は caller-established）L4 モデル・独立定式・退行テスト
  ```
- **docs/PROGRESS.md**（L4 着手済みモジュール一覧の末尾に追記）:
  ```text
  登録免許税法 別表第一（二）（RegistryMiningFees.lean：鉱業権・租鉱権・砂鉱権・特定鉱業権・試掘権／貯留権の登録手数料を 76 定額型 + 14 面積型（十万平方メートルあたり）+ 9 割合型（千分の四=4/1000、千分の二=2/1000、千分の一=1/1000、切り捨て、小数点率なし）でモデル化、課税標準・面積・件数・該当性は caller-established、二十二の二（十三）は原文途切れで対象外、他の号・条文は NOT YET COVERED）
  ```

## 5. インテグレーターへの明示事項

**インテグレーターは `JapanTaxLaw.lean` に以下の 3 つの import を追加すること。**

```lean
import JapanTaxLaw.RegistryMiningFees
import JapanTaxLaw.RegistryMiningFeesSpec
import JapanTaxLaw.RegistryMiningFeesTests
```

（他ワーカーの 3 件ずつと併せてメインが行数を確認してください。
W-Y は `JapanTaxLaw.lean` を書き換えていません。他ワーカーのファイルには触れていません。）

## 6. 範囲・残ブロッカーの正直な申告（最終報告）

- **build**: 自作 3 モジュールのみ `lake build` 成功（5 jobs / warning なし）。全体ビルド・CI・
  `run_python_gates.py` は未実行です。
- **axiom**: 走査 308 件（実装 def 108 + theorem 100 + Spec def 100）、
  `Classical.choice` / `sorryAx` なし。307 件 axiom-free、`miningRateFeeMono` 1 件のみ
  `[propext]` 依存（許可範囲）。一時ファイルは削除済み。
- **逐語**: FOUND 18 / MISS 0（担当範囲原文・pinned JSON の両方、出現回数 1、長さ 128/104）。
- **def 数**: 実装 108（税率 9 + 税額関数 9 + 面積 14 + 定額 76）+ theorem 100 + Spec 100 = 名前付き宣言 308。Tests は新規定理名なし。
- **STAGING**: 本ファイル `docs/STAGING_WY.md` を作成済みです。
- これは **L4 のごく小さなスライド**です。**完成・網羅を主張しません**。
- 担当は 登録免許税法 別表第一（二）の**十九 鉱業権又は租鉱権 / 二十 砂鉱権又は租鉱権 /
  二十一 鉱業法第百十四条第二項（予定された損害賠償額） / 二十二 特定鉱業権 /
  二十二の二 試掘権又は貯留権 のみ**。別表第一の他の号・他の条文、
  登録免許税の納付手続・端数処理の通則法的詳細は **NOT YET COVERED**。
- 二十二の二（十三）は原文が文中で途切れており fee string は W-Z モデル化済み（重複回避）ため対象外。
  担当範囲原文に「漁業権」の fee string は含まれていません（未提供スライドのためモデル化せず）。
- 課税標準、面積、件数・個数、各区分への該当性はすべて caller-established とし、
  法的判断の自動化・Bool の金額式への組込みはしていません。
- 定額・面積型は一件／一個／一区画／十万平方メートルあたり単価のみを定義し、
  件数・面積の掛け算はしていません。
- 割合型の率はすべて整数千分率 `⟨4,1000⟩` / `⟨2,1000⟩` / `⟨1,1000⟩` として符号化しました
  （小数点率は範囲内になし、分母 10000 不使用）。原文の率文字列は doc-comment に保持していますが、
  これは法的な率の解釈を保証するものではありません。
- `agreeRegistryMiningFees` は有限点（13 基底）の `==` 一致確認であり、法的意味の等価証明ではありません。
- 転記監査は fidelity-only（原文 bytes との一致確認）であり、法的正しさを保証しません。
- **L7 候補 3,438 件は unreviewed のまま**です（本スライドでは一切レビューしていません）。
- 残ブロッカー: 転記監査 check の `checks()` への組み込み（§2、+18 needles）、
  `JapanTaxLaw.lean` への import 追加（§5）、README / PROGRESS の 1 行追記（§4）、
  および全体ビルド・CI ゲートの実行は**すべてメインセッションの担当**です
  （W-Y は実行していません）。
