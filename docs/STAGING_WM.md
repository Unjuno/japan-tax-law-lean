# STAGING — W-M（登録免許税法 別表第一（二）第三十二号 百四十〜百五十一 の flat fee）受け渡しメモ

> 実装担当 W-M からメインセッション（統合担当）への受け渡し用。
> ブランチ操作・add/commit/push/merge は一切していません。
> 書き換えたのは下記 4 ファイルのみです（他は読み取り専用）。

## 0. 対象ファイル

| ファイル | 状態 |
| --- | --- |
| `JapanTaxLaw/RegistrationQualificationFeesP8M.lean` | 新規 |
| `JapanTaxLaw/RegistrationQualificationFeesP8MSpec.lean` | 新規 |
| `JapanTaxLaw/RegistrationQualificationFeesP8MTests.lean` | 新規 |
| `docs/STAGING_WM.md` | 新規（本ファイル） |

pinned source: `data/raw/342AC0000000035_20261101_508AC0000000021.law.json`
law id `342AC0000000035` / revision `342AC0000000035_20261101_508AC0000000021`
amendment enforcement date `2026-11-01`（RegistrationQualificationFees / P2A〜P7L と同一ピン）。
担当範囲原文: `art32_140_151.txt`（百四十〜百五十一、UTF-8、1 行、正規化後 4859 文字）。
pinned bytes から金額を日本語数字で読み取り Arabic に変換
（九万円→90,000 / 十五万円→150,000 / 三万円→30,000 / 一万五千円→15,000 /
一万円→10,000、全件一致確認済み）。

## 1. 担当範囲のカテゴリ一覧（百四十〜百五十一）

| 条号 | 区分／法律 | 件数 |
| --- | --- | --- |
| 百四十 | 倉庫業法（業者登録／新設変更登録／トランクルーム認定、（一）〜（三）） | 3 |
| 百四十一 | 国際観光ホテル整備法（ホテル／旅館／登録実施機関、（一）〜（三）） | 3 |
| 百四十一の二 | 通訳案内士法（登録研修機関の登録） | 1 |
| 百四十二 | 旅行業法（旅行業／旅行業者代理業／旅行サービス手配業／登録研修機関、（一）〜（五）） | 5 |
| 百四十二の二 | 観光圏整備法（観光圏整備実施計画＝認定観光圏案内所の認定） | 1 |
| 百四十二の三 | 住宅宿泊事業法（住宅宿泊管理業者／住宅宿泊仲介業者、（一）（二）） | 2 |
| 百四十三 | 気象業務法（予報業務の許可／範囲変更認可／無線通信による発表業務の許可／認定測定者／登録検定機関、（一）〜（五）） | 5 |
| 百四十四 | 建設業法（建設業の許可（一）イ・ロ／講習の登録／登録経営状況分析機関） | 4 |
| 百四十五 | 浄化槽法（工場／外国工場で製造する浄化槽の型式認定、（一）（二）） | 2 |
| 百四十六 | 不動産の鑑定評価に関する法律（鑑定業者／実務修習機関、（一）（二）） | 2 |
| 百四十七 | 宅地建物取引業法（免許／登録講習機関、（一）（二）） | 2 |
| 百四十八 | 積立式宅地建物販売業法（許可） | 1 |
| 百四十九 | 公共工事の前払金保証事業に関する法律（登録） | 1 |
| 百五十 | 不動産特定共同事業法（許可／変更認可／小規模登録／変更登録、（一）〜（四）） | 4 |
| 百五十一 | マンション管理適正化法（管理者登録／登録講習機関 2 種、（一）〜（三）） | 3 |
| 百五十一の二 | 賃貸住宅管理業務等適正化法（賃貸住宅管理業者の登録） | 1 |
| **合計** | | **40** |

原文の「〜につき△△円」フレーズ出現数は **40**（`につき` の出現数も 40）、
内訳は `一個につき` 2 件（百四十(二)(三)）、`一箇所につき` 0 件、`千分の`（割合）0 件です。
タスク指定の 40 件と一致します。

