# STAGING — W-Z（登録免許税法 別表第一（二）二十二〜二十五 外国会社・投資法人等手数料 L4 モデル）受け渡しメモ

> 実装担当 W-Z からメインセッション（統合担当）への受け渡し用。
> ブランチ操作・add/commit/push/merge は一切していません。
> 書き換えたのは下記 4 ファイルのみです（他は読み取り専用）。

## 0. 対象ファイル / pinned source

| ファイル | 状態 |
| --- | --- |
| `JapanTaxLaw/RegistryForeignCompanyFees.lean` | 新規 |
| `JapanTaxLaw/RegistryForeignCompanyFeesSpec.lean` | 新規 |
| `JapanTaxLaw/RegistryForeignCompanyFeesTests.lean` | 新規 |
| `docs/STAGING_WZ.md` | 新規（本ファイル） |

pinned source: `data/raw/342AC0000000035_20261101_508AC0000000021.law.json`
law id `342AC0000000035` / revision `342AC0000000035_20261101_508AC0000000021`
amendment enforcement date `2026-11-01`（他 Registry* モジュールと同一ピン）。
担当範囲原文: `C:\Users\junny\AppData\Local\Temp\opencode\reg_rem_B.txt`
（二十二 鉱業権の末尾 / 二十三 漁業権又は入漁権の登録 / 二十四 会社又は外国会社の商業登記 /
二十五 特定目的会社の登記、UTF-8、raw 3,500 文字 / 正規化後 3,412 文字）。

Namespace: `JapanTaxLaw.RegistryForeignCompanyFees`（専用サブ名前空間。
他ワーカー／既存モジュールと衝突しません）。`open JapanTaxLaw.TaxFinance`
（`Money = Nat`、`TaxRate`、`applyFloor`）。

## 1. 追加した宣言一覧

原文を一字も誤らず読み、金額・率を確定（日本語数字 → Arabic）:

- **割合型 2 件**（税率定数 `TaxRate` + 税額関数 `base.applyFloor`、整数千分率は分母 1000）:
  - 二十三（七） 債権金額、極度金額又は工事費用の予算金額「千分の四」→ `⟨4, 1000⟩`
  - 二十三（十）イ 債権金額又は極度金額「千分の二」→ `⟨2, 1000⟩`
  - 小数点表記（二・五／一・五）は本範囲に現れません。
- **定額型 `Money` 定数 42 件**（一件／一箇所／一個あたり単価、件数・箇所数・個数の
  乗算は行わない）: 1,000 / 1,500 / 1,800 / 2,000 / 3,000 / 4,500 / 6,000 / 9,000 /
  10,000 / 15,000 / 20,000 / 30,000 / 60,000 / 90,000 / 300,000 円。

| ファイル | def | theorem | example |
| --- | --- | --- | --- |
| `RegistryForeignCompanyFees.lean` | 46（税率 2 + 税額関数 2 + 定額 42） | 44（税率分母正性 2 + 定額正性 42） | 50 |
| `RegistryForeignCompanyFeesSpec.lean` | 45（独立整数定式 2 + 定額 42 + `agree` 1） | 0 | 47 |
| `RegistryForeignCompanyFeesTests.lean` | 0 | 0 | 106 |

**名前付き宣言総数 135（90 + 45）、`by decide` の example は 203 件（50 + 47 + 106）。**

### 実装 def 一覧（`.lean`）

税率定数（`TaxRate`, 分母 1000）2 本:
`fishingRightLienPreservationRate`(4), `fishingRightLienTrustRate`(2)。

税額関数（`Money → Money` = `Rate.applyFloor base`）2 本:
`fishingRightLienPreservationFee`, `fishingRightLienTrustFee`。

定額定数（`Money`）42 本:

- 二十二（末尾・十四）: `miningAreaChangeRegistrationFeePerArea`(1,000),
  `miningAreaCancellationFeePerArea`(1,000)。
