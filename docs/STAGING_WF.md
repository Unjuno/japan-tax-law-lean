# STAGING — W-F (登録免許税法 別表第一（二）第三十二号 九十七〜百二 の flat fee) 受け渡しメモ

> 実装担当 W-F からメインセッション（統合担当）への受け渡し用。
> ブランチ操作・add/commit/push/merge は一切していません。
> 書き換えたのは下記 4 ファイルのみです（他は読み取り専用）。

## 0. 対象ファイル

| ファイル | 状態 |
| --- | --- |
| `JapanTaxLaw/RegistrationQualificationFeesP4F.lean` | 新規 |
| `JapanTaxLaw/RegistrationQualificationFeesP4FSpec.lean` | 新規 |
| `JapanTaxLaw/RegistrationQualificationFeesP4FTests.lean` | 新規 |
| `docs/STAGING_WF.md` | 新規（本ファイル） |

pinned source: `data/raw/342AC0000000035_20261101_508AC0000000021.law.json`
law id `342AC0000000035` / revision `342AC0000000035_20261101_508AC0000000021`
amendment enforcement date `2026-11-01`（RegistrationQualificationFees / P2A / P2B / P3C / P3D と同一ピン）。
担当範囲原文: `art32_97_102.txt`（九十七〜百二、UTF-8、1 行 3,197 文字）。
pinned bytes から金額を日本語数字で読み取り Arabic に変換（九万円→90,000 /
三万円→30,000 / 一万五千円→15,000、全件一致確認済み）。

## 1. 担当範囲のカテゴリ一覧（九十七〜百二）

| 条号 | 区分／法律 | 件数 |
| --- | --- | --- |
| 九十七 | 石油パイプライン事業法（事業の許可／導管の変更の許可） | 1 |
| 九十八 | 石油の備蓄の確保等に関する法律（石油輸入業者の登録） | 1 |
| 九十九 | 揮発油等の品質の確保等に関する法律（(一)〜(四)） | 4 |
| 百 | 液化石油ガスの保安の確保及び取引の適正化に関する法律（(一)〜(四)） | 4 |
| 百一 | ガス事業法 等（(一)〜(十)） | 10 |
| 百二 | 高圧ガス保安法（(一)〜(八)） | 8 |
| **合計** | | **28** |

原文に存在する fee string をすべて数えた結果が **28 件**で、タスク指定の総数 28 件と一致します。
本範囲に割合（千分の△）はありません。
デーミング規定は 百（四）・百一（十）の2箇所にあり、いずれも主額（九万円）の括弧内で
「既に（四）／（十）に掲げる登録を受けている者については、一万五千円」と定められています。
タスク指示に従い、これらは **金額なし行として扱い、デーミング用の fee def は作りません**
（主額の九万円のみを def 化）。金額なしの行はそれ以外にありません。

## 2. 追加した def 一覧（名前 → 金額 → 条号／区分）

`namespace JapanTaxLaw`、`open JapanTaxLaw.TaxFinance`。各 def は `Money := <額>` の flat 定数
（課税標準は一件につき）。各 def に `<name>_pos : <name> > 0 := by decide` と
`example : <name> = <額> := by decide` を付与済み（28 本ずつ）。