**金額なし／fee def を作らない行**: 百四十の（注）（物資流通効率化法／福島復興再生特別措置法による
登録・変更登録のみなし）と百四十二の（注）（観光圏整備法／奄美群島・小笠原諸島振興開発特別措置法
による旅行業者代理業の登録のみなし）は長大ですが金額を伴わない適用判定であり、fee def を作りません
（caller-established）。原文に「既に」は 5 回出現しますが、うち 3 回は適用除外
（百四十二の二／百四十三(二)／百四十四(一)）、残り 2 回が百四十五(一)(二) の軽減括弧書
「既に…重要でない部分のみが異なる場合…政令で定めるものについては一万五千円」です。
この一万五千円は軽減額であり、主たる fee（九万円）とは別の def は作っていません
（Bool を式に入れず、軽減額の別 def も作らない方針に従う）。したがって fee string 40 行すべてを
fee def 化しました。

## 2. 追加した def 一覧（名前 → 金額 → 条号／区分）

`namespace JapanTaxLaw`、`open JapanTaxLaw.TaxFinance`。各 def は `Money := <額>` の flat 定数
（課税標準は一件／一箇につき。個数・箇所数の掛け算は caller-established）。各 def に
`<name>_pos : <name> > 0 := by decide` と `example : <name> = <額> := by decide` を付与済み（40 本ずつ）。

| # | 条号／区分 | def 名 | 金額 | 原文 fee |
| --- | --- | --- | --- | --- |
| 1 | 百四十(一) | `warehouseOperatorRegFee` | 90,000 | 九万円 |
| 2 | 百四十(二) | `warehouseNewChangeRegFeePerUnit` | 30,000 | 三万円 |
| 3 | 百四十(三) | `trunkRoomCertificationFeePerUnit` | 10,000 | 一万円 |
| 4 | 百四十一(一) | `hotelRegFee` | 150,000 | 十五万円 |
| 5 | 百四十一(二) | `ryokanRegFee` | 90,000 | 九万円 |
| 6 | 百四十一(三) | `foreignGuestLodgingRegOrgRegFee` | 90,000 | 九万円 |
| 7 | 百四十一の二 | `nationalGuideTrainingOrgRegFee` | 90,000 | 九万円 |
| 8 | 百四十二(一) | `travelAgencyRegFee` | 90,000 | 九万円 |
| 9 | 百四十二(二) | `travelAgencySubAgentRegFee` | 15,000 | 一万五千円 |
| 10 | 百四十二(三) | `travelServiceArrangerRegFee` | 90,000 | 九万円 |
| 11 | 百四十二(四) | `travelAgencyTrainingOrgRegFee` | 90,000 | 九万円 |
| 12 | 百四十二(五) | `travelAgencyManagerTrainingOrgRegFee` | 90,000 | 九万円 |
| 13 | 百四十二の二 | `tourismZoneGuideOfficePlanCertificationFee` | 15,000 | 一万五千円 |
| 14 | 百四十二の三(一) | `privateLodgingManagerRegFee` | 90,000 | 九万円 |
| 15 | 百四十二の三(二) | `privateLodgingBrokerRegFee` | 90,000 | 九万円 |
| 16 | 百四十三(一) | `weatherForecastBizPermitFee` | 90,000 | 九万円 |
| 17 | 百四十三(二) | `weatherForecastScopeChangeApprovalFee` | 90,000 | 九万円 |
| 18 | 百四十三(三) | `weatherObservationWirelessBroadcastPermitFee` | 90,000 | 九万円 |
| 19 | 百四十三(四) | `weatherInstrumentMeasurerCertificationFee` | 90,000 | 九万円 |
| 20 | 百四十三(五) | `weatherInstrumentInspectionOrgRegFee` | 90,000 | 九万円 |
| 21 | 百四十四(一)イ | `constructionBizPermitClass1Fee` | 150,000 | 十五万円 |
| 22 | 百四十四(一)ロ | `constructionBizPermitClass2Fee` | 150,000 | 十五万円 |
| 23 | 百四十四(二) | `constructionEngineerTrainingRegFee` | 90,000 | 九万円 |
| 24 | 百四十四(三) | `constructionBizAnalysisOrgRegFee` | 90,000 | 九万円 |
| 25 | 百四十五(一) | `domesticSepticTankTypeCertificationFee` | 90,000 | 九万円 |
| 26 | 百四十五(二) | `foreignSepticTankTypeCertificationFee` | 90,000 | 九万円 |
| 27 | 百四十六(一) | `realEstateAppraisalBizRegFee` | 90,000 | 九万円 |
| 28 | 百四十六(二) | `realEstateAppraisalTrainingOrgRegFee` | 90,000 | 九万円 |
| 29 | 百四十七(一) | `realEstateTransactionBizLicenseFee` | 90,000 | 九万円 |
| 30 | 百四十七(二) | `realEstateTransactionTrainingOrgRegFee` | 90,000 | 九万円 |
| 31 | 百四十八 | `installmentLandBuildingSalesBizPermitFee` | 150,000 | 十五万円 |
| 32 | 百四十九 | `publicWorksAdvancePaymentGuaranteeBizRegFee` | 150,000 | 十五万円 |
| 33 | 百五十(一) | `realEstateSpecificJointBizPermitFee` | 150,000 | 十五万円 |
| 34 | 百五十(二) | `realEstateSpecificJointBizTypeIncreaseApprovalFee` | 30,000 | 三万円 |
| 35 | 百五十(三) | `smallRealEstateSpecificJointBizRegFee` | 150,000 | 十五万円 |
| 36 | 百五十(四) | `smallRealEstateSpecificJointBizTypeIncreaseRegFee` | 30,000 | 三万円 |
| 37 | 百五十一(一) | `condominiumManagerRegFee` | 90,000 | 九万円 |
| 38 | 百五十一(二) | `condominiumManagerTrainingOrgRegFee` | 90,000 | 九万円 |
| 39 | 百五十一(三) | `condominiumManagementStaffTrainingOrgRegFee` | 90,000 | 九万円 |
| 40 | 百五十一の二 | `rentalHousingManagerRegFee` | 90,000 | 九万円 |

