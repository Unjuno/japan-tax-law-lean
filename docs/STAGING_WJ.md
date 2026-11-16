# STAGING — W-J（登録免許税法 別表第一（二）第三十二号 百二十五〜百二十九 の flat fee）受け渡しメモ

> 実装担当 W-J からメインセッション（統合担当）への受け渡し用。
> ブランチ操作・add/commit/push/merge は一切していません。
> 書き換えたのは下記 4 ファイルのみです（他は読み取り専用）。

## 0. 対象ファイル

| ファイル | 状態 |
| --- | --- |
| `JapanTaxLaw/RegistrationQualificationFeesP6J.lean` | 新規 |
| `JapanTaxLaw/RegistrationQualificationFeesP6JSpec.lean` | 新規 |
| `JapanTaxLaw/RegistrationQualificationFeesP6JTests.lean` | 新規 |
| `docs/STAGING_WJ.md` | 新規（本ファイル） |

pinned source: `data/raw/342AC0000000035_20261101_508AC0000000021.law.json`
law id `342AC0000000035` / revision `342AC0000000035_20261101_508AC0000000021`
amendment enforcement date `2026-11-01`（RegistrationQualificationFees / P2A〜P6J と同一ピン）。
担当範囲原文: `art32_125_129.txt`（百二十五〜百二十九、UTF-8、1 行 5177 文字、
正規化後 5148 文字）。pinned bytes から金額を日本語数字で読み取り Arabic に変換
（九万円→90,000 / 十二万円→120,000 / 六万円→60,000 / 三万円→30,000 / 一万五千円→15,000 /
五千円→5,000 / 三千円→3,000 / 十五万円→150,000、全件一致確認済み）。

## 1. 担当範囲のカテゴリ一覧（百二十五〜百二十九）

| 条号 | 区分／法律 | 件数 |
| --- | --- | --- |
| 百二十五(一) | 道路運送法（一般旅客自動車運送事業の許可：イ乗合・貸切／ロ乗用） | 2 |
| 百二十五(二) | 道路運送法（事業計画の変更の認可：イ・ロ・ハ） | 3 |
| 百二十五(三) | 道路運送法（特定旅客自動車運送事業の許可） | 1 |
| 百二十五(四)(五) | 貨物自動車運送事業法（一般貨物／特定貨物の許可） | 2 |
| 百二十五(六)(七) | 貨物自動車運送事業法（登録貨物軽自動車安全管理者講習機関／定期講習機関の登録） | 2 |
| 百二十五の二 | タクシー業務適正化特別措置法（登録実施機関の登録） | 1 |
| 百二十五の三 | 道路運送法（自家用有償旅客運送者の登録／変更登録） | 2 |
| 百二十六 | 道路運送法（自家用自動車の有償貸渡しの許可） | 1 |
| 百二十七 | 運河法（運河開設の免許） | 1 |
| 百二十七の二 | 港湾法（登録確認機関の登録） | 1 |
| 百二十八 | 造船法（(一) 施設の新設等／(二) 設備の新設等の許可） | 2 |
| 百二十九 | 小型船造船業法（小型船造船業者の登録） | 1 |
| **合計** | | **19** |

原文の「〜件数一件につき△△円」フレーズ出現数は **19**（`につき` / `一件につき` の出現数も 19）で、
タスク指定の 19 件と一致します。本範囲に割合（千分の△）はありません。
`政令` の出現は 6 回（適用除外・限定の文言、すべて caller-established）、`既に`（デーミング）は 0 回です。

**金額なし／fee def を作らない行**: 百二十五(一)ロ 括弧内の「個人の受ける一般乗用旅客自動車
運送事業の許可で政令で定めるものについては、一万五千円」は軽減額の例外であり
「一件につき」の主たる fee string ではないため別 def を作りません（caller-established の軽減例外）。
また 百二十五・百二十五の三・百二十八の（注）のみなし規定（各種計画の認定等を許可等とみなす）
も適用判定であり金額定数には反映しません。デーミング規定・金額なし行は本範囲に存在しないため、
fee string 19 行すべてを fee def 化しました。

