# STAGING — W-K（登録免許税法 別表第一（二）第三十二号 百三十〜百三十四 の flat fee）受け渡しメモ

> 実装担当 W-K からメインセッション（統合担当）への受け渡し用。
> ブランチ操作・add/commit/push/merge は一切していません。
> 書き換えたのは下記 4 ファイルのみです（他は読み取り専用）。

## 0. 対象ファイル

| ファイル | 状態 |
| --- | --- |
| `JapanTaxLaw/RegistrationQualificationFeesP7K.lean` | 新規 |
| `JapanTaxLaw/RegistrationQualificationFeesP7KSpec.lean` | 新規 |
| `JapanTaxLaw/RegistrationQualificationFeesP7KTests.lean` | 新規 |
| `docs/STAGING_WK.md` | 新規（本ファイル） |

pinned source: `data/raw/342AC0000000035_20261101_508AC0000000021.law.json`
law id `342AC0000000035` / revision `342AC0000000035_20261101_508AC0000000021`
（いずれも `data/INVENTORY.json` の当該 law レコード／raw_snapshot で確認）。
amendment enforcement date `2026-11-01`。
担当範囲原文: `art32_130_134.txt`（百三十〜百三十四、UTF-8、1 行 3,894 文字、
正規化後 3,854 文字）。pinned bytes から金額を日本語数字で読み取り Arabic に変換
（九万円→90,000 / 十五万円→150,000 / 一万五千円→15,000 / 六万円→60,000 /
三万円→30,000、全件一致確認済み）。

## 1. 担当範囲のカテゴリ一覧（百三十〜百三十四）

| 条号 | 区分／法律 | 件数 |
| --- | --- | --- |
| 百三十 | 船舶安全法（(一)〜(三) 事業場の認定／(四)〜(八) 登録検定機関・登録検査確認機関・船級協会・登録検査機関・証書発給船級協会の登録） | 8 |
| 百三十一 | 海洋汚染等及び海上災害の防止に関する法律（(一)(二) 準用による認定／(三) 廃油処理事業の許可／(四)〜(九) 登録確認機関・船級協会・登録検定機関の登録） | 9 |
| 百三十二 | 国際航海船舶及び国際港湾施設の保安の確保等に関する法律（船級協会の登録） | 1 |
| 百三十二の二 | 船舶の再資源化解体の適正な実施に関する法律（(一) 再資源化解体の許可／(二)(三) 船級協会の登録） | 3 |
| 百三十三 | 海上運送法（(一)(二)(五) 航路事業の許可／(三)(四)(六) 航路事業の登録／(七)(八) 講習機関の登録） | 8 |
| 百三十四 | 港湾運送事業法（(一)〜(四) 港湾運送上の各種事業の許可） | 4 |
| **合計** | | **33** |

原文の「〜件数一件につき△△円」フレーズ出現数は **33**
（九万円 27 / 一万五千円 2 / 十五万円 1 / 六万円 1 / 三万円 2 = 33）で、
タスク指定の 33 件と一致します。本範囲に割合（千分の△）はありません。

**fee def を作らない行**: デーミング規定・金額なし行は本範囲に存在しません。
ただし 百三十(一)(二)(三) 及び 百三十一(一)(二) の括弧内「既に…については、一万五千円」
は軽減額の例外であり「一件につき」の主たる fee string ではないため別 def を作りません
（caller-established の軽減例外）。これらの軽減額を Bool 式や別 def で表現していません。
また 百三十（注）のみなし規定（特定船舶導入計画等の認定を事業場の認定とみなす）
百三十三（注）のみなし規定（総合効率化計画等の認定を許可／登録とみなす）も
適用判定であり金額定数には反映しません（caller-established）。

## 2. 追加した def 一覧（名前 → 金額 → 条号／区分）

`namespace JapanTaxLaw`、`open JapanTaxLaw.TaxFinance`。各 def は `Money := <額>` の flat 定数
（課税標準は一件につき）。各 def に `<name>_pos : <name> > 0 := by decide` と
`example : <name> = <額> := by decide` を付与済み（33 本ずつ）。