金額一致の内訳: 九万円=27 件（90,000）／ 十五万円=7 件（150,000）／
三万円=3 件（30,000）／ 一万五千円=2 件（15,000）／ 一万円=1 件（10,000）
＝ 合計 40 件。pinned 原文の fee フレーズ出現数と完全一致。

`RegistrationQualificationFeesP8MSpec.lean` は `spec` 接頭辞の独立定式 40 本 +
`agreeRegistrationQualificationFeesP8M : Bool`（実装 ≡ spec の `==` 一致）+
`example : agreeRegistrationQualificationFeesP8M = true := by decide`。
`RegistrationQualificationFeesP8MTests.lean` は `example := by decide` のスモーク 40 件のみ。

doc-comment に明記した射程外（overclaim 防止）:

- 「政令で定めるものに限る」「更新の登録／免許／認定を除く」「既に…については一万五千円」
  「既に当該認定を受けている者が受けるものを除く」「既に他の建設業について許可がされている場合…を
  除く」の適用判定・軽減額は **caller-established** とし、金額定数には反映していません
  （Bool を式に入れていません）。
- 百四十・百四十二の（注）のみなし規定も caller-established です。
- 百四十五(一)(二) の一万五千円は軽減額であり、主たる fee（九万円）とは別 def を作っていません。
  百四十二(二)・百四十二の二の一万五千円は主たる fee string であり軽減額ではありません。
- 百三十九 以前・百五十二 以降は NOT YET COVERED。「認定件数」「登録件数」「許可件数」
  「免許件数」の意味上の区別は非モデル化（一律 `Money`）。倉庫数・トランクルーム数の掛け算も
  caller-established。

## 3. 転記監査に追加すべき check（JSON 断片）

`scripts/ci/transcription_audit.py` の `checks()` に追加する check の JSON 表現です
（`law_id` / `kind` / `title` / `needles` の 4 キー）。needle 文字列は一字も変えないこと。
**文字正規化・全角／半角変換・異体字変換を行わず、そのまま移してください。**
各 needle は正規化テキスト（空白・全角空白除去）上の連続部分そのもので、
pinned 原文 `art32_140_151.txt` と pinned JSON の両方で出現回数 1 です。