| # | 条号／区分 | def 名 | 金額 | 原文 fee |
| --- | --- | --- | --- | --- |
| 1 | 九十七 石油パイプライン事業の許可／導管の変更の許可 | `oilPipelinePermitFee` | 90,000 | 九万円 |
| 2 | 九十八 石油輸入業者の登録 | `oilImporterRegFee` | 30,000 | 三万円 |
| 3 | 九十九（一） 揮発油販売業者の登録 | `gasolineSellerRegFee` | 30,000 | 三万円 |
| 4 | 九十九（二） 揮発油特定加工業者の登録 | `gasolineSpecialProcessorRegFee` | 90,000 | 九万円 |
| 5 | 九十九（三） 軽油特定加工業者の登録 | `lightOilSpecialProcessorRegFee` | 90,000 | 九万円 |
| 6 | 九十九（四） 分析機関の登録 | `gasolineAnalysisOrgRegFee` | 90,000 | 九万円 |
| 7 | 百（一） 液化石油ガス販売事業者の登録 | `lpgSalesBizRegFee` | 30,000 | 三万円 |
| 8 | 百（二） 保安機関の認定 | `lpgSecurityOrgCertFee` | 90,000 | 九万円 |
| 9 | 百（三） 一般消費者等の数の増加の認可 | `lpgConsumerIncreaseApprovalFee` | 15,000 | 一万五千円 |
| 10 | 百（四） 検査機関の登録（※デーミングあり） | `lpgInspectOrgRegFee` | 90,000 | 九万円 |
| 11 | 百一（一） ガス小売事業の登録 | `gasRetailBizRegFee` | 90,000 | 九万円 |
| 12 | 百一（二） 指定旧供給区域等の変更の許可（区域の増加） | `gasOldAreaChangePermitFee` | 90,000 | 九万円 |
| 13 | 百一（三） 指定旧供給区域等の変更の許可（供給地点群の増加） | `gasSupplyPointGroupChangePermitFee` | 15,000 | 一万五千円 |
| 14 | 百一（四） 認定高度保安実施ガス小売事業者の認定 | `gasCertHighSecurityRetailerCertFee` | 90,000 | 九万円 |
| 15 | 百一（五） 一般ガス導管事業の許可／供給区域の増加 | `gasGeneralPipelineBizPermitFee` | 90,000 | 九万円 |
| 16 | 百一（六） 認定高度保安実施一般ガス導管事業者の認定 | `gasCertHighSecurityPipelineCertFee` | 90,000 | 九万円 |
| 17 | 百一（七） 認定高度保安実施特定ガス導管事業者の認定 | `gasCertHighSecuritySpecificPipelineCertFee` | 90,000 | 九万円 |
| 18 | 百一（八） 認定高度保安実施ガス製造事業者の認定 | `gasCertHighSecurityMakerCertFee` | 90,000 | 九万円 |
| 19 | 百一（九） 登録ガス工作物検査機関の登録 | `gasWorkInspectOrgRegFee` | 90,000 | 九万円 |
| 20 | 百一（十） 検査機関の登録（特定ガス用品）（※デーミングあり） | `gasProductInspectOrgRegFee` | 90,000 | 九万円 |
| 21 | 百二（一） 認定完成検査実施者の認定 | `hpGasCompletionInspectCertFee` | 90,000 | 九万円 |
| 22 | 百二（二） 認定保安検査実施者の認定 | `hpGasSecurityInspectCertFee` | 90,000 | 九万円 |
| 23 | 百二（三） 認定高度保安実施者の認定 | `hpGasHighSecurityCertFee` | 90,000 | 九万円 |
| 24 | 百二（四） 容器検査所の登録 | `hpGasContainerInspectOfficeRegFee` | 90,000 | 九万円 |
| 25 | 百二（五） 登録容器等製造業者の登録 | `hpGasContainerMakerRegFee` | 90,000 | 九万円 |
| 26 | 百二（六） 外国登録容器等製造業者の登録 | `hpGasForeignContainerMakerRegFee` | 90,000 | 九万円 |
| 27 | 百二（七） 登録特定設備製造業者の登録 | `hpGasSpecificEquipMakerRegFee` | 90,000 | 九万円 |
| 28 | 百二（八） 外国登録特定設備製造業者の登録 | `hpGasForeignSpecificEquipMakerRegFee` | 90,000 | 九万円 |

金額一致の内訳: 九万円=23 件（90,000）／ 三万円=3 件（30,000）／ 一万五千円=2 件（15,000）
＝ 合計 28 件。pinned 原文の fee フレーズ出現数と完全一致。

`RegistrationQualificationFeesP4FSpec.lean` は `spec` 接頭辞の独立定式 28 本 +
`agreeRegistrationQualificationFeesP4F : Bool`（実装 ≡ spec の `==` 一致）+
`example : agreeRegistrationQualificationFeesP4F = true := by decide`。
`RegistrationQualificationFeesP4FTests.lean` は `example := by decide` のスモーク 28 件のみ。

doc-comment に明記した射程外（overclaim 防止）:

- 「導管の延長の増加に係る許可で政令で定めるものに限る。」「更新の登録を除く。」
  「更新の認定を除く。」「政令で定めるものに限り、更新の登録を除く。」
  「これらの許可を受けている供給区域の属する市町村内における供給区域の増加に係るものを除く。」
  「当該供給区域の属する市町村内における供給区域の増加に係るものを除く。」等の適用判定は
  **caller-established** とし、金額定数には反映していません。
