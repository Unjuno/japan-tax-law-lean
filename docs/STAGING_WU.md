# STAGING — W-U（登録免許税法 別表第一（二）の意匠権・商標権・回路配置利用権の手数料モデル）受け渡しメモ

> 実装担当 W-U からメインセッション（統合担当）への受け渡し用。
> ブランチ操作・add/commit/push/merge は一切していません。
> 書き換えたのは下記 4 ファイルのみです（他は読み取り専用）。

## 0. 対象ファイル

| ファイル | 状態 |
| --- | --- |
| `JapanTaxLaw/RegistryDesignTrademarkFees.lean` | 新規 |
| `JapanTaxLaw/RegistryDesignTrademarkFeesSpec.lean` | 新規 |
| `JapanTaxLaw/RegistryDesignTrademarkFeesTests.lean` | 新規 |
| `docs/STAGING_WU.md` | 新規（本ファイル） |

pinned source: `data/raw/342AC0000000035_20261101_508AC0000000021.law.json`
law id `342AC0000000035` / revision `342AC0000000035_20261101_508AC0000000021`
amendment enforcement date `2026-11-01`。
担当範囲原文: `reg_ip_C.txt`（十五〜十七、正規化済み・UTF-8、1707 文字、temp）。

Namespace note: 新規モジュールは dedicated sub-namespace
`JapanTaxLaw.RegistryDesignTrademarkFees` を使用（`Money = Nat` は
`open JapanTaxLaw.TaxFinance` で参照）。他ワーカー（W-S / W-T）の flat namespace と衝突しません。

### 原文範囲の重要な申告（育成者権）

task 文面は「意匠権・商標権・回路配置利用権・**育成者権**」と記載していましたが、
pinned 原文 `reg_ip_C.txt`（1707 文字）には十五 意匠権・十六 商標権・十七 回路配置利用権の
手数料しか存在せず、**「育成者権」という語もその料金も 1 文字も出現しません**
（`'育成' in src == False`、`'十八' in src == False` を確認）。
したがって育成者権は本スライスでは **モデル化していません**。金額をでっち上げることは
していません。育成者権の別表第一（二）の区分が必要なら、別ワーカー／メインセッションが
対応する pinned 原文を提示して別スライスとして扱ってください。

## 1. 追加した def 一覧

`namespace JapanTaxLaw.RegistryDesignTrademarkFees`、`open JapanTaxLaw.TaxFinance`。
定額型は `Money` 定数（1 件あたり）、割合型は税率定数 `TaxRate ⟨X, 1000, by decide⟩`
と税額関数 `rate.applyFloor base`（= 債権金額 × X / 1000、切り捨て）としてモデル化しました。
件数を掛ける Nat 掛け算は行わず、件数・課税標準・該当性は caller-established です。

### 1a. 定額型 `Money` 定数（25 本、1 件あたり）

【十五 意匠権の登録】

| # | def 名 | 原文 | 額 |
| --- | --- | --- | --- |
| 1 | `designTransferInheritanceOrMergerFee` | （一）イ 相続・合併「意匠権の件数一件につき三千円」 | ¥3,000 |
| 2 | `designTransferOtherFee` | （一）ロ その他「意匠権の件数一件につき九千円」 | ¥9,000 |
| 3 | `designExclusiveRightEstablishmentOrPreservationFee` | （二）専用実施権の設定又は保存「九千円」 | ¥9,000 |
| 4 | `designExclusiveRightTransferInheritanceOrMergerFee` | （四）イ 相続・合併「千五百円」 | ¥1,500 |
| 5 | `designExclusiveRightTransferOtherFee` | （四）ロ その他「意匠権等の件数一件につき三千円」 | ¥3,000 |
| 6 | `designTrustNonPledgeFee` | （五）ロ 質権以外の権利の信託「三千円」 | ¥3,000 |
| 7 | `designUpdateRegistrationFee` | （六）付記・仮・回復・更正／変更「千円」 | ¥1,000 |
| 8 | `designCancellationFee` | （七）登録の抹消「千円」 | ¥1,000 |

【十六 商標権の登録】

