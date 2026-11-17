# STAGING — W-AC（登録免許税法 別表第一（二）三十九〜四十九 担保付社債信託事業・各種金融業登録等の手数料 L4 モデル）受け渡しメモ

> 実装担当 W-AC からメインセッション（統合担当）への受け渡し用。
> ブランチ操作・add/commit/push/merge は一切していません。
> 書き換えたのは下記 4 ファイルのみです（他は読み取り専用）。

## 0. 対象ファイル / pinned source

| ファイル | 状態 |
| --- | --- |
| `JapanTaxLaw/RegistryQualificationFeesJ2.lean` | 新規 |
| `JapanTaxLaw/RegistryQualificationFeesJ2Spec.lean` | 新規 |
| `JapanTaxLaw/RegistryQualificationFeesJ2Tests.lean` | 新規 |
| `docs/STAGING_WAC.md` | 新規（本ファイル） |

pinned source: `data/raw/342AC0000000035_20261101_508AC0000000021.law.json`
law id `342AC0000000035` / revision `342AC0000000035_20261101_508AC0000000021`
amendment enforcement date `2026-11-01`（RegistrationTax / Registry* 各モジュールと同一ピン、
`data/INVENTORY.json` の `current_enforced` レコードで確認）。
担当範囲原文: `C:\Users\junny\AppData\Local\Temp\opencode\reg_qual_B.txt`
（三十九〜四十九、UTF-8、raw 3,665 文字 / 正規化後 3,613 文字）。

Namespace: `JapanTaxLaw.RegistryQualificationFeesJ2`（専用サブ名前空間。
`JapanTaxLaw` 直下の `RegistrationQualificationFees*` や他の `Registry*` モジュールと
衝突しません）。`open JapanTaxLaw.TaxFinance`（`Money = Nat`）。

## 1. 追加した宣言一覧

原文を一字も誤らず読み、金額を確定（日本語数字 → Arabic）。本範囲は **すべて定額型**で、
割合型（千分のX）は存在しません（`千分` / `百分` / `割合` の出現はいずれも 0 回）。
したがって `TaxRate` / `applyFloor` は導入していません（分母 10000 の 10 倍過大バグ警戒対象なし）。

- **`Money` 定数 45 件**（一件／一箇所あたり単価。件数・箇所数の Nat 掛け算は行わない）:
  - 十五万円（150,000）**33 件** / 九万円（90,000）**12 件** ＝ 45 件。
  - 原文の `につき` 45 回、`十五万円` 33 回、`九万円` 12 回と一致。
  - 内訳: 三十九 1 / 三十九の二 1 / 四十 9 / 四十一 13 / 四十四 1 / 四十五 1 /
    四十六 2 / 四十七 2 / 四十八 3 / 四十九 12。
  - **四十二及び四十三は「削除」**で fee string を持たないため fee def を作らず、
    caller-established と明記（実装・Spec・Tests のいずれにも対応定数なし）。

| ファイル | def | theorem | example |
| --- | --- | --- | --- |
| `RegistryQualificationFeesJ2.lean` | 45（money 定数） | 45（正性） | 45（smoke） |
| `RegistryQualificationFeesJ2Spec.lean` | 46（独立定式 45 + `agree` 1） | 0 | 46（Spec smoke 45 + agree 1） |
| `RegistryQualificationFeesJ2Tests.lean` | 0 | 0 | 45（kernel-decide smoke） |

**名前付き宣言総数 136（実装 90 + Spec 46）、`by decide` の example は 136 件（45 + 46 + 45）。**

### 実装 def 一覧（`.lean`、すべて `: Money`）

- 三十九 `securedBondTrustBizLicenseFee`(150,000) /
  三十九の二 `enterpriseValueSecurityTrustBizLicenseFee`(150,000)
- 四十(一) `financialProductMarketOpeningLicenseFee`(150,000) /
  (二) `internationalCooperationEmissionReductionMarketApprovalFee`(150,000) /
  (三) `financialExchangeOrgReorganizationApprovalFee`(150,000) /
  (四) `otcSecuritiesMarketOpeningApprovalFee`(150,000) /
  (五) `foreignMarketTransactionApprovalFee`(150,000) /
  (六) `financialExchangeHoldingCompanyApprovalFee`(150,000) /
  (七) `certifiedFinancialInstrumentsFirmAssociationCertFee`(150,000) /
  (八) `certifiedInvestorProtectionOrgCertFee`(90,000) /
  (九) `selfRegulatoryBusinessApprovalFee`(150,000)
