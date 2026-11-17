# STAGING — W-AB（登録免許税法 別表第一（二）三十三〜三十八 の flat fee モデル化）受け渡しメモ

> 実装担当 W-AB からメインセッション（統合担当）への受け渡し用。
> ブランチ操作・add/commit/push/merge は一切していません。
> 本タスクで書き換えたのは下記 4 ファイルのみです（他は読み取り専用）。

## 0. 対象ファイル / pinned source

| ファイル | 状態 |
| --- | --- |
| `JapanTaxLaw/RegistryQualificationFeesJ1.lean` | 新規 |
| `JapanTaxLaw/RegistryQualificationFeesJ1Spec.lean` | 新規 |
| `JapanTaxLaw/RegistryQualificationFeesJ1Tests.lean` | 新規 |
| `docs/STAGING_WAB.md` | 新規（本ファイル） |

pinned source: `data/raw/342AC0000000035_20261101_508AC0000000021.law.json`

- law id `342AC0000000035`
- revision `342AC0000000035_20261101_508AC0000000021`
- amendment enforcement date `2026-11-01`
- 担当範囲原文: `C:\Users\junny\AppData\Local\Temp\opencode\reg_qual_A.txt`（UTF-8、4564 文字、三十三〜三十八）。
  本メモの needles はすべてこのファイルから一字も変えず抽出。
- 名前空間は **`JapanTaxLaw.RegistryQualificationFeesJ1`**（他モジュールと衝突しません）。
  `open JapanTaxLaw.TaxFinance`、`Money := Nat`。

既存 `RegistrationQualificationFees.lean` は本範囲の一部（三十三、三十四、三十四の三（一）〜（三）、
三十六の二、三十六の三、三十七（一）〜（六）、三十八）を既にモデル化していますが、
**本モジュールは別名前空間による独立の再モデル化**であり、既存モジュールは変更していません。
本モジュールは 三十四の二、三十四の三（四）、三十五（全 16 行）、三十六（全 5 行）、
三十七（七）も欠けなく収録しています。

## 1. 追加した def 一覧（全 55 件）

各 def は `Money := <額>` の flat 定数。全件に `<name>_pos : <name> > 0 := by decide` と
`example : <name> = <額> := by decide`（kernel-decide smoke）を付与済み。
「〜数一箇所につき」の 5 件には `PerPlace` suffix を付け、1 箇所あたりの額であることを
doc-comment に明記（箇所数は caller-established、Nat 掛け算は行わない）。