```json
{
  "law_id": "342AC0000000035",
  "kind": "file",
  "title": null,
  "needles": [
    "生計画の変更の認定は、当該登録又は変更登録とみなす。（一）倉庫業法第三条（登録）の倉庫業者の登録登録件数一件につき九万円",
    "（二）倉庫業法第七条第一項（変更登録等）の変更登録（倉庫の新設に係る変更登録で政令で定めるものに限る。）倉庫の数一個につき三万円",
    "限る。）倉庫の数一個につき三万円（三）倉庫業法第二十五条（トランクルームの認定）の認定トランクルームの数一個につき一万円",
    "（一）国際観光ホテル整備法（昭和二十四年法律第二百七十九号）第三条（ホテルの登録）のホテルの登録登録件数一件につき十五万円",
    "登録登録件数一件につき十五万円（二）国際観光ホテル整備法第十八条第一項（旅館の登録）の旅館の登録登録件数一件につき九万円",
    "（三）国際観光ホテル整備法第三条又は第十八条第一項の登録実施機関に係る登録（更新の登録を除く。）登録件数一件につき九万円",
    "百四十一の二全国通訳案内士に係る登録研修機関の登録通訳案内士法（昭和二十四年法律第二百十号）第三十条第一項（登録研修機関の登録）の登録（更新の登録を除く。）登録件数一件につき九万円",
    "（一）旅行業法第三条（登録）又は第六条の四第一項（変更登録）の規定による旅行業の登録又は変更登録（政令で定めるものに限り、更新の登録を除く。）登録件数一件につき九万円",
    "につき九万円（二）旅行業法第三条の規定による旅行業者代理業の登録（政令で定めるものに限る。）登録件数一件につき一万五千円",
    "一万五千円（三）旅行業法第二十三条（登録）の旅行サービス手配業の登録（政令で定めるものに限る。）登録件数一件につき九万円",
    "につき九万円（四）旅行業法第十二条の十一第一項（登録研修機関の登録）の登録（更新の登録を除く。）登録件数一件につき九万円",
    "一件につき九万円（五）旅行業法第二十八条第五項（登録研修機関の登録）の登録（更新の登録を除く。）登録件数一件につき九万円",
    "律第八条第三項（観光圏整備実施計画の認定）（同条第七項において準用する場合を含む。）の規定による観光圏整備実施計画（同法第十条第一項（認定観光圏案内所）に規定するものに限る。）の認定（既に当該認定を受けている者が受けるものを除く。）認定件数一件につき一万五千円",
    "（一）住宅宿泊事業法（平成二十九年法律第六十五号）第二十二条第一項（登録）の住宅宿泊管理業者の登録（更新の登録を除く。）登録件数一件につき九万円",
    "九万円（二）住宅宿泊事業法第四十六条第一項（登録）の住宅宿泊仲介業者の登録（更新の登録を除く。）登録件数一件につき九万円",
    "（一）気象業務法（昭和二十七年法律第百六十五号）第十七条第一項（予報業務の許可）の予報業務の許可許可件数一件につき九万円",
    "崩れ、高潮、波浪若しくは洪水のうちいずれかの予報の業務を新たに行うために受けるものに限り、既に同法第十八条第一項第四号の予報の業務の許可を受けている者が当該許可の範囲に含まれていない同号の予報の業務を新たに行うために受けるものを除く。）認可件数一件につき九万円",
    "（三）気象業務法第二十六条第一項（無線通信による資料の発表）の規定による気象の観測の成果に係る無線通信による発表の業務の許可許可件数一件につき九万円",
    "件につき九万円（四）気象業務法第三十二条の二第一項（測定能力の認定）の規定による認定測定者の認定認定件数一件につき九万円",
    "数一件につき九万円（五）気象業務法第九条第一項（登録検定機関の登録）の登録（更新の登録を除く。）登録件数一件につき九万円",
    "ごとにこれらの許可を一の許可とみなす。）イ建設業法第三条第一項第一号に掲げる者に係る同項の許可許可件数一件につき十五万円",
    "係る同項の許可許可件数一件につき十五万円ロ建設業法第三条第一項第二号に掲げる者に係る同項の許可許可件数一件につき十五万円",
    "ロ建設業法第三条第一項第二号に掲げる者に係る同項の許可許可件数一件につき十五万円（二）建設業法第二十六条第五項（講習の登録）の登録（更新の登録を除く。）登録件数一件につき九万円",
    "者に係る同項の許可許可件数一件につき十五万円（二）建設業法第二十六条第五項（講習の登録）の登録（更新の登録を除く。）登録件数一件につき九万円（三）建設業法第二十七条の二十四第一項（登録経営状況分析機関の登録）の登録（更新の登録を除く。）登録件数一件につき九万円",
    "（一）浄化槽法（昭和五十八年法律第四十三号）第十三条第一項（認定）の規定による工場において製造する浄化槽の型式の認定（更新の認定を除く。）認定件数一件につき九万円",
    "（二）浄化槽法第十三条第二項の規定による外国の工場において製造する浄化槽の型式の認定（更新の認定を除く。）認定件数一件につき九万円",
    "）の規定により国土交通大臣がする不動産鑑定業者の登録（更新の登録及び同法第十五条（登録）の不動産鑑定士が受ける登録を除く。）又は同法第二十六条第一項第二号（登録換え）の登録換えに係る登録（同法第十五条の不動産鑑定士が受ける登録を除く。）登録件数一件につき九万円",
    "（二）不動産の鑑定評価に関する法律第十四条の二（実務修習機関の登録）の登録（更新の登録を除く。）登録件数一件につき九万円",
    "（一）宅地建物取引業法（昭和二十七年法律第百七十六号）第三条第一項（免許）の国土交通大臣がする宅地建物取引業の免許（更新の免許を除く。）免許件数一件につき九万円",
    "つき九万円（二）宅地建物取引業法第十六条第三項（登録講習機関の登録）の登録（更新の登録を除く。）登録件数一件につき九万円",
    "百四十八積立式宅地建物販売業の許可積立式宅地建物販売業法（昭和四十六年法律第百十一号）第三条（積立式宅地建物販売業の許可）の規定により国土交通大臣がする積立式宅地建物販売業の許可許可件数一件につき十五万円",
    "百四十九前払金保証事業の登録公共工事の前払金保証事業に関する法律（昭和二十七年法律第百八十四号）第三条（登録）の前払金保証事業の登録登録件数一件につき十五万円",
    "（一）不動産特定共同事業法（平成六年法律第七十七号）第三条第一項（不動産特定共同事業の許可）の規定により主務大臣がする不動産特定共同事業の許可許可件数一件につき十五万円",
    "（二）不動産特定共同事業法第九条第一項（変更の認可）の規定により主務大臣がする変更の認可（同法第五条第一項第六号（許可の申請）の不動産特定共同事業の種別の増加に係るものに限る。）認可件数一件につき三万円",
    "（三）不動産特定共同事業法第四十一条第一項（小規模不動産特定共同事業の登録）の規定により主務大臣がする小規模不動産特定共同事業の登録（更新の登録を除く。）登録件数一件につき十五万円",
    "（四）不動産特定共同事業法第四十六条第一項（変更の登録）の規定により主務大臣がする変更の登録（同法第四十二条第一項第六号（登録の申請）の小規模不動産特定共同事業の種別の増加に係るものに限る。）登録件数一件につき三万円",
    "（一）マンションの管理の適正化の推進に関する法律第四十四条第一項（登録）のマンション管理業者の登録（更新の登録を除く。）登録件数一件につき九万円",
    "（二）マンションの管理の適正化の推進に関する法律第四十一条（登録講習機関の登録）の登録（更新の登録を除く。）登録件数一件につき九万円",
    "（三）マンションの管理の適正化の推進に関する法律第六十条第二項（登録講習機関の登録）の登録（更新の登録を除く。）登録件数一件につき九万円",
    "百五十一の二賃貸住宅管理業者の登録賃貸住宅の管理業務等の適正化に関する法律（令和二年法律第六十号）第三条第一項（登録）の賃貸住宅管理業者の登録（更新の登録を除く。）登録件数一件につき九万円"
  ]
}
```