| # | def 名 | 原文 | 額 |
| --- | --- | --- | --- |
| 9 | `trademarkTransferInheritanceOrMergerFee` | （一）イ 相続・合併「商標権の件数一件につき三千円」 | ¥3,000 |
| 10 | `trademarkTransferOtherFee` | （一）ロ その他「商標権の件数一件につき三万円」 | ¥30,000 |
| 11 | `trademarkUseRightEstablishmentOrPreservationFee` | （二）専用使用権／通常使用権の設定・保存「三万円」 | ¥30,000 |
| 12 | `trademarkUseRightTransferInheritanceOrMergerFee` | （四）イ 相続・合併「商標権等の件数一件につき三千円」 | ¥3,000 |
| 13 | `trademarkUseRightTransferOtherFee` | （四）ロ その他「九千円」 | ¥9,000 |
| 14 | `trademarkTrustNonPledgeFee` | （五）ロ 質権以外の権利の信託「九千円」 | ¥9,000 |
| 15 | `trademarkUpdateRegistrationFee` | （六）付記・仮・回復・更正／変更「千円」 | ¥1,000 |
| 16 | `trademarkCancellationFee` | （七）登録の抹消「千円」 | ¥1,000 |

【十七 回路配置利用権の登録】

| # | def 名 | 原文 | 額 |
| --- | --- | --- | --- |
| 17 | `circuitEstablishmentFee` | （一）設定「一万八千円」 | ¥18,000 |
| 18 | `circuitTransferInheritanceOrMergerFee` | （二）イ 相続・合併「三千円」 | ¥3,000 |
| 19 | `circuitTransferOtherFee` | （二）ロ その他「九千円」 | ¥9,000 |
| 20 | `circuitUseRightEstablishmentFee` | （三）専用利用権／通常利用権の設定「九千円」 | ¥9,000 |
| 21 | `circuitUseRightTransferInheritanceOrMergerFee` | （五）イ 相続・合併「千五百円」 | ¥1,500 |
| 22 | `circuitUseRightTransferOtherFee` | （五）ロ その他「回路配置利用権等の件数一件につき三千円」 | ¥3,000 |
| 23 | `circuitTrustNonPledgeFee` | （六）ロ 質権以外の権利の信託「三千円」 | ¥3,000 |
| 24 | `circuitUpdateRegistrationFee` | （七）付記・仮・回復・更正／変更「千円」 | ¥1,000 |
| 25 | `circuitCancellationFee` | （八）登録の抹消「千円」 | ¥1,000 |

### 1b. 割合型: 税率定数（6 本、分母すべて 1000）

| # | def 名 | 原文 | 率 |
| --- | --- | --- | --- |
| 26 | `designPledgeSecurityRate` | 十五（三）意匠権等を目的とする質権の設定／処分制限「債権金額千分の四」 | 4/1000 |
| 27 | `designTrustPledgeRate` | 十五（五）イ 質権の信託「債権金額千分の二」 | 2/1000 |
| 28 | `trademarkPledgeSecurityRate` | 十六（三）商標権等を目的とする質権の設定／処分制限「千分の四」 | 4/1000 |
| 29 | `trademarkTrustPledgeRate` | 十六（五）イ 質権の信託「千分の二」 | 2/1000 |
| 30 | `circuitPledgeSecurityRate` | 十七（四）回路配置利用権等を目的とする質権の設定／処分制限「千分の四」 | 4/1000 |
| 31 | `circuitTrustPledgeRate` | 十七（六）イ 質権の信託「千分の二」 | 2/1000 |

### 1c. 割合型: 税額関数（`(base : Money) → Money`、6 本）

| # | def 名 | 算術 |
| --- | --- | --- |
| 32 | `designPledgeSecurityFee` | `designPledgeSecurityRate.applyFloor base`（4/1000） |
| 33 | `designTrustPledgeFee` | `designTrustPledgeRate.applyFloor base`（2/1000） |
| 34 | `trademarkPledgeSecurityFee` | `trademarkPledgeSecurityRate.applyFloor base`（4/1000） |
| 35 | `trademarkTrustPledgeFee` | `trademarkTrustPledgeRate.applyFloor base`（2/1000） |
| 36 | `circuitPledgeSecurityFee` | `circuitPledgeSecurityRate.applyFloor base`（4/1000） |
| 37 | `circuitTrustPledgeFee` | `circuitTrustPledgeRate.applyFloor base`（2/1000） |

### 1d. 定理名（32 本、すべて axiom-free または propext のみ）

