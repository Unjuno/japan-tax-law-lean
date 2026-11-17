# STAGING — W-G (登録免許税法 別表第一（二）第三十二号 百三〜百十 の flat fee) 受け渡しメモ

> 実装担当 W-G からメインセッション（統合担当）への受け渡し用。
> ブランチ操作・add/commit/push/merge は一切していません。
> 書き換えたのは下記 4 ファイルのみです（他は読み取り専用）。

## 0. 対象ファイル

| ファイル | 状態 |
| --- | --- |
| `JapanTaxLaw/RegistrationQualificationFeesP5G.lean` | 新規 |
| `JapanTaxLaw/RegistrationQualificationFeesP5GSpec.lean` | 新規 |
| `JapanTaxLaw/RegistrationQualificationFeesP5GTests.lean` | 新規 |
| `docs/STAGING_WG.md` | 新規（本ファイル） |

pinned source: `data/raw/342AC0000000035_20261101_508AC0000000021.law.json`
law id `342AC0000000035` / revision `342AC0000000035_20261101_508AC0000000021`
amendment enforcement date `2026-11-01`（RegistrationQualificationFees / P2A / P2B /
P3C / P3D / P4E / P4F と同一ピン）。
担当範囲原文: `art32_103_110.txt`（百三〜百十、UTF-8、1 行 2,824 文字）。
pinned bytes から金額を日本語数字で読み取り Arabic に変換（九万円→90,000 /
十五万円→150,000 / 一万五千円→15,000、全件一致確認済み）。

## 1. 担当範囲のカテゴリ一覧（百三〜百十）

| 条号 | 区分／法律 | 件数 |
| --- | --- | --- |
| 百三 | 熱供給事業法（熱供給事業の登録） | 1 |
| 百四 | 電気事業法 等（（一）〜（十四）） | 14 |
| 百五 | 電気工事業の業務の適正化に関する法律（登録電気工事業者の登録） | 1 |
| 百六 | エネルギーの使用の合理化及び非化石エネルギーへの転換等に関する法律（登録調査機関の登録） | 1 |
| 百七 | 工業用水道事業法（事業の許可／給水区域の変更の許可） | 1 |
| 百八 | 深海底鉱業暫定措置法（深海底鉱業の許可／深海底鉱区の変更の許可） | 1 |
| 百八の二 | 二酸化炭素の貯留事業に関する法律（登録導管輸送工作物検査機関の登録） | 1 |
| 百九 | アルコール事業法（（一）〜（三）） | 3 |
| 百十 | 航空機製造事業法（事業の許可／事業の区分の変更の許可） | 1 |
| **合計** | | **24** |

原文に存在する fee string をすべて数えた結果が **24 件**で、タスク指定の総数 24 件と一致します
（`一件につき` の出現回数も 24）。本範囲に割合（千分の△）はありません。
**デーミング規定・金額なし行は本範囲に存在しない**ため、fee def を作らない行はありません
（原文に `既に` / `については` / `千分の` は 0 回）。

## 2. 追加した def 一覧（名前 → 金額 → 条号／区分）

`namespace JapanTaxLaw`、`open JapanTaxLaw.TaxFinance`。各 def は `Money := <額>` の flat 定数
（課税標準は一件につき）。各 def に `<name>_pos : <name> > 0 := by decide` と
`example : <name> = <額> := by decide` を付与済み（24 本ずつ）。