| # | 条号／区分 | def 名 | 金額 | 原文 fee |
| --- | --- | --- | --- | --- |
| 1 | 百三十(一) | `shipSafetyMfgConversionWorkSiteCertFee` | 90,000 | 九万円 |
| 2 | 百三十(二) | `shipSafetyMaintenanceWorkSiteCertFee` | 90,000 | 九万円 |
| 3 | 百三十(三) | `shipSafetyRemoteSupportWorkSiteCertFee` | 90,000 | 九万円 |
| 4 | 百三十(四) | `shipSafetyVerificationOrgRegFee` | 90,000 | 九万円 |
| 5 | 百三十(五) | `shipSafetyInspectionConfirmationOrgRegFee` | 90,000 | 九万円 |
| 6 | 百三十(六) | `shipSafetyClassificationSocietyRegFee` | 90,000 | 九万円 |
| 7 | 百三十(七) | `shipSafetyInspectionOrgRegFee` | 90,000 | 九万円 |
| 8 | 百三十(八) | `shipSafetyCertIssuingClassSocietyRegFee` | 90,000 | 九万円 |
| 9 | 百三十一(一) | `marinePollutionMfgWorkSiteCertFee` | 90,000 | 九万円 |
| 10 | 百三十一(二) | `marinePollutionMaintenanceWorkSiteCertFee` | 90,000 | 九万円 |
| 11 | 百三十一(三) | `wasteOilDisposalBizPermitFee` | 150,000 | 十五万円 |
| 12 | 百三十一(四) | `marinePollutionRegConfirmationOrgRegFee` | 90,000 | 九万円 |
| 13 | 百三十一(五) | `marinePollutionClassSocietyRegArt19No15Fee` | 90,000 | 九万円 |
| 14 | 百三十一(六) | `marinePollutionClassSocietyRegArt19No30Fee` | 90,000 | 九万円 |
| 15 | 百三十一(七) | `marinePollutionClassSocietyRegArt19No46Fee` | 90,000 | 九万円 |
| 16 | 百三十一(八) | `marinePollutionVerificationOrgRegViaSafetyActFee` | 90,000 | 九万円 |
| 17 | 百三十一(九) | `marinePollutionVerificationOrgRegArt43No9Fee` | 90,000 | 九万円 |
| 18 | 百三十二 | `shipSecurityClassSocietyRegFee` | 90,000 | 九万円 |
| 19 | 百三十二の二(一) | `shipRecyclingBizPermitFee` | 90,000 | 九万円 |
| 20 | 百三十二の二(二) | `shipRecyclingClassSocietyRegArt30Fee` | 90,000 | 九万円 |
| 21 | 百三十二の二(三) | `shipRecyclingClassSocietyRegArt31Fee` | 90,000 | 九万円 |
| 22 | 百三十三(一) | `generalPassengerRegularRouteBizPermitFee` | 90,000 | 九万円 |
| 23 | 百三十三(二) | `specifiedPassengerRegularRouteBizPermitFee` | 90,000 | 九万円 |
| 24 | 百三十三(三) | `externalPassengerRegularRouteBizRegFee` | 90,000 | 九万円 |
| 25 | 百三十三(四) | `passengerFreightRegularRouteBizRegFee` | 15,000 | 一万五千円 |
| 26 | 百三十三(五) | `passengerIrregularRouteBizPermitFee` | 90,000 | 九万円 |
| 27 | 百三十三(六) | `generalIrregularRouteBizRegFee` | 15,000 | 一万五千円 |
| 28 | 百三十三(七) | `registeredSafetyControlManagerTrainingOrgRegFee` | 90,000 | 九万円 |
| 29 | 百三十三(八) | `registeredOperationManagerTrainingOrgRegFee` | 90,000 | 九万円 |
| 30 | 百三十四(一) | `generalPortTransportBizPermitFee` | 90,000 | 九万円 |
| 31 | 百三十四(二) | `portStevedoringBizPermitFee` | 60,000 | 六万円 |
| 32 | 百三十四(三) | `lighterOrRaftTransportBizPermitFee` | 30,000 | 三万円 |
| 33 | 百三十四(四) | `tallySurveyOrMeasurementBizPermitFee` | 30,000 | 三万円 |