25 本の定額正性:
`designTransferInheritanceOrMergerFee_pos` / `designTransferOtherFee_pos` /
`designExclusiveRightEstablishmentOrPreservationFee_pos` /
`designExclusiveRightTransferInheritanceOrMergerFee_pos` /
`designExclusiveRightTransferOtherFee_pos` / `designTrustNonPledgeFee_pos` /
`designUpdateRegistrationFee_pos` / `designCancellationFee_pos` /
`trademarkTransferInheritanceOrMergerFee_pos` / `trademarkTransferOtherFee_pos` /
`trademarkUseRightEstablishmentOrPreservationFee_pos` /
`trademarkUseRightTransferInheritanceOrMergerFee_pos` /
`trademarkUseRightTransferOtherFee_pos` / `trademarkTrustNonPledgeFee_pos` /
`trademarkUpdateRegistrationFee_pos` / `trademarkCancellationFee_pos` /
`circuitEstablishmentFee_pos` / `circuitTransferInheritanceOrMergerFee_pos` /
`circuitTransferOtherFee_pos` / `circuitUseRightEstablishmentFee_pos` /
`circuitUseRightTransferInheritanceOrMergerFee_pos` /
`circuitUseRightTransferOtherFee_pos` / `circuitTrustNonPledgeFee_pos` /
`circuitUpdateRegistrationFee_pos` / `circuitCancellationFee_pos`。

6 本の税率分母正性:
`designPledgeSecurityRate_den_pos` / `designTrustPledgeRate_den_pos` /
`trademarkPledgeSecurityRate_den_pos` / `trademarkTrustPledgeRate_den_pos` /
`circuitPledgeSecurityRate_den_pos` / `circuitTrustPledgeRate_den_pos`。

および単調性 `rateFee_mono`（`propext` 依存、許容範囲）。

### 1e. Spec モジュール（独立整数定式 31 + agree 1 = 32 def）