- 二十三 漁業権／入漁権:
  `fishingRightTransferByInheritanceOrMergerFeePerCase`(1,800),
  `fishingRightTransferOtherFeePerCase`(9,000),
  `fishingRightShareTransferByInheritanceOrMergerFeePerCase`(1,500),
  `fishingRightShareTransferOtherFeePerCase`(3,000),
  `anglingRightEstablishmentFeePerCase`(6,000),
  `anglingRightPreservationFeePerCase`(1,500),
  `anglingRightTransferByInheritanceOrMergerFeePerCase`(1,500),
  `anglingRightTransferOtherFeePerCase`(4,500),
  `anglingRightShareTransferByInheritanceOrMergerFeePerCase`(1,500),
  `anglingRightShareTransferOtherFeePerCase`(3,000),
  `lienOrMortgageTransferByInheritanceOrMergerFeePerCase`(1,500),
  `lienOrMortgageTransferOtherFeePerCase`(3,000),
  `mortgageRankChangeFeePerCase`(1,000),
  `nonLienOrMortgageRightTrustFeePerCase`(4,500),
  `fishingIncidentalOrRestorationOrCorrectionFeePerCase`(1,000),
  `fishingRightCancellationFeePerCase`(1,000)。
- 二十四（一）リ〜ナ:
  `mutualCompanyEstablishmentFeePerApplication`(300,000),
  `newShareOptionIssuanceChangeFeePerApplication`(90,000),
  `branchOrSubsidiaryOfficeEstablishmentFeePerOffice`(60,000),
  `headOrBranchOfficeRelocationFeePerOffice`(30,000),
  `boardAndCommitteeMatterChangeFeePerApplication`(30,000),
  `directorAndOfficerMatterChangeFeePerApplication`(30,000),
  `directorAndOfficerMatterChangeSmallCapitalFeePerApplication`(10,000),
  `managerAppointmentOrAgencyRevocationFeePerApplication`(30,000),
  `directorDutySuspensionOrSubstituteAppointmentFeePerApplication`(30,000),
  `companyDissolutionFeePerApplication`(30,000),
  `companyContinuationOrRestorationFeePerApplication`(30,000),
  `companyMiscRegistrationChangeFeePerApplication`(30,000),
  `companyCorrectionFeePerApplication`(20,000),
  `companyCancellationFeePerApplication`(20,000)。
- 二十四（二）外国会社:
  `foreignCompanyBusinessOfficeEstablishmentFeePerOffice`(90,000),
  `foreignCompanyWithoutBusinessOfficeRegistrationFeePerApplication`(60,000),
  `foreignCompanyOtherRegistrationFeePerApplication`(9,000),
  `foreignCompanyCorrectionOrCancellationFeePerApplication`(6,000)。
- 二十四（三）清算:
  `foreignCompanyLiquidatorAppointmentFeePerApplication`(9,000),
  `foreignCompanyLiquidatorDutySuspensionFeePerApplication`(6,000),
  `foreignCompanyLiquidationCompletionFeePerApplication`(2,000),
  `foreignCompanyLiquidationMiscFeePerApplication`(6,000)。
- 二十五 特定目的会社:
  `specialPurposeCompanyEstablishmentFeePerApplication`(30,000),
  `specialPurposeCompanyOtherRegistrationFeePerApplication`(15,000)。

Spec: 上記税額関数に対応する `spec*Fee`（`(base * X) / 1000` の独立整数定式）2 本、
定額 `spec*` 42 本、一致確認 `agreeRegistryForeignCompanyFees : Bool`
（基底 `[0,1,39,40,66,67,99,100,249,250,333,334,499,500,999,1000,1001,12345,100000,1000000]`
で impl ≡ spec を `==` 比較）1 本。

Tests: 新規定理名なし、各税率定数の分子・分母・正性、各定額の金額・正性、
各割合型の 0→0 / 1000→分子、および端数境界の代表例
（4/1000: 249→0, 250→1, 999→3, 1001→4, 12345→49 / 2/1000: 499→0, 500→1, 999→1, 1001→2, 12345→24）
の smoke（全て `by decide`）。

### 原文どおりの読み取り（誠実性の境界）

- 課税標準（「債権金額」「極度金額」「工事費用の予算金額」）、申請件数、漁業権・入漁権の
  件数、営業所・支店・事務所の箇所数、試掘区域・貯留区域の数は **caller-established** と明記。
  本モジュールは与えられた値に税率・単価を適用する算術のみを扱い、値の算定手続は扱わない。