| # | 条号／区分 | def 名 | 金額 | 原文 fee |
| --- | --- | --- | --- | --- |
| 1 | 百三 熱供給事業の登録 | `heatSupplyRegFee` | 90,000 | 九万円 |
| 2 | 百四（一） 小売電気事業の登録 | `retailElectricRegFee` | 90,000 | 九万円 |
| 3 | 百四（二） 指定旧供給区域の変更の許可 | `oldSupplyAreaChangePermitFee` | 90,000 | 九万円 |
| 4 | 百四（三） 一般送配電事業の許可／供給区域の変更の許可 | `generalTransmissionPermitFee` | 150,000 | 十五万円 |
| 5 | 百四（四） 供給区域外の供給の許可（第二十四条第一項） | `outsideAreaSupplyPermitFee` | 15,000 | 一万五千円 |
| 6 | 百四（五） 送電事業の許可／振替供給の相手方の変更の許可 | `transmissionBizPermitFee` | 150,000 | 十五万円 |
| 7 | 百四（六） 配電事業の許可／供給区域の変更の許可 | `distributionBizPermitFee` | 150,000 | 十五万円 |
| 8 | 百四（七） 供給区域外の供給の許可（準用） | `specificTransmissionOutsideSupplyPermitFee` | 15,000 | 一万五千円 |
| 9 | 百四（八） 特定送配電事業者による小売供給の登録 | `specificTransmissionRetailRegFee` | 15,000 | 一万五千円 |
| 10 | 百四（九） 特定供給（電気を供給する事業の許可） | `specificSupplyPermitFee` | 15,000 | 一万五千円 |
| 11 | 百四（十） 認定高度保安実施設置者の認定 | `highSecurityFacilityCertFee` | 90,000 | 九万円 |
| 12 | 百四（十一） 認定電気使用者情報利用者等協会の認定 | `certElectricUserInfoAssocFee` | 150,000 | 十五万円 |
| 13 | 百四（十二） 登録適合性確認機関の登録 | `registrationConformityOrgFee` | 90,000 | 九万円 |
| 14 | 百四（十三） 登録安全管理審査機関の登録 | `registeredSafetyAuditOrgFee` | 90,000 | 九万円 |
| 15 | 百四（十四） 登録調査機関の登録 | `registeredInvestigationOrgFee` | 90,000 | 九万円 |
| 16 | 百五 登録電気工事業者の登録 | `electricWorkContractorRegFee` | 90,000 | 九万円 |
| 17 | 百六 工場等に係る登録調査機関の登録 | `factoryInvestigationOrgRegFee` | 90,000 | 九万円 |
| 18 | 百七 工業用水道事業の許可／給水区域の変更の許可 | `industrialWaterPermitFee` | 90,000 | 九万円 |
| 19 | 百八 深海底鉱業の許可／深海底鉱区の変更の許可 | `deepSeabedMiningPermitFee` | 90,000 | 九万円 |
| 20 | 百八の二 登録導管輸送工作物検査機関の登録 | `co2PipelineInspectOrgRegFee` | 90,000 | 九万円 |
| 21 | 百九（一） アルコールの製造／輸入の事業の許可 | `alcoholMfgImportPermitFee` | 150,000 | 十五万円 |
| 22 | 百九（二） アルコールの販売の事業の許可 | `alcoholSalesPermitFee` | 90,000 | 九万円 |
| 23 | 百九（三） アルコールの使用の許可／変更の許可 | `alcoholUsePermitFee` | 15,000 | 一万五千円 |
| 24 | 百十 航空機等の製造／修理事業の許可・事業の区分の変更の許可 | `aircraftMfgRepairPermitFee` | 90,000 | 九万円 |

金額一致の内訳: 九万円=14 件（90,000）／ 十五万円=5 件（150,000）／ 一万五千円=5 件（15,000）
＝ 合計 24 件。pinned 原文の fee フレーズ出現数（14 / 5 / 5）と完全一致。

`RegistrationQualificationFeesP5GSpec.lean` は `spec` 接頭辞の独立定式 24 本 +
`agreeRegistrationQualificationFeesP5G : Bool`（実装 ≡ spec の `==` 一致）+
`example : agreeRegistrationQualificationFeesP5G = true := by decide`。
`RegistrationQualificationFeesP5GTests.lean` は `example := by decide` のスモーク 24 件のみ。

doc-comment に明記した射程外（overclaim 防止）:

- 「指定旧供給区域の増加に係るもの（当該指定旧供給区域の属する市町村内における増加を
  除く。）に限る。」「供給区域の増加に係るもの（…市町村内における増加を除く。）に限る。」
  「振替供給の相手方である一般送配電事業者又は配電事業者の増加に係るものに限る。」
  「更新の認定を除く。」「更新の登録を除く。」「深海底鉱区の面積の増加に係るものに限る。」
  「使用施設ごとのアルコールの用途の増加に係るものに限る。」
  「事業の区分の増加に係るものに限る。」等の適用判定は **caller-established** とし、
  金額定数には反映していません（Bool を式に入れていません）。