金額一致の内訳: 九万円=27 件（90,000）／ 一万五千円=2 件（15,000）／
十五万円=1 件（150,000）／ 六万円=1 件（60,000）／ 三万円=2 件（30,000）
＝ 合計 33 件。pinned 原文の fee フレーズ出現数と完全一致。

`RegistrationQualificationFeesP7KSpec.lean` は `spec` 接頭辞の独立定式 33 本 +
`agreeRegistrationQualificationFeesP7K : Bool`（実装 ≡ spec の `==` 一致）+
`example : agreeRegistrationQualificationFeesP7K = true := by decide`。
`RegistrationQualificationFeesP7KTests.lean` は `example := by decide` のスモーク 33 件のみ。

doc-comment に明記した射程外（overclaim 防止）:

- 「財務省令で定めるものを除く」「政令で定める許可を除く」「更新の登録／許可を除く」
  の適用判定は **caller-established** とし、金額定数には反映していません（Bool を式に入れていません）。
- 百三十(一)(二)(三)・百三十一(一)(二) の軽減例外（既に認定を受けている者は一万五千円）
  も caller-established とし、軽減額の別 def は作っていません。
- 百三十・百三十三の（注）のみなし規定も caller-established です。
- 百二十九 以前・百三十五 以降は NOT YET COVERED。「申請件数」「登録件数」「許可件数」
  の意味上の区別は非モデル化（一律 `Money`）。

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
    "（一）船舶安全法（昭和八年法律第十一号）第六条ノ二（事業場の認定）の製造工事又は改造修理工事に係る事業場の認定（財務省令で定めるものを除く。）申請件数一件につき九万円",
    "（二）船舶安全法第六条ノ三（事業場の認定）の整備に係る事業場の認定（財務省令で定めるものを除く。）申請件数一件につき九万円",
    "（三）船舶安全法第六条ノ四第一項（事業場の認定）の遠隔支援業務に係る事業場の認定（財務省令で定めるものを除く。）申請件数一件につき九万円",
    "に掲げる認定を受けている者については、一万五千円）（四）船舶安全法第六条ノ五第一項（登録検定機関の登録）の登録（更新の登録を除く。）登録件数一件につき九万円",
    "の登録（更新の登録を除く。）登録件数一件につき九万円（五）船舶安全法第六条ノ六（登録検査確認機関の登録）の登録（更新の登録を除く。）登録件数一件につき九万円",
    "機関の登録）の登録（更新の登録を除く。）登録件数一件につき九万円（六）船舶安全法第八条（船級協会の登録）の登録（更新の登録を除く。）登録件数一件につき九万円",
    "登録（更新の登録を除く。）登録件数一件につき九万円（七）船舶安全法第二十八条第五項（登録検査機関の登録）の登録（更新の登録を除く。）登録件数一件につき九万円",
    "（八）船舶安全法第二十九条ノ三第二項（証書の発給を行う船級協会の登録）の登録（更新の登録を除く。）登録件数一件につき九万円",
    "第十九条の四十九第一項（船舶安全法の準用）において準用する船舶安全法第六条ノ二（事業場の認定）の認定（財務省令で定めるものを除く。）申請件数一件につき九万円",
    "（二）海洋汚染等及び海上災害の防止に関する法律第十九条の四十九第一項において準用する船舶安全法第六条ノ三（事業場の認定）の認定（財務省令で定めるものを除く。）申請件数一件につき九万円",
    "（三）海洋汚染等及び海上災害の防止に関する法律第二十条第一項（事業の許可及び届出）の廃油処理事業の許可許可件数一件につき十五万円",
    "（四）海洋汚染等及び海上災害の防止に関する法律第九条の二第四項（登録確認機関の登録）の登録（更新の登録を除く。）登録件数一件につき九万円",
    "（五）海洋汚染等及び海上災害の防止に関する法律第十九条の十五第一項（船級協会の登録）の船級協会の登録（更新の登録を除く。）登録件数一件につき九万円",
    "（六）海洋汚染等及び海上災害の防止に関する法律第十九条の三十第一項（船級協会の登録）の船級協会の登録（更新の登録を除く。）登録件数一件につき九万円",
    "（七）海洋汚染等及び海上災害の防止に関する法律第十九条の四十六第一項（船級協会の登録）の船級協会の登録（更新の登録を除く。）登録件数一件につき九万円",
    "（八）海洋汚染等及び海上災害の防止に関する法律第十九条の四十九第一項において準用する船舶安全法第六条ノ五第一項（登録検定機関の登録）の登録（更新の登録を除く。）登録件数一件につき九万円",
    "（九）海洋汚染等及び海上災害の防止に関する法律第四十三条の九第一項（登録検定機関の登録）の登録（更新の登録を除く。）登録件数一件につき九万円",
    "（平成十六年法律第三十一号）第二十条第一項（船級協会の登録）の船級協会の登録（更新の登録を除く。）登録件数一件につき九万円",
    "（一）船舶の再資源化解体の適正な実施に関する法律（平成三十年法律第六十一号）第十条第一項（再資源化解体の許可）の特定船舶の再資源化解体の許可（更新の許可を除く。）許可件数一件につき九万円",
    "（二）船舶の再資源化解体の適正な実施に関する法律第三十条第一項（船級協会の登録）の船級協会の登録（更新の登録を除く。）登録件数一件につき九万円",
    "（三）船舶の再資源化解体の適正な実施に関する法律第三十一条第一項（船級協会の登録）の船級協会の登録（更新の登録を除く。）登録件数一件につき九万円",
    "（一）海上運送法第三条第一項（一般旅客定期航路事業の許可）の一般旅客定期航路事業の許可（離島航路整備法（昭和二十七年法律第二百二十六号）第二条第二項（定義）に規定する離島航路事業に係る許可その他政令で定める許可を除く。）許可件数一件につき九万円",
    "（二）海上運送法第十九条の六第一項（特定旅客定期航路事業の許可）の特定旅客定期航路事業の許可（（一）の離島航路事業に係る許可その他政令で定める許可を除く。）許可件数一件につき九万円",
    "る許可を除く。）許可件数一件につき九万円（三）海上運送法第十九条の七第一項（対外旅客定期航路事業の登録）の対外旅客定期航路事業の登録登録件数一件につき九万円",
    "）の対外旅客定期航路事業の登録登録件数一件につき九万円（四）海上運送法第二十条第一項（貨客定期航路事業）の貨客定期航路事業の登録登録件数一件につき一万五千円",
    "件数一件につき一万五千円（五）海上運送法第二十一条第一項（旅客不定期航路事業の許可）の旅客不定期航路事業の許可（更新の許可を除く。）許可件数一件につき九万円",
    "可（更新の許可を除く。）許可件数一件につき九万円（六）海上運送法第二十二条第一項（一般不定期航路事業）の一般不定期航路事業の登録登録件数一件につき一万五千円",
    "第三十二条の二十六（登録安全統括管理者講習機関の登録）の登録安全統括管理者講習機関の登録（更新の登録を除く。）登録件数一件につき九万円",
    "第三十二条の四十第一項（登録運航管理者講習機関の登録）の登録運航管理者講習機関の登録（更新の登録を除く。）登録件数一件につき九万円",
    "運送事業の許可港湾運送事業法（昭和二十六年法律第百六十一号）第四条（許可）の規定による港湾運送事業の許可（一）一般港湾運送事業の許可許可件数一件につき九万円",
    "百六十一号）第四条（許可）の規定による港湾運送事業の許可（一）一般港湾運送事業の許可許可件数一件につき九万円（二）港湾荷役事業の許可許可件数一件につき六万円",
    "事業の許可許可件数一件につき九万円（二）港湾荷役事業の許可許可件数一件につき六万円（三）はしけ運送事業の許可又はいかだ運送事業の許可許可件数一件につき三万円",
    "万円（三）はしけ運送事業の許可又はいかだ運送事業の許可許可件数一件につき三万円（四）検数事業の許可、鑑定事業の許可又は検量事業の許可許可件数一件につき三万円"
  ]
}
```

参考：現行スクリプト形式への変換例（name は任意、needles は上記 33 本をそのまま使用）:

```python
yield ("登録免許税法 別表第一（二）第三十二号 百三十〜百三十四（船舶安全・海洋汚染防止・船舶保安・再資源化・海上運送・港湾運送）↔ RegistrationQualificationFeesP7K.lean",
       "342AC0000000035",
       "file", None,
       [ ...上記 needles 33 本を一字も変えずに列挙... ])