- 四十一(一) `financialInstrumentsBusinessRegistrationFee`(150,000) /
  (二) `financialInstrumentsBusinessChangeRegistrationFee`(150,000) /
  (三) `financialInstrumentsBusinessApprovalFee`(150,000) /
  (四) `foreignSecuritiesUnderwritingPermissionFee`(90,000) /
  (五) `exchangeTransactionBusinessPermissionFee`(150,000) /
  (六) `electronicOtcDerivativeBusinessPermissionFee`(150,000) /
  (七) `financialInstrumentsIntermediaryRegistrationFee`(90,000) /
  (八) `creditRatingAgencyRegistrationFee`(90,000) /
  (九) `investmentManagementRelatedBusinessTrusteeRegistrationFee`(90,000) /
  (十) `financialInstrumentsBusinessChangeRegistrationArticle66_75Fee`(90,000) /
  (十一) `financialInstrumentClearingCorpDebtAssumptionLicenseFee`(150,000) /
  (十二) `foreignFinancialInstrumentClearingCorpDebtAssumptionLicenseFee`(150,000) /
  (十三) `linkedFinancialInstrumentDebtAssumptionApprovalFee`(150,000)
- 四十四 `securitiesFinanceCompanyLicenseFee`(150,000) /
  四十五 `specifiedFinancialCompanyRegistrationFee`(150,000)
- 四十六(一) `moneyLenderRegistrationFee`(150,000) /
  (二) `moneyLendingBusinessManagerTrainingInstitutionRegistrationFee`(90,000)
- 四十七(一) `mutualFinancingBusinessLicenseFee`(150,000) /
  (二) `mutualFinancingCompanyBranchOfficeApprovalFee`(90,000)
- 四十八(一) `financialServicesIntermediaryRegistrationFee`(90,000) /
  (二) `financialServicesIntermediaryChangeRegistrationFee`(90,000) /
  (三) `certifiedFinancialServicesIntermediaryAssociationCertFee`(150,000)
- 四十九(一) `thirdPartyPrepaidPaymentInstrumentIssuerRegistrationFee`(150,000) /
  (二) `fundsTransferServiceProviderRegistrationFee`(150,000) /
  (三) `fundsTransferServiceProviderChangeRegistrationFee`(150,000) /
  (四) `electronicPaymentInstrumentEtcTransactionBusinessRegistrationFee`(150,000) /
  (五) `electronicPaymentInstrumentEtcTransactionBusinessChangeRegistrationFee`(150,000) /
  (六) `cryptoAssetExchangeBusinessRegistrationFee`(150,000) /
  (七) `electronicPaymentCryptoAssetServiceIntermediaryRegistrationFee`(90,000) /
  (八) `electronicPaymentCryptoAssetServiceIntermediaryChangeRegistrationFee`(90,000) /
  (九) `foreignExchangeAnalysisBusinessPermissionFee`(150,000) /
  (十) `businessCategoryChangePermissionFee`(150,000) /
  (十一) `fundsClearingBusinessLicenseFee`(150,000) /
  (十二) `certifiedFundsSettlementBusinessAssociationCertFee`(150,000)

Spec: 上記 45 本に対応する `spec*` 定数 45 本（独立定式）と一致確認
`agreeRegistryQualificationFeesJ2 : Bool`（45 本すべて `==` 比較、`by decide` で `true`）1 本。
Tests: 新規定理名なし、45 本の金額 smoke（すべて `by decide`）。

### 原文どおりの読み取り（誠実性の境界）

- 免許・登録・認定・許可の要件・適用、および「免許件数」「登録件数」「認定件数」
  「許可件数」の意味上の区別は **caller-established**（一律 `Money` で扱う）。