| # | 原文（号） | def 名 | 金額 |
| --- | --- | --- | --- |
| 1 | 三十三 認定個人情報保護団体の認定 | `certifiedPersonalInfoProtectionOrgCertFee` | 90,000 |
| 2 | 三十四 警備員等に係る登録講習機関の登録 | `securityGuardTrainingOrgRegFee` | 90,000 |
| 3 | 三十四の二 登録誘引情報提供機関の登録 | `datingInducementInfoProviderRegFee` | 15,000 |
| 4 | 三十四の三（一）カジノ事業の免許 | `casinoBusinessLicenseFee` | 150,000 |
| 5 | 三十四の三（二）カジノ施設供用事業の免許 | `casinoFacilityOperationBusinessLicenseFee` | 150,000 |
| 6 | 三十四の三（三）カジノ関連機器等製造業等の許可 | `casinoRelatedEquipmentBusinessPermitFee` | 150,000 |
| 7 | 三十四の三（四）カジノ関連機器等外国製造業の認定 | `casinoRelatedEquipmentForeignManufacturerCertFee` | 150,000 |
| 8 | 三十五（一）外国銀行の営業の免許 | `foreignBankBusinessLicenseFee` | 150,000 |
| 9 | 三十五（二）外国銀行代理業務の認可（銀行法） | `bankForeignBankAgencyBusinessApprovalFee` | 150,000 |
| 10 | 三十五（三）外国銀行代理業務の認可（長期信用銀行法） | `longTermCreditBankForeignBankAgencyApprovalFee` | 150,000 |
| 11 | 三十五（四）イ 外国支店の設置の認可（**一箇所**） | `bankForeignBranchEstablishmentApprovalFeePerPlace` | 150,000 |
| 12 | 三十五（四）ロ 外国営業所の設置等の認可（**一箇所**） | `bankForeignOfficeEstablishmentApprovalFeePerPlace` | 90,000 |
| 13 | 三十五（四）ハ 外国における業務委託契約の認可 | `bankForeignBusinessOutsourcingContractApprovalFee` | 90,000 |
| 14 | 三十五（五）イ 従たる外国銀行支店の設置の認可（**一箇所**） | `subsidiaryForeignBankBranchEstablishmentApprovalFeePerPlace` | 150,000 |
| 15 | 三十五（五）ロ 従たる外国銀行営業所の設置等の認可（**一箇所**） | `subsidiaryForeignBankOfficeEstablishmentApprovalFeePerPlace` | 90,000 |
| 16 | 三十五（六）信用金庫の事業の免許 | `creditCooperativeBusinessLicenseFee` | 150,000 |
| 17 | 三十五（七）信用金庫の外国銀行代理業務の認可 | `creditCooperativeForeignBankAgencyApprovalFee` | 150,000 |
| 18 | 三十五（八）信用金庫従たる事務所の定款変更認可（**一箇所**） | `creditCooperativeSubOfficeEstablishmentApprovalFeePerPlace` | 90,000 |
| 19 | 三十五（九）金融機関の転換の認可 | `financialInstitutionConversionApprovalFee` | 150,000 |
| 20 | 三十五（十）金融商品取引法 33 の 2 の登録 | `financialInstitutionRegistrationFee` | 150,000 |
| 21 | 三十五（十一）信託業務の兼営の認可 | `trustBusinessConcurrentOperationApprovalFee` | 150,000 |
| 22 | 三十五（十二）銀行持株会社に係る認可 | `bankHoldingCompanyApprovalFee` | 150,000 |
| 23 | 三十五（十三）長期信用銀行持株会社に係る認可 | `longTermCreditBankHoldingCompanyApprovalFee` | 150,000 |
| 24 | 三十六（一）銀行代理業の許可 | `bankAgencyBusinessPermitFee` | 90,000 |
| 25 | 三十六（二）長期信用銀行代理業の許可 | `longTermCreditBankAgencyBusinessPermitFee` | 90,000 |
| 26 | 三十六（三）信用金庫代理業の許可 | `creditCooperativeAgencyBusinessPermitFee` | 90,000 |
| 27 | 三十六（四）労働金庫代理業の許可 | `laborBankAgencyBusinessPermitFee` | 90,000 |
| 28 | 三十六（五）信用協同組合代理業の許可 | `creditCooperativeFinancialBusinessAgencyPermitFee` | 90,000 |
| 29 | 三十六の二（一）電子決済等取扱業者の登録 | `electronicPaymentOperatorRegFee` | 150,000 |
| 30 | 三十六の二（二）信用金庫電子決済等取扱業者の登録 | `creditCooperativeElectronicPaymentOperatorRegFee` | 150,000 |
| 31 | 三十六の二（三）信用協同組合電子決済等取扱業者の登録 | `creditCooperativeFinancialBusinessElectronicPaymentOperatorRegFee` | 150,000 |
| 32 | 三十六の二（四）認定電子決済等取扱事業者協会の認定 | `certifiedElectronicPaymentOperatorAssociationCertFee` | 150,000 |
| 33 | 三十六の二（五）認定信用金庫電子決済等取扱事業者協会の認定 | `certifiedCreditCooperativeElectronicPaymentOperatorAssociationCertFee` | 150,000 |
| 34 | 三十六の二（六）認定信用協同組合電子決済等取扱事業者協会の認定 | `certifiedCreditCooperativeFinancialBusinessElectronicPaymentAssociationCertFee` | 150,000 |
| 35 | 三十六の三（一）電子決済等代行業者の登録 | `electronicPaymentProxyOperatorRegFee` | 90,000 |
| 36 | 三十六の三（二）信用金庫電子決済等代行業者の登録 | `creditCooperativeElectronicPaymentProxyOperatorRegFee` | 90,000 |
| 37 | 三十六の三（三）労働金庫電子決済等代行業者の登録 | `laborBankElectronicPaymentProxyOperatorRegFee` | 90,000 |
| 38 | 三十六の三（四）信用協同組合電子決済等代行業者の登録 | `creditCooperativeFinancialBusinessElectronicPaymentProxyOperatorRegFee` | 90,000 |
| 39 | 三十六の三（五）認定電子決済等代行事業者協会の認定 | `certifiedElectronicPaymentProxyOperatorAssociationCertFee` | 150,000 |
| 40 | 三十六の三（六）認定信用金庫電子決済等代行事業者協会の認定 | `certifiedCreditCooperativeElectronicPaymentProxyAssociationCertFee` | 150,000 |
| 41 | 三十六の三（七）認定労働金庫電子決済等代行事業者協会の認定 | `certifiedLaborBankElectronicPaymentProxyAssociationCertFee` | 150,000 |
| 42 | 三十六の三（八）認定信用協同組合電子決済等代行事業者協会の認定 | `certifiedCreditCooperativeFinancialBusinessElectronicPaymentProxyAssociationCertFee` | 150,000 |
| 43 | 三十七（一）保険業の新規免許 | `newInsuranceBusinessLicenseFee` | 150,000 |
| 44 | 三十七（二）少額短期保険業者の登録 | `smallShortTermInsuranceBusinessOperatorRegFee` | 150,000 |
| 45 | 三十七（三）特定保険業の認可 | `specialInsuranceBusinessApprovalFee` | 150,000 |
| 46 | 三十七（四）保険仲立人の登録 | `insuranceBrokerRegFee` | 90,000 |
| 47 | 三十七（五）特定保険募集人の登録 | `specialInsuranceSolicitorRegFee` | 15,000 |
| 48 | 三十七（六）保険金信託業務の認可 | `insuranceClaimsTrustBusinessApprovalFee` | 150,000 |
| 49 | 三十七（七）保険持株会社に係る認可 | `insuranceHoldingCompanyApprovalFee` | 150,000 |
| 50 | 三十八（一）信託業の免許 | `trustBusinessLicenseFee` | 150,000 |
| 51 | 三十八（二）管理型信託会社の登録 | `managementTypeTrustCompanyRegFee` | 150,000 |
| 52 | 三十八（三）管理型外国信託会社の登録 | `managementTypeForeignTrustCompanyRegFee` | 150,000 |
| 53 | 三十八（四）自己信託に係る事務に関する事業の登録 | `selfTrustBusinessRegFee` | 150,000 |
| 54 | 三十八（五）特定大学技術移転事業承認事業者の登録 | `universityTechnologyTransferApprovedBusinessRegFee` | 150,000 |
| 55 | 三十八（六）信託契約代理店の登録 | `trustContractAgencyRegFee` | 90,000 |