- 各区分への該当性（設定／移転／持分の移転／信託／付記・仮登録・回復・更正・変更・抹消、
  相続若しくは法人の合併によるかその他か、外国会社若しくは外国相互会社か、清算の結了か、
  資本金が一億円以下か 等）は **caller-established** とし、**Bool を金額式に入れていない**。
- 定額は「一件／一箇所／一個につき」の **1 件・1 箇所・1 個あたり単価** のみを定義し、
  件数・箇所数・個数を掛ける Nat 掛け算はしていない（呼び出し側が判断）。
- 割合型の丸めは `TaxRate.applyFloor`（切り捨て）を採用（per-law business data として
  明示）。割合型は `base` が小さいと 0 になり得るため strict positivity は主張せず、
  税率定数の `den_pos` と税額関数の smoke を付与した。
- **境界**: 二十四（一）イ〜チ（株式会社等の設立・増加、最低税額 3/6/15 万円）は
  `RegistrationCommercialTax.lean` / `RegistrationCommercialTaxTable.lean` の担当のため
  重複定義していない。二十五（三）登記の抹消は原文が「申請件数一件に」で切れており
  金額を確定できないため **NOT COVERED**。他の号・条文、納付手続・端数処理の通則法的詳細も
  **NOT YET COVERED**。
- Pinned evidence is in doc-comments only; 各定理はモデルの性質のみを主張し、
  実法律の意味を主張しない（誠実性の原則）。

## 2. 転記監査に追加すべき check（JSON 断片）

`scripts/ci/transcription_audit.py` の `checks()` に追加する check の JSON 表現です
（`law_id` / `kind` / `title` / `needles` の 4 キー）。needle 文字列は一字も変えないこと。
**文字正規化・全角／半角変換・異体字変換を行わず、そのまま移してください。**
各 needle は正規化テキスト（空白・全角空白除去）上の連続部分そのもので、
担当範囲原文・pinned JSON の両方で出現回数 **1**（一意）、長さ 125 文字です。