```

## 4. 期待 literal 増分

- W-K 担当分: 新規 check **33 needles** なので **+33**。
- `docs/PROGRESS.md` の監査 literal 総数はメインセッションが再確認して加算してください
  （起点値は本メモでは書きません）。

## 5. 検証結果（すべて本セッションで実行済み）

- `lake build JapanTaxLaw.RegistrationQualificationFeesP7K JapanTaxLaw.RegistrationQualificationFeesP7KSpec JapanTaxLaw.RegistrationQualificationFeesP7KTests`
  → **成功（5 jobs、warning なし）**。※自作 3 モジュールのみビルド（全体ビルド／CI／`run_python_gates.py` は実行していません）。
- `python scripts/ci/check_no_sorry.py` → `no forbidden placeholder proofs found in tracked Lean sources`。
  （新規 3 ファイルは未追跡のため走査対象外ですが、人力でも `sorry` / `admit` はありません。）
- `#print axioms`（一時ファイル `WKAxiomProbe.lean` を approved temp dir に作成、`lake env lean` で実行後 **削除済み**）:
  - 新規 positivity 定理 **33 本すべて** と `agreeRegistrationQualificationFeesP7K` の計 **34 件**が
    `does not depend on any axioms`。
  - **`Classical.choice` も `sorryAx` も `propext` も `quot.sound` も一切なし**（出力 34 行を全文走査、いずれも 0 回）。