定額 25 本: `specDesignTransferInheritanceOrMergerFee` … `specCircuitCancellationFee`
（impl の 25 定額と 1 対 1、値は同じ）。
割合型 6 本: `specDesignPledgeSecurityFee` / `specDesignTrustPledgeFee` /
`specTrademarkPledgeSecurityFee` / `specTrademarkTrustPledgeFee` /
`specCircuitPledgeSecurityFee` / `specCircuitTrustPledgeFee`
（いずれも `(base : Nat) : Nat`、4/1000 または 2/1000 を `(base * X) / 1000` で独立計算）。
一致確認 `agreeRegistryDesignTrademarkFees : Bool`。
Spec は impl の `TaxRate.applyFloor` を再利用せず独立整数定式、
`agreeRegistryDesignTrademarkFees` は 12 点グリッドの `==` 一致を `by decide` で確認。
Tests は kernel-decide smoke のみ（新規定理名なし、0・端数境界 249/250/499/500/
999/1000/1001・12345・1_000_000 をカバー）。

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
    "十五意匠権の登録（意匠権の信託の登録を含み、国際登録簿への登録を除く。）（一）意匠権の移転の登録イ相続又は法人の合併による移転の登録意匠権の件数一件につき三千円ロその他の原因による移転の登録意匠権の件",
    "続又は法人の合併による移転の登録意匠権の件数一件につき三千円ロその他の原因による移転の登録意匠権の件数一件につき九千円（二）専用実施権の設定又は保存の登録専用実施権の件数一件につき",
    "数一件につき九千円（二）専用実施権の設定又は保存の登録専用実施権の件数一件につき九千円（三）意匠権若しくは専用実施権を目的とする質権の設定又は意匠権、専用実施権若しくは当該質権の処分の制限の登録債権金",
    "（三）意匠権若しくは専用実施権を目的とする質権の設定又は意匠権、専用実施権若しくは当該質権の処分の制限の登録債権金額千分の四（四）専用実施権の移転又は意匠権若しくは専用実施権を目的",
    "（四）専用実施権の移転又は意匠権若しくは専用実施権を目的とする質権の移転の登録イ相続又は法人の合併による移転の登録意匠権又は専用実施権（以下この号において「意匠権等」という。）の件数一件につき千五百円ロその他の原因による",
    "（五）信託の登録イ質権の信託の登録債権金額千分の二ロ質権以外の権利の信託の登録意匠権等の件数一件につき三千円（六）付記登録、仮登録、抹消した登録の回復の登録又は登録の更正若しくは変更の登録（",
    "（六）付記登録、仮登録、抹消した登録の回復の登録又は登録の更正若しくは変更の登録（これらの登録のうち（一）から（五）までに掲げるものを除く。）意匠権等の件数一件につき千円（七）登録の抹消意匠権等の件数",
    "十六商標権の登録（商標権の信託の登録を含み、国際登録簿への登録を除く。）（一）商標権の移転の登録イ相続又は法人の合併による移転の登録商標権の件数一件につき三千円ロその他の原因による移転の登録商標権の件数一件につき三万円（",
    "（二）専用使用権又は通常使用権の設定又は保存の登録専用使用権又は通常使用権の件数一件につき三万円（三）商標権、専用使用権若しくは通常使用権を目的とする質権の設定又は商標権、専用使用権、通常使用権若しくは当該質権の処分の制",
    "（四）専用使用権若しくは通常使用権の移転又はこれらの権利若しくは商標権を目的とする質権の移転の登録イ相続又は法人の合併による移転の登録商標権、専用使用権又は通常使用権（以下この号において「商標権等」という。）の件数一件に",
    "（五）信託の登録イ質権の信託の登録債権金額千分の二ロ質権以外の権利の信託の登録商標権等の件数一件につき九千円（六）付記登録、仮登録、抹消した登録の回復の登録又は登録の更正若しくは変更の登録（これらの登",
    "（六）付記登録、仮登録、抹消した登録の回復の登録又は登録の更正若しくは変更の登録（これらの登録のうち（一）から（五）までに掲げるものを除く。）商標権等の件数一件につき千円（七）登録の抹消商標権等の件数一件につき千円十七回",
    "十七回路配置利用権の登録（回路配置利用権の信託の登録を含む。）（一）回路配置利用権の設定の登録回路配置利用権の件数一件につき一万八千円（二）回路配置利用権の移転の登録イ相続又は法人の合併による移転の登録回路配置利用権の件",
    "（二）回路配置利用権の移転の登録イ相続又は法人の合併による移転の登録回路配置利用権の件数一件につき三千円ロその他の原因による移転の登録回路配置利用権の件数一件につき九千円（三）専用利用権又は通常利用権の設定の登録専用利用権又は通常利用権の件",
    "（三）専用利用権又は通常利用権の設定の登録専用利用権又は通常利用権の件数一件につき九千円（四）回路配置利用権、専用利用権若しくは通常利用権を目的とする質権の設定又は回路配置利用権、専用利用権、通常利用権若しくは当該質権の処分の制限の登録債権金額千分の",
    "（五）専用利用権若しくは通常利用権の移転又はこれらの権利若しくは回路配置利用権を目的とする質権の移転の登録イ相続又は法人の合併による移転の登録回路配置利用権、専用利用権又は通常利用権（以下この号において「回路配置利用権等」という。）の件数一件につき千五百円ロそ",
    "（六）信託の登録イ質権の信託の登録債権金額千分の二ロ質権以外の権利の信託の登録回路配置利用権等の件数一件につき三千円（七）付記登録、仮登録、抹消した登録の回復の登録又は登録の更正若しくは変更の登録（これらの登録のうち（一）から（六）までに掲げるものを",
    "（七）付記登録、仮登録、抹消した登録の回復の登録又は登録の更正若しくは変更の登録（これらの登録のうち（一）から（六）までに掲げるものを除く。）回路配置利用権等の件数一件につき千円（八）登録の抹消回路配置利用権等の件数一件につき千円"
  ]
}
```

参考：現行スクリプト形式への変換例（name は任意、needles は上記 18 本を一字も変えずに列挙）:

```python
yield ("登録免許税法 別表第一（二）意匠権・商標権・回路配置利用権 ↔ RegistryDesignTrademarkFees.lean",
       "342AC0000000035",
       "file", None,
       [ ...上記 needles 18 本を一字も変えずに列挙... ])
