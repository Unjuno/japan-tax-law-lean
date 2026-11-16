# STAGING — W-L（登録免許税法 別表第一（二）第三十二号 百三十五〜百三十九 の flat fee）受け渡しメモ

> 実装担当 W-L からメインセッション（統合担当）への受け渡し用。
> ブランチ操作・add/commit/push/merge は一切していません。
> 書き換えたのは下記 4 ファイルのみです（他は読み取り専用）。

## 0. 対象ファイル

| ファイル | 状態 |
| --- | --- |
| `JapanTaxLaw/RegistrationQualificationFeesP7L.lean` | 新規 |
| `JapanTaxLaw/RegistrationQualificationFeesP7LSpec.lean` | 新規 |
| `JapanTaxLaw/RegistrationQualificationFeesP7LTests.lean` | 新規 |
| `docs/STAGING_WL.md` | 新規（本ファイル） |

pinned source: `data/raw/342AC0000000035_20261101_508AC0000000021.law.json`
law id `342AC0000000035` / revision `342AC0000000035_20261101_508AC0000000021`
amendment enforcement date `2026-11-01`（RegistrationQualificationFees / P2A〜P6J と同一ピン）。
担当範囲原文: `art32_135_139.txt`（百三十五〜百三十九、UTF-8、1 行、正規化後 4108 文字）。
pinned bytes から金額を日本語数字で読み取り Arabic に変換
（九万円→90,000 / 十五万円→150,000 / 十二万円→120,000 / 一万五千円→15,000 /
二万円→20,000、全件一致確認済み）。

## 1. 担当範囲のカテゴリ一覧（百三十五〜百三十九）

| 条号 | 区分／法律 | 件数 |
| --- | --- | --- |
| 百三十五 | 内航海運業法（内航海運業の登録） | 1 |
| 百三十六 | 船舶職員及び小型船舶操縦者法等による登録（（一）〜（八）） | 8 |
| 百三十六の二 | 水先法（登録水先人養成施設／水先免許更新講習、（一）（二）） | 2 |
| 百三十七 | 船員職業安定法（船員派遣事業の許可） | 1 |
| 百三十七の二 | 船員法（登録生存／登録消火／登録検査機関、（一）〜（三）） | 3 |
| 百三十八 | 航空法（空港等／航空保安施設の設置、事業場の認定、航空運送事業／航空機使用事業／外国人国際航空運送事業の許可、登録訓練機関、（一）イ・ロ〜（六）） | 7 |
| 百三十八の二 | 航空法（無人航空機検査の登録検査機関、登録講習機関、登録更新講習機関、（一）〜（三）） | 3 |
| 百三十九 | 貨物利用運送事業法（第一種／第二種の登録・許可、変更登録、事業計画変更認可、（一）〜（八）） | 8 |
| **合計** | | **33** |

原文の「〜件数一件につき△△円」フレーズ出現数は **33**（`一件につき` / `につき` の出現数も 33）で、
タスク指定の 33 件と一致します。本範囲に割合（千分の△）はありません。
`既に`（デーミング）は 0 回、`政令` の出現も 0 回です（`財務省令で定めるものに限る／除く` は
百三十八(二) と百三十九(二)(四)(六)(八) に出現、すべて caller-established）。

**金額なし／fee def を作らない行**: 百三十七・百三十九の（注）のみなし規定（各種計画の認定等を
許可・登録とみなす）は長大ですが金額を伴わない適用判定であり、fee def を作りません
（caller-established）。デーミング規定・金額なし fee 行は本範囲に存在しないため、
fee string 33 行すべてを fee def 化しました。百三十九(二)(六) の「一万五千円」は変更登録の
主たる fee string であり軽減額ではないため、別 def を作っていません。

## 2. 追加した def 一覧（名前 → 金額 → 条号／区分）

`namespace JapanTaxLaw`、`open JapanTaxLaw.TaxFinance`。各 def は `Money := <額>` の flat 定数
（課税標準は一件につき）。各 def に `<name>_pos : <name> > 0 := by decide` と
`example : <name> = <額> := by decide` を付与済み（33 本ずつ）。