- 適用判定 —「更新の登録を除く。」（四十六(一)(二)）、「業務の種別の増加に係るもの」
  「電子募集業務…を行うために受けるもの」（四十一(二)(十)）、
  「同項ただし書の商品先物取引…に共通する業務に係るものを除く。」（四十(二)）、
  「業務の種別の増加に係るものに限る。」（四十八(二)）等 — は **caller-established** とし、
  **Bool を金額式に入れていない**。
- 定額は「一件／一箇所につき」の **1 件・1 箇所あたり単価** のみを定義し、
  件数・箇所数を掛ける Nat 掛け算は行わない（呼び出し側が判断）。
- 四十二及び四十三「削除」は fee def を作らず caller-established と明記。
  原文に金額なし fee 行・デーミング規定・軽減額（「既に…については」型）は存在しない
  （千分／百分／割合／みな／既に／政令 の出現はいずれも 0 回を確認）。
- 三十八 以前・五十 以降、別表第一の他の号・他の条文、登録免許税の納付手続・端数処理の
  通則法的詳細は **NOT YET COVERED**。
- Pinned evidence is in doc-comments only; 各定理はモデルの性質のみを主張し、
  実法律の意味・解釈の正しさを主張しない（誠実性の原則）。

## 2. 転記監査に追加すべき check（JSON 断片）

`scripts/ci/transcription_audit.py` の `checks()` に追加する check の JSON 表現です
（`law_id` / `kind` / `title` / `needles` の 4 キー）。needle 文字列は一字も変えないこと。
**文字正規化・全角／半角変換・異体字変換を行わず、そのまま移してください。**
各 needle は担当範囲原文から抽出した連続部分そのもので、pinned JSON 正規化テキスト
（`re.sub(r"[\s\u3000]+", "", ...)`、平坦化は `transcription_audit.py` と同一ロジック）に
対し `.find()` / `.count()` で **一意（出現回数 1）** を確認済み。長さは 120 文字
（正規化後 117〜119 文字）で、指定の 60〜130 文字の範囲内です。