参考：現行スクリプト形式への変換例（name は任意、needles は上記 40 本をそのまま使用）:

```python
yield ("登録免許税法 別表第一（二）第三十二号 百四十〜百五十一（倉庫・観光・住宅宿泊・気象・建設・浄化槽・不動産鑑定・宅建・積立式販売・前払金保証・不動産特定共同事業・マンション管理・賃貸住宅管理）↔ RegistrationQualificationFeesP8M.lean",
       "342AC0000000035",
       "file", None,
       [ ...上記 needles 40 本を一字も変えずに列挙... ])
```

## 4. 期待 literal 増分

- W-M 担当分: 新規 check **40 needles** なので **+40**。
- `docs/PROGRESS.md` の監査 literal 総数はメインセッションが再確認して加算してください
  （起点値は本メモでは書きません）。

## 5. 検証結果（すべて本セッションで実行済み）

- `lake build JapanTaxLaw.RegistrationQualificationFeesP8M JapanTaxLaw.RegistrationQualificationFeesP8MSpec JapanTaxLaw.RegistrationQualificationFeesP8MTests`
  → **成功（5 jobs、warning なし）**。※自作 3 モジュールのみビルド（全体ビルド／CI／
  `run_python_gates.py` は実行していません）。
- `python scripts/ci/check_no_sorry.py` → `no forbidden placeholder proofs found in tracked Lean sources`。
  （新規 3 ファイルは未追跡のため走査対象外ですが、人力でも `sorry` / `admit` はありません。）