| # | 条号／区分 | def 名 | 金額 | 原文 fee |
| --- | --- | --- | --- | --- |
| 1 | 百三十五 | `domesticCoastalShippingBizRegFee` | 90,000 | 九万円 |
| 2 | 百三十六(一) | `maritimeOfficerLicenseTrainingCourseRegFee` | 90,000 | 九万円 |
| 3 | 百三十六(二) | `maritimeLicenseRenewalTrainingCourseRegFee` | 90,000 | 九万円 |
| 4 | 百三十六(三) | `registeredSeafarerTrainingFacilityRegFee` | 90,000 | 九万円 |
| 5 | 百三十六(四) | `registeredFishingOperationTrainingOrgRegFee` | 90,000 | 九万円 |
| 6 | 百三十六(五) | `registeredSmallVesselTrainingSchoolRegFee` | 90,000 | 九万円 |
| 7 | 百三十六(六) | `operationLicenseRenewalTrainingCourseRegFee` | 90,000 | 九万円 |
| 8 | 百三十六(七) | `registeredSpecificOperationLicenseTrainingOrgRegFee` | 90,000 | 九万円 |
| 9 | 百三十六(八) | `electronicCommunicationTransitionTrainingRegFee` | 90,000 | 九万円 |
| 10 | 百三十六の二(一) | `registeredPilotTrainingFacilityRegFee` | 90,000 | 九万円 |
| 11 | 百三十六の二(二) | `pilotLicenseRenewalTrainingRegFee` | 90,000 | 九万円 |
| 12 | 百三十七 | `crewDispatchBizPermitFee` | 90,000 | 九万円 |
| 13 | 百三十七の二(一) | `registeredSurvivalTrainingOrgRegFee` | 90,000 | 九万円 |
| 14 | 百三十七の二(二) | `registeredFireFightingTrainingOrgRegFee` | 90,000 | 九万円 |
| 15 | 百三十七の二(三) | `registeredInspectionOrgRegFee` | 90,000 | 九万円 |
| 16 | 百三十八(一)イ | `airportInstallationPermitFee` | 150,000 | 十五万円 |
| 17 | 百三十八(一)ロ | `aviationSecurityFacilityInstallationPermitFee` | 90,000 | 九万円 |
| 18 | 百三十八(二) | `businessFacilityCertificationFee` | 90,000 | 九万円 |
| 19 | 百三十八(三) | `airTransportBizPermitFee` | 150,000 | 十五万円 |
| 20 | 百三十八(四) | `aircraftOperationBizPermitFee` | 90,000 | 九万円 |
| 21 | 百三十八(五) | `foreignInternationalAirTransportBizPermitFee` | 150,000 | 十五万円 |
| 22 | 百三十八(六) | `registeredTrainingOrgRegFee` | 90,000 | 九万円 |
| 23 | 百三十八の二(一) | `uavInspectionOrgRegFee` | 90,000 | 九万円 |
| 24 | 百三十八の二(二) | `uavOperationTrainingOrgRegFee` | 90,000 | 九万円 |
| 25 | 百三十八の二(三) | `uavOperationRenewalTrainingOrgRegFee` | 90,000 | 九万円 |
| 26 | 百三十九(一) | `firstClassFreightForwardingBizRegFee` | 90,000 | 九万円 |
| 27 | 百三十九(二) | `freightForwardingChangeRegFee` | 15,000 | 一万五千円 |
| 28 | 百三十九(三) | `secondClassFreightForwardingBizPermitFee` | 120,000 | 十二万円 |
| 29 | 百三十九(四) | `freightForwardingPlanChangeApprovalFee` | 20,000 | 二万円 |
| 30 | 百三十九(五) | `internationalFreightFirstClassRegFee` | 90,000 | 九万円 |
| 31 | 百三十九(六) | `internationalFreightChangeRegFee` | 15,000 | 一万五千円 |
| 32 | 百三十九(七) | `internationalFreightSecondClassPermitFee` | 120,000 | 十二万円 |
| 33 | 百三十九(八) | `internationalFreightPlanChangeApprovalFee` | 20,000 | 二万円 |

金額一致の内訳: 九万円=24 件（90,000）／ 十五万円=3 件（150,000）／
十二万円=2 件（120,000）／ 一万五千円=2 件（15,000）／ 二万円=2 件（20,000）
＝ 合計 33 件。pinned 原文の fee フレーズ出現数（一件につき九万円 24 /
一件につき十五万円 3 / 一件につき十二万円 2 / 一件につき一万五千円 2 /
一件につき二万円 2）と完全一致。