```json
{
  "law_id": "342AC0000000035",
  "kind": "file",
  "title": null,
  "needles": [
    "変更の登録（これらの登録のうち（一）から（十二）までに掲げるものを除く。）試掘区域又は貯留区域の数一個につき千円（十四）登録の抹消試掘区域又は貯留区域の数一個につき千円二十三漁業権又は入漁権の登録（漁業権又は入漁権の信託の登録を含む。）（一）漁業権の",
    "三漁業権又は入漁権の登録（漁業権又は入漁権の信託の登録を含む。）（一）漁業権の移転の登録イ相続又は法人の合併による移転の登録漁業権の件数一件につき千八百円ロその他の原因による移転の登録漁業権の件数一件につき九千円（二）漁業権の持分の移転の登録イ相続又",
    "。）（一）漁業権の移転の登録イ相続又は法人の合併による移転の登録漁業権の件数一件につき千八百円ロその他の原因による移転の登録漁業権の件数一件につき九千円（二）漁業権の持分の移転の登録イ相続又は法人の合併による移転の登録漁業権の件数一件につき千五百円ロ",
    "る移転の登録漁業権の件数一件につき千五百円ロその他の原因による移転の登録漁業権の件数一件につき三千円（三）入漁権の設定の登録入漁権の件数一件につき六千円（四）入漁権の保存の登録入漁権の件数一件につき千五百円（五）入漁権の移転の登録イ相続又は法人の合併",
    "百円（五）入漁権の移転の登録イ相続又は法人の合併による移転の登録入漁権の件数一件につき千五百円ロその他の原因による移転の登録入漁権の件数一件につき四千五百円（六）入漁権の持分の移転の登録イ相続又は法人の合併による移転の登録入漁権の件数一件につき千五百",
    "くは担保不動産収益執行に係る差押え、仮差押え、仮処分又は抵当付債権の差押えその他権利の処分の制限の登録債権金額、極度金額又は工事費用の予算金額千分の四（八）先取特権又は抵当権の移転の登録イ相続又は法人の合併による移転の登録漁業権の件数一件につき千五百",
    "件数一件につき三千円（九）抵当権の順位の変更の登録抵当権の件数一件につき千円（十）信託の登録イ先取特権又は抵当権の信託の登録債権金額又は極度金額千分の二ロ先取特権及び抵当権以外の権利の信託の登録漁業権又は入漁権の件数一件につき四千五百円（十一）付記登",
    "の登録漁業権の件数一件につき千五百円ロその他の原因による移転の登録漁業権の件数一件につき三千円（九）抵当権の順位の変更の登録抵当権の件数一件につき千円（十）信託の登録イ先取特権又は抵当権の信託の登録債権金額又は極度金額千分の二ロ先取特権及び抵当権以外",
    "資本金の増加の登記増加した資本金の額千分の七（これによつて計算した税額が三万円に満たないときは、申請件数一件につき三万円）リ相互会社の設立（新設合併又は組織変更による設立を含む。）の登記申請件数一件につき三十万円ヌ新株予約権の発行による変更の登記申請",
    "きは、申請件数一件につき三万円）リ相互会社の設立（新設合併又は組織変更による設立を含む。）の登記申請件数一件につき三十万円ヌ新株予約権の発行による変更の登記申請件数一件につき九万円ル支店又は従たる事務所の設置の登記支店又は従たる事務所の数一箇所につき",
    "又は組織変更による設立を含む。）の登記申請件数一件につき三十万円ヌ新株予約権の発行による変更の登記申請件数一件につき九万円ル支店又は従たる事務所の設置の登記支店又は従たる事務所の数一箇所につき六万円ヲ本店若しくは主たる事務所又は支店若しくは従たる事務",
    "又は従たる事務所の設置の登記支店又は従たる事務所の数一箇所につき六万円ヲ本店若しくは主たる事務所又は支店若しくは従たる事務所の移転の登記本店若しくは主たる事務所又は支店若しくは従たる事務所の数一箇所につき三万円ワ取締役会、監査役会、監査等委員会若しく",
    "くは従たる事務所の移転の登記本店若しくは主たる事務所又は支店若しくは従たる事務所の数一箇所につき三万円ワ取締役会、監査役会、監査等委員会若しくは指名委員会等（会社法第二条第十二号（定義）に規定する指名委員会等をいう。以下（一）において同じ。）又は理事",
    "若しくは評議員の職務執行の停止若しくは職務代行者の選任の登記申請件数一件につき三万円レ会社又は相互会社若しくは一般社団法人等の解散の登記申請件数一件につき三万円ソ会社若しくは一般社団法人等の継続の登記、合併を無効とする判決が確定した場合における合併に",
    "万円ツ登記事項の変更、消滅又は廃止の登記（これらの登記のうちイからソまでに掲げるものを除く。）申請件数一件につき三万円ネ登記の更正の登記申請件数一件につき二万円ナ登記の抹消申請件数一件につき二万円（二）外国会社又は外国相互会社の登記（（三）に掲げる登",
    "登記（これらの登記のうちイからソまでに掲げるものを除く。）申請件数一件につき三万円ネ登記の更正の登記申請件数一件につき二万円ナ登記の抹消申請件数一件につき二万円（二）外国会社又は外国相互会社の登記（（三）に掲げる登記を除く。）イ営業所の設置の登記（ロ",
    "につき二万円（二）外国会社又は外国相互会社の登記（（三）に掲げる登記を除く。）イ営業所の設置の登記（ロに掲げる登記を除く。）営業所の数一箇所につき九万円ロ営業所を設置していない場合の外国会社の登記又は当該営業所を設置していない外国会社が初めて設置する",
    "外国相互会社の登記（（三）に掲げる登記を除く。）イ営業所の設置の登記（ロに掲げる登記を除く。）営業所の数一箇所につき九万円ロ営業所を設置していない場合の外国会社の登記又は当該営業所を設置していない外国会社が初めて設置する一の営業所の設置の登記申請件数",
    "い場合の外国会社の登記又は当該営業所を設置していない外国会社が初めて設置する一の営業所の設置の登記申請件数一件につき六万円ハイ、ロ及びニに掲げる登記以外の登記申請件数一件につき九千円ニ登記の更正の登記又は登記の抹消申請件数一件につき六千円（三）会社又",
    "が初めて設置する一の営業所の設置の登記申請件数一件につき六万円ハイ、ロ及びニに掲げる登記以外の登記申請件数一件につき九千円ニ登記の更正の登記又は登記の抹消申請件数一件につき六千円（三）会社又は相互会社若しくは一般社団法人等の清算に係る登記（外国会社又",
    "つき六千円（三）会社又は相互会社若しくは一般社団法人等の清算に係る登記（外国会社又は外国相互会社の清算に係る登記を含む。）イ清算人又は代表清算人の登記申請件数一件につき九千円ロ清算人若しくは代表清算人の職務執行の停止若しくはその取消し若しくは変更又は",
    "しくはその取消し若しくは変更又は清算人若しくは代表清算人の職務代行者の選任、解任若しくは変更の登記申請件数一件につき六千円ハ清算の結了の登記申請件数一件につき二千円ニ登記事項の変更、消滅若しくは廃止の登記（これらの登記のうちロに掲げるものを除く。）、",
    "一件につき六千円二十五特定目的会社の登記（一）資産の流動化に関する法律（平成十年法律第百五号）第二条第三項（定義）に規定する特定目的会社の設立の登記申請件数一件につき三万円（二）（一）及び（三）に掲げる登記以外の登記申請件数一件につき一万五千円（三）",
    "定目的会社の登記（一）資産の流動化に関する法律（平成十年法律第百五号）第二条第三項（定義）に規定する特定目的会社の設立の登記申請件数一件につき三万円（二）（一）及び（三）に掲げる登記以外の登記申請件数一件につき一万五千円（三）登記の抹消申請件数一件に"
  ]
}
```