```json{
  "law_id": "342AC0000000035",
  "kind": "file",
  "title": null,
  "needles": [
    "三十九担保付社債に関する信託事業の免許担保付社債信託法第三条（免許）の担保付社債に関する信託事業の免許免許件数一件につき十五万円三十九の二企業価値担保権に関する信託業務の免許事業性融資の推進等に関する法律（令和六年法律第五十二号）第三十",
    "開設の認可、外国市場取引の認可、金融商品取引所持株会社に係る認可、認定金融商品取引業協会若しくは認定投資者保護団体の認定又は自主規制業務の認可（一）金融商品取引法第八十条第一項（免許）の金融商品市場の開設の免許免許件数一件につき十五万円（",
    "しくは金融商品取引所持株会社グループに属する二以上の会社（金融商品会員制法人を含む。）に共通する業務に係るものを除く。）認可件数一件につき十五万円（三）金融商品取引法第百一条の十七第一項（組織変更の認可）の組織変更の認可認可件数一件につき",
    "につき十五万円（六）金融商品取引法第百六条の十第一項又は第三項ただし書（認可等）の認可認可件数一件につき十五万円（七）金融商品取引法第七十八条第一項（認定金融商品取引業協会の認定）の認定金融商品取引業協会の認定認定件数一件につき十五万円",
    "自主規制業務の認可認可件数一件につき十五万円四十一金融商品取引業者の登録若しくは業務の認可、外国証券業者の引受業務、取引所取引業務若しくは電子店頭デリバティブ取引等業務の許可、金融商品仲介業者、信用格付業者若しくは投資運用関係業務受託業者",
    "の登録登録件数一件につき十五万円（二）金融商品取引法第三十一条第四項（変更登録等）の変更登録（同法第二十九条の二第一項第五号（登録の申請）の業務の種別の増加に係るもの、同項第六号の電子募集業務若しくは電子募集取扱業務を行うために受けるもの",
    "第二種少額電子募集取扱業務のみを行うために受けるものを除く。）又は同法第二十九条の二第一項第八号若しくは第九号の業務を行うために受けるものに限る。）登録件数一件につき十五万円（三）金融商品取引法第三十条第一項（認可）の業務の認可認可件数一",
    "許可件数一件につき十五万円（六）金融商品取引法第六十条の十四第一項（電子店頭デリバティブ取引等業務の許可）の電子店頭デリバティブ取引等業務の許可許可件数一件につき十五万円（七）金融商品取引法第六十六条（登録）の金融商品仲介業者の登録登録",
    "一件につき九万円（十）金融商品取引法第六十六条の七十五第四項（変更登録等）の変更登録（同法第六十六条の七十二第一項第六号（登録の申請）の業務の種別の増加に係るものに限る。）登録件数一件につき九万円（十一）金融商品取引法第百五十六条の二（",
    "つき十五万円（十三）金融商品取引法第百五十六条の二十の十六第一項（他の金融商品取引清算機関等と連携する場合の認可）の連携金融商品債務引受業務の認可認可件数一件につき十五万円四十二及び四十三削除四十四証券金融会社の免許金融商品取引法第百",
    "条（登録）の特定金融会社等の登録登録件数一件につき十五万円四十六貸金業者の登録又は貸金業務取扱主任者に係る登録講習機関の登録（一）貸金業法（昭和五十八年法律第三十二号）第三条第一項（登録）の内閣総理大臣がする貸金業者の登録（更新の登録を",
    "可（一）無尽業法（昭和六年法律第四十二号）第二条第一項（免許）の無尽業の免許免許件数一件につき十五万円（二）無尽業法第七条第三号（認可）の無尽会社の出張所又は代理店の設置の認可出張所又は代理店の数一箇所につき九万円四十八金融サービス仲",
    "（二）金融サービスの提供及び利用環境の整備等に関する法律第十六条第一項（変更登録等）の変更登録（同法第十三条第一項第四号（登録の申請）の業務の種別の増加に係るものに限る。）登録件数一件につき九万円（三）金融サービスの提供及び利用環境の整",
    "取引業者の登録、暗号資産交換業者の登録、電子決済手段・暗号資産サービス仲介業者の登録、為替取引分析業者の許可、資金清算業の免許又は認定資金決済事業者協会の認定（一）資金決済に関する法律（平成二十一年法律第五十九号）第七条（第三者型発行者の",
    "法律第四十一条第一項（変更登録等）の変更登録登録件数一件につき十五万円（四）資金決済に関する法律第六十二条の三（電子決済手段等取引業者の登録）の電子決済手段等取引業者の登録登録件数一件につき十五万円（五）資金決済に関する法律第六十二条の",
    "法律第六十三条の二十二の二（電子決済手段・暗号資産サービス仲介業者の登録）の電子決済手段・暗号資産サービス仲介業者の登録登録件数一件につき九万円（八）資金決済に関する法律第六十三条の二十二の六第一項（変更登録等）の変更登録登録件数一件につ",
    "の許可等）の変更の許可許可件数一件につき十五万円（十一）資金決済に関する法律第六十四条第一項（資金清算機関の免許等）の資金清算業の免許免許件数一件につき十五万円（十二）資金決済に関する法律第八十七条（認定資金決済事業者協会の認定）の認定"
  ]
}```

参考：現行スクリプト形式への変換例（name は任意、needles は上記 17 本を一字も変えずに列挙）:

```python
yield ("登録免許税法 別表第一（二）（三十九〜四十九 担保付社債信託事業・各種金融業登録等）↔ RegistryQualificationFeesJ2.lean",
       "342AC0000000035",
       "file", None,
       [ ...上記 needles 17 本を一字も変えずに列挙... ])
```

## 3. 検証結果（すべて本セッションで実行済み）

- `lake build JapanTaxLaw.RegistryQualificationFeesJ2 JapanTaxLaw.RegistryQualificationFeesJ2Spec JapanTaxLaw.RegistryQualificationFeesJ2Tests`
  → **成功（5 jobs、warning なし）**。※自作 3 モジュールのみビルド（全体ビルド／CI／
  `run_python_gates.py` は実行していません）。
- `python scripts/ci/check_no_sorry.py` →
  `no forbidden placeholder proofs found in tracked Lean sources`。
  （新規 3 ファイルは未追跡のため走査対象外ですが、リポジトリの
  `strip_comments_and_strings` と同一ロジックで個別に走査し、3 ファイルとも
  `sorry` / `admit` が **0 件**であることを別途確認済み。）
