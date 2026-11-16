# STAGING — W-H（登録免許税法 別表第一（二）第三十二号 百十一〜百十九 の flat fee）受け渡しメモ

> 実装担当 W-H からメインセッション（統合担当）への受け渡し用。
> ブランチ操作・add/commit/push/merge は一切していません。
> 書き換えたのは下記 4 ファイルのみです（他は読み取り専用）。

## 0. 対象ファイル

| ファイル | 状態 |
| --- | --- |
| `JapanTaxLaw/RegistrationQualificationFeesP5H.lean` | 新規 |
| `JapanTaxLaw/RegistrationQualificationFeesP5HSpec.lean` | 新規 |
| `JapanTaxLaw/RegistrationQualificationFeesP5HTests.lean` | 新規 |
| `docs/STAGING_WH.md` | 新規（本ファイル） |

pinned source: `data/raw/342AC0000000035_20261101_508AC0000000021.law.json`
law id `342AC0000000035` / revision `342AC0000000035_20261101_508AC0000000021`
amendment enforcement date `2026-11-01`（RegistrationQualificationFees / P2A〜P4F と同一ピン）。
担当範囲原文: `art32_111_119.txt`（百十一〜百十九、UTF-8、1 行 2,623 文字、正規化後 2,594 文字）。
pinned bytes から金額を日本語数字で読み取り Arabic に変換
（九万円→90,000 / 十五万円→150,000 / 一万五千円→15,000、全件一致確認済み）。

## 1. 担当範囲のカテゴリ一覧（百十一〜百十九）

| 条号 | 区分／法律 | 件数 |
| --- | --- | --- |
| 百十一 | 電気用品安全法（検査機関の登録） | 1 |
| 百十二 | 消費生活用製品安全法（検査機関の登録） | 1 |
| 百十三 | 産業標準化法（(一)〜(三)：登録認証機関・試験事業者） | 3 |
| 百十四 | 計量法（(一) 校正事業者の登録／(二) 認定計量証明事業者の認定） | 2 |
| 百十五 | 半導体集積回路の回路配置に関する法律（登録機関の登録） | 1 |
| 百十六 | 工業所有権に関する手続等の特例に関する法律（(一)〜(三)） | 3 |
| 百十七 | 相互承認の実施に関する法律（国外適合性評価事業の認定） | 1 |
| 百十七の二 | 特定原産地証明書の発給等に関する法律（認定輸出者の認定） | 1 |
| 百十八 | 割賦販売法（(一)〜(七)） | 7 |
| 百十九 | フロン類の使用の合理化及び管理の適正化に関する法律（(一)(二)） | 2 |
| 百十九の二 | 産業競争力強化法（認証機関の認定） | 1 |
| 百十九の三 | 脱炭素成長型経済構造への円滑な移行の推進に関する法律（登録確認機関） | 1 |
| **合計** | | **24** |

原文の「〜件数一件につき△△円」フレーズ出現数は **24**（`につき` の出現数も 24）で、
タスク指定の 24 件と一致します。本範囲に割合（千分の△）はありません。
「政令で定めるものに限る」は本範囲に存在しません（`.count('政令') == 0`）。

デーミング規定は **7 箇所**（百十一・百十二・百十三(一)(二)(三)・百十四(一)・百十七）にあり、
いずれも主額（九万円）の括弧内で「既に登録／認定を受けている者については、一万五千円」と
定められています（`.count('既に') == 7`）。タスク指示に従い、これらは **金額なし行として扱い、
デーミング用の fee def は作りません**（主額の九万円のみを def 化）。
「更新の登録を除く」12・「更新の認定を除く」4・「更新の許可を除く」2（計 18）も
金額定数には反映せず caller-established とします。

## 2. 追加した def 一覧（名前 → 金額 → 条号／区分）