## 2. 追加した def 一覧（名前 → 金額 → 条号／区分）

`namespace JapanTaxLaw`、`open JapanTaxLaw.TaxFinance`。各 def は `Money := <額>` の flat 定数
（課税標準は一件につき）。各 def に `<name>_pos : <name> > 0 := by decide` と
`example : <name> = <額> := by decide` を付与済み（19 本ずつ）。

| # | 条号／区分 | def 名 | 金額 | 原文 fee |
| --- | --- | --- | --- | --- |
| 1 | 百二十五(一)イ | `generalRouteCharterPassengerTransportPermitFee` | 90,000 | 九万円 |
| 2 | 百二十五(一)ロ | `generalPassengerCarTransportPermitFee` | 30,000 | 三万円 |
| 3 | 百二十五(二)イ | `routeAreaIncreasePlanChangeApprovalFee` | 15,000 | 一万五千円 |
| 4 | 百二十五(二)ロ | `businessAreaIncreasePlanChangeApprovalFee` | 5,000 | 五千円 |
| 5 | 百二十五(二)ハ | `semiSpecificAreaCapacityIncreasePlanChangeApprovalFee` | 5,000 | 五千円 |
| 6 | 百二十五(三) | `specifiedPassengerTransportBizPermitFee` | 30,000 | 三万円 |
| 7 | 百二十五(四) | `generalFreightTransportBizPermitFee` | 120,000 | 十二万円 |
| 8 | 百二十五(五) | `specifiedFreightTransportBizPermitFee` | 60,000 | 六万円 |
| 9 | 百二十五(六) | `registeredLightFreightSafetyInstructorTrainingOrgRegFee` | 90,000 | 九万円 |
| 10 | 百二十五(七) | `registeredLightFreightSafetyInstructorPeriodicTrainingOrgRegFee` | 90,000 | 九万円 |
| 11 | 百二十五の二 | `taxiDriverRegistrationOrgRegFee` | 90,000 | 九万円 |
| 12 | 百二十五の三(一) | `privatePaidPassengerTransportRegFee` | 15,000 | 一万五千円 |
| 13 | 百二十五の三(二) | `privatePaidPassengerTransportChangeRegFee` | 3,000 | 三千円 |
| 14 | 百二十六 | `privateCarPaidLoanPermitFee` | 90,000 | 九万円 |
| 15 | 百二十七 | `canalConstructionLicenseFee` | 150,000 | 十五万円 |
| 16 | 百二十七の二 | `portTechnicalStandardVerificationOrgRegFee` | 90,000 | 九万円 |
| 17 | 百二十八(一) | `shipMfgRepairFacilityNewPermitFee` | 150,000 | 十五万円 |
| 18 | 百二十八(二) | `shipMfgRepairEquipmentExpansionPermitFee` | 30,000 | 三万円 |
| 19 | 百二十九 | `smallVesselShipbuilderRegFee` | 90,000 | 九万円 |

金額一致の内訳: 九万円=7 件（90,000）／ 三万円=3 件（30,000）／ 一万五千円=2 件（15,000）／
五千円=2 件（5,000）／ 十二万円=1 件（120,000）／ 六万円=1 件（60,000）／ 三千円=1 件（3,000）／
十五万円=2 件（150,000）＝ 合計 19 件。pinned 原文の fee フレーズ出現数と完全一致。

`RegistrationQualificationFeesP6JSpec.lean` は `spec` 接頭辞の独立定式 19 本 +
`agreeRegistrationQualificationFeesP6J : Bool`（実装 ≡ spec の `==` 一致）+
`example : agreeRegistrationQualificationFeesP6J = true := by decide`。
`RegistrationQualificationFeesP6JTests.lean` は `example := by decide` のスモーク 19 件のみ。

doc-comment に明記した射程外（overclaim 防止）:

- 「政令で定めるものに限る」「政令で定めるものを除く」「更新の登録を除く」「更新の許可を除く」
  「財務省令で定めるもの」の適用判定は **caller-established** とし、金額定数には反映していません。
- 百二十五(一)ロ の軽減例外（政令で定める個人は一万五千円）も caller-established とし、別 def は作っていません。
- 百二十五・百二十五の三・百二十八の（注）のみなし規定も caller-established です。
- 百二十四 以前・百三十 以降は NOT YET COVERED。「認定件数」「登録件数」「許可件数」「免許件数」
  「申請件数」の意味上の区別は非モデル化（一律 `Money`）。

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
    "（一）道路運送法第四条第一項（一般旅客自動車運送事業の許可）の一般旅客自動車運送事業の許可イ一般乗合旅客自動車運送事業の許可又は一般貸切旅客自動車運送事業の許可（更新の許可を除く。）許可件数一件につき九万円",
    "一般乗合旅客自動車運送事業の許可又は一般貸切旅客自動車運送事業の許可（更新の許可を除く。）許可件数一件につき九万円ロ一般乗用旅客自動車運送事業の許可許可件数一件につき三万円",
    "イ（一）イに掲げる許可を受けている者が道路運送法第五条第一項第三号（許可申請）の路線又は営業区域を増加することに係る事業計画の変更の認可で財務省令で定めるもの認可件数一件につき一万五千円",
    "ロ（一）ロに掲げる許可（政令で定めるものを除く。ハにおいて同じ。）を受けている者が道路運送法第五条第一項第三号の営業区域を増加することに係る事業計画の変更の認可で財務省令で定めるもの認可件数一件につき五千円",
    "に規定する準特定地域における一般乗用旅客自動車運送事業の供給輸送力を増加させる事業計画の変更の認可で財務省令で定めるもの認可件数一件につき五千円",
    "件数一件につき五千円（三）道路運送法第四十三条第一項（特定旅客自動車運送事業）の特定旅客自動車運送事業の許可許可件数一件につき三万円",
    "（四）貨物自動車運送事業法第三条（一般貨物自動車運送事業の許可）の一般貨物自動車運送事業の許可許可件数一件につき十二万円",
    "（五）貨物自動車運送事業法第三十五条第一項（特定貨物自動車運送事業）の特定貨物自動車運送事業の許可許可件数一件につき六万円",
    "（六）貨物自動車運送事業法第五十八条の二（登録貨物軽自動車安全管理者講習機関の登録）の登録貨物軽自動車安全管理者講習機関の登録（更新の登録を除く。）登録件数一件につき九万円",
    "（七）貨物自動車運送事業法第五十八条の十六第一項（登録貨物軽自動車安全管理者定期講習機関の登録）の登録貨物軽自動車安全管理者定期講習機関の登録（更新の登録を除く。）登録件数一件につき九万円",
    "百二十五の二タクシーの運転者に係る登録実施機関の登録タクシー業務適正化特別措置法（昭和四十五年法律第七十五号）第十九条第一項（登録実施機関の登録）の登録（更新の登録を除く。）登録件数一件につき九万円",
    "（一）道路運送法第七十九条（登録）の自家用有償旅客運送者の登録（政令で定めるものに限り、更新の登録を除く。）登録件数一件につき一万五千円",
    "一万五千円（二）道路運送法第七十九条の七第一項（変更登録等）の変更登録（政令で定めるものに限る。）登録件数一件につき三千円",
    "百二十六自家用自動車の有償貸渡しの許可道路運送法第八十条第一項（有償貸渡し）の規定による自家用自動車の貸渡しの事業の許可（政令で定めるものを除く。）許可件数一件につき九万円",
    "百二十七運河開設の免許運河法（大正二年法律第十六号）第一条（免許）の規定による運河の開設の免許免許件数一件につき十五万円",
    "百二十七の二港湾の技術基準対象施設に係る登録確認機関の登録港湾法（昭和二十五年法律第二百十八号）第五十六条の二の二第三項（登録確認機関の登録）の登録（更新の登録を除く。）登録件数一件につき九万円",
    "の規定による船舶の製造又は修繕に係る施設の新設、譲受け又は借受けの許可（当該許可を受けている者が当該許可に係る施設について受けるもの及び一時的な需要のために行う許可で財務省令で定めるものを除く。）許可件数一件につき十五万円",
    "（二）造船法第三条第一項（設備の新設等の許可等）の規定による船舶の製造又は修繕に必要な設備の新設、増設又は拡張の許可（当該設備に係る拡張の許可で政令で定めるもの及び一時的な需要のために行う許可で財務省令で定めるものを除く。）許可件数一件につき三万円",
    "百二十九小型船造船業者の登録小型船造船業法（昭和四十一年法律第百十九号）第四条（登録）の規定による小型船造船業者の登録登録件数一件につき九万円"
  ]
}
```

参考：現行スクリプト形式への変換例（name は任意、needles は上記 19 本をそのまま使用）:

```python
yield ("登録免許税法 別表第一（二）第三十二号 百二十五〜百二十九（道路運送・貨物自動車運送・タクシー登録実施機関・自家用有償旅客・運河・港湾・造船・小型船）↔ RegistrationQualificationFeesP6J.lean",
       "342AC0000000035",
       "file", None,
       [ ...上記 needles 19 本を一字も変えずに列挙... ])