- 百二 以前・百十一 以降は NOT YET COVERED。

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
    "百三熱供給事業の登録熱供給事業法（昭和四十七年法律第八十八号）第三条（事業の登録）の熱供給事業の登録登録件数一件につき九万円",
    "登録調査機関の登録（一）電気事業法（昭和三十九年法律第百七十号）第二条の二（事業の登録）の小売電気事業の登録登録件数一件につき九万円",
    "に規定する指定旧供給区域の増加に係るもの（当該指定旧供給区域の属する市町村内における指定旧供給区域の増加に係るものを除く。）に限る。）許可件数一件につき九万円",
    "同法第六条第二項第五号（許可証）に掲げる供給区域の増加に係るもの（これらの許可を受けている供給区域の属する市町村内における供給区域の増加に係るものを除く。）に限る。）許可件数一件につき十五万円",
    "（四）電気事業法第二十四条第一項（供給区域外に設置する電線路による供給）の供給区域外の供給の許可許可件数一件につき一万五千円",
    "同法第二十七条の七第二項第五号（許可証）に掲げる振替供給の相手方である一般送配電事業者又は配電事業者の増加に係るものに限る。）許可件数一件につき十五万円",
    "同法第二十七条の十二の五第二項第五号（許可証）に掲げる供給区域の増加に係るもの（これらの許可を受けている供給区域の属する市町村内における供給区域の増加に係るものを除く。）に限る。）許可件数一件につき十五万円",
    "（七）電気事業法第二十七条の十二の十三（準用）において準用する同法第二十四条第一項の供給区域外の供給の許可許可件数一件につき一万五千円",
    "につき一万五千円（八）電気事業法第二十七条の十五（小売供給の登録）の特定送配電事業者による小売供給の登録登録件数一件につき一万五千円",
    "録件数一件につき一万五千円（九）電気事業法第二十七条の三十三第一項（特定供給）の電気を供給する事業の許可許可件数一件につき一万五千円",
    "件につき一万五千円（十）電気事業法第五十五条の三（認定）の認定高度保安実施設置者の認定（更新の認定を除く。）認定件数一件につき九万円",
    "（十一）電気事業法第三十七条の四（認定電気使用者情報利用者等協会の認定）の認定電気使用者情報利用者等協会の認定認定件数一件につき十五万円",
    "につき十五万円（十二）電気事業法第四十八条の二第一項（登録適合性確認機関の登録）の登録（更新の登録を除く。）登録件数一件につき九万円",
    "（十三）電気事業法第五十一条第三項（登録安全管理審査機関の登録）又は第五十五条第四項（登録安全管理審査機関の登録）の登録（更新の登録を除く。）登録件数一件につき九万円",
    "件数一件につき九万円（十四）電気事業法第五十七条の二第一項（登録調査機関の登録）の登録（更新の登録を除く。）登録件数一件につき九万円",
    "百五登録電気工事業者の登録電気工事業の業務の適正化に関する法律（昭和四十五年法律第九十六号）第三条第一項（登録）の経済産業大臣がする登録電気工事業者の登録（更新の登録を除く。）登録件数一件につき九万円",
    "百六特定事業者等が設置している工場等に係る登録調査機関の登録エネルギーの使用の合理化及び非化石エネルギーへの転換等に関する法律（昭和五十四年法律第四十九号）第八十四条第一項（登録調査機関の登録）の登録（更新の登録を除く。）登録件数一件につき九万円",
    "同法第四条第一項第二号（事業の届出及び許可）の給水区域の増加に係るもの（これらの許可を受けている給水区域の属する市町村内における給水区域の増加に係るものを除く。）に限る。）許可件数一件につき九万円",
    "変更）の規定による変更の許可（同法第十三条第二項第六号（許可証）の深海底鉱区の面積の増加に係るものに限る。）許可件数一件につき九万円",
    "百八の二二酸化炭素を輸送する事業に係る登録導管輸送工作物検査機関の登録二酸化炭素の貯留事業に関する法律第九十一条第一項（登録導管輸送工作物検査機関の登録）の登録（更新の登録を除く。）登録件数一件につき九万円",
    "（一）アルコール事業法（平成十二年法律第三十六号）第三条第一項（製造の許可）の規定によるアルコールの製造の事業の許可又は同法第十六条第一項（輸入の許可）の規定によるアルコールの輸入の事業の許可許可件数一件につき十五万円",
    "件につき十五万円（二）アルコール事業法第二十一条第一項（販売の許可）の規定によるアルコールの販売の事業の許可許可件数一件につき九万円",
    "可等）の変更の許可（同法第二十六条第二項第六号の使用施設ごとのアルコールの用途の増加に係るものに限る。）許可件数一件につき一万五千円",
    "分の変更）の規定による変更の許可（同法第二条の六第二項第三号（許可証）の事業の区分の増加に係るものに限る。）許可件数一件につき九万円"
  ]
}
```

参考：現行スクリプト形式への変換例（name は任意、needles は上記 24 本をそのまま使用）:

```python
yield ("登録免許税法 別表第一（二）第三十二号 百三〜百十（熱供給・電気・電気工事・エネルギー・工業用水道・深海底鉱業・二酸化炭素・アルコール・航空機）↔ RegistrationQualificationFeesP5G.lean",
       "342AC0000000035",
       "file", None,
       [ ...上記 needles 24 本を一字も変えずに列挙... ])
```

## 4. 期待 literal 増分

- W-G 担当分: 新規 check **24 needles** なので **+24**。
- `docs/PROGRESS.md` の監査 literal 総数はメインセッションが再確認して加算してください
  （起点値は本メモでは書きません）。

## 5. 検証結果（すべて本セッションで実行済み）

- `lake build JapanTaxLaw.RegistrationQualificationFeesP5G JapanTaxLaw.RegistrationQualificationFeesP5GSpec JapanTaxLaw.RegistrationQualificationFeesP5GTests`
  → **成功（5 jobs、warning なし）**。※自作 3 モジュールのみビルド（全体ビルド／CI／`run_python_gates.py` は実行していません）。
- `python scripts/ci/check_no_sorry.py` → `no forbidden placeholder proofs found in tracked Lean sources`。
  （新規 3 ファイルは未追跡のため走査対象外ですが、人力でも `sorry` / `admit` はありません。）
- `#print axioms`（一時ファイル `WGAxiomProbe.lean` を approved temp dir に作成、`lake env lean` で実行後 **削除済み**）:
  - 新規 positivity 定理 **24 本すべて** と `agreeRegistrationQualificationFeesP5G` の計 **25 件**が
    `does not depend on any axioms`。
  - **`Classical.choice` も `sorryAx` も `propext` も一切なし**。