`namespace JapanTaxLaw`、`open JapanTaxLaw.TaxFinance`。各 def は `Money := <額>` の flat 定数
（課税標準は一件につき）。各 def に `<name>_pos : <name> > 0 := by decide` と
`example : <name> = <額> := by decide` を付与済み（24 本ずつ）。

| # | 条号／区分 | def 名 | 金額 | 原文 fee |
| --- | --- | --- | --- | --- |
| 1 | 百十一 特定電気用品の検査機関の登録 | `specifiedElectricalApplianceInspectOrgRegFee` | 90,000 | 九万円 |
| 2 | 百十二 特別特定製品の検査機関の登録 | `specialSpecificProductInspectOrgRegFee` | 90,000 | 九万円 |
| 3 | 百十三(一) 登録認証機関の登録 | `jisConformityCertificationBodyRegFee` | 90,000 | 九万円 |
| 4 | 百十三(二) 国内試験所の試験事業者の登録 | `domesticTestLabBusinessOperatorRegFee` | 90,000 | 九万円 |
| 5 | 百十三(三) 外国試験所の試験事業者の登録 | `foreignTestLabBusinessOperatorRegFee` | 90,000 | 九万円 |
| 6 | 百十四(一) 計量器の校正等に係る事業者の登録 | `measuringInstrumentCalibrationBizRegFee` | 90,000 | 九万円 |
| 7 | 百十四(二) 認定特定計量証明事業者の認定 | `certifiedMetrologyCertificationBizLicenseFee` | 90,000 | 九万円 |
| 8 | 百十五 回路配置利用権の登録機関の登録 | `circuitLayoutRightRegOrgRegFee` | 90,000 | 九万円 |
| 9 | 百十六(一) 登録情報処理機関の登録 | `registeredInfoProcessingOrgRegFee` | 90,000 | 九万円 |
| 10 | 百十六(二) 登録調査機関の登録 | `registeredInvestigationOrgRegFee` | 90,000 | 九万円 |
| 11 | 百十六(三) 特定登録調査機関の登録 | `specifiedRegisteredInvestigationOrgRegFee` | 90,000 | 九万円 |
| 12 | 百十七 国外適合性評価事業の認定 | `foreignConformityAssessmentBizLicenseFee` | 90,000 | 九万円 |
| 13 | 百十七の二 認定輸出者の認定 | `certifiedExporterLicenseFee` | 90,000 | 九万円 |
| 14 | 百十八(一) 前払式割賦販売業の許可 | `prepaidInstallmentSalesBizPermitFee` | 150,000 | 十五万円 |
| 15 | 百十八(二) 包括信用購入あつせん業者の登録 | `comprehensiveCreditPurchaseAgencyRegFee` | 150,000 | 十五万円 |
| 16 | 百十八(三) 少額包括信用購入あつせん業者の登録 | `smallComprehensiveCreditPurchaseAgencyRegFee` | 150,000 | 十五万円 |
| 17 | 百十八(四) 個別信用購入あつせん業者の登録 | `individualCreditPurchaseAgencyRegFee` | 150,000 | 十五万円 |
| 18 | 百十八(五) 前払式特定取引業の許可 | `prepaidSpecificTransactionBizPermitFee` | 150,000 | 十五万円 |
| 19 | 百十八(六) クレジットカード番号等取扱契約締結事業者の登録 | `creditCardNumberHandlingContractBizRegFee` | 150,000 | 十五万円 |
| 20 | 百十八(七) 認定割賦販売協会の認定 | `certifiedInstallmentSalesAssociationLicenseFee` | 150,000 | 十五万円 |
| 21 | 百十九(一) 第一種フロン類再生業者の許可 | `class1FluorocarbonRecyclingBizPermitFee` | 90,000 | 九万円 |
| 22 | 百十九(二) フロン類破壊業者の許可 | `fluorocarbonDestructionBizPermitFee` | 90,000 | 九万円 |
| 23 | 百十九の二 認定技術等情報漏えい防止措置認証機関の認定 | `techInfoLeakPreventionCertOrgLicenseFee` | 15,000 | 一万五千円 |
| 24 | 百十九の三 登録確認機関の登録 | `registeredVerificationOrgRegFee` | 90,000 | 九万円 |