金額内訳（全 55 行）: 十五万円 (150,000) **36 件** / 九万円 (90,000) **17 件** /
一万五千円 (15,000) **2 件**。
割合（千分の X / 百分の X）は本範囲に存在しないため `TaxRate` / `applyFloor` は不使用
（小数点率を 1000 分母に誤る「10 倍過大バグ」の対象外）。

### 独立定式・退行テスト

- `RegistryQualificationFeesJ1Spec.lean`: `spec` 接頭辞の独立定式 **55 本** +
  `agreeRegistryQualificationFeesJ1 : Bool`（実装 ≡ spec の `==` 一致、55 項目）+
  `example : agreeRegistryQualificationFeesJ1 = true := by decide`。
- `RegistryQualificationFeesJ1Tests.lean`: `example ... := by decide` の kernel-decide smoke **55 件**。
- 実装側: positivity 定理 **55 本** + smoke **55 件**。

### doc-comment に明記した射程

- 「政令で定めるものに限る。」「更新の登録（免許／許可／認定）を除く。」「臨時の営業所の設置に
  係る認可その他の政令で定める認可を除く。」「国の行政機関による認可として政令で定めるものに
  限る。」「…財務省令で定めるものを除く。」「…者に係るものに限る。」「当該転換後の法人が
  労働金庫又は信用協同組合であるものを除く。」等の適用判定は **すべて caller-established**。
  **Bool は計算式に入れていない**。軽減額の別 def も作っていない。
- **三十七（注）** の「…新たな同法第二百七十六条の特定保険募集人の登録とみなす。」は
  デーミング規定で金額なし。doc-comment に逐語記載したが **fee def は作っていない**。
  金額なしの fee 行は他に存在しない。
- 三十五（四）イ・ロ、（五）イ・ロ、（八）の「〜数一箇所につき」は 1 箇所あたりの額。
  箇所数は caller-established とし、Nat 掛け算はモジュール内で行っていない。
- 転記監査は fidelity-only であり法的正しさを保証しない。

## 2. 転記監査に追加すべき check（JSON 断片）