```

## 3. 検証結果（すべて本セッションで実行済み）

- `lake build JapanTaxLaw.RegistryDesignTrademarkFees JapanTaxLaw.RegistryDesignTrademarkFeesSpec JapanTaxLaw.RegistryDesignTrademarkFeesTests`
  → **成功（5 jobs、warning なし）**。※自作 3 モジュールのみビルド（全体ビルド／CI／
  `run_python_gates.py` は実行していません）。
- `python scripts/ci/check_no_sorry.py` →
  `no forbidden placeholder proofs found in tracked Lean sources`。
  （新規 3 ファイルは未追跡のため走査対象外ですが、人力でも `sorry` / `admit` はありません。）
- `#print axioms`（一時ファイル `WUAxiomProbe.lean` を approved temp dir に作成、
  `lake env lean` で実行後 **削除済み**）:
  - 33 件（32 positivity / well-definedness + `rateFee_mono` + `agreeRegistryDesignTrademarkFees`）を走査。
  - `Classical.choice` / `sorryAx` は **0 件**。
  - `rateFee_mono` のみ `propext` に依存（`simp` 由来）。**`propext` は許容**のため問題なし。
  - 他 32 件は `does not depend on any axioms`。
- 原文逐語検証（needle を正規化テキストに対して Python `.find()`、出現回数も確認、
  `transcription_audit.py` の `_norm` / `contains` と同一条件）:
  - 担当範囲原文 `reg_ip_C.txt`（正規化後 1,646 文字）:
    **18/18 FOUND、MISS 0 件**、各出現回数 1。
  - pinned JSON `law_full_text`（正規化後 211,508 文字、原文全体が
    offset 129617 に 1 回だけ出現）:
    **18/18 FOUND、MISS 0 件**、各出現回数 1。

### 逐語 FOUND / MISS 一覧（一字も変更せず）

| # | 区分 | len | 結果(原文) | src@ | count | 結果(JSON) | json@ | count |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| N1 | 十五（一）〜（二） | 100 | FOUND | 0 | 1 | FOUND | 129617 | 1 |
| N2 | 十五（一）イ／ロ・（二） | 90 | FOUND | 50 | 1 | FOUND | 129667 | 1 |
| N3 | 十五（二）・（三） | 100 | FOUND | 100 | 1 | FOUND | 129717 | 1 |
| N4 | 十五（三）・（四） | 90 | FOUND | 143 | 1 | FOUND | 129760 | 1 |
| N5 | 十五（四）イ／ロ | 110 | FOUND | 205 | 1 | FOUND | 129822 | 1 |
| N6 | 十五（五）イ／ロ・（六） | 95 | FOUND | 335 | 1 | FOUND | 129952 | 1 |
| N7 | 十五（六）・（七） | 100 | FOUND | 389 | 1 | FOUND | 130006 | 1 |
| N8 | 十六（一）イ／ロ | 110 | FOUND | 496 | 1 | FOUND | 130113 | 1 |
| N9 | 十六（二）・（三） | 110 | FOUND | 605 | 1 | FOUND | 130222 | 1 |
| N10 | 十六（四）イ／ロ・（五） | 110 | FOUND | 727 | 1 | FOUND | 130344 | 1 |
| N11 | 十六（五）イ／ロ・（六） | 100 | FOUND | 872 | 1 | FOUND | 130489 | 1 |
| N12 | 十六（六）・（七）・十七見出し | 110 | FOUND | 926 | 1 | FOUND | 130543 | 1 |
| N13 | 十七（一）・（二）イ | 110 | FOUND | 1033 | 1 | FOUND | 130650 | 1 |
| N14 | 十七（二）ロ・（三）・（四） | 120 | FOUND | 1100 | 1 | FOUND | 130717 | 1 |
| N15 | 十七（四）・（五） | 125 | FOUND | 1185 | 1 | FOUND | 130802 | 1 |
| N16 | 十七（五）イ／ロ・（六） | 130 | FOUND | 1311 | 1 | FOUND | 130928 | 1 |
| N17 | 十七（六）イ／ロ・（七） | 125 | FOUND | 1473 | 1 | FOUND | 131090 | 1 |
| N18 | 十七（七）・（八） | 115 | FOUND | 1531 | 1 | FOUND | 131148 | 1 |

**FOUND 18 / MISS 0**（両テキストで出現回数 1、一意）。needle の長さは 90〜130 文字
（指定の 60〜130 の範囲内）。needle は担当範囲原文の正規化文字列から
オフセット指定で一字も変えず抽出し、その後 pinned JSON に対して `.find()` しました。
アンカーの勝手な変更・正規化・文字変換はしていません。