金額一致の内訳: 九万円=16 件（90,000）／ 十五万円=7 件（150,000）／ 一万五千円=1 件（15,000）
＝ 合計 24 件。pinned 原文の fee フレーズ出現数と完全一致。

`RegistrationQualificationFeesP5HSpec.lean` は `spec` 接頭辞の独立定式 24 本 +
`agreeRegistrationQualificationFeesP5H : Bool`（実装 ≡ spec の `==` 一致）+
`example : agreeRegistrationQualificationFeesP5H = true := by decide`。
`RegistrationQualificationFeesP5HTests.lean` は `example := by decide` のスモーク 24 件のみ。

doc-comment に明記した射程外（overclaim 防止）:

- 「更新の登録を除く。」「更新の認定を除く。」「更新の許可を除く。」の適用判定は
  **caller-established** とし、金額定数には反映していません（本範囲に「政令で定めるものに限る」なし）。
- デーミング規定 7 箇所（既登録／既認定者は一万五千円）も caller-established とし、
  デーミング用の別 def は作っていません。
- 百十 以前・百二十 以降は NOT YET COVERED（百十七の二・百十九の二・百十九の三は担当範囲に含む）。
  「認定件数」「登録件数」「許可件数」「申請件数」の意味上の区別は非モデル化（一律 `Money`）。

## 3. 転記監査に追加すべき check（JSON 断片）

`scripts/ci/transcription_audit.py` の `checks()` に追加する check の JSON 表現です
（`law_id` / `kind` / `title` / `needles` の 4 キー）。needle 文字列は一字も変えないこと。
**文字正規化・全角／半角変換・異体字変換を行わず、そのまま移してください。**