`scripts/ci/transcription_audit.py` の `checks()` に追加する check の JSON 表現です
（`law_id` / `kind` / `title` / `needles` の 4 キー）。needle 文字列は原文の一字一句です。
**文字正規化・全角／半角変換・異体字変換を行わず、そのまま移してください。**
各 needle は 60〜130 文字で、担当範囲原文・pinned JSON 正規化テキストの両方で出現回数 **1**（一意）。

```json{
  "law_id": "342AC0000000035",
  "kind": "file",
  "title": null,
  "needles": [
    "個人情報の保護に関する法律（平成十五年法律第五十七号）第四十七条第一項（認定）の認定個人情報保護団体の認定（政令で定めるものに限る。）認定件数一件につき九万円",
    "警備員等に係る登録講習機関の登録警備業法（昭和四十七年法律第百十七号）第二十三条第三項（登録講習機関の登録）の登録（更新の登録を除く。）登録件数一件につき九万円",
    "インターネット異性紹介事業を利用して児童を誘引する行為の規制等に関する法律（平成十五年法律第八十三号）第十八条第一項（登録誘引情報提供機関の登録）の登録誘引情報提供機関の登録登録件数一件につき一万五千円",
    "特定複合観光施設区域整備法（平成三十年法律第八十号）第三十九条（免許等）のカジノ事業の免許（更新の免許を除く。）免許件数一件につき十五万円",
    "特定複合観光施設区域整備法第百五十条第一項（カジノ関連機器等外国製造業の認定）のカジノ関連機器等外国製造業の認定（更新の認定を除く。）認定件数一件につき十五万円",
    "銀行（長期信用銀行を含む。（四）において同じ。）及び銀行法（昭和五十六年法律第五十九号）第十条第二項第八号（業務の範囲）に規定する外国銀行の営業の免許免許件数一件につき十五万円",
    "銀行の外国における支店の設置の認可支店の数一箇所につき十五万円ロ銀行の外国における支店以外の営業所の設置又は外国における支店以外の営業所の支店への変更の認可（臨時の営業所の設置に係る認可その他の政令で定める認可を除く。）営業所の数一箇所につき九万円",
    "金融商品取引法（昭和二十三年法律第二十五号）第三十三条の二（金融機関の登録）の登録登録件数一件につき十五万円（十一）金融機関の信託業務の兼営等に関する法律（昭和十八年法律第四十三号）第一条第一項（兼営の認可）の規定による営業の認可認可件数一件につき十五万円",
    "銀行法第五十二条の三十六第一項（許可）の銀行代理業の許可許可件数一件につき九万円（二）長期信用銀行法第十六条の五第一項（長期信用銀行代理業の許可）の長期信用銀行代理業の許可許可件数一件につき九万円",
    "銀行法第五十二条の六十の三（登録）の電子決済等取扱業者の登録登録件数一件につき十五万円（二）信用金庫法第八十五条の三第一項（登録）の信用金庫電子決済等取扱業者の登録登録件数一件につき十五万円",
    "銀行法第五十二条の六十一の二（登録）の電子決済等代行業者の登録登録件数一件につき九万円（二）信用金庫法第八十五条の四第一項（登録）の信用金庫電子決済等代行業者の登録登録件数一件につき九万円",
    "同法第二百八十条第一項第一号（変更等の届出等）の規定による届出をした場合における同条第二項の規定による登録は、新たな同法第二百七十六条の特定保険募集人の登録とみなす。",
    "一時的な必要に基づき期限を付して行われる委託又は再委託で財務省令で定めるものを除く。）を受けた者に係るものに限る。）登録件数一件につき一万五千円",
    "信託業法第七条第一項（登録）の管理型信託会社の登録（更新の登録を除く。）登録件数一件につき十五万円（三）信託業法第五十四条第一項（登録）の管理型外国信託会社の登録（更新の登録を除く。）登録件数一件につき十五万円",
    "信託業法第五十二条第一項（特定大学技術移転事業に係る信託についての特例）の特定大学技術移転事業承認事業者の登録登録件数一件につき十五万円（六）信託業法第六十七条第一項（登録）の信託契約代理店の登録登録件数一件につき九万円"
  ]
}```

参考：現行スクリプト形式への変換例（name は任意、needles は上記 15 本を一字も変えずに列挙）:

```python
yield ("登録免許税法 別表第一（二）三十三〜三十八 ↔ RegistryQualificationFeesJ1.lean",
       "342AC0000000035",
       "file", None,
       [ ...上記 needles 15 本を一字も変えずに列挙... ])
```