- `#print axioms`（一時ファイル `WMAxiomProbe.lean` を approved temp dir に作成、`lake env lean` で
  実行後 **削除済み**）:
  - 新規 positivity 定理 **40 本すべて** と `agreeRegistrationQualificationFeesP8M` の計 **41 件**が
    `does not depend on any axioms`。
  - **`Classical.choice` も `sorryAx` も `propext` も一切なし**（出力 41 行を全文走査、いずれも 0 回）。
- 原文逐語検証（pinned 原文 / pinned JSON を正規化テキストに対して `.find()`）:
  **40/40 FOUND、MISS 0 件**（§6）。各 needle は両テキストで出現回数 **1**（一意）、
  長さはすべて **60〜130 文字**、40 本すべて相互に異なることを確認。
- 金額一致: 一件につき九万円=27 / 十五万円=7 / 三万円=3 / 一万五千円=2 / 一万円=1
  ＝ 40 件、pinned 原文の fee フレーズ出現数と完全一致（`千分の` 0 回、割合なし）。

## 6. 逐語検証 FOUND / MISS 一覧（一字も変更せず）

担当範囲原文 `art32_140_151.txt` を、転記監査と同じ `re.sub(r"[\s\u3000]+", "", ...)` で正規化した文字列に
対して各 needle を Python の `.find()` で検索（`art@`）。
`json@` は pinned JSON `law_full_text` を `transcription_audit.py` と同一ロジックで平坦化・正規化した文字列上の offset。
各 needle の出現回数は両方とも **1**（一意）。