```

## 4. 期待 literal 増分

- W-J 担当分: 新規 check **19 needles** なので **+19**。
- `docs/PROGRESS.md` の監査 literal 総数はメインセッションが再確認して加算してください
  （起点値は本メモでは書きません）。

## 5. 検証結果（すべて本セッションで実行済み）

- `lake build JapanTaxLaw.RegistrationQualificationFeesP6J JapanTaxLaw.RegistrationQualificationFeesP6JSpec JapanTaxLaw.RegistrationQualificationFeesP6JTests`
  → **成功（5 jobs、warning なし）**。※自作 3 モジュールのみビルド（全体ビルド／CI／`run_python_gates.py` は実行していません）。
- `python scripts/ci/check_no_sorry.py` → `no forbidden placeholder proofs found in tracked Lean sources`。
  （新規 3 ファイルは未追跡のため走査対象外ですが、人力でも `sorry` / `admit` はありません。）
- `#print axioms`（一時ファイル `WJAxiomProbe.lean` を approved temp dir に作成、`lake env lean` で実行後 **削除済み**）:
  - 新規 positivity 定理 **19 本すべて** と `agreeRegistrationQualificationFeesP6J` の計 **20 件**が
    `does not depend on any axioms`。
  - **`Classical.choice` も `sorryAx` も `propext` も一切なし**（出力 20 行を全文走査、いずれも 0 回）。
- 原文逐語検証（pinned JSON を正規化テキストに対して `.find()`）: **19/19 FOUND、MISS 0 件**（§6）。
  担当範囲原文 `art32_125_129.txt` 正規化テキストに対しても **19/19 FOUND、MISS 0 件**。
  各 needle は両テキストで出現回数 **1**（一意）、長さはすべて **60〜124 文字**、19 本すべて相互に異なることを確認。
  law id `342AC0000000035` … FOUND / revision `342AC0000000035_20261101_508AC0000000021` … FOUND。
- 金額一致: 九万円=7 / 三万円=3 / 一万五千円=2 / 五千円=2 / 十二万円=1 / 六万円=1 / 三千円=1 / 十五万円=2
  ＝ 19 件、pinned 原文の fee フレーズ出現数と完全一致。

## 6. 逐語検証 FOUND / MISS 一覧（一字も変更せず）

担当範囲原文 `art32_125_129.txt` を、転記監査と同じ `re.sub(r"[\s\u3000]+", "", ...)` で正規化した文字列に
対して各 needle を Python の `.find()` で検索（`art@`）。
`json@` は pinned JSON `law_full_text` を `transcription_audit.py` と同一ロジックで平坦化・正規化した文字列上の offset。
各 needle の出現回数は両方とも **1**（一意）。