## 3. 期待 literal 増分

- W-AB 担当分: 新規 check **15 needles** なので **+15**。
- `docs/PROGRESS.md` の監査 literal 総数はメインセッションが再確認して加算してください
  （起点値は本メモでは書きません）。

## 4. 検証結果（すべて本セッションで実行済み）

- `lake build JapanTaxLaw.RegistryQualificationFeesJ1 JapanTaxLaw.RegistryQualificationFeesJ1Spec JapanTaxLaw.RegistryQualificationFeesJ1Tests`
  → **成功（5 jobs、warning なし）**。※自作 3 モジュールのみビルド（全体ビルド／CI／
  `run_python_gates.py` は実行していません）。初回ビルドで 1 件の構文エラー
  （三十七（注）の単独 doc-comment `/-- ... -/` が宣言に付かない）が出たため、
  通常ブロックコメント `/- ... -/` に修正して再ビルド成功。
- `python scripts/ci/check_no_sorry.py` →
  `no forbidden placeholder proofs found in tracked Lean sources`
  （新規 3 ファイルは未追跡のため走査対象外ですが、人力でも `sorry` / `admit` はありません）。
- `#print axioms`（一時ファイル `WAB_AxiomProbe.lean` を approved temp dir に作成、
  `lake env lean` で実行後 **削除済み**）:
  - 実装 55 def + positivity 定理 55 本 + spec 55 def + agree 1 def = **166 定数**を検査。
  - **166/166 が `does not depend on any axioms`**。
  - **`Classical.choice` 0 回 / `sorryAx` 0 回 / `propext` 0 回**。
- 原文逐語検証（pinned JSON 正規化テキストに対する `.find()`）: **15/15 FOUND、MISS 0 件**（§5）。
  needle 長 69〜129 文字、出現回数はいずれも 1。

## 5. 逐語検証 FOUND / MISS 一覧（一字も変更せず）

pinned JSON の `law_full_text` を `transcription_audit.py` と同一ロジックで平坦化し、
`re.sub(r"[\s　]+", "", ...)` で正規化した文字列に対して各 needle を `.find()` で検索。
`art@` は担当範囲原文 `reg_qual_A.txt` の正規化文字列上の offset、`json@` は pinned JSON
正規化文字列上の offset。needle 自体も同じ正規化を適用（原文からの抽出は一字も変更していない）。

| # | needle 先頭 | 結果 | len | art@ | json@ | 出現回数(art/json) |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | 個人情報の保護に関する法律（平成十五年… | **FOUND** | 79 | 16 | 147158 | 1/1 |
| 2 | 警備員等に係る登録講習機関の登録警備業法… | **FOUND** | 80 | 98 | 147240 | 1/1 |
| 3 | インターネット異性紹介事業を利用して… | **FOUND** | 101 | 213 | 147355 | 1/1 |
| 4 | 特定複合観光施設区域整備法（平成三十年… | **FOUND** | 69 | 377 | 147519 | 1/1 |
| 5 | 特定複合観光施設区域整備法第百五十条第一項… | **FOUND** | 80 | 617 | 147759 | 1/1 |
| 6 | 銀行（長期信用銀行を含む。（四）において… | **FOUND** | 88 | 759 | 147901 | 1/1 |
| 7 | 銀行の外国における支店の設置の認可… | **FOUND** | 125 | 1013 | 148155 | 1/1 |
| 8 | 金融商品取引法（昭和二十三年法律第二十五号）… | **FOUND** | 129 | 1608 | 148750 | 1/1 |
| 9 | 銀行法第五十二条の三十六第一項（許可）… | **FOUND** | 99 | 1875 | 149017 | 1/1 |
| 10 | 銀行法第五十二条の六十の三（登録）… | **FOUND** | 96 | 2204 | 149346 | 1/1 |
| 11 | 銀行法第五十二条の六十一の二（登録）… | **FOUND** | 95 | 2653 | 149795 | 1/1 |
| 12 | 同法第二百八十条第一項第一号（変更等の届出等）… | **FOUND** | 83 | 3413 | 150555 | 1/1 |
| 13 | 一時的な必要に基づき期限を付して行われる委託… | **FOUND** | 72 | 3857 | 150999 | 1/1 |
| 14 | 信託業法第七条第一項（登録）の管理型信託会社… | **FOUND** | 106 | 4187 | 151329 | 1/1 |
| 15 | 信託業法第五十二条第一項（特定大学技術移転事業… | **FOUND** | 111 | 4386 | 151528 | 1/1 |