`RegistrationQualificationFeesP7LSpec.lean` は `spec` 接頭辞の独立定式 33 本 +
`agreeRegistrationQualificationFeesP7L : Bool`（実装 ≡ spec の `==` 一致）+
`example : agreeRegistrationQualificationFeesP7L = true := by decide`。
`RegistrationQualificationFeesP7LTests.lean` は `example := by decide` のスモーク 33 件のみ。

doc-comment に明記した射程外（overclaim 防止）:

- 「第三十二号に掲げるものを除く」「第三十二号及び次号に掲げるものを除く」
  「更新の登録を除く」「更新の許可を除く」「財務省令で定めるものに限る／除く」の適用判定は
  **caller-established** とし、金額定数には反映していません（Bool を式に入れていません）。
- 百三十七・百三十九の（注）のみなし規定（各種計画の認定等を許可・登録とみなす）も
  caller-established です。
- 百三十九(二)(六) の一万五千円は変更登録の主たる fee であり軽減額ではありません。
  本範囲に「既に…については一万五千円」型の軽減例外は存在しないため、軽減額の別 def は作っていません。
- 百三十四 以前・百四十 以降は NOT YET COVERED。「認定件数」「登録件数」「許可件数」の
  意味上の区別は非モデル化（一律 `Money`）。

## 3. 転記監査に追加すべき check（JSON 断片）

`scripts/ci/transcription_audit.py` の `checks()` に追加する check の JSON 表現です
（`law_id` / `kind` / `title` / `needles` の 4 キー）。needle 文字列は一字も変えないこと。
**文字正規化・全角／半角変換・異体字変換を行わず、そのまま移してください。**
各 needle は正規化テキスト（空白・全角空白除去）上の連続部分そのもので、
pinned 原文 `art32_135_139.txt` と pinned JSON の両方で出現回数 1 です。