参考：現行スクリプト形式への変換例（name は任意、needles は上記 24 本を一字も変えずに列挙）:

```python
yield ("登録免許税法 別表第一（二）（二十二〜二十五 外国会社・投資法人等手数料）↔ RegistryForeignCompanyFees.lean",
       "342AC0000000035",
       "file", None,
       [ ...上記 needles 24 本を一字も変えずに列挙... ])
```

## 3. 検証結果（すべて本セッションで実行済み）

- `lake build JapanTaxLaw.RegistryForeignCompanyFees JapanTaxLaw.RegistryForeignCompanyFeesSpec JapanTaxLaw.RegistryForeignCompanyFeesTests`
  → **成功（5 jobs、warning なし）**。※自作 3 モジュールのみビルド（全体ビルド／CI／
  `run_python_gates.py` は実行していません）。途中、漁業権／入漁権の同名 def 衝突が
  発生しましたが、`anglingRight*`（入漁権）と `fishingRight*`（漁業権）に分離して解消済みです。
- `python scripts/ci/check_no_sorry.py` →
  `no forbidden placeholder proofs found in tracked Lean sources`。
  （新規 3 ファイルは未追跡のため走査対象外ですが、同一ロジックで個別に走査し、
  `sorry` / `admit` が **0 件**であることを別途確認済み。）
- `#print axioms`（一時ファイル `WZ_AxiomProbe.lean` を approved temp dir に作成、
  `lake env lean` で実行後 **削除済み**）:
  - 名前付き宣言 **135 件**（実装 def 46 + theorem 44 + Spec def 45）を走査。
  - `Classical.choice` / `sorryAx` / `propext` は **0 件**。
  - **135 件すべてが `does not depend on any axioms`**。
- 原文逐語検証（needle を `re.sub(r"[\s\u3000]+", "", ...)` 正規化テキストに対して
  Python `.find()` / `.count()`）:
  - 担当範囲原文 `reg_rem_B.txt`（正規化後 3,412 文字）:
    **24/24 FOUND、MISS 0 件**、各出現回数 1、長さ 125 文字。
  - pinned JSON `law_full_text`（正規化後 211,508 文字。平坦化は
    `transcription_audit.py` と同一ロジック）:
    **24/24 FOUND、MISS 0 件**、各出現回数 1。
  - 参考: 担当範囲原文の正規化文字列は pinned JSON 正規化文字列の offset 136008 から
    そのまま一致（3,412 文字すべて逐語一致）。
  - 一時検証スクリプト・出力・axiom probe はすべて削除済み（担当範囲原文
    `reg_rem_B.txt` は残置）。