- 百（四）・百一（十）のデーミング規定（既登録者は一万五千円）も caller-established とし、
  デーミング用の別 def は作っていません。
- 九十六 以前・百三 以降は NOT YET COVERED。

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
    "同法第八条第一項（事業用施設の変更）の導管に係る変更の許可（導管の延長の増加に係る許可で政令で定めるものに限る。）許可件数一件につき九万円",
    "九十八石油輸入業者の登録石油の備蓄の確保等に関する法律（昭和五十年法律第九十六号）第十六条（登録）の石油輸入業者の登録登録件数一件につき三万円",
    "九十九揮発油販売業者、揮発油特定加工業者若しくは軽油特定加工業者の登録又は揮発油等に係る分析機関の登録（一）揮発油等の品質の確保等に関する法律（昭和五十一年法律第八十八号）第三条（揮発油販売業者の登録）の揮発油販売業者の登録登録件数一件につき三万円",
    "（二）揮発油等の品質の確保等に関する法律第十二条の二（揮発油特定加工業者の登録）の揮発油特定加工業者の登録登録件数一件につき九万円",
    "（三）揮発油等の品質の確保等に関する法律第十二条の九（軽油特定加工業者の登録）の軽油特定加工業者の登録登録件数一件につき九万円",
    "第十七条の四の二第二項（揮発油特定加工業者に係る分析機関の登録）（同法第十七条の八第四項において準用する場合を含む。）の登録（更新の登録を除く。）登録件数一件につき九万円",
    "（一）液化石油ガスの保安の確保及び取引の適正化に関する法律（昭和四十二年法律第百四十九号）第三条第一項（事業の登録）の経済産業大臣がする液化石油ガス販売事業者の登録登録件数一件につき三万円",
    "（二）液化石油ガスの保安の確保及び取引の適正化に関する法律第二十九条第一項（認定）の経済産業大臣がする保安機関の認定（更新の認定を除く。）認定件数一件につき九万円",
    "（三）液化石油ガスの保安の確保及び取引の適正化に関する法律第三十三条第一項（一般消費者等の数の増加の認可等）の規定により経済産業大臣がする保安業務に係る一般消費者等の数の増加の認可認可件数一件につき一万五千円",
    "（四）液化石油ガスの保安の確保及び取引の適正化に関する法律第四十七条第一項（検査機関の登録）の登録（更新の登録を除く。）申請件数一件につき九万円（既に（四）に掲げる登録を受けている者については、一万五千円）",
    "検査機関の登録（一）ガス事業法（昭和二十九年法律第五十一号）第三条（事業の登録）のガス小売事業の登録登録件数一件につき九万円",
    "第六条第二項第三号（許可証）の供給区域の増加に係るものに限り、当該供給区域の属する市町村内における供給区域の増加に係るものを除く。）許可件数一件につき九万円",
    "（三）電気事業法等の一部を改正する等の法律（平成二十七年法律第四十七号）附則第二十三条第一項の指定旧供給区域等の変更の許可（旧ガス事業法第六条第二項第三号の供給地点群の増加に係るものに限る。）許可件数一件につき一万五千円",
    "（四）ガス事業法第三十四条の二（認定）の認定高度保安実施ガス小売事業者の認定（更新の認定を除く。）認定件数一件につき九万円",
    "（五）ガス事業法第三十五条（事業の許可）の一般ガス導管事業の許可又は同法第四十条第一項（供給区域の変更）の供給区域の増加に係る変更の許可（これらの許可を受けている供給区域の属する市町村内における供給区域の増加に係るものを除く。）許可件数一件につき九万円",
    "（六）ガス事業法第七十一条の二（認定）の認定高度保安実施一般ガス導管事業者の認定（更新の認定を除く。）認定件数一件につき九万円",
    "（七）ガス事業法第八十四条の二（認定）の認定高度保安実施特定ガス導管事業者の認定（更新の認定を除く。）認定件数一件につき九万円",
    "（八）ガス事業法第百四条の二（認定）の認定高度保安実施ガス製造事業者の認定（更新の認定を除く。）認定件数一件につき九万円",
    "（同法第八十四条第一項（ガス工作物に係る規定の準用）において準用する場合を含む。）又は第百二条第一項（登録ガス工作物検査機関の登録）の登録（更新の登録を除く。）登録件数一件につき九万円",
    "（十）ガス事業法第百四十六条第一項（検査機関の登録）の登録（更新の登録を除く。）申請件数一件につき九万円（既に（十）に掲げる登録を受けている者については、一万五千円）",
    "（一）高圧ガス保安法（昭和二十六年法律第二百四号）第二十条第三項第二号（完成検査）の認定完成検査実施者の認定（更新の認定を除く。）認定件数一件につき九万円",
    "（二）高圧ガス保安法第三十五条第一項第二号（保安検査）の認定保安検査実施者の認定（更新の認定を除く。）認定件数一件につき九万円",
    "認定件数一件につき九万円（三）高圧ガス保安法第三十九条の十三（認定）の認定高度保安実施者の認定（更新の認定を除く。）認定件数一件につき九万円",
    "（四）高圧ガス保安法第四十九条第一項（容器再検査）の容器検査所の登録（政令で定めるものに限り、更新の登録を除く。）登録件数一件につき九万円",
    "（五）高圧ガス保安法第四十九条の五第一項（容器等製造業者の登録）の規定による登録容器等製造業者の登録（更新の登録を除く。）登録件数一件につき九万円",
    "（六）高圧ガス保安法第四十九条の三十一第一項（外国容器等製造業者の登録）の規定による外国登録容器等製造業者の登録（更新の登録を除く。）登録件数一件につき九万円",
    "（七）高圧ガス保安法第五十六条の六の二第一項（特定設備製造業者の登録）の規定による登録特定設備製造業者の登録（更新の登録を除く。）登録件数一件につき九万円",
    "（八）高圧ガス保安法第五十六条の六の二十二第一項（外国特定設備製造業者の登録）の規定による外国登録特定設備製造業者の登録（更新の登録を除く。）登録件数一件につき九万円"
  ]
}
```

参考：現行スクリプト形式への変換例（name は任意、needles は上記 28 本をそのまま使用）:

```python
yield ("登録免許税法 別表第一（二）第三十二号 九十七〜百二（石油パイプライン・石油輸入・揮発油等・液化石油ガス・ガス・高圧ガス）↔ RegistrationQualificationFeesP4F.lean",
       "342AC0000000035",
       "file", None,
       [ ...上記 needles 28 本を一字も変えずに列挙... ])