- 原文逐語検証（pinned JSON を正規化テキストに対して `.find()`）: **24/24 FOUND、MISS 0 件**（§6）。
  担当範囲原文 `art32_103_110.txt` 正規化テキストに対しても **24/24 FOUND、MISS 0 件**。
  各 needle は両テキストで出現回数 **1**（一意）、長さはすべて **62〜123 文字**。
  law id `342AC0000000035` … FOUND / revision `342AC0000000035_20261101_508AC0000000021` … FOUND。
- 金額一致: 九万円=14 件 / 十五万円=5 件 / 一万五千円=5 件 ＝ 24 件、pinned 原文の fee
  フレーズ出現数（14 / 5 / 5）と完全一致。

## 6. 逐語検証 FOUND / MISS 一覧（一字も変更せず）

担当範囲原文 `art32_103_110.txt` を、転記監査と同じ `re.sub(r"[\s　]+", "", ...)` で正規化した文字列に
対して各 needle を Python の `.find()` で検索（`art@`）。
`json@` は pinned JSON `law_full_text` を `transcription_audit.py` と同一ロジックで平坦化・正規化した文字列上の offset。
各 needle の出現回数は両方とも **1**（一意）。

| # | 条号/区分 | def | 結果 | art@ | json@ | 出現回数(art/json) | len |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 1 | 百三 | `heatSupplyRegFee` | FOUND | 0 | 173270 | 1/1 | 62 |
| 2 | 百四(一) | `retailElectricRegFee` | FOUND | 316 | 173586 | 1/1 | 66 |
| 3 | 百四(二) | `oldSupplyAreaChangePermitFee` | FOUND | 474 | 173744 | 1/1 | 79 |
| 4 | 百四(三) | `generalTransmissionPermitFee` | FOUND | 608 | 173878 | 1/1 | 96 |
| 5 | 百四(四) | `outsideAreaSupplyPermitFee` | FOUND | 704 | 173974 | 1/1 | 62 |
| 6 | 百四(五) | `transmissionBizPermitFee` | FOUND | 832 | 174102 | 1/1 | 76 |
| 7 | 百四(六) | `distributionBizPermitFee` | FOUND | 974 | 174244 | 1/1 | 103 |
| 8 | 百四(七) | `specificTransmissionOutsideSupplyPermitFee` | FOUND | 1077 | 174347 | 1/1 | 67 |
| 9 | 百四(八) | `specificTransmissionRetailRegFee` | FOUND | 1136 | 174406 | 1/1 | 66 |
| 10 | 百四(九) | `specificSupplyPermitFee` | FOUND | 1189 | 174459 | 1/1 | 66 |
| 11 | 百四(十) | `highSecurityFacilityCertFee` | FOUND | 1246 | 174516 | 1/1 | 66 |
| 12 | 百四(十一) | `certElectricUserInfoAssocFee` | FOUND | 1312 | 174582 | 1/1 | 68 |
| 13 | 百四(十二) | `registrationConformityOrgFee` | FOUND | 1373 | 174643 | 1/1 | 66 |
| 14 | 百四(十三) | `registeredSafetyAuditOrgFee` | FOUND | 1439 | 174709 | 1/1 | 83 |
| 15 | 百四(十四) | `registeredInvestigationOrgFee` | FOUND | 1512 | 174782 | 1/1 | 66 |
| 16 | 百五 | `electricWorkContractorRegFee` | FOUND | 1578 | 174848 | 1/1 | 100 |
| 17 | 百六 | `factoryInvestigationOrgRegFee` | FOUND | 1678 | 174948 | 1/1 | 123 |
| 18 | 百七 | `industrialWaterPermitFee` | FOUND | 1908 | 175178 | 1/1 | 98 |
| 19 | 百八 | `deepSeabedMiningPermitFee` | FOUND | 2098 | 175368 | 1/1 | 66 |
| 20 | 百八の二 | `co2PipelineInspectOrgRegFee` | FOUND | 2164 | 175434 | 1/1 | 103 |
| 21 | 百九(一) | `alcoholMfgImportPermitFee` | FOUND | 2299 | 175569 | 1/1 | 109 |
| 22 | 百九(二) | `alcoholSalesPermitFee` | FOUND | 2400 | 175670 | 1/1 | 66 |
| 23 | 百九(三) | `alcoholUsePermitFee` | FOUND | 2542 | 175812 | 1/1 | 66 |
| 24 | 百十 | `aircraftMfgRepairPermitFee` | FOUND | 2732 | 176002 | 1/1 | 66 |

- **FOUND 24 / MISS 0**。needle の長さはすべて **60〜130 文字**、24 本すべて相互に異なることを確認。
  アンカーの勝手な変更・正規化・文字変換はしていません。