### 逐語 FOUND / MISS 一覧（一字も変更せず）

| # | 区分 | len | 原文@/count | JSON@/count | 結果 |
| --- | --- | --- | --- | --- | --- |
| 1 | 二十二末尾・二十三 header | 125 | 0/1 | 136008/1 | FOUND |
| 2 | 二十三（一）（二）漁業権移転 | 125 | 86/1 | 136094/1 | FOUND |
| 3 | 二十三（一）（二）漁業権・千八百/九千/千五百 | 125 | 116/1 | 136124/1 | FOUND |
| 4 | 二十三（二）（三）（四）（五） | 125 | 219/1 | 136227/1 | FOUND |
| 5 | 二十三（五）（六）入漁権 千五百/四千五百 | 125 | 320/1 | 136328/1 | FOUND |
| 6 | 二十三（七）千分の四・（八） | 125 | 507/1 | 136515/1 | FOUND |
| 7 | 二十三（九）（十）千分の二・（十一） | 125 | 652/1 | 136660/1 | FOUND |
| 8 | 二十三（八）（九）（十） | 125 | 615/1 | 136623/1 | FOUND |
| 9 | 二十四（一）ニ〜リ 相互会社設立 30万 | 125 | 1845/1 | 137853/1 | FOUND |
| 10 | 二十四（一）リ・ヌ・ル | 125 | 1890/1 | 137898/1 | FOUND |
| 11 | 二十四（一）ヌ・ル・ヲ | 125 | 1919/1 | 137927/1 | FOUND |
| 12 | 二十四（一）ル・ヲ・ワ | 125 | 1983/1 | 137991/1 | FOUND |
| 13 | 二十四（一）ヲ・ワ（指名委員会等） | 125 | 2037/1 | 138045/1 | FOUND |
| 14 | 二十四（一）タ・レ・ソ | 125 | 2517/1 | 138525/1 | FOUND |
| 15 | 二十四（一）ツ・ネ・ナ・（二）header | 125 | 2729/1 | 138737/1 | FOUND |
| 16 | 二十四（一）ネ・ナ・（二）header・イ | 125 | 2747/1 | 138755/1 | FOUND |
| 17 | 二十四（二）イ 営業所 9万・ロ | 125 | 2821/1 | 138829/1 | FOUND |
| 18 | 二十四（二）イ・ロ | 125 | 2836/1 | 138844/1 | FOUND |
| 19 | 二十四（二）ロ・ハ・ニ | 125 | 2908/1 | 138916/1 | FOUND |
| 20 | 二十四（二）ハ・ニ・（三）header | 125 | 2938/1 | 138946/1 | FOUND |
| 21 | 二十四（三）header・イ・ロ | 125 | 3022/1 | 139030/1 | FOUND |
| 22 | 二十四（三）ロ・ハ・ニ | 125 | 3131/1 | 139139/1 | FOUND |
| 23 | 二十五 header・（一）（二）（三） | 125 | 3275/1 | 139283/1 | FOUND |
| 24 | 二十五（一）（二）（三） | 125 | 3287/1 | 139295/1 | FOUND |

**FOUND 24 / MISS 0**（両テキストで出現回数 1、一意）。needle の長さは 125 文字。
アンカーの勝手な変更・正規化・文字変換はしていません（原文の `若しくは` / `に掲げる` /
旧仮名遣い `に関し` 等も保持）。

## 4. README / PROGRESS に足す 1 行文案

CROSS_LAW の scan/pin 件数や監査 literal 総数はメインセッションが計算するため、ここでは書きません。

- **README.md**（登録免許税モジュール一覧の末尾付近に追加）:
  ```text
  JapanTaxLaw/RegistryForeignCompanyFees.lean / -Spec.lean / -Tests.lean  # 登録免許税法 別表第一（二）の鉱業権末尾・漁業権/入漁権・会社/外国会社商業登記・特定目的会社の手数料（定額 42 件 1,000〜300,000 円 + 割合型 2 件 4/2 千分率、課税標準・件数・該当性は caller-established）L4 モデル・独立定式・退行テスト
  ```