```

## 4. 期待 literal 増分

- W-F 担当分: 新規 check **28 needles** なので **+28**。
- `docs/PROGRESS.md` の監査 literal 総数はメインセッションが再確認して加算してください
  （起点値は本メモでは書きません）。

## 5. 検証結果（すべて本セッションで実行済み）

- `lake build JapanTaxLaw.RegistrationQualificationFeesP4F JapanTaxLaw.RegistrationQualificationFeesP4FSpec JapanTaxLaw.RegistrationQualificationFeesP4FTests`
  → **成功（5 jobs、warning なし）**。※自作 3 モジュールのみビルド（全体ビルド／CI／`run_python_gates.py` は実行していません）。
- `python scripts/ci/check_no_sorry.py` → `no forbidden placeholder proofs found in tracked Lean sources`。
  （新規 3 ファイルは未追跡のため走査対象外ですが、人力でも `sorry` / `admit` はありません。）
- `#print axioms`（一時ファイル `WFAxiomProbe.lean` を approved temp dir に作成、`lake env lean` で実行後 **削除済み**）:
  - 新規 positivity 定理 **28 本すべて** と `agreeRegistrationQualificationFeesP4F` の計 **29 件**が
    `does not depend on any axioms`。
  - **`Classical.choice` も `sorryAx` も `propext` も一切なし**。
- 原文逐語検証（pinned JSON を正規化テキストに対して `.find()`）: **28/28 FOUND、MISS 0 件**（§6）。
  担当範囲原文 `art32_97_102.txt` 正規化テキストに対しても **28/28 FOUND、MISS 0 件**。
  各 needle は両テキストで出現回数 **1**（一意）、長さはすべて **60〜126 文字**。
  law id `342AC0000000035` … FOUND / revision `342AC0000000035_20261101_508AC0000000021` … FOUND。
- 金額一致: 九万円=23 件 / 三万円=3 件 / 一万五千円=2 件 ＝ 28 件、pinned 原文の fee フレーズ出現数と完全一致。