- 原文逐語検証（pinned JSON を正規化テキストに対して `.find()`）: **33/33 FOUND、MISS 0 件**（§6）。
  担当範囲原文 `art32_130_134.txt` 正規化テキストに対しても **33/33 FOUND、MISS 0 件**。
  各 needle は両テキストで出現回数 **1**（一意）、長さはすべて **61〜122 文字**、33 本すべて相互に異なることを確認。
- 金額一致: 九万円=27 / 一万五千円=2 / 十五万円=1 / 六万円=1 / 三万円=2
  ＝ 33 件、pinned 原文の fee フレーズ出現数と完全一致。

## 6. 逐語検証 FOUND / MISS 一覧（一字も変更せず）

担当範囲原文 `art32_130_134.txt` を、転記監査と同じ `re.sub(r"[\s　]+", "", ...)` で正規化した文字列に
対して各 needle を Python の `.find()` で検索（`art@`）。
`json@` は pinned JSON `law_full_text` を `transcription_audit.py` と同一ロジックで平坦化・正規化した文字列上の offset。
各 needle の出現回数は両方とも **1**（一意）。

| # | 条号/区分 | def | 結果 | art@ | json@ | 出現回数(art/json) | len |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 1 | 百三十(一) | `shipSafetyMfgConversionWorkSiteCertFee` | FOUND | 347 | 186970 | 1/1 | 83 |
| 2 | 百三十(二) | `shipSafetyMaintenanceWorkSiteCertFee` | FOUND | 461 | 187084 | 1/1 | 61 |
| 3 | 百三十(三) | `shipSafetyRemoteSupportWorkSiteCertFee` | FOUND | 553 | 187176 | 1/1 | 68 |
| 4 | 百三十(四) | `shipSafetyVerificationOrgRegFee` | FOUND | 627 | 187250 | 1/1 | 78 |
| 5 | 百三十(五) | `shipSafetyInspectionConfirmationOrgRegFee` | FOUND | 679 | 187302 | 1/1 | 78 |
| 6 | 百三十(六) | `shipSafetyClassificationSocietyRegFee` | FOUND | 725 | 187348 | 1/1 | 78 |
| 7 | 百三十(七) | `shipSafetyInspectionOrgRegFee` | FOUND | 778 | 187401 | 1/1 | 78 |
| 8 | 百三十(八) | `shipSafetyCertIssuingClassSocietyRegFee` | FOUND | 856 | 187479 | 1/1 | 61 |
| 9 | 百三十一(一) | `marinePollutionMfgWorkSiteCertFee` | FOUND | 1039 | 187662 | 1/1 | 78 |
| 10 | 百三十一(二) | `marinePollutionMaintenanceWorkSiteCertFee` | FOUND | 1148 | 187771 | 1/1 | 91 |
| 11 | 百三十一(三) | `wasteOilDisposalBizPermitFee` | FOUND | 1270 | 187893 | 1/1 | 64 |
| 12 | 百三十一(四) | `marinePollutionRegConfirmationOrgRegFee` | FOUND | 1334 | 187957 | 1/1 | 68 |
| 13 | 百三十一(五) | `marinePollutionClassSocietyRegArt19No15Fee` | FOUND | 1402 | 188025 | 1/1 | 73 |
| 14 | 百三十一(六) | `marinePollutionClassSocietyRegArt19No30Fee` | FOUND | 1475 | 188098 | 1/1 | 73 |
| 15 | 百三十一(七) | `marinePollutionClassSocietyRegArt19No46Fee` | FOUND | 1548 | 188171 | 1/1 | 74 |
| 16 | 百三十一(八) | `marinePollutionVerificationOrgRegViaSafetyActFee` | FOUND | 1622 | 188245 | 1/1 | 92 |
| 17 | 百三十一(九) | `marinePollutionVerificationOrgRegArt43No9Fee` | FOUND | 1714 | 188337 | 1/1 | 70 |
| 18 | 百三十二 | `shipSecurityClassSocietyRegFee` | FOUND | 1835 | 188458 | 1/1 | 61 |
| 19 | 百三十二の二(一) | `shipRecyclingBizPermitFee` | FOUND | 1939 | 188562 | 1/1 | 93 |
| 20 | 百三十二の二(二) | `shipRecyclingClassSocietyRegArt30Fee` | FOUND | 2032 | 188655 | 1/1 | 71 |
| 21 | 百三十二の二(三) | `shipRecyclingClassSocietyRegArt31Fee` | FOUND | 2103 | 188726 | 1/1 | 72 |
| 22 | 百三十三(一) | `generalPassengerRegularRouteBizPermitFee` | FOUND | 3081 | 189704 | 1/1 | 122 |
| 23 | 百三十三(二) | `specifiedPassengerRegularRouteBizPermitFee` | FOUND | 3203 | 189826 | 1/1 | 90 |
| 24 | 百三十三(三) | `externalPassengerRegularRouteBizRegFee` | FOUND | 3273 | 189896 | 1/1 | 78 |
| 25 | 百三十三(四) | `passengerFreightRegularRouteBizRegFee` | FOUND | 3324 | 189947 | 1/1 | 78 |
| 26 | 百三十三(五) | `passengerIrregularRouteBizPermitFee` | FOUND | 3390 | 190013 | 1/1 | 78 |
| 27 | 百三十三(六) | `generalIrregularRouteBizRegFee` | FOUND | 3444 | 190067 | 1/1 | 78 |
| 28 | 百三十三(七) | `registeredSafetyControlManagerTrainingOrgRegFee` | FOUND | 3530 | 190153 | 1/1 | 67 |
| 29 | 百三十三(八) | `registeredOperationManagerTrainingOrgRegFee` | FOUND | 3605 | 190228 | 1/1 | 65 |
| 30 | 百三十四(一) | `generalPortTransportBizPermitFee` | FOUND | 3676 | 190299 | 1/1 | 78 |
| 31 | 百三十四(二) | `portStevedoringBizPermitFee` | FOUND | 3700 | 190323 | 1/1 | 78 |
| 32 | 百三十四(三) | `lighterOrRaftTransportBizPermitFee` | FOUND | 3737 | 190360 | 1/1 | 78 |
| 33 | 百三十四(四) | `tallySurveyOrMeasurementBizPermitFee` | FOUND | 3776 | 190399 | 1/1 | 78 |