- 各 needle には原則として項目の条号（百三〜百十）又は区分（（一）〜（十四））を含めています。
  ただし原文が極端に長い 14 件（#2 百四(一)・#3 百四(二)・#4 百四(三)・#6 百四(五)・
  #7 百四(六)・#9 百四(八)・#10 百四(九)・#11 百四(十)・#13 百四(十二)・#15 百四(十四)・
  #18 百七・#19 百八・#23 百九(三)・#24 百十）は、条号／区分から fee フレーズまでの距離が
  130 文字を超えるか、区分単体では 60 文字に満たないため、60〜130 文字制約と fee literal の
  逐語確認を両立させる目的で、当該項目を一意に特定する区分・根拠条文・fee literal を含む
  連続部分をアンカーとして採用しました。対応する条号／区分は上表および def の
  doc-comment に明記しています。
- 金額の日本語数字との対応も全件一致（九万円=90,000 / 十五万円=150,000 /
  一万五千円=15,000）。

## 7. README / PROGRESS に足す 1 行文案

CROSS_LAW の scan/pin 件数や監査 literal 総数はメインセッションが計算するため、ここでは書きません。

- **README.md**（モジュール一覧・`RegistrationQualificationFeesP4F*` 行の直後に追加）:
  ```text
  JapanTaxLaw/RegistrationQualificationFeesP5G.lean / -Spec.lean / -Tests.lean  # 登録免許税法 別表第一（二）第三十二号 百三〜百十（熱供給・電気・電気工事・エネルギー・工業用水道・深海底鉱業・二酸化炭素・アルコール・航空機）の flat fee L4 モデル・独立定式・退行テスト
  ```
- **docs/PROGRESS.md**（L4 着手済みモジュール一覧の末尾に追記）:
  ```text
  登録免許税法 別表第一（二）第三十二号 百三〜百十（RegistrationQualificationFeesP5G.lean：24 件の flat fee 額を Money 定数化、百二 以前・百十一 以降 NOT YET COVERED）
  ```

## 8. インテグレーターへの明示事項

**インテグレーターは `JapanTaxLaw.lean` に以下の 3 つの import を追加すること。**

```lean
import JapanTaxLaw.RegistrationQualificationFeesP5G
import JapanTaxLaw.RegistrationQualificationFeesP5GSpec
import JapanTaxLaw.RegistrationQualificationFeesP5GTests
```

（W-A / W-B / W-C / W-D / W-F 等の各 3 件と併せてメインが統合してください。
W-G は `JapanTaxLaw.lean` を書き換えていません。）

## 9. 範囲・残ブロッカーの正直な申告

- これは **L4 のごく小さなスライス**です。**完成・網羅を主張しません**。
- 担当は 別表第一（二）第三十二号 **百三〜百十 のみ**。**百二 以前・百十一 以降は NOT YET COVERED**。
- 登録・認定・認可・許可の要件・適用、「更新の登録を除く」「更新の認定を除く」
  「…に限る。」等の該当性はすべて caller-established とし、法的判断の自動化はしていません。
- 本範囲に割合はなく、デーミング規定・金額なし行は存在しないため 24 行すべてを fee def 化しました。
- `agreeRegistrationQualificationFeesP5G` は定数同士の `==` 一致確認であり、法的意味の等価証明ではありません。
- 転記監査は fidelity-only（原文 bytes との一致確認）であり、法的正しさを保証しません。
- **L7 候補 3,438 件は unreviewed のまま**です（本スライスでは一切レビューしていません）。
- 残ブロッカー: 転記監査 check の `checks()` への組み込み（§3、+24）、`JapanTaxLaw.lean` への
  import 追加（§8）、README / PROGRESS の 1 行追記（§7）、および全体ビルド・CI ゲートの
  実行は**すべてメインセッションの担当**です（W-G は実行していません）。

---
---

# STAGING — W-G（所得税法 art. 208 / 175 / 179 源泉徴収税率）受け渡しメモ

> **⚠ ラベル衝突について（統合担当へ）**: 本ファイルは元々「W-G＝登録免許税法 別表第一（二）
> 第三十二号 百三〜百十」担当の受け渡しメモでした（上記 `## 0`〜`## 9`、その工作は既に
> `JapanTaxLaw.lean` に import 済み）。今回の W-G（所得税 源泉徴収税率）は**別の作業項目**に
> 同じラベルが割り当てられたため、既存記録を消さずに**追記**しています。下記 `## 10` 以降が
> 本次（所得税 art. 208 / 175 / 179）の受け渡しメモです。

> 実装担当 W-G（所得税 源泉徴収税率）からメインセッション（統合担当）への受け渡し用。
> ブランチ操作・add/commit/push/merge は一切していません。
> 書き換えたのは下記 4 ファイルのみです（他は読み取り専用）。

## 10. 対象ファイル

| ファイル | 状態 |
| --- | --- |
| `JapanTaxLaw/IncomeWithholdingRates.lean` | 新規 |
| `JapanTaxLaw/IncomeWithholdingRatesSpec.lean` | 新規 |
| `JapanTaxLaw/IncomeWithholdingRatesTests.lean` | 新規 |
| `docs/STAGING_WG.md` | 本ファイル（§10 以降を追記、既存 §0〜§9 は保持） |