| # | 条号/区分 | def | 結果 | art@ | json@ | 出現回数(art/json) | len |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 1 | 百四十(一) | `warehouseOperatorRegFee` | FOUND | 506 | 195091 | 1/1 | 60 |
| 2 | 百四十(二) | `warehouseNewChangeRegFeePerUnit` | FOUND | 566 | 195151 | 1/1 | 64 |
| 3 | 百四十(三) | `trunkRoomCertificationFeePerUnit` | FOUND | 614 | 195199 | 1/1 | 60 |
| 4 | 百四十一(一) | `hotelRegFee` | FOUND | 710 | 195295 | 1/1 | 61 |
| 5 | 百四十一(二) | `ryokanRegFee` | FOUND | 756 | 195341 | 1/1 | 60 |
| 6 | 百四十一(三) | `foreignGuestLodgingRegOrgRegFee` | FOUND | 816 | 195401 | 1/1 | 60 |
| 7 | 百四十一の二 | `nationalGuideTrainingOrgRegFee` | FOUND | 876 | 195461 | 1/1 | 90 |
| 8 | 百四十二(一) | `travelAgencyRegFee` | FOUND | 1459 | 196044 | 1/1 | 83 |
| 9 | 百四十二(二) | `travelAgencySubAgentRegFee` | FOUND | 1536 | 196121 | 1/1 | 60 |
| 10 | 百四十二(三) | `travelServiceArrangerRegFee` | FOUND | 1591 | 196176 | 1/1 | 60 |
| 11 | 百四十二(四) | `travelAgencyTrainingOrgRegFee` | FOUND | 1645 | 196230 | 1/1 | 60 |
| 12 | 百四十二(五) | `travelAgencyManagerTrainingOrgRegFee` | FOUND | 1697 | 196282 | 1/1 | 60 |
| 13 | 百四十二の二 | `tourismZoneGuideOfficePlanCertificationFee` | FOUND | 1814 | 196399 | 1/1 | 130 |
| 14 | 百四十二の三(一) | `privateLodgingManagerRegFee` | FOUND | 1971 | 196556 | 1/1 | 72 |
| 15 | 百四十二の三(二) | `privateLodgingBrokerRegFee` | FOUND | 2040 | 196625 | 1/1 | 60 |
| 16 | 百四十三(一) | `weatherForecastBizPermitFee` | FOUND | 2190 | 196775 | 1/1 | 60 |
| 17 | 百四十三(二) | `weatherForecastScopeChangeApprovalFee` | FOUND | 2349 | 196934 | 1/1 | 130 |
| 18 | 百四十三(三) | `weatherObservationWirelessBroadcastPermitFee` | FOUND | 2479 | 197064 | 1/1 | 74 |
| 19 | 百四十三(四) | `weatherInstrumentMeasurerCertificationFee` | FOUND | 2546 | 197131 | 1/1 | 60 |
| 20 | 百四十三(五) | `weatherInstrumentInspectionOrgRegFee` | FOUND | 2597 | 197182 | 1/1 | 60 |
| 21 | 百四十四(一)イ | `constructionBizPermitClass1Fee` | FOUND | 2883 | 197468 | 1/1 | 60 |
| 22 | 百四十四(一)ロ | `constructionBizPermitClass2Fee` | FOUND | 2923 | 197508 | 1/1 | 60 |
| 23 | 百四十四(二) | `constructionEngineerTrainingRegFee` | FOUND | 2943 | 197528 | 1/1 | 88 |
| 24 | 百四十四(三) | `constructionBizAnalysisOrgRegFee` | FOUND | 2961 | 197546 | 1/1 | 130 |
| 25 | 百四十五(一) | `domesticSepticTankTypeCertificationFee` | FOUND | 3114 | 197699 | 1/1 | 81 |
| 26 | 百四十五(二) | `foreignSepticTankTypeCertificationFee` | FOUND | 3255 | 197840 | 1/1 | 65 |
| 27 | 百四十六(一) | `realEstateAppraisalBizRegFee` | FOUND | 3463 | 198048 | 1/1 | 130 |
| 28 | 百四十六(二) | `realEstateAppraisalTrainingOrgRegFee` | FOUND | 3593 | 198178 | 1/1 | 60 |
| 29 | 百四十七(一) | `realEstateTransactionBizLicenseFee` | FOUND | 3688 | 198273 | 1/1 | 80 |
| 30 | 百四十七(二) | `realEstateTransactionTrainingOrgRegFee` | FOUND | 3763 | 198348 | 1/1 | 60 |
| 31 | 百四十八 | `installmentLandBuildingSalesBizPermitFee` | FOUND | 3823 | 198408 | 1/1 | 102 |
| 32 | 百四十九 | `publicWorksAdvancePaymentGuaranteeBizRegFee` | FOUND | 3925 | 198510 | 1/1 | 79 |
| 33 | 百五十(一) | `realEstateSpecificJointBizPermitFee` | FOUND | 4083 | 198668 | 1/1 | 84 |
| 34 | 百五十(二) | `realEstateSpecificJointBizTypeIncreaseApprovalFee` | FOUND | 4167 | 198752 | 1/1 | 101 |
| 35 | 百五十(三) | `smallRealEstateSpecificJointBizRegFee` | FOUND | 4268 | 198853 | 1/1 | 90 |
| 36 | 百五十(四) | `smallRealEstateSpecificJointBizTypeIncreaseRegFee` | FOUND | 4358 | 198943 | 1/1 | 108 |
| 37 | 百五十一(一) | `condominiumManagerRegFee` | FOUND | 4505 | 199090 | 1/1 | 72 |
| 38 | 百五十一(二) | `condominiumManagerTrainingOrgRegFee` | FOUND | 4577 | 199162 | 1/1 | 66 |
| 39 | 百五十一(三) | `condominiumManagementStaffTrainingOrgRegFee` | FOUND | 4643 | 199228 | 1/1 | 68 |
| 40 | 百五十一の二 | `rentalHousingManagerRegFee` | FOUND | 4711 | 199296 | 1/1 | 94 |

- **FOUND 40 / MISS 0**。needle の長さはすべて **60〜130 文字**、40 本すべて相互に異なることを確認。
  アンカーの勝手な変更・正規化・文字変換はしていません。