```json
{
  "law_id": "342AC0000000035",
  "kind": "file",
  "title": null,
  "needles": [
    "百三十五内航海運業の登録内航海運業法（昭和二十七年法律第百五十一号）第三条第一項（登録）の内航海運業の登録登録件数一件につき九万円",
    "（一）船舶職員及び小型船舶操縦者法第四条第二項（海技免許講習の登録）の登録（更新の登録を除く。）登録件数一件につき九万円",
    "船舶職員及び小型船舶操縦者法第七条の二第三項第三号（海技免状更新講習の登録）の登録（更新の登録を除く。）登録件数一件につき九万円",
    "船舶職員及び小型船舶操縦者法第十三条の二第一項（登録船舶職員養成施設の登録）の登録（更新の登録を除く。）登録件数一件につき九万円",
    "船舶職員及び小型船舶操縦者法第二十二条の四（登録漁ろう操船講習機関の登録）の登録漁ろう操船講習機関の登録（更新の登録を除く。）登録件数一件につき九万円",
    "船舶職員及び小型船舶操縦者法第二十三条の十第一項（登録小型船舶教習所の登録）の登録（更新の登録を除く。）登録件数一件につき九万円",
    "船舶職員及び小型船舶操縦者法第二十三条の十一（操縦免許証更新講習の登録）において準用する同法第七条の二第三項第三号の登録（更新の登録を除く。）登録件数一件につき九万円",
    "船舶職員及び小型船舶操縦者法第二十三条の二十五（登録特定操縦免許講習機関の登録）の登録特定操縦免許講習機関の登録（更新の登録を除く。）登録件数一件につき九万円",
    "船舶安全法及び船舶職員法の一部を改正する法律（平成三年法律第七十五号）附則第三条（電子通信移行講習の登録）の登録（更新の登録を除く。）登録件数一件につき九万円",
    "免許更新講習の登録（一）水先法第五条第一項第二号（登録水先人養成施設の登録）の登録（更新の登録を除く。）登録件数一件につき九万円",
    "）登録件数一件につき九万円（二）水先法第十条第三項（水先免許更新講習の登録）の登録（更新の登録を除く。）登録件数一件につき九万円",
    "船員職業安定法（昭和二十三年法律第百三十号）第五十五条第一項（船員派遣事業の許可）の船員派遣事業の許可（更新の許可を除く。）許可件数一件につき九万円",
    "る登録（一）船員法第八十三条の二（登録生存講習機関の登録）の登録生存講習機関の登録（更新の登録を除く。）登録件数一件につき九万円",
    "万円（二）船員法第八十三条の十七（登録消火講習機関の登録）の登録消火講習機関の登録（更新の登録を除く。）登録件数一件につき九万円",
    "）登録件数一件につき九万円（三）船員法第百条の二第一項（登録検査機関の登録）の登録（更新の登録を除く。）登録件数一件につき九万円",
    "航空法第三十八条第一項（空港等又は航空保安施設の設置）の規定による空港等又は航空保安施設の設置の許可イ空港等の設置の許可許可件数一件につき十五万円",
    "港等又は航空保安施設の設置の許可イ空港等の設置の許可許可件数一件につき十五万円ロ航空保安施設の設置の許可許可件数一件につき九万円",
    "一件につき九万円（二）航空法第二十条第一項（事業場の認定）の事業場の認定（財務省令で定めるものを除く。）認定件数一件につき九万円",
    "省令で定めるものを除く。）認定件数一件につき九万円（三）航空法第百条第一項（許可）の航空運送事業の許可許可件数一件につき十五万円",
    "可許可件数一件につき十五万円（四）航空法第百二十三条第一項（航空機使用事業の許可）の航空機使用事業の許可許可件数一件につき九万円",
    "航空法第百二十九条第一項（外国人国際航空運送事業）の規定による旅客又は貨物を運送する事業の許可許可件数一件につき十五万円",
    "につき十五万円（六）航空法第九十九条の二（登録訓練機関の登録）の登録訓練機関の登録（更新の登録を除く。）登録件数一件につき九万円",
    "登録更新講習機関の登録（一）航空法第百三十二条の二十四（登録検査機関の登録）の登録（更新の登録を除く。）登録件数一件につき九万円",
    "き九万円（二）航空法第百三十二条の六十九（登録講習機関の登録）の登録講習機関の登録（更新の登録を除く。）登録件数一件につき九万円",
    "航空法第百三十二条の八十二（登録更新講習機関の登録）の登録更新講習機関の登録（更新の登録を除く。）登録件数一件につき九万円",
    "事業計画の変更の認可とみなす。（一）貨物利用運送事業法第三条第一項（登録）の第一種貨物利用運送事業の登録登録件数一件につき九万円",
    "項（変更登録等）の変更登録（同法第四条第一項第四号（登録の申請）の利用運送に係る運送機関の種類若しくは利用運送の区域若しくは区間の増加に係るもの（財務省令で定めるものに限る。）又は同号の業務の範囲の増加に係るものに限る。）登録件数一件につき一万五千円",
    "。）登録件数一件につき一万五千円（三）貨物利用運送事業法第二十条（許可）の第二種貨物利用運送事業の許可許可件数一件につき十二万円",
    "貨物利用運送事業法第二十五条第一項（事業計画及び集配事業計画）の事業計画の変更の認可（財務省令で定めるものに限る。）認可件数一件につき二万円",
    "貨物利用運送事業法第三十五条第一項（登録）の船舶運航事業者又は航空運送事業者の行う国際貨物運送に係る第一種貨物利用運送事業の登録登録件数一件につき九万円",
    "貨物利用運送事業法第三十九条第一項（変更登録等）の変更登録（同法第四条第一項第四号の利用運送の区間又は業務の範囲の増加に係るものに限る。）登録件数一件につき一万五千円",
    "貨物利用運送事業法第四十五条第一項（許可）の船舶運航事業者又は航空運送事業者の行う国際貨物運送に係る第二種貨物利用運送事業の許可許可件数一件につき十二万円",
    "貨物利用運送事業法第四十六条第二項（事業計画）の事業計画の変更の認可（財務省令で定めるものに限る。）認可件数一件につき二万円"
  ]
}
```

参考：現行スクリプト形式への変換例（name は任意、needles は上記 33 本をそのまま使用）:

```python
yield ("登録免許税法 別表第一（二）第三十二号 百三十五〜百三十九（内航海運・船舶職員／水先／船員派遣・船員・航空・無人航空機・貨物利用運送）↔ RegistrationQualificationFeesP7L.lean",
       "342AC0000000035",
       "file", None,
       [ ...上記 needles 33 本を一字も変えずに列挙... ])
```

## 4. 期待 literal 増分

- W-L 担当分: 新規 check **33 needles** なので **+33**。
- `docs/PROGRESS.md` の監査 literal 総数はメインセッションが再確認して加算してください
  （起点値は本メモでは書きません）。

## 5. 検証結果（すべて本セッションで実行済み）

- `lake build JapanTaxLaw.RegistrationQualificationFeesP7L JapanTaxLaw.RegistrationQualificationFeesP7LSpec JapanTaxLaw.RegistrationQualificationFeesP7LTests`
  → **成功（5 jobs、warning なし）**。※自作 3 モジュールのみビルド（全体ビルド／CI／`run_python_gates.py` は実行していません）。
  日本語コメントの軽微な修正後に再ビルドしても **成功（5 jobs）**。
- `python scripts/ci/check_no_sorry.py` → `no forbidden placeholder proofs found in tracked Lean sources`。
  （新規 3 ファイルは未追跡のため走査対象外ですが、人力でも `sorry` / `admit` はありません。）
- `#print axioms`（一時ファイル `WLAxiomProbe.lean` を approved temp dir に作成、`lake env lean` で
  実行後 **削除済み**）:
  - 新規 positivity 定理 **33 本すべて** と `agreeRegistrationQualificationFeesP7L` の計 **34 件**が
    `does not depend on any axioms`。
  - **`Classical.choice` も `sorryAx` も `propext` も一切なし**（出力 34 行を全文走査、いずれも 0 回）。
- 原文逐語検証（pinned 原文 / pinned JSON を正規化テキストに対して `.find()`）:
  **33/33 FOUND、MISS 0 件**（§6）。各 needle は両テキストで出現回数 **1**（一意）、
  長さはすべて **60〜125 文字**、33 本すべて相互に異なることを確認。
- 金額一致: 一件につき九万円=24 / 十五万円=3 / 十二万円=2 / 一万五千円=2 / 二万円=2
  ＝ 33 件、pinned 原文の fee フレーズ出現数と完全一致（`既に` 0 回、割合なし）。

## 6. 逐語検証 FOUND / MISS 一覧（一字も変更せず）

担当範囲原文 `art32_135_139.txt` を、転記監査と同じ `re.sub(r"[\s\u3000]+", "", ...)` で正規化した文字列に
対して各 needle を Python の `.find()` で検索（`art@`）。
`json@` は pinned JSON `law_full_text` を `transcription_audit.py` と同一ロジックで平坦化・正規化した文字列上の offset。
各 needle の出現回数は両方とも **1**（一意）。