- **FOUND 33 / MISS 0**（担当範囲原文・pinned JSON の両方、出現回数 1、長さ 61〜122）。
  needle の勝手な変更・正規化・文字変換はしていません（原文の文字使いを保持）。
  各 needle には項目の条号（百三十〜百三十四）又は区分（（一）〜（九））を含めています。
  原文が極端に長いため 130 文字制約と fee literal の逐語確認を両立させる目的で一意な連続部分を
  アンカーとした項目では、対応する条号／区分を上表および def の doc-comment に明記しています。

## 7. README / PROGRESS に足す 1 行文案

CROSS_LAW の scan/pin 件数や監査 literal 総数はメインセッションが計算するため、ここでは書きません。

- **README.md**（モジュール一覧・`RegistrationQualificationFeesP6J*` 行の直後に追加）:
  ```text
  JapanTaxLaw/RegistrationQualificationFeesP7K.lean / -Spec.lean / -Tests.lean  # 登録免許税法 別表第一（二）第三十二号 百三十〜百三十四（船舶安全・海洋汚染防止・船舶保安・再資源化・海上運送・港湾運送）の flat fee L4 モデル・独立定式・退行テスト
  ```
- **docs/PROGRESS.md**（L4 着手済みモジュール一覧の末尾に追記）:
  ```text
  登録免許税法 別表第一（二）第三十二号 百三十〜百三十四（RegistrationQualificationFeesP7K.lean：33 件の flat fee 額を Money 定数化、百二十九 以前・百三十五 以降 NOT YET COVERED）
  ```