```json
{
  "law_id": "342AC0000000035",
  "kind": "file",
  "title": null,
  "needles": [
    "百十一特定電気用品に係る検査機関の登録電気用品安全法（昭和三十六年法律第二百三十四号）第九条第一項（検査機関の登録）の登録（更新の登録を除く。以下この号において単に「登録」という。）申請件数一件につき九万円（既に登録を受けている者については、一万五千円）",
    "百十二特別特定製品に係る検査機関の登録消費生活用製品安全法（昭和四十八年法律第三十一号）第十二条第一項（検査機関の登録）の登録（更新の登録を除く。以下この号において単に「登録」という。）申請件数一件につき九万円（既に登録を受けている者については、一万五千円）",
    "第三十三条第一項（登録認証機関の登録）又は第三十七条第一項から第六項まで（登録認証機関の登録）の登録（更新の登録を除く。）申請件数一件につき九万円（既に（一）に掲げる登録を受けている者については、一万五千円）",
    "（二）産業標準化法第五十七条第一項（試験事業者の試験所の登録）の国内にある試験所における製品試験等に係る事業者の登録（更新の登録を除く。）申請件数一件につき九万円（既に（二）に掲げる登録を受けている者については、一万五千円）",
    "（三）産業標準化法第六十六条第一項（外国試験事業者の試験所の登録）の外国にある試験所における製品試験等に係る試験事業者の登録（更新の登録を除く。）申請件数一件につき九万円（既に（三）に掲げる登録を受けている者については、一万五千円）",
    "（一）計量法第百四十三条第一項（登録）の計量器の校正等に係る事業者の登録（更新の登録を除く。）申請件数一件につき九万円（既に（一）に掲げる登録を受けている者については、一万五千円）",
    "（一）に掲げる登録を受けている者については、一万五千円）（二）計量法第百二十一条の二（認定）の認定特定計量証明事業者の認定（更新の認定を除く。）認定件数一件につき九万円",
    "百十五回路配置利用権の設定登録等事務に係る登録機関の登録半導体集積回路の回路配置に関する法律（昭和六十年法律第四十三号）第二十八条第一項（登録機関の登録）の登録（更新の登録を除く。）登録件数一件につき九万円",
    "（一）工業所有権に関する手続等の特例に関する法律（平成二年法律第三十号）第九条第一項（登録情報処理機関の登録）の登録（更新の登録を除く。）登録件数一件につき九万円",
    "（二）工業所有権に関する手続等の特例に関する法律第三十六条第一項（登録調査機関の登録）の登録（更新の登録を除く。）登録件数一件につき九万円",
    "（三）工業所有権に関する手続等の特例に関する法律第三十九条の二（特定登録調査機関の登録）の登録（更新の登録を除く。）登録件数一件につき九万円",
    "の相互承認の実施に関する法律（平成十三年法律第百十一号）第三条第一項（認定）の国外適合性評価事業の認定（更新の認定を除く。以下この号において単に「認定」という。）申請件数一件につき九万円（既に認定を受けている者については、一万五千円）",
    "百十七の二第二種特定原産地証明書の作成に係る認定輸出者の認定経済連携協定に基づく特定原産地証明書の発給等に関する法律（平成十六年法律第百四十三号）第七条の二第一項（認定）の認定輸出者の認定（更新の認定を除く。）認定件数一件につき九万円",
    "（一）割賦販売法（昭和三十六年法律第百五十九号）第十一条（前払式割賦販売業の許可）の規定による前払式割賦販売の事業の許可許可件数一件につき十五万円",
    "（二）割賦販売法第三十一条（包括信用購入あつせん業者の登録）の登録包括信用購入あつせん業者の登録登録件数一件につき十五万円",
    "登録件数一件につき十五万円（三）割賦販売法第三十五条の二の三第一項（登録）の登録少額包括信用購入あつせん業者の登録登録件数一件につき十五万円",
    "（四）割賦販売法第三十五条の三の二十三（個別信用購入あつせん業者の登録）の登録個別信用購入あつせん業者の登録（更新の登録を除く。）登録件数一件につき十五万円",
    "（五）割賦販売法第三十五条の三の六十一（前払式特定取引業の許可）の規定による前払式特定取引の事業の許可許可件数一件につき十五万円",
    "（六）割賦販売法第三十五条の十七の二（クレジットカード番号等取扱契約締結事業者の登録）のクレジットカード番号等取扱契約締結事業者の登録登録件数一件につき十五万円",
    "（七）割賦販売法第三十五条の十八第一項（認定割賦販売協会の認定及び業務）の認定割賦販売協会の認定認定件数一件につき十五万円",
    "（一）フロン類の使用の合理化及び管理の適正化に関する法律（平成十三年法律第六十四号）第五十条第一項（第一種フロン類再生業者の許可）の第一種フロン類再生業者の許可（更新の許可を除く。）許可件数一件につき九万円",
    "（二）フロン類の使用の合理化及び管理の適正化に関する法律第六十三条第一項（フロン類破壊業者の許可）のフロン類破壊業者の許可（更新の許可を除く。）許可件数一件につき九万円",
    "百十九の二認定技術等情報漏えい防止措置認証機関の認定産業競争力強化法（平成二十五年法律第九十八号）第六十八条第一項（認定技術等情報漏えい防止措置認証機関の認定）の認定技術等情報漏えい防止措置認証機関の認定（更新の認定を除く。）認定件数一件につき一万五千円",
    "百十九の三排出目標量及び排出実績量に係る登録確認機関の登録脱炭素成長型経済構造への円滑な移行の推進に関する法律（令和五年法律第三十二号）第三十三条第二項（登録確認機関の登録）の登録（更新の登録を除く。）登録件数一件につき九万円"
  ]
}
```

参考：現行スクリプト形式への変換例（name は任意、needles は上記 24 本をそのまま使用）:

```python
yield ("登録免許税法 別表第一（二）第三十二号 百十一〜百十九（検査機関・登録認証機関・試験事業者・計量・回路配置・工業所有権・割賦販売・フロン類等）↔ RegistrationQualificationFeesP5H.lean",
       "342AC0000000035",
       "file", None,
       [ ...上記 needles 24 本を一字も変えずに列挙... ])
```

## 4. 期待 literal 増分

- W-H 担当分: 新規 check **24 needles** なので **+24**。
- `docs/PROGRESS.md` の監査 literal 総数はメインセッションが再確認して加算してください
  （起点値は本メモでは書きません）。

## 5. 検証結果（すべて本セッションで実行済み）

- `lake build JapanTaxLaw.RegistrationQualificationFeesP5H JapanTaxLaw.RegistrationQualificationFeesP5HSpec JapanTaxLaw.RegistrationQualificationFeesP5HTests`
  → **成功（5 jobs、warning なし）**。※自作 3 モジュールのみビルド（全体ビルド／CI／`run_python_gates.py` は実行していません）。
- `python scripts/ci/check_no_sorry.py` → `no forbidden placeholder proofs found in tracked Lean sources`。
  （新規 3 ファイルは未追跡のため走査対象外ですが、人力でも `sorry` / `admit` はありません。）
- `#print axioms`（一時ファイル `P5HAxiomProbe.lean` を approved temp dir に作成、`lake env lean` で実行後 **削除済み**）:
  - 新規 positivity 定理 **24 本すべて** と `agreeRegistrationQualificationFeesP5H` の計 **25 件**が
    `does not depend on any axioms`。
  - **`Classical.choice` も `sorryAx` も `propext` も一切なし**（出力 25 行を全文走査）。
- 原文逐語検証（pinned JSON を正規化テキストに対して `.find()`）: **24/24 FOUND、MISS 0 件**（§6）。
  担当範囲原文 `art32_111_119.txt` 正規化テキストに対しても **24/24 FOUND、MISS 0 件**。
  各 needle は両テキストで出現回数 **1**（一意）、長さはすべて **60〜130 文字**、24 本すべて相互に異なることを確認。
  law id `342AC0000000035` … FOUND / revision `342AC0000000035_20261101_508AC0000000021` … FOUND。
- 金額一致: 九万円=16 件 / 十五万円=7 件 / 一万五千円=1 件 ＝ 24 件、pinned 原文の fee フレーズ出現数と完全一致。

## 6. 逐語検証 FOUND / MISS 一覧（一字も変更せず）

担当範囲原文 `art32_111_119.txt` を、転記監査と同じ `re.sub(r"[\s\u3000]+", "", ...)` で正規化した文字列に
対して各 needle を Python の `.find()` で検索（`art@`）。
`json@` は pinned JSON `law_full_text` を `transcription_audit.py` と同一ロジックで平坦化・正規化した文字列上の offset。
各 needle の出現回数は両方とも **1**（一意）。