| # | 条号/区分 | def | 結果 | art@ | json@ | 出現回数(art/json) | len |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 1 | 百三十五 | `domesticCoastalShippingBizRegFee` | FOUND | 0 | 190477 | 1/1 | 65 |
| 2 | 百三十六(一) | `maritimeOfficerLicenseTrainingCourseRegFee` | FOUND | 109 | 190586 | 1/1 | 60 |
| 3 | 百三十六(二) | `maritimeLicenseRenewalTrainingCourseRegFee` | FOUND | 172 | 190649 | 1/1 | 64 |
| 4 | 百三十六(三) | `registeredSeafarerTrainingFacilityRegFee` | FOUND | 239 | 190716 | 1/1 | 64 |
| 5 | 百三十六(四) | `registeredFishingOperationTrainingOrgRegFee` | FOUND | 306 | 190783 | 1/1 | 75 |
| 6 | 百三十六(五) | `registeredSmallVesselTrainingSchoolRegFee` | FOUND | 384 | 190861 | 1/1 | 64 |
| 7 | 百三十六(六) | `operationLicenseRenewalTrainingCourseRegFee` | FOUND | 451 | 190928 | 1/1 | 83 |
| 8 | 百三十六(七) | `registeredSpecificOperationLicenseTrainingOrgRegFee` | FOUND | 537 | 191014 | 1/1 | 79 |
| 9 | 百三十六(八) | `electronicCommunicationTransitionTrainingRegFee` | FOUND | 619 | 191096 | 1/1 | 79 |
| 10 | 百三十六の二(一) | `registeredPilotTrainingFacilityRegFee` | FOUND | 723 | 191200 | 1/1 | 64 |
| 11 | 百三十六の二(二) | `pilotLicenseRenewalTrainingRegFee` | FOUND | 774 | 191251 | 1/1 | 64 |
| 12 | 百三十七 | `crewDispatchBizPermitFee` | FOUND | 984 | 191461 | 1/1 | 74 |
| 13 | 百三十七の二(一) | `registeredSurvivalTrainingOrgRegFee` | FOUND | 1085 | 191562 | 1/1 | 64 |
| 14 | 百三十七の二(二) | `registeredFireFightingTrainingOrgRegFee` | FOUND | 1147 | 191624 | 1/1 | 64 |
| 15 | 百三十七の二(三) | `registeredInspectionOrgRegFee` | FOUND | 1198 | 191675 | 1/1 | 64 |
| 16 | 百三十八(一)イ | `airportInstallationPermitFee` | FOUND | 1308 | 191785 | 1/1 | 73 |
| 17 | 百三十八(一)ロ | `aviationSecurityFacilityInstallationPermitFee` | FOUND | 1342 | 191819 | 1/1 | 64 |
| 18 | 百三十八(二) | `businessFacilityCertificationFee` | FOUND | 1398 | 191875 | 1/1 | 64 |
| 19 | 百三十八(三) | `airTransportBizPermitFee` | FOUND | 1437 | 191914 | 1/1 | 64 |
| 20 | 百三十八(四) | `aircraftOperationBizPermitFee` | FOUND | 1487 | 191964 | 1/1 | 64 |
| 21 | 百三十八(五) | `foreignInternationalAirTransportBizPermitFee` | FOUND | 1554 | 192031 | 1/1 | 60 |
| 22 | 百三十八(六) | `registeredTrainingOrgRegFee` | FOUND | 1607 | 192084 | 1/1 | 64 |
| 23 | 百三十八の二(一) | `uavInspectionOrgRegFee` | FOUND | 1723 | 192200 | 1/1 | 64 |
| 24 | 百三十八の二(二) | `uavOperationTrainingOrgRegFee` | FOUND | 1783 | 192260 | 1/1 | 64 |
| 25 | 百三十八の二(三) | `uavOperationRenewalTrainingOrgRegFee` | FOUND | 1850 | 192327 | 1/1 | 61 |
| 26 | 百三十九(一) | `firstClassFreightForwardingBizRegFee` | FOUND | 3471 | 193948 | 1/1 | 64 |
| 27 | 百三十九(二) | `freightForwardingChangeRegFee` | FOUND | 3552 | 194029 | 1/1 | 125 |
| 28 | 百三十九(三) | `secondClassFreightForwardingBizPermitFee` | FOUND | 3661 | 194138 | 1/1 | 64 |
| 29 | 百三十九(四) | `freightForwardingPlanChangeApprovalFee` | FOUND | 3728 | 194205 | 1/1 | 70 |
| 30 | 百三十九(五) | `internationalFreightFirstClassRegFee` | FOUND | 3801 | 194278 | 1/1 | 76 |
| 31 | 百三十九(六) | `internationalFreightChangeRegFee` | FOUND | 3880 | 194357 | 1/1 | 83 |
| 32 | 百三十九(七) | `internationalFreightSecondClassPermitFee` | FOUND | 3966 | 194443 | 1/1 | 77 |
| 33 | 百三十九(八) | `internationalFreightPlanChangeApprovalFee` | FOUND | 4046 | 194523 | 1/1 | 62 |

- **FOUND 33 / MISS 0**。needle の長さはすべて **60〜125 文字**、33 本すべて相互に異なることを確認。
  アンカーの勝手な変更・正規化・文字変換はしていません（原文の `運` / `輸` / `運送` の使い分けも保持）。