## 6. 逐語検証 FOUND / MISS 一覧（一字も変更せず）

担当範囲原文 `art32_97_102.txt` を、転記監査と同じ `re.sub(r"[\s\u3000]+", "", ...)` で正規化した文字列に
対して各 needle を Python の `.find()` で検索（`art@`）。
`json@` は pinned JSON `law_full_text` を `transcription_audit.py` と同一ロジックで平坦化・正規化した文字列上の offset。
各 needle の出現回数は両方とも **1**（一意）。

| # | 条号/区分 | def | 結果 | art@ | json@ | 出現回数(art/json) | len |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 1 | 九十七 | `oilPipelinePermitFee` | FOUND | 91 | 170196 | 1/1 | 69 |
| 2 | 九十八 | `oilImporterRegFee` | FOUND | 160 | 170265 | 1/1 | 71 |
| 3 | 九十九(一) | `gasolineSellerRegFee` | FOUND | 231 | 170336 | 1/1 | 124 |
| 4 | 九十九(二) | `gasolineSpecialProcessorRegFee` | FOUND | 355 | 170460 | 1/1 | 65 |
| 5 | 九十九(三) | `lightOilSpecialProcessorRegFee` | FOUND | 420 | 170525 | 1/1 | 63 |
| 6 | 九十九(四) | `gasolineAnalysisOrgRegFee` | FOUND | 765 | 170870 | 1/1 | 85 |
| 7 | 百(一) | `lpgSalesBizRegFee` | FOUND | 914 | 171019 | 1/1 | 94 |
| 8 | 百(二) | `lpgSecurityOrgCertFee` | FOUND | 1008 | 171113 | 1/1 | 81 |
| 9 | 百(三) | `lpgConsumerIncreaseApprovalFee` | FOUND | 1089 | 171194 | 1/1 | 104 |
| 10 | 百(四) | `lpgInspectOrgRegFee` | FOUND | 1193 | 171298 | 1/1 | 103 |
| 11 | 百一(一) | `gasRetailBizRegFee` | FOUND | 1473 | 171578 | 1/1 | 62 |
| 12 | 百一(二) | `gasOldAreaChangePermitFee` | FOUND | 1680 | 171785 | 1/1 | 78 |
| 13 | 百一(三) | `gasSupplyPointGroupChangePermitFee` | FOUND | 1758 | 171863 | 1/1 | 110 |
| 14 | 百一(四) | `gasCertHighSecurityRetailerCertFee` | FOUND | 1868 | 171973 | 1/1 | 61 |
| 15 | 百一(五) | `gasGeneralPipelineBizPermitFee` | FOUND | 1929 | 172034 | 1/1 | 126 |
| 16 | 百一(六) | `gasCertHighSecurityPipelineCertFee` | FOUND | 2055 | 172160 | 1/1 | 63 |
| 17 | 百一(七) | `gasCertHighSecuritySpecificPipelineCertFee` | FOUND | 2118 | 172223 | 1/1 | 63 |
| 18 | 百一(八) | `gasCertHighSecurityMakerCertFee` | FOUND | 2181 | 172286 | 1/1 | 60 |
| 19 | 百一(九) | `gasWorkInspectOrgRegFee` | FOUND | 2298 | 172403 | 1/1 | 92 |
| 20 | 百一(十) | `gasProductInspectOrgRegFee` | FOUND | 2390 | 172495 | 1/1 | 83 |
| 21 | 百二(一) | `hpGasCompletionInspectCertFee` | FOUND | 2586 | 172691 | 1/1 | 77 |
| 22 | 百二(二) | `hpGasSecurityInspectCertFee` | FOUND | 2663 | 172768 | 1/1 | 63 |
| 23 | 百二(三) | `hpGasHighSecurityCertFee` | FOUND | 2714 | 172819 | 1/1 | 70 |
| 24 | 百二(四) | `hpGasContainerInspectOfficeRegFee` | FOUND | 2784 | 172889 | 1/1 | 69 |
| 25 | 百二(五) | `hpGasContainerMakerRegFee` | FOUND | 2853 | 172958 | 1/1 | 73 |
| 26 | 百二(六) | `hpGasForeignContainerMakerRegFee` | FOUND | 2926 | 173031 | 1/1 | 79 |
| 27 | 百二(七) | `hpGasSpecificEquipMakerRegFee` | FOUND | 3005 | 173110 | 1/1 | 77 |
| 28 | 百二(八) | `hpGasForeignSpecificEquipMakerRegFee` | FOUND | 3082 | 173187 | 1/1 | 83 |