pinned source: `data/raw/340AC0000000033_20261001_507AC0000000070.law.json`
law id `340AC0000000033` / revision `340AC0000000033_20261001_507AC0000000070`
amendment enforcement date `2026-10-01` / raw snapshot sha256
`94C4A7AD83726CDE60787967ED4E959585AD0AF9279D25DB9AA02264B3FE606B`
（`IndividualIncomeTax.lean` / `IncomeMiscDeductions.lean` と同一ピン。）

**名前空間: `JapanTaxLaw.IncomeWithholdingRates`（サブ名前空間）**。
フラットな `JapanTaxLaw` には `IncomeMiscDeductions.lean` の
`dividendWithholdingRate` / `interestWithholdingRate` 等が別サブ名前空間に存在するため、
同名衝突を避けるためです。`annuityWithholdingRate`（15%）という名称は担当指定に従って
います（対象は art. 175 第一号の**利子等**であり、art. 208 の年金とは別物です）。

## 11. def 一覧

### 11.1 `IncomeWithholdingRates.lean`（12 defs + 1 inductive / 21 公開定理 / 16 smoke）

**art. 208（徴収税額）: 年金 − 保険料対応額 × 10%（saturating Nat + floor）**

| def | 条 | 値／式 | needle 対応 |
| --- | --- | --- | --- |
| `article208WithholdingRate` | 第208条 | `⟨10,100⟩` | #7 |
| `article208DeductedAnnuity` | 第208条 | `年金 − 保険料対応額`（saturating） | #7 |
| `article208WithholdingTax` | 第208条 | `(年金 − 保険料対応額) × 10/100` | #7 |

**art. 175（内国法人の税率）: 利子等 15% / 配当等 20%**

| def | 条 | 値／式 | needle 対応 |
| --- | --- | --- | --- |
| `annuityWithholdingRate` | 第175条 第一号（利子等） | `⟨15,100⟩` | #1 |
| `dividendWithholdingRate` | 第175条 第二号（配当等） | `⟨20,100⟩` | #2 |
| `article175Rate` | 第175条 区分選択 | `isDividend ? 20% : 15%` | #1, #2 |
| `article175WithholdingTax` | 第175条 | `金額 × (15% or 20%)/100` | #1, #2 |

**art. 179（外国法人の税率）: 一号 20% / 二号 10% / 三号 15%**

| def | 条 | 値／式 | needle 対応 |
| --- | --- | --- | --- |
| `foreignCorpGeneralRate` | 第179条 一号 | `⟨20,100⟩` | #4 |
| `foreignCorpArticle161Item5Rate` | 第179条 二号 | `⟨10,100⟩` | #5 |
| `foreignCorpArticle161Item8Or15Rate` | 第179条 三号 | `⟨15,100⟩` | #6 |
| `ForeignCorpDomesticSourceCategory`（inductive） | 第179条 3区分 | `general / item5 / item8Or15` | #4, #5, #6 |
| `article179Rate` | 第179条 率選択 | `category → 20% / 10% / 15%` | #4, #5, #6 |
| `article179WithholdingTax` | 第179条 | `金額 × (20% or 10% or 15%)/100` | #4, #5, #6 |

- 公開定理 21 本: 率 `*_num_pos`（6 本, 内 1 本は `*_den_pos`）、
  saturating の `article208DeductedAnnuity_of_ge / _of_lt / _le_annuity` 3、
  法定リテラルへの `*_eq` 接続（`article208WithholdingTax_eq` 1）、
  率選択 characterization（`article175Rate_dividend/_interest` 2,
  `article179Rate_general/_item5/_item8Or15` 3）、
  税額 exact（`article175WithholdingTax_dividend/_interest` 2,
  `article179WithholdingTax_*` 3）。
  （`Nat.sub_eq_zero_of_le` は core で `propext` 依存のため、自前の axiom-free 補助
  `natSubEqZeroOfLeFree`（`private`）で `article208DeductedAnnuity_of_lt` を証明。）
- 課税標準額（年金の額・利子等／配当等の金額・国内源泉所得の金額）、区分該当性、
  および第208条の「政令で定めるところにより計算した金額」（保険料対応額）は
  caller-established とし、金額算出式には入れていません（Bool を式に混入させていません）。

### 11.2 `IncomeWithholdingRatesSpec.lean`（5 defs / 10 smoke）

- 独立整数定式: `specArticle208DeductedAnnuity` / `specArticle208WithholdingTax` /
  `specArticle175WithholdingTax` / `specArticle179WithholdingTax`。
  `TaxRate.applyFloor` を使わず `* 20 / 100` 等を直接記述し、art. 208 の控除は
  明示 `if` で saturating を表現（Nat 減算のアンダーフローに依存しない）。
- `agreeIncomeWithholdingRates : Bool` — impl と spec の全テスト点
  （(年金, 保険料対応額) 8 点 × art.208、金額 12 点 × art.175 2 通り × art.179 3 通り）を
  `==` 比較。`example : agreeIncomeWithholdingRates = true := by decide`。