- `#print axioms`（一時ファイル `WAC_AxiomProbe.lean` を approved temp dir に作成、
  `lake env lean` で実行後 **削除済み**）:
  - 名前付き宣言 **136 件**（実装 def 45 + theorem 45 + Spec def 46）を走査。
  - `Classical.choice` / `sorryAx` は **0 件**。
  - **136 件すべてが `does not depend on any axioms`**（`[propext]` 依存も 0 件）。
- 原文逐語検証（needle を `re.sub(r"[\s\u3000]+", "", ...)` 正規化テキストに対して
  Python `.find()` / `.count()`）:
  - 担当範囲原文 `reg_qual_B.txt`（正規化後 3,613 文字）:
    **17/17 FOUND、MISS 0 件**、各出現回数 1。
  - pinned JSON `law_full_text`（正規化後 211,508 文字。平坦化は
    `transcription_audit.py` と同一ロジック）:
    **17/17 FOUND、MISS 0 件**、各出現回数 1。
  - 参考: 担当範囲原文の正規化文字列は pinned JSON 正規化文字列の offset 151638 から
    そのまま一致（3,613 文字すべて逐語一致）。
  - 一時検証スクリプト・出力・axiom probe はすべて削除済み（担当範囲原文
    `reg_qual_B.txt` は残置）。

### 逐語 FOUND / MISS 一覧（一字も変更せず）

| # | 担当範囲原文 off | len(raw/norm) | 原文@/count | JSON@/count | 結果 |
| --- | --- | --- | --- | --- | --- |
| 1 | 0 | 120/118 | 0/1 | 151638/1 | FOUND |
| 2 | 220 | 120/119 | 220/1 | 151855/1 | FOUND |
| 3 | 440 | 120/119 | 440/1 | 152073/1 | FOUND |
| 4 | 660 | 120/118 | 660/1 | 152290/1 | FOUND |
| 5 | 880 | 120/119 | 880/1 | 152506/1 | FOUND |
| 6 | 1100 | 120/119 | 1100/1 | 152724/1 | FOUND |
| 7 | 1320 | 120/119 | 1320/1 | 152943/1 | FOUND |
| 8 | 1540 | 120/118 | 1540/1 | 153160/1 | FOUND |
| 9 | 1760 | 120/118 | 1760/1 | 153376/1 | FOUND |
| 10 | 1980 | 120/117 | 1980/1 | 153593/1 | FOUND |
| 11 | 2200 | 120/118 | 2200/1 | 153809/1 | FOUND |
| 12 | 2420 | 120/117 | 2420/1 | 154025/1 | FOUND |
| 13 | 2640 | 120/118 | 2640/1 | 154241/1 | FOUND |
| 14 | 2860 | 120/119 | 2860/1 | 154458/1 | FOUND |
| 15 | 3080 | 120/118 | 3080/1 | 154675/1 | FOUND |
| 16 | 3300 | 120/119 | 3300/1 | 154891/1 | FOUND |
| 17 | 3520 | 120/118 | 3520/1 | 155108/1 | FOUND |

**FOUND 17 / MISS 0**（両テキストで出現回数 1、一意）。needle の長さは 120 文字
（正規化後 117〜119 文字、指定 60〜130 文字内）。アンカーの勝手な変更・正規化・
文字変換はしていません（原文の `若しくは` / `に掲げる` / 全角空白等も保持）。

## 4. README / PROGRESS に足す 1 行文案

CROSS_LAW の scan/pin 件数や監査 literal 総数はメインセッションが計算するため、ここでは書きません。

- **README.md**（登録免許税モジュール一覧の末尾付近、例: `RegistryCorporateSecurityFees.lean` 行の直後に追加）:
  ```text
  JapanTaxLaw/RegistryQualificationFeesJ2.lean / -Spec.lean / -Tests.lean  # 登録免許税法 別表第一（二）三十九〜四十九の担保付社債信託事業・金融商品取引業・貸金業・無尽業・金融サービス仲介業・資金決済関連の免許/登録/認定/許可手数料（定額 45 件 90,000/150,000 円、件数・該当性は caller-established、四十二及び四十三は削除で fee def なし）L4 モデル・独立定式・退行テスト
  ```