- **docs/PROGRESS.md**（L4 着手済みモジュール一覧の末尾に追記）:
  ```text
  登録免許税法 別表第一（二）（RegistryForeignCompanyFees.lean：二十二〜二十五の外国会社・投資法人等手数料を 42 定額型（一件/一箇所/一個あたり 1,000〜300,000 円）+ 2 割合型（千分の四=4/1000、千分の二=2/1000、債権金額等基準・切り捨て）でモデル化、課税標準・件数・該当性は caller-established、二十四（一）イ〜チは別モジュール担当、二十五（三）他は NOT YET COVERED）
  ```

## 5. インテグレーターへの明示事項

**インテグレーターは `JapanTaxLaw.lean` に以下の 3 つの import を追加すること。**

```lean
import JapanTaxLaw.RegistryForeignCompanyFees
import JapanTaxLaw.RegistryForeignCompanyFeesSpec
import JapanTaxLaw.RegistryForeignCompanyFeesTests
```

（他ワーカーの 3 件ずつと併せてメインが行数を確認してください。
W-Z は `JapanTaxLaw.lean` を書き換えていません。他ワーカーのファイルには触れていません。）

## 6. 範囲・残ブロッカーの正直な申告（最終報告）

- **build**: 自作 3 モジュールのみ `lake build` 成功（5 jobs / warning なし）。全体ビルド・CI・
  `run_python_gates.py` は未実行です。
- **axiom**: 走査 135 件（実装 def 46 + theorem 44 + Spec def 45）、
  `Classical.choice` / `sorryAx` / `propext` なし。135 件すべて axiom-free。一時ファイルは削除済み。
- **逐語**: FOUND 24 / MISS 0（担当範囲原文・pinned JSON の両方、出現回数 1、長さ 125）。
- **def 数**: 実装 46（税率 2 + 税額関数 2 + 定額 42）+ theorem 44 + Spec 45
  = **名前付き宣言 135**（＋ `by decide` の example 203 件）。Tests は新規定理名なし。
- **STAGING**: 本ファイル `docs/STAGING_WZ.md` を作成済みです。
- これは **L4 のごく小さなスライド**です。**完成・網羅を主張しません**。
- 担当は 別表第一（二）の **二十二（末尾）/ 二十三 漁業権・入漁権 /
  二十四（一）リ〜ナ・（二）外国会社・（三）清算 / 二十五 特定目的会社 のみ**。
  二十四（一）イ〜チ（株式会社等の設立・増加、最低税額）は既存モジュール担当のため重複せず、
  二十五（三）は原文が「申請件数一件に」で切れており金額を確定できないため NOT COVERED。
  別表第一の他の号・他の条文、登録免許税の納付手続・端数処理の通則法的詳細は **NOT YET COVERED**。
- 課税標準（債権金額、極度金額、工事費用の予算金額）、申請件数、漁業権・入漁権の件数、
  営業所・支店・事務所の箇所数、試掘区域・貯留区域の数、各区分への該当性はすべて
  caller-established とし、法的判断の自動化・Bool の金額式への組込みはしていません。
- 定額は一件／一箇所／一個あたり単価のみを定義し、件数・箇所数・個数の掛け算はしていません。
- 割合型の率は「千分の四」= `⟨4,1000⟩`、`⟨2,1000⟩` として符号化しました（過去の 10 倍過大
  バグを避け、整数千分率は分母 1000）。原文の率文字列は doc-comment に保持していますが、
  これは法的な率の解釈を保証するものではありません。
- `agreeRegistryForeignCompanyFees` は有限点（20 基底）の `==` 一致確認であり、
  法的意味の等価証明ではありません。
- 転記監査は fidelity-only（原文 bytes との一致確認）であり、法的正しさを保証しません。
- **L7 候補 3,438 件は unreviewed のまま**です（本スライドでは一切レビューしていません）。
- 残ブロッカー: 転記監査 check の `checks()` への組み込み（§2、+24 needles）、
  `JapanTaxLaw.lean` への import 追加（§5）、README / PROGRESS の 1 行追記（§4）、
  および全体ビルド・CI ゲートの実行は**すべてメインセッションの担当**です
  （W-Z は実行していません）。