## 4. README / PROGRESS に足す 1 行文案

CROSS_LAW の scan/pin 件数や監査 literal 総数はメインセッションが計算するため、ここでは書きません。

- **README.md**（モジュール一覧・`RegistryRealEstateFees*` / `RegistrationQualificationFees*` 行の付近に追加）:
  ```text
  JapanTaxLaw/RegistryDesignTrademarkFees.lean       # 登録免許税法 別表第一（二）意匠権・商標権・回路配置利用権（移転3千/9千/3万・質権4/1000・信託2/1000・設定18千等、件数・債権金額は caller-established）L4 モデル
  JapanTaxLaw/RegistryDesignTrademarkFeesSpec.lean   # 同上 独立整数定式
  JapanTaxLaw/RegistryDesignTrademarkFeesTests.lean  # 同上 退行テスト
  ```
- **docs/PROGRESS.md**（L4 着手済みモジュール一覧の末尾に追記）:
  ```text
  登録免許税法 別表第一（二）意匠権・商標権・回路配置利用権（RegistryDesignTrademarkFees.lean：25 定額型（意匠3千/9千/1.5千/1千・商標3千/3万/9千/1千・回路1.8万/3千/9千/1.5千/1千）＋6 割合型（質権設定4/1000・質権信託2/1000、債権金額は caller-established、丸めは切り捨て）、育成者権は原文になく非モデル化）
  ```

## 5. インテグレーターへの明示事項

**インテグレーターは `JapanTaxLaw.lean` に以下の 3 つの import を追加すること。**

```lean
import JapanTaxLaw.RegistryDesignTrademarkFees
import JapanTaxLaw.RegistryDesignTrademarkFeesSpec
import JapanTaxLaw.RegistryDesignTrademarkFeesTests
```

（W-S / W-T を含む他ワーカーの 3 件ずつと併せてメインが行数を確認してください。
W-U は `JapanTaxLaw.lean` を書き換えていません。他ワーカーのファイルには触れていません。）

## 6. 範囲・残ブロッカーの正直な申告（最終報告）

- **build**: 自作 3 モジュールのみ `lake build` 成功（5 jobs / warning なし）。全体ビルド・CI・
  `run_python_gates.py` は未実行です。
- **axiom**: 走査 33 件、`Classical.choice` / `sorryAx` なし。1 件が `propext` 依存
  （許容範囲）。一時ファイルは削除済み。
- **逐語**: FOUND 18 / MISS 0（担当範囲原文・pinned JSON の両方、出現回数 1、長さ 90〜130）。
- **def 数**: 実装 37 def + 32 定理 = 69 本、Spec 32 def（31 独立定式 + agree 1）、
  Tests は新規定理名なしの `example := by decide` のみ。名前付き宣言の合計は **101 本**。
- **STAGING**: 本ファイル `docs/STAGING_WU.md` を作成済みです。
- これは別表第一（二）の十五 意匠権・十六 商標権・十七 回路配置利用権に限る
  **小さなスライス**です。**完成・網羅を主張しません**。
- **育成者権は担当範囲原文に存在しないため非モデル化**です（§0 参照）。原文提示があれば
  別スライスでの対応が必要です。
- 別表第一（二）の他の号（第三十二号の資格登録等は W-S/W-T 担当）、登録免許税法全体
  （免税・軽減規定、納税義務者、税率の特例、他の別表）は **NOT YET COVERED / 非モデル化** です。
- 課税標準（割合型の「債権金額」）・件数・登録の該当性・原因判定は caller-established な
  入力です。その算定・評価、件数掛け算、端数処理の詳細（通則法含む）は非モデル化です。
- `agreeRegistryDesignTrademarkFees` は有限点（12 基底）の `==` 一致確認であり、法的意味の
  等価証明ではありません。
- 転記監査は fidelity-only（原文 bytes との一致確認）であり、法的正しさを保証しません。
- **L7 候補 3,438 件は unreviewed のまま**です（本スライスでは一切レビューしていません）。
- 残ブロッカー: 転記監査 check の `checks()` への組み込み（§2、+18 needles）、
  `JapanTaxLaw.lean` への import 追加（§5）、README / PROGRESS の 1 行追記（§4）、
  および全体ビルド・CI ゲートの実行は**すべてメインセッションの担当**です
  （W-U は実行していません）。