- 各 needle には項目の条号（百四十〜百五十一の二）又は区分（（一）〜（五）、イ／ロ）を含めています。
  原文が長いため 130 文字制約と fee literal の逐語確認を両立させる目的で一意な連続部分を
  アンカーとした項目（#1, #3, #5, #9〜#12, #15, #19, #20, #22〜#24, #27, #30）では、
  対応する条号／区分を上表および def の doc-comment に明記しています。
  特に #13, #17, #24, #27 は原文が極端に長いため fee literal を含む連続部分（130 文字）を
  アンカーとしています。
- 金額の日本語数字との対応も全件一致（九万円=90,000 / 十五万円=150,000 / 三万円=30,000 /
  一万五千円=15,000 / 一万円=10,000）。

## 7. README / PROGRESS に足す 1 行文案

CROSS_LAW の scan/pin 件数や監査 literal 総数はメインセッションが計算するため、ここでは書きません。

- **README.md**（モジュール一覧・`RegistrationQualificationFeesP7L*` 行の直後に追加）:
  ```text
  JapanTaxLaw/RegistrationQualificationFeesP8M.lean / -Spec.lean / -Tests.lean  # 登録免許税法 別表第一（二）第三十二号 百四十〜百五十一（倉庫・観光・住宅宿泊・気象・建設・浄化槽・不動産鑑定・宅建・積立式販売・前払金保証・不動産特定共同事業・マンション管理・賃貸住宅管理）の flat fee L4 モデル・独立定式・退行テスト
  ```
- **docs/PROGRESS.md**（L4 着手済みモジュール一覧の末尾に追記）:
  ```text
  登録免許税法 別表第一（二）第三十二号 百四十〜百五十一（RegistrationQualificationFeesP8M.lean：40 件の flat fee 額を Money 定数化、百三十九 以前・百五十二 以降 NOT YET COVERED）
  ```

## 8. インテグレーターへの明示事項

**インテグレーターは `JapanTaxLaw.lean` に以下の 3 つの import を追加すること。**

```lean
import JapanTaxLaw.RegistrationQualificationFeesP8M
import JapanTaxLaw.RegistrationQualificationFeesP8MSpec
import JapanTaxLaw.RegistrationQualificationFeesP8MTests
```

（W-A〜W-L の各 3 件と併せてメインが行数を確認してください。
W-M は `JapanTaxLaw.lean` を書き換えていません。W-N の P8N ファイルには触れていません。）

## 9. 範囲・残ブロッカーの正直な申告（最終報告）

- **build**: 自作 3 モジュールのみ `lake build` 成功（5 jobs / warning なし）。全体ビルド・CI・
  `run_python_gates.py` は未実行です。
- **axiom**: 新規 positivity 40 本 + agree 1 本の計 41 件すべて axiom-free、
  `Classical.choice` / `sorryAx` / `propext` なし（一時ファイルは削除済み）。
- **逐語**: FOUND 40 / MISS 0（担当範囲原文・pinned JSON の両方、出現回数 1、長さ 60〜130）。
- **def 数**: 40（九万円 27 / 十五万円 7 / 三万円 3 / 一万五千円 2 / 一万円 1）。
  百四十五(一)(二) の一万五千円は軽減額のため別 def は作っていません。
  百四十・百四十二の（注）のみなし規定にも fee def は作っていません。
- **STAGING**: 本ファイル `docs/STAGING_WM.md` を作成済みです。
- これは **L4 のごく小さなスライス**です。**完成・網羅を主張しません**。
- 担当は 別表第一（二）第三十二号 **百四十〜百五十一 のみ**。**百三十九 以前・百五十二 以降は
  NOT YET COVERED**。
- 「政令で定めるものに限る」「更新の登録／免許／認定を除く」「既に…については一万五千円」、
  および（注）のみなし規定の該当性はすべて caller-established とし、法的判断の自動化はしていません。
- `agreeRegistrationQualificationFeesP8M` は定数同士の `==` 一致確認であり、法的意味の等価証明ではありません。
- 転記監査は fidelity-only（原文 bytes との一致確認）であり、法的正しさを保証しません。
- **L7 候補 3,438 件は unreviewed のまま**です（本スライスでは一切レビューしていません）。
- 残ブロッカー: 転記監査 check の `checks()` への組み込み（§3、+40）、`JapanTaxLaw.lean` への
  import 追加（§8）、README / PROGRESS の 1 行追記（§7）、および全体ビルド・CI ゲートの
  実行は**すべてメインセッションの担当**です（W-M は実行していません）。