- **docs/PROGRESS.md**（L4 着手済みモジュール一覧の末尾に追記）:
  ```text
  登録免許税法 別表第一（二）（RegistryQualificationFeesJ2.lean：担保付社債信託事業・企業価値担保権信託業務・金融商品市場開設/金融商品取引業/貸金業/無尽業/金融サービス仲介業/資金決済関連等の免許・登録・認定・許可手数料を 45 定額型（一件/一箇所あたり 90,000 円 12 件 + 150,000 円 33 件、割合型なし）でモデル化、件数・更新登録除く等の該当性は caller-established、四十二及び四十三は削除、他の号・条文は NOT YET COVERED）
  ```

## 5. インテグレーターへの明示事項

**インテグレーターは `JapanTaxLaw.lean` に以下の 3 つの import を追加すること。**

```lean
import JapanTaxLaw.RegistryQualificationFeesJ2
import JapanTaxLaw.RegistryQualificationFeesJ2Spec
import JapanTaxLaw.RegistryQualificationFeesJ2Tests
```

（他ワーカーの 3 件ずつと併せてメインが行数を確認してください。
W-AC は `JapanTaxLaw.lean` を書き換えていません。他ワーカーのファイルには触れていません。）

## 6. 範囲・残ブロッカーの正直な申告（最終報告）

- **build**: 自作 3 モジュールのみ `lake build` 成功（5 jobs / warning なし）。全体ビルド・CI・
  `run_python_gates.py` は未実行です。
- **axiom**: 走査 136 件（実装 def 45 + theorem 45 + Spec def 46）、
  `Classical.choice` / `sorryAx` なし。136 件すべて axiom-free（`[propext]` 依存も 0 件）。
  一時ファイルは削除済み。
- **逐語**: FOUND 17 / MISS 0（担当範囲原文・pinned JSON の両方、出現回数 1、
  needle 長 120 文字 / 正規化後 117〜119 文字）。
- **def 数**: 実装 45 + theorem 45 + Spec 46 = **名前付き宣言 136**
  （＋ `by decide` の example 136 件）。Tests は新規定理名なし。
- **STAGING**: 本ファイル `docs/STAGING_WAC.md` を作成済みです。
- これは **L4 のごく小さなスライド**です。**完成・網羅を主張しません**。
- 担当は 登録免許税法 別表第一（二）の**三十九〜四十九（担保付社債信託事業・各種金融業
  登録等）のみ**。三十八 以前・五十 以降、別表第一の他の号・他の条文、登録免許税の納付手続・
  端数処理の通則法的詳細は **NOT YET COVERED**。
- 件数・箇所数、免許／登録／認定／許可の区分、更新の登録を除く等の適用判定、および
  「免許件数」「登録件数」「認定件数」「許可件数」の意味上の区別はすべて caller-established
  とし、法的判断の自動化・Bool の金額式への組込みはしていません。
- 定額は一件／一箇所あたり単価のみを定義し、件数・箇所数の掛け算はしていません。
- 四十二及び四十三は「削除」のため fee def を作らず caller-established と明記しました。
- 本範囲に割合型（千分のX）は存在しないため `TaxRate` は導入しておらず、
  分母 10000 の 10 倍過大バグの警戒対象はありません。
- `agreeRegistryQualificationFeesJ2` は 45 本の定数に対する `==` 一致確認であり、
  法的意味の等価証明ではありません。
- 転記監査は fidelity-only（原文 bytes との一致確認）であり、法的正しさを保証しません。
- **L7 候補 3,438 件は unreviewed のまま**です（本スライドでは一切レビューしていません）。
- 残ブロッカー: 転記監査 check の `checks()` への組み込み（§2、+17 needles）、
  `JapanTaxLaw.lean` への import 追加（§5）、README / PROGRESS の 1 行追記（§4）、
  および全体ビルド・CI ゲートの実行は**すべてメインセッションの担当**です
  （W-AC は実行していません）。