- **FOUND 28 / MISS 0**。needle の長さはすべて **60〜130 文字**、28 本すべて相互に異なることを確認。
  アンカーの勝手な変更・正規化・文字変換はしていません。
- 各 needle には原則として項目の条号（九十七〜百二）又は区分（（一）〜（十））を含めています。
  ただし原文が極端に長い 4 件（#1 九十七、#6 九十九(四)、#12 百一(二)、#19 百一(九)）は、
  条号／区分から fee フレーズまでの距離が 130 文字を超えるため、130 文字制約と
  fee literal の逐語確認を両立させる目的で、当該項目を一意に特定する根拠条文
  （第八条第一項 / 第十七条の四の二第二項 / 第六条第二項第三号（許可証） /
  第八十四条第一項・第百二条第一項）をアンカーとして採用しました。
  対応する条号／区分は上表および def の doc-comment に明記しています。
- 金額の日本語数字との対応も全件一致（九万円=90,000 / 三万円=30,000 / 一万五千円=15,000）。

## 7. README / PROGRESS に足す 1 行文案

CROSS_LAW の scan/pin 件数や監査 literal 総数はメインセッションが計算するため、ここでは書きません。

- **README.md**（モジュール一覧・`RegistrationQualificationFeesP3D*` 行の直後に追加）:
  ```text
  JapanTaxLaw/RegistrationQualificationFeesP4F.lean / -Spec.lean / -Tests.lean  # 登録免許税法 別表第一（二）第三十二号 九十七〜百二（石油パイプライン・石油輸入・揮発油等・液化石油ガス・ガス・高圧ガス）の flat fee L4 モデル・独立定式・退行テスト
  ```
- **docs/PROGRESS.md**（L4 着手済みモジュール一覧の末尾に追記）:
  ```text
  登録免許税法 別表第一（二）第三十二号 九十七〜百二（RegistrationQualificationFeesP4F.lean：28 件の flat fee 額を Money 定数化、九十六 以前・百三 以降 NOT YET COVERED）
  ```

## 8. インテグレーターへの明示事項

**インテグレーターは `JapanTaxLaw.lean` に以下の 3 つの import を追加すること。**

```lean
import JapanTaxLaw.RegistrationQualificationFeesP4F
import JapanTaxLaw.RegistrationQualificationFeesP4FSpec
import JapanTaxLaw.RegistrationQualificationFeesP4FTests
```

（W-A / W-B / W-C / W-D の P2A / P2B / P3C / P3D 各 3 件と併せて計 15 行の追加になる見込みです。
メインが統合してください。W-F は `JapanTaxLaw.lean` を書き換えていません。）

## 9. 範囲・残ブロッカーの正直な申告

- これは **L4 のごく小さなスライス**です。**完成・網羅を主張しません**。
- 担当は 別表第一（二）第三十二号 **九十七〜百二 のみ**。**九十六 以前・百三 以降は NOT YET COVERED**。
- 登録・認定・認可・許可の要件・適用、「更新の登録を除く」「政令で定めるものに限る」、
  百（四）・百一（十）のデーミング規定（既登録者は一万五千円）の該当性は
  すべて caller-established とし、法的判断の自動化はしていません。
- 本範囲に割合はなく、デーミング規定 2 件を除く 28 行を fee def 化しました
  （デーミング用の別 def は作っていません）。
- `agreeRegistrationQualificationFeesP4F` は定数同士の `==` 一致確認であり、法的意味の等価証明ではありません。
- 転記監査は fidelity-only（原文 bytes との一致確認）であり、法的正しさを保証しません。
- **L7 候補 3,438 件は unreviewed のまま**です（本スライスでは一切レビューしていません）。
- 残ブロッカー: 転記監査 check の `checks()` への組み込み（§3、+28）、`JapanTaxLaw.lean` への
  import 追加（§8）、README / PROGRESS の 1 行追記（§7）、および全体ビルド・CI ゲートの
 実行は**すべてメインセッションの担当**です（W-F は実行していません）。