### 11.3 `IncomeWithholdingRatesTests.lean`

- `example ... := by decide` の kernel-decide smoke **31 本**のみ（新規定理名なし）。
- `TaxRate` は `den_pos` 証明フィールドを持ち構造体等号が decide 不能なため、
  率選択のスモークは `.num` フィールドで検証（`article175Rate_dividend` 等の
  構造体等号は impl 側の `rfl` 定理で担保）。

### 11.4 NOT MODELLED（正直な射程外）

- **第179条の全体**: 原文は 3 区分とも明確な率（20% / 10% / 15%）を規定するため
  当該 3 率を定数化しましたが、**「いずれの号に該当するか」の判定ロジック**および
  **第百六十九条第一号・第二号・第四号・第五号による課税標準の読み替え**
  「第百六十一条第一項第五号／第八号及び第十五号の該当性」は複雑なため
  **NOT MODELLED** です。区分と課税標準は caller-established としました。
  租税条約上の軽減・免除も非モデル化。
- **第175条 第三号（賞金）**: 「賞金その金額から政令で定める金額を控除した残額に
  百分の十の税率」は政令細目に依存するため **NOT MODELLED**（needle #3 は原文逐語
  証拠としてのみ採録）。
- **第208条の保険料対応額**: 「政令で定めるところにより計算した金額」の算定そのものは
  **NOT MODELLED**（caller-established な入力値として扱う）。
- 丸めは切り捨て（`TaxRate.applyFloor`）。端数処理（通則法 art. 118 / 119）、
  復興特別所得税・防衛特別所得税、確定申告調整は非モデル化。
- 転記監査は fidelity-only（原文 bytes との一致確認）であり、法的正しさを保証しません。

## 12. 転記監査に追加すべき check（JSON 断片）

`scripts/ci/transcription_audit.py` の `checks()` に追加する check の JSON 表現です
（`law_id` / `kind` / `title` / `needles` の 4 キー）。needle 文字列は一字も変えないこと。

```json
{
  "law_id": "340AC0000000033",
  "kind": "file",
  "title": null,
  "needles": [
    "給付補てん金、利息、利益若しくは差益その金額に百分の十五の税率を乗じて計算した金額",
    "配当等又は同条第九号に掲げる利益の分配その金額に百分の二十の税率を乗じて計算した金額",
    "前条第十号に掲げる賞金その金額から政令で定める金額を控除した残額に百分の十の税率を乗じて計算した金額",
    "第百六十九条第二号、第四号及び第五号（分離課税に係る所得税の課税標準）に掲げる国内源泉所得については、これらの規定に定める金額）に百分の二十の税率を乗じて計算した金額",
    "第百六十一条第一項第五号（国内源泉所得）に掲げる国内源泉所得その金額に百分の十の税率を乗じて計算した金額",
    "第百六十一条第一項第八号及び第十五号に掲げる国内源泉所得その金額（第百六十九条第一号に掲げる国内源泉所得については、同号に定める金額）に百分の十五の税率を乗じて計算した金額",
    "その支払われる年金の額に対応するものとして政令で定めるところにより計算した金額を控除した金額に百分の十の税率を乗じて計算した金額"
  ]
}
```

> **重要（統合時の注意）**: needle は原文 pinned bytes の一字一句です。
> 文字正規化・全角／半角変換・異体字変換を行わず、そのまま移してください。
> §14 の検証で実際に `.find()` したのは、まさに上記 7 文字列です（`_norm` は
> 空白・全角空白を除去するだけなので、needle 中の文字は一切変換していません）。

参考：現行スクリプト形式への変換例（name は任意）:

```python
yield ("所得税法 art. 208/175/179（源泉徴収税率）↔ IncomeWithholdingRates.lean",
       "340AC0000000033",
       "file", None,
       [ ...上記 needles 7 本を一字も変えずに列挙... ])
```

## 13. 期待 literal 増分

- 新規 check 1 件 × needles **7 本**なので **+7**。
- needle 数 = 7（art.175 × 3、art.179 × 3、art.208 × 1）。
- `docs/PROGRESS.md` §7 の記載値はメインセッションで再確認してください。

## 14. 検証結果（すべて本セッションで実行済み）

- `lake build JapanTaxLaw.IncomeWithholdingRates JapanTaxLaw.IncomeWithholdingRatesSpec JapanTaxLaw.IncomeWithholdingRatesTests`
  → **成功（5 jobs、warning なし）**。※自作 3 モジュールのみビルド（全体ビルド／CI／
  `run_python_gates.py` は未実行）。
- `python scripts/ci/check_no_sorry.py` →
  `no forbidden placeholder proofs found in tracked Lean sources`。
  （新規 3 ファイルは未追跡のため本スクリプトの走査対象外ですが、人力でも
  `sorry` / `admit` はありません。）
- `#print axioms`（一時ファイル `WGIncomeAxiomProbe.lean` を approved temp dir に作成、
  `lake env lean` で実行後 **削除済み**）:
  - 21 本の公開定理と `agreeIncomeWithholdingRates` の計 **22 件**が
    `does not depend on any axioms`。
  - **`Classical.choice` も `sorryAx` も `propext` も一切なし**。