## 8. インテグレーターへの明示事項

**インテグレーターは `JapanTaxLaw.lean` に以下の 3 つの import を追加すること。**

```lean
import JapanTaxLaw.RegistrationQualificationFeesP7K
import JapanTaxLaw.RegistrationQualificationFeesP7KSpec
import JapanTaxLaw.RegistrationQualificationFeesP7KTests
```

（W-A〜W-J, W-L の各 3 件と併せてメインが行数を確認してください。
W-K は `JapanTaxLaw.lean` を書き換えていません。W-L の P7L ファイルには触れていません。）

## 9. 範囲・残ブロッカーの正直な申告（最終報告）

- **build**: 自作 3 モジュールのみ `lake build` 成功（5 jobs / warning なし）。全体ビルド・CI・
  `run_python_gates.py` は未実行です。
- **axiom**: 新規 positivity 33 本 + agree 1 本の計 34 件すべて axiom-free、
  `Classical.choice` / `sorryAx` / `propext` / `quot.sound` なし（一時ファイルは削除済み）。
- **逐語**: FOUND 33 / MISS 0（担当範囲原文・pinned JSON の両方、出現回数 1、長さ 61〜122）。
- **def 数**: 33（九万円 27 / 一万五千円 2 / 十五万円 1 / 六万円 1 / 三万円 2）。
  軽減額（既に認定を受けている者は一万五千円）の別 def は作っていません。
- **STAGING**: 本ファイル `docs/STAGING_WK.md` を作成済みです。
- これは **L4 のごく小さなスライス**です。**完成・網羅を主張しません**。
- 担当は 別表第一（二）第三十二号 **百三十〜百三十四 のみ**。**百二十九 以前・百三十五 以降は NOT YET COVERED**。
- 「財務省令で定めるものを除く」「政令で定める許可を除く」「更新の登録／許可を除く」、
  既に認定を受けている者の軽減額、および（注）のみなし規定の該当性はすべて caller-established とし、
  法的判断の自動化はしていません。
- `agreeRegistrationQualificationFeesP7K` は定数同士の `==` 一致確認であり、法的意味の等価証明ではありません。
- 転記監査は fidelity-only（原文 bytes との一致確認）であり、法的正しさを保証しません。
- **L7 候補 3,438 件は unreviewed のまま**です（本スライスでは一切レビューしていません）。
- 残ブロッカー: 転記監査 check の `checks()` への組み込み（§3、+33）、`JapanTaxLaw.lean` への
  import 追加（§8）、README / PROGRESS の 1 行追記（§7）、および全体ビルド・CI ゲートの
  実行は**すべてメインセッションの担当**です（W-K は実行していません）。