| # | 条号/区分 | def | 結果 | art@ | json@ | 出現回数(art/json) | len |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 1 | 百十一 | `specifiedElectricalApplianceInspectOrgRegFee` | FOUND | 0 | 176068 | 1/1 | 127 |
| 2 | 百十二 | `specialSpecificProductInspectOrgRegFee` | FOUND | 127 | 176195 | 1/1 | 129 |
| 3 | 百十三(一) | `jisConformityCertificationBodyRegFee` | FOUND | 411 | 176479 | 1/1 | 104 |
| 4 | 百十三(二) | `domesticTestLabBusinessOperatorRegFee` | FOUND | 515 | 176583 | 1/1 | 112 |
| 5 | 百十三(三) | `foreignTestLabBusinessOperatorRegFee` | FOUND | 627 | 176695 | 1/1 | 116 |
| 6 | 百十四(一) | `measuringInstrumentCalibrationBizRegFee` | FOUND | 778 | 176846 | 1/1 | 90 |
| 7 | 百十四(二) | `certifiedMetrologyCertificationBizLicenseFee` | FOUND | 840 | 176908 | 1/1 | 84 |
| 8 | 百十五 | `circuitLayoutRightRegOrgRegFee` | FOUND | 924 | 176992 | 1/1 | 103 |
| 9 | 百十六(一) | `registeredInfoProcessingOrgRegFee` | FOUND | 1072 | 177140 | 1/1 | 81 |
| 10 | 百十六(二) | `registeredInvestigationOrgRegFee` | FOUND | 1153 | 177221 | 1/1 | 69 |
| 11 | 百十六(三) | `specifiedRegisteredInvestigationOrgRegFee` | FOUND | 1222 | 177290 | 1/1 | 70 |
| 12 | 百十七 | `foreignConformityAssessmentBizLicenseFee` | FOUND | 1337 | 177405 | 1/1 | 117 |
| 13 | 百十七の二 | `certifiedExporterLicenseFee` | FOUND | 1454 | 177522 | 1/1 | 117 |
| 14 | 百十八(一) | `prepaidInstallmentSalesBizPermitFee` | FOUND | 1666 | 177734 | 1/1 | 73 |
| 15 | 百十八(二) | `comprehensiveCreditPurchaseAgencyRegFee` | FOUND | 1739 | 177807 | 1/1 | 61 |
| 16 | 百十八(三) | `smallComprehensiveCreditPurchaseAgencyRegFee` | FOUND | 1787 | 177855 | 1/1 | 70 |
| 17 | 百十八(四) | `individualCreditPurchaseAgencyRegFee` | FOUND | 1857 | 177925 | 1/1 | 78 |
| 18 | 百十八(五) | `prepaidSpecificTransactionBizPermitFee` | FOUND | 1935 | 178003 | 1/1 | 64 |
| 19 | 百十八(六) | `creditCardNumberHandlingContractBizRegFee` | FOUND | 1999 | 178067 | 1/1 | 80 |
| 20 | 百十八(七) | `certifiedInstallmentSalesAssociationLicenseFee` | FOUND | 2079 | 178147 | 1/1 | 61 |
| 21 | 百十九(一) | `class1FluorocarbonRecyclingBizPermitFee` | FOUND | 2167 | 178235 | 1/1 | 103 |
| 22 | 百十九(二) | `fluorocarbonDestructionBizPermitFee` | FOUND | 2270 | 178338 | 1/1 | 84 |
| 23 | 百十九の二 | `techInfoLeakPreventionCertOrgLicenseFee` | FOUND | 2354 | 178422 | 1/1 | 127 |
| 24 | 百十九の三 | `registeredVerificationOrgRegFee` | FOUND | 2481 | 178549 | 1/1 | 113 |

- **FOUND 24 / MISS 0**。needle の長さはすべて **60〜130 文字**、24 本すべて相互に異なることを確認。
  アンカーの勝手な変更・正規化・文字変換はしていません。
- 各 needle には原則として項目の条号（百十一〜百十九の三）又は区分（（一）〜（七））を含めています。
  例外は以下のとおりで、原文が極端に長いため 130 文字制約と fee literal の逐語確認を両立させる目的で
  一意な連続部分をアンカーとしました（対応する条号／区分は上表および def の doc-comment に明記）:
  - #3 百十三(一): 先頭の法律引用が長いため「第三十三条第一項…第三十七条第一項から第六項まで…」を
    アンカー（デーミング括弧内に「（一）」を含む）。
  - #7 百十四(二): 主額までの距離が長いため (一) のデーミング括弧末尾を起点に「（二）計量法…」をアンカー。
  - #12 百十七: 条号「百十七」から fee までが 138 文字のため、固有の法律名・第三条第一項・
    「以下この号において単に「認定」という。」を含む連続部分をアンカー。
  - #16 百十八(三): 主額までの距離が短いため直前の (二) の fee 末尾を起点に「（三）割賦販売法…」をアンカー。