- 各 needle には原則として項目の条号（百三十五〜百三十九）又は区分（（一）〜（八）、イ／ロ）を
  含めています。原文が極端に長いため 130 文字制約と fee literal の逐語確認を両立させる目的で
  一意な連続部分をアンカーとした項目（#10, #11, #13, #14, #15, #17〜#20, #22〜#24, #26, #28, #27）
  では、対応する条号／区分を上表および def の doc-comment に明記しています。
  特に #27 は原文が 139 文字と長いため fee literal を含む連続部分（125 文字）をアンカーとしています。
- 金額の日本語数字との対応も全件一致（九万円=90,000 / 十五万円=150,000 / 十二万円=120,000 /
  一万五千円=15,000 / 二万円=20,000）。

## 7. README / PROGRESS に足す 1 行文案

CROSS_LAW の scan/pin 件数や監査 literal 総数はメインセッションが計算するため、ここでは書きません。

- **README.md**（モジュール一覧・`RegistrationQualificationFeesP6J*` 行の直後に追加）:
  ```text
  JapanTaxLaw/RegistrationQualificationFeesP7L.lean / -Spec.lean / -Tests.lean  # 登録免許税法 別表第一（二）第三十二号 百三十五〜百三十九（内航海運・船舶職員／水先／船員派遣・船員・航空・無人航空機・貨物利用運送）の flat fee L4 モデル・独立定式・退行テスト
  ```
- **docs/PROGRESS.md**（L4 着手済みモジュール一覧の末尾に追記）:
  ```text
  登録免許税法 別表第一（二）第三十二号 百三十五〜百三十九（RegistrationQualificationFeesP7L.lean：33 件の flat fee 額を Money 定数化、百三十四 以前・百四十 以降 NOT YET COVERED）
  ```

## 8. インテグレーターへの明示事項

**インテグレーターは `JapanTaxLaw.lean` に以下の 3 つの import を追加すること。**

```lean
import JapanTaxLaw.RegistrationQualificationFeesP7L
import JapanTaxLaw.RegistrationQualificationFeesP7LSpec
import JapanTaxLaw.RegistrationQualificationFeesP7LTests
```

（W-A〜W-J, W-K の各 3 件と併せてメインが行数を確認してください。
W-L は `JapanTaxLaw.lean` を書き換えていません。W-K の P7K ファイルには触れていません。）

## 9. 範囲・残ブロッカーの正直な申告（最終報告）

- **build**: 自作 3 モジュールのみ `lake build` 成功（5 jobs / warning なし）。全体ビルド・CI・
  `run_python_gates.py` は未実行です。
- **axiom**: 新規 positivity 33 本 + agree 1 本の計 34 件すべて axiom-free、
  `Classical.choice` / `sorryAx` / `propext` なし（一時ファイルは削除済み）。
- **逐語**: FOUND 33 / MISS 0（担当範囲原文・pinned JSON の両方、出現回数 1、長さ 60〜125）。
- **def 数**: 33（九万円 24 / 十五万円 3 / 十二万円 2 / 一万五千円 2 / 二万円 2）。
  百三十九(二)(六) の一万五千円は主たる fee であり軽減額ではないため別 def は作っていません。
  百三十七・百三十九の（注）のみなし規定にも fee def は作っていません。
- **STAGING**: 本ファイル `docs/STAGING_WL.md` を作成済みです。
- これは **L4 のごく小さなスライス**です。**完成・網羅を主張しません**。
- 担当は 別表第一（二）第三十二号 **百三十五〜百三十九 のみ**。**百三十四 以前・百四十 以降は
  NOT YET COVERED**。
- 「第三十二号に掲げるものを除く」「更新の登録／許可を除く」「財務省令で定めるものに限る／除く」、
  および（注）のみなし規定の該当性はすべて caller-established とし、法的判断の自動化はしていません。
- `agreeRegistrationQualificationFeesP7L` は定数同士の `==` 一致確認であり、法的意味の等価証明ではありません。
- 転記監査は fidelity-only（原文 bytes との一致確認）であり、法的正しさを保証しません。
- **L7 候補 3,438 件は unreviewed のまま**です（本スライスでは一切レビューしていません）。
- 残ブロッカー: 転記監査 check の `checks()` への組み込み（§3、+33）、`JapanTaxLaw.lean` への
  import 追加（§8）、README / PROGRESS の 1 行追記（§7）、および全体ビルド・CI ゲートの
  実行は**すべてメインセッションの担当**です（W-L は実行していません）。