- 原文逐語検証: 下記 §15 のとおり **7/7 FOUND、MISS 0 件**。
  支給テキスト `W_G_income.txt`（正規化済み）と pinned JSON の `law_full_text` を
  `transcription_audit.py` と同一ロジックで平坦化・正規化した両方で
  各 needle の出現回数は **1**（一意）。

## 15. 逐語検証 FOUND / MISS 一覧（一字も変更せず）

needle を `_norm = re.sub(r"[\s　]+", "", ...)` で正規化し、Python の `.find()` で検索
（needle 側も同正規化）。`art@` は支給テキスト `W_G_income.txt` 正規化文字列上の offset、
`json@` は pinned JSON `law_full_text` 平坦化・正規化文字列上の offset。
law id `340AC0000000033` / revision `340AC0000000033_20261001_507AC0000000070` /
sha256 `94C4A7AD…FE606B` は INVENTORY.json で一致確認済み。

| # | 対象 | 結果 | len | 出現回数(art/json) | art@ | json@ |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | art.175 利子等 15% | FOUND | 41 | 1/1 | 110 | 191861 |
| 2 | art.175 配当等 20% | FOUND | 42 | 1/1 | 161 | 191912 |
| 3 | art.175 賞金 10%（NOT MODELLED） | FOUND | 50 | 1/1 | 204 | 191955 |
| 4 | art.179 一号 20% | FOUND | 83 | 1/1 | 371 | 194358 |
| 5 | art.179 二号 10% | FOUND | 52 | 1/1 | 455 | 194442 |
| 6 | art.179 三号 15% | FOUND | 86 | 1/1 | 508 | 194495 |
| 7 | art.208 10% | FOUND | 64 | 1/1 | 692 | 228938 |

- **FOUND 7 / MISS 0**。needle の長さはすべて 41〜86 文字、7 本すべて相互に異なることを確認。
  アンカーの勝手な変更・正規化・文字変換はしていません。

## 16. README / PROGRESS に足す 1 行文案

CROSS_LAW の scan/pin 件数や監査 literal 総数はメインセッションが計算するため、ここでは書きません。

- **README.md**（モジュール一覧・`IncomeMiscDeductions` 3 行の直後に追加）:
  ```text
  JapanTaxLaw/IncomeWithholdingRates.lean / -Spec.lean / -Tests.lean  # 所得税法 art.208/175/179（年金・利子等/配当等・外国法人の源泉徴収税率）bounded L4 モデル・独立定式・退行テスト
  ```
- **docs/PROGRESS.md**（L4 着手済みモジュール一覧の末尾に追記）:
  ```text
  所得税法 art.208/175/179 源泉徴収税率 IncomeWithholdingRates.lean（208 は年金−保険料対応額×10% を saturating Nat、175 は 15%/20%、179 は 20%/10%/15% を定数化。区分・課税標準・政令細目は caller-established、179 の区分判定と 169 条読み替えは NOT MODELLED）
  ```

## 17. インテグレーターへの明示事項

**インテグレーターは `JapanTaxLaw.lean` に以下の 3 つの import を追加すること。**

```lean
import JapanTaxLaw.IncomeWithholdingRates
import JapanTaxLaw.IncomeWithholdingRatesSpec
import JapanTaxLaw.IncomeWithholdingRatesTests
```

（W-A / W-B / W-C / W-D / W-F 等の各 3 件と併せてメインが統合してください。
W-G は `JapanTaxLaw.lean` を書き換えていません。）

## 18. 範囲・残ブロッカーの正直な申告

- これは **L4 のごく小さなスライス**です。**完成・網羅を主張しません**。
- 担当は 所得税法の上記 **3 条文のみ**（art. 208 / 175 / 179）。
  所得税法全体、他の源泉徴収・申告・納付・分離課税の詳細は NOT YET COVERED。
- 第179条は 3 率（20/10/15%）のみ定数化し、区分判定ロジック・第百六十九条による
  課税標準の読み替え・第百六十一条各号の該当性は **NOT MODELLED**。
  第175条第三号（賞金・政令控除・10%）および第208条の保険料対応額の算定も
  **NOT MODELLED**。
- 区分該当性・課税標準額・政令細目はすべて caller-established であり、
  法的判断の自動化はしていません。
- `agreeIncomeWithholdingRates` は有限点での `==` 一致確認であり、
  法的意味の等価証明ではありません。
- 転記監査は fidelity-only（原文 bytes との一致確認）であり、法的正しさを保証しません。
- **L7 候補 3,438 件は unreviewed のまま**です（本スライスでは一切レビューしていません）。
- 残ブロッカー: 転記監査 check の `checks()` への組み込み（§12、+7）、
  `JapanTaxLaw.lean` への import 追加（§17）、README / PROGRESS の 1 行追記（§16）、
  および全体ビルド・CI ゲートの実行は**すべてメインセッションの担当**です
  （W-G は実行していません）。