- 金額の日本語数字との対応も全件一致（九万円=90,000 / 十五万円=150,000 / 一万五千円=15,000）。

## 7. README / PROGRESS に足す 1 行文案

CROSS_LAW の scan/pin 件数や監査 literal 総数はメインセッションが計算するため、ここでは書きません。

- **README.md**（モジュール一覧・`RegistrationQualificationFeesP4F*` 行の直後に追加）:
  ```text
  JapanTaxLaw/RegistrationQualificationFeesP5H.lean / -Spec.lean / -Tests.lean  # 登録免許税法 別表第一（二）第三十二号 百十一〜百十九（検査機関・登録認証機関・試験事業者・計量・回路配置・工業所有権・国外適合性評価・割賦販売・フロン類等）の flat fee L4 モデル・独立定式・退行テスト
  ```
- **docs/PROGRESS.md**（L4 着手済みモジュール一覧の末尾に追記）:
  ```text
  登録免許税法 別表第一（二）第三十二号 百十一〜百十九（RegistrationQualificationFeesP5H.lean：24 件の flat fee 額を Money 定数化、百十 以前・百二十 以降 NOT YET COVERED）
  ```

## 8. インテグレーターへの明示事項

**インテグレーターは `JapanTaxLaw.lean` に以下の 3 つの import を追加すること。**

```lean
import JapanTaxLaw.RegistrationQualificationFeesP5H
import JapanTaxLaw.RegistrationQualificationFeesP5HSpec
import JapanTaxLaw.RegistrationQualificationFeesP5HTests
```

（W-A〜W-G の各 3 件、W-F の P4F 3 件と併せてメインが行数を確認してください。
W-H は `JapanTaxLaw.lean` を書き換えていません。W-G の P5G ファイルには触れていません。）

## 9. 範囲・残ブロッカーの正直な申告（最終報告）

- **build**: 自作 3 モジュールのみ `lake build` 成功（5 jobs / warning なし）。全体ビルド・CI・
  `run_python_gates.py` は未実行です。
- **axiom**: 新規 positivity 24 本 + agree 1 本の計 25 件すべて axiom-free、
  `Classical.choice` / `sorryAx` / `propext` なし（一時ファイルは削除済み）。
- **逐語**: FOUND 24 / MISS 0（担当範囲原文・pinned JSON の両方、出現回数 1、長さ 60〜130）。
- **def 数**: 24（九万円 16 / 十五万円 7 / 一万五千円 1）。デーミング 7 箇所の別 def は作っていません。
- **STAGING**: 本ファイル `docs/STAGING_WH.md` を作成済みです。
- これは **L4 のごく小さなスライス**です。**完成・網羅を主張しません**。
- 担当は 別表第一（二）第三十二号 **百十一〜百十九 のみ**。**百十 以前・百二十 以降は NOT YET COVERED**。
- 「更新の登録／認定／許可を除く。」およびデーミング規定（既登録／既認定者は一万五千円）の該当性は
  すべて caller-established とし、法的判断の自動化はしていません。
- `agreeRegistrationQualificationFeesP5H` は定数同士の `==` 一致確認であり、法的意味の等価証明ではありません。
- 転記監査は fidelity-only（原文 bytes との一致確認）であり、法的正しさを保証しません。
- **L7 候補 3,438 件は unreviewed のまま**です（本スライスでは一切レビューしていません）。
- 残ブロッカー: 転記監査 check の `checks()` への組み込み（§3、+24）、`JapanTaxLaw.lean` への
  import 追加（§8）、README / PROGRESS の 1 行追記（§7）、および全体ビルド・CI ゲートの
  実行は**すべてメインセッションの担当**です（W-H は実行していません）。