| # | 条号/区分 | def | 結果 | art@ | json@ | 出現回数(art/json) | len |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 1 | 百二十五(一)イ | `generalRouteCharterPassengerTransportPermitFee` | FOUND | 2436 | 183911 | 1/1 | 103 |
| 2 | 百二十五(一)ロ | `generalPassengerCarTransportPermitFee` | FOUND | 2482 | 183957 | 1/1 | 86 |
| 3 | 百二十五(二)イ | `routeAreaIncreasePlanChangeApprovalFee` | FOUND | 2652 | 184127 | 1/1 | 93 |
| 4 | 百二十五(二)ロ | `businessAreaIncreasePlanChangeApprovalFee` | FOUND | 2745 | 184220 | 1/1 | 103 |
| 5 | 百二十五(二)ハ | `semiSpecificAreaCapacityIncreasePlanChangeApprovalFee` | FOUND | 2923 | 184398 | 1/1 | 72 |
| 6 | 百二十五(三) | `specifiedPassengerTransportBizPermitFee` | FOUND | 2985 | 184460 | 1/1 | 66 |
| 7 | 百二十五(四) | `generalFreightTransportBizPermitFee` | FOUND | 3051 | 184526 | 1/1 | 60 |
| 8 | 百二十五(五) | `specifiedFreightTransportBizPermitFee` | FOUND | 3111 | 184586 | 1/1 | 61 |
| 9 | 百二十五(六) | `registeredLightFreightSafetyInstructorTrainingOrgRegFee` | FOUND | 3172 | 184647 | 1/1 | 86 |
| 10 | 百二十五(七) | `registeredLightFreightSafetyInstructorPeriodicTrainingOrgRegFee` | FOUND | 3258 | 184733 | 1/1 | 94 |
| 11 | 百二十五の二 | `taxiDriverRegistrationOrgRegFee` | FOUND | 3352 | 184827 | 1/1 | 99 |
| 12 | 百二十五の三(一) | `privatePaidPassengerTransportRegFee` | FOUND | 4194 | 185669 | 1/1 | 68 |
| 13 | 百二十五の三(二) | `privatePaidPassengerTransportChangeRegFee` | FOUND | 4257 | 185732 | 1/1 | 61 |
| 14 | 百二十六 | `privateCarPaidLoanPermitFee` | FOUND | 4318 | 185793 | 1/1 | 86 |
| 15 | 百二十七 | `canalConstructionLicenseFee` | FOUND | 4404 | 185879 | 1/1 | 60 |
| 16 | 百二十七の二 | `portTechnicalStandardVerificationOrgRegFee` | FOUND | 4464 | 185939 | 1/1 | 97 |
| 17 | 百二十八(一) | `shipMfgRepairFacilityNewPermitFee` | FOUND | 4842 | 186317 | 1/1 | 111 |
| 18 | 百二十八(二) | `shipMfgRepairEquipmentExpansionPermitFee` | FOUND | 4953 | 186428 | 1/1 | 124 |
| 19 | 百二十九 | `smallVesselShipbuilderRegFee` | FOUND | 5077 | 186552 | 1/1 | 71 |

- **FOUND 19 / MISS 0**。needle の長さはすべて **60〜124 文字**、19 本すべて相互に異なることを確認。
  アンカーの勝手な変更・正規化・文字変換はしていません（原文の `運` / `輸` / `運送` の使い分けも保持）。
- 各 needle には原則として項目の条号（百二十五〜百二十九）又は区分（（一）〜（七）、イ／ロ／ハ）を含めています。
  原文が極端に長いため 130 文字制約と fee literal の逐語確認を両立させる目的で一意な連続部分を
  アンカーとした項目（#1, #2, #3, #4, #5, #6, #9, #10, #11, #12, #13, #14, #16, #17, #18）では、
  対応する条号／区分を上表および def の doc-comment に明記しています。