- **FOUND 15 / MISS 0**。needle の長さは 69〜129 文字、15 本すべて相互に異なることを確認。
  アンカーの勝手な変更・正規化・文字変換はしていません（原文の `行つていた` 等の旧仮名遣いも保持）。
- MISS が出ていた場合はここで作業を止めて報告する手順でしたが、該当なしです。
- 金額の日本語数字との対応も全件一致（九万円=90,000 / 十五万円=150,000 /
  一万五千円=15,000）。

## 6. README / PROGRESS に足す 1 行文案

CROSS_LAW の scan/pin 件数や監査 literal 総数はメインセッションが計算するため、ここでは書きません。

- **README.md**（モジュール一覧・`RegistrationQualificationFeesTests.lean` 行の直後に追加）:
  ```text
  JapanTaxLaw/RegistryQualificationFeesJ1.lean / -Spec.lean / -Tests.lean  # 登録免許税法 別表第一（二）三十三〜三十八（認定個人情報保護団体・警備員登録講習機関・カジノ・銀行等・電子決済等取扱/代行・保険会社等・信託会社等）の flat fee 全55行 L4 モデル・独立定式・退行テスト
  ```
- **docs/PROGRESS.md**（L4 着手済みモジュール一覧の末尾に追記）:
  ```text
  登録免許税法 別表第一（二）三十三〜三十八（RegistryQualificationFeesJ1.lean：flat fee 全55行を Money 定数化、15万円36件/9万円17件/1.5万円2件、1箇所あたり5件は PerPlace、三十七（注）デーミング規定は金額なし・fee def なし、割合なし、適用判定は caller-established）
  ```

## 7. インテグレーターへの明示事項

**インテグレーターは `JapanTaxLaw.lean` に以下の 3 つの import を追加すること。**

```lean
import JapanTaxLaw.RegistryQualificationFeesJ1
import JapanTaxLaw.RegistryQualificationFeesJ1Spec
import JapanTaxLaw.RegistryQualificationFeesJ1Tests
```

（W-AB は `JapanTaxLaw.lean` を書き換えていません。メインが統合してください。）

## 8. 範囲・残ブロッカーの正直な申告（最終報告）

- **build**: 自作 3 モジュールのみ `lake build` 成功（5 jobs / warning なし）。全体ビルド・CI・
  `run_python_gates.py` は未実行です。
- **axiom**: 実装 55 def + positivity 55 定理 + spec 55 def + agree 1 def の計 **166 件すべて
  axiom-free**、`Classical.choice` / `sorryAx` / `propext` なし（一時ファイルは削除済み）。
- **逐語**: FOUND 15 / MISS 0（担当範囲原文・pinned JSON の両方、出現回数 1、69〜129 文字）。
- **def 数**: 実装 **55** + spec **55** + agree **1** = **111 def**（＋ positivity 定理 55 本）。
- **STAGING**: 本ファイル `docs/STAGING_WAB.md` を作成済みです。
- これは **L4 のごく小さなスライス**です。**完成・網羅を主張しません**。
- 担当は 別表第一（二）**第三十三号〜第三十八号 のみ**。三十二 以前・三十九 以降
  （担保付社債信託・金融商品市場等を含む）は NOT YET COVERED。
- 登録・免許・許可・認可・認定の要件・適用・更新の有無、政令／財務省令で定めるものの該当性、
  一箇所あたりの箇所数はすべて caller-established とし、法的判断の自動化はしていません。
- 三十七（注）のデーミング規定（変更届出に伴う登録は新たな登録とみなす）は金額がないため
  fee def を作っていません。
- `agreeRegistryQualificationFeesJ1` は定数同士の `==` 一致確認であり、法的意味の等価証明では
  ありません。
- 転記監査は fidelity-only（原文 bytes との一致確認）であり、法的正しさを保証しません。
- **L7 候補 3,438 件は unreviewed のまま**です（本スライスでは一切レビューしていません）。
- 残ブロッカー: 転記監査 check の `checks()` への組み込み（§2、+15）、`JapanTaxLaw.lean` への
  import 追加（§7）、README / PROGRESS の 1 行追記（§6）、および全体ビルド・CI ゲートの
  実行は**すべてメインセッションの担当**です（W-AB は実行していません）。