- 金額の日本語数字との対応も全件一致（九万円=90,000 / 十二万円=120,000 / 六万円=60,000 /
  三万円=30,000 / 一万五千円=15,000 / 五千円=5,000 / 三千円=3,000 / 十五万円=150,000）。

## 7. README / PROGRESS に足す 1 行文案

CROSS_LAW の scan/pin 件数や監査 literal 総数はメインセッションが計算するため、ここでは書きません。

- **README.md**（モジュール一覧・`RegistrationQualificationFeesP5H*` 行の直後に追加）:
  ```text
  JapanTaxLaw/RegistrationQualificationFeesP6J.lean / -Spec.lean / -Tests.lean  # 登録免許税法 別表第一（二）第三十二号 百二十五〜百二十九（道路運送・貨物自動車運送・タクシー登録実施機関・自家用有償旅客・運河・港湾・造船・小型船）の flat fee L4 モデル・独立定式・退行テスト
  ```
- **docs/PROGRESS.md**（L4 着手済みモジュール一覧の末尾に追記）:
  ```text
  登録免許税法 別表第一（二）第三十二号 百二十五〜百二十九（RegistrationQualificationFeesP6J.lean：19 件の flat fee 額を Money 定数化、百二十四 以前・百三十 以降 NOT YET COVERED）
  ```

## 8. インテグレーターへの明示事項

**インテグレーターは `JapanTaxLaw.lean` に以下の 3 つの import を追加すること。**

```lean
import JapanTaxLaw.RegistrationQualificationFeesP6J
import JapanTaxLaw.RegistrationQualificationFeesP6JSpec
import JapanTaxLaw.RegistrationQualificationFeesP6JTests
```

（W-A〜W-H, W-I の各 3 件と併せてメインが行数を確認してください。
W-J は `JapanTaxLaw.lean` を書き換えていません。W-I の P6I ファイルには触れていません。）

## 9. 範囲・残ブロッカーの正直な申告（最終報告）

- **build**: 自作 3 モジュールのみ `lake build` 成功（5 jobs / warning なし）。全体ビルド・CI・
  `run_python_gates.py` は未実行です。
- **axiom**: 新規 positivity 19 本 + agree 1 本の計 20 件すべて axiom-free、
  `Classical.choice` / `sorryAx` / `propext` なし（一時ファイルは削除済み）。
- **逐語**: FOUND 19 / MISS 0（担当範囲原文・pinned JSON の両方、出現回数 1、長さ 60〜124）。
- **def 数**: 19（九万円 7 / 三万円 3 / 一万五千円 2 / 五千円 2 / 十二万円 1 / 六万円 1 /
  三千円 1 / 十五万円 2）。百二十五(一)ロ の軽減例外の別 def は作っていません。
- **STAGING**: 本ファイル `docs/STAGING_WJ.md` を作成済みです。
- これは **L4 のごく小さなスライス**です。**完成・網羅を主張しません**。
- 担当は 別表第一（二）第三十二号 **百二十五〜百二十九 のみ**。**百二十四 以前・百三十 以降は NOT YET COVERED**。
- 「政令で定めるものに限る／除く」「更新の登録／許可を除く」「財務省令で定めるもの」、
  百二十五(一)ロ の軽減例外、および（注）のみなし規定の該当性はすべて caller-established とし、
  法的判断の自動化はしていません。
- `agreeRegistrationQualificationFeesP6J` は定数同士の `==` 一致確認であり、法的意味の等価証明ではありません。
- 転記監査は fidelity-only（原文 bytes との一致確認）であり、法的正しさを保証しません。
- **L7 候補 3,438 件は unreviewed のまま**です（本スライスでは一切レビューしていません）。
- 残ブロッカー: 転記監査 check の `checks()` への組み込み（§3、+19）、`JapanTaxLaw.lean` への
  import 追加（§8）、README / PROGRESS の 1 行追記（§7）、および全体ビルド・CI ゲートの
  実行は**すべてメインセッションの担当**です（W-J は実行していません）。
