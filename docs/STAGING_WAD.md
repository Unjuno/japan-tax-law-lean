# STAGING — W-AD（登録免許税法 別表第一（二）五十〜五十九：監査法人・公認会計士・消防設備等 の手数料モデル）受け渡しメモ

> 実装担当 W-AD からメインセッション（統合担当）への受け渡し用。
> ブランチ操作・add/commit/push/merge は一切していません。
> 書き換えたのは下記 4 ファイルのみです（他は読み取り専用）。

## 0. 対象ファイル / pinned source

| ファイル | 状態 |
| --- | --- |
| `JapanTaxLaw/RegistryQualificationFeesJ3.lean` | 新規 |
| `JapanTaxLaw/RegistryQualificationFeesJ3Spec.lean` | 新規 |
| `JapanTaxLaw/RegistryQualificationFeesJ3Tests.lean` | 新規 |
| `docs/STAGING_WAD.md` | 新規（本ファイル） |

pinned source: `data/raw/342AC0000000035_20261101_508AC0000000021.law.json`
law id `342AC0000000035` / revision `342AC0000000035_20261101_508AC0000000021`
（登録免許税法。amendment enforcement date `2026-11-01`）。
担当範囲原文（正規化済み・UTF-8）: `C:\Users\junny\AppData\Local\Temp\opencode\reg_qual_C.txt`
（五十〜五十九、2550 文字、改行・全角空白除去後 2519 文字）。
名前空間は `JapanTaxLaw.RegistryQualificationFeesJ3`（他モジュールと衝突しません）。

## 1. モデル化した手数料と金額

原文の fee string「〇〇件数一件につき△△円」「一局につき△△円」をすべて flat 定数
（`Money = Nat`）としてモデル化しました。金額は日本語数字で確定し Arabic に変換。

| 号 | 内容 | 原文金額 | 定数 |
| --- | --- | --- | --- |
| 五十(一) | 有限責任監査法人の登録 | 十五万円 | `limitedLiabilityAuditCorpRegFee` = 150,000 |
| 五十(二) | 登録上場会社等監査人の登録 | 九万円 | `registeredListedCompanyAuditFirmRegFee` = 90,000 |
| 五十(三) | 実務補習団体等の認定 | 十五万円 | `cpaPracticalTrainingOrgCertFee` = 150,000 |
| 五十の二 | 登録試験機関の登録 | 十五万円 | `consumerAffairsCounselorExamOrgRegFee` = 150,000 |
| 五十の三 | 特定適格消費者団体の認定 | 一万五千円 | `specifiedQualifiedConsumerOrgCertFee` = 15,000 |
| 五十一(一) | 電気通信事業者の登録／業務区域増加変更登録 | 十五万円 | `telecomBusinessRegFee` = 150,000 |
| 五十一(二) | 認定送信型対電気通信設備サイバー攻撃対処協会の認定 | 十五万円 | `certifiedCyberAttackResponseAssocCertFee` = 150,000 |
| 五十一(三) | 登録講習機関の登録 | 九万円 | `telecomChiefEngineerTrainingOrgRegFee` = 90,000 |
| 五十一(四) | 登録認定機関の登録 | 九万円 | `terminalEquipmentCertOrgRegFee` = 90,000 |
| 五十二 | 登録送信適正化機関の登録 | 九万円 | `registeredSenderOptimizationOrgRegFee` = 90,000 |
| 五十三(一) | 認定認証事業者の認定 | 九万円 | `certifiedCertificationBusinessRegFee` = 90,000 |
| 五十三(二) | 認定外国認証事業者の認定 | 九万円 | `certifiedForeignCertificationBusinessRegFee` = 90,000 |
| 五十三の二 | 認定電子委任状取扱事業者の認定 | 九万円 | `certifiedElectronicPowerOfAttorneyBusinessRegFee` = 90,000 |
| 五十四(一) | 無線局の免許 | 三万円 | `radioStationLicenseFee` = 30,000 |
| 五十四(一) 特例 | 電波法第五条第四項の放送をする無線局 | 十五万円 | `broadcastRadioStationLicenseFee` = 150,000 |
| 五十四(二) | 無線局の登録 | 三万円 | `radioStationRegFee` = 30,000 |
| 五十四(三) | 検査等事業者の登録 | 九万円 | `radioEquipmentInspectionBusinessRegFee` = 90,000 |
| 五十四(四) | 外国点検事業者の登録 | 九万円 | `foreignRadioEquipmentInspectionBusinessRegFee` = 90,000 |
| 五十四(五) | 登録証明機関の登録 | 九万円 | `registeredRadioEquipmentCertOrgRegFee` = 90,000 |
| 五十四(六) | 登録周波数終了対策機関の登録 | 九万円 | `registeredFrequencyTerminationOrgRegFee` = 90,000 |
| 五十五(一) | 認定基幹放送事業者の認定 | 九万円 | `certifiedKeyBroadcastBusinessCertFee` = 90,000 |
| 五十五(二) | 登録一般放送事業者の登録／変更登録 | 九万円 | `registeredGeneralBroadcastBusinessRegFee` = 90,000 |
| 五十五(三) | 認定放送持株会社の認定 | 十五万円 | `certifiedBroadcastHoldingCompanyCertFee` = 150,000 |
| 五十九(一) | 一般信書便事業の許可 | 九万円 | `generalMailBusinessLicenseFee` = 90,000 |
| 五十九(二) | 特定信書便事業の許可 | 三万円 | `specifiedMailBusinessLicenseFee` = 30,000 |

内訳: 十五万円 7 件／九万円 14 件／三万円 3 件／一万五千円 1 件 ＝ **25 件**。

境界（正直な申告）:

- 本範囲に割合型（千分の△・割合）は存在しません（原文で `千分` / `割合` の出現 0 回を確認）。
  よって **TaxRate / applyFloor の定数は作っていません**（10 倍過大バグの対象なし）。
- 「更新の登録を除く。」「更新の認定を除く。」「再免許及び政令で定める無線局の免許を除く。」
  「再登録その他政令で定める登録を除く。」「業務区域の増加に係るものに限る。」「一般放送の
  種類の増加／業務区域の増加に係るものに限る。」「電波法第五条第四項の放送をする無線局に
  ついては…」等の該当性はすべて **caller-established** とし、Bool を式に入れていません。
- 五十一の（注）（電子委任状法による登録・変更登録の「みなし」規定）は金額を定める行ではなく、
  **デーミング規定として fee def を作らず caller-established** と明記しました。
- 五十六から五十八まで は「削除」行で金額なし。**fee def を作らず caller-established** と明記。
- 五十 以前・六十 以降は NOT YET COVERED。「登録件数」「認定件数」「許可件数」「局数」の
  意味上の区別は非モデル化（一律 `Money`）。

## 2. 追加した宣言一覧

`namespace JapanTaxLaw.RegistryQualificationFeesJ3`、`open JapanTaxLaw.TaxFinance`。

- 実装（`RegistryQualificationFeesJ3.lean`）: **25 def**（上表）＋ **25 positivity 定理**
  （`*_pos : <fee> > 0 := by decide`）＋ **25 smoke `example ... := by decide`**。
- 独立定式（`RegistryQualificationFeesJ3Spec.lean`）: **25 `spec*` def** ＋ 25 smoke example ＋
  **`agreeRegistryQualificationFeesJ3 : Bool`**（25 件の `specX == x && ...` 連鎖）＋
  `example : agreeRegistryQualificationFeesJ3 = true := by decide`。
- 退行テスト（`RegistryQualificationFeesJ3Tests.lean`）: **25 kernel-decide smoke example**。
  定理名は追加していません。

**def（宣言）総数: 実装 25 + spec 25 + agree 1 = 51 def、さらに positivity 定理 25 本。**

## 3. 転記監査に追加すべき check（JSON 断片）

`scripts/ci/transcription_audit.py` の `checks()` に追加する check の JSON 表現です
（`law_id` / `kind` / `title` / `needles` の 4 キー）。needle 文字列は一字も変えないこと。
**文字正規化・全角／半角変換・異体字変換を行わず、そのまま移してください。**
各 needle は正規化テキスト（`re.sub(r"[\s\u3000]+", "", ...)`）上の連続部分そのもので、
担当範囲原文と pinned JSON の両方で出現回数 **1**（一意）、長さ 60〜128 文字です。

```json{
  "law_id": "342AC0000000035",
  "kind": "file",
  "title": null,
  "needles": [
    "五十有限責任監査法人若しくは登録上場会社等監査人の登録又は公認会計士に係る実務補習団体等の認定（一）公認会計士法第三十四条の二十四（有限責任監査法人の登録）の登録登録件数一件につき十五万円",
    "公認会計士法第三十四条の三十四の二（登録上場会社等監査人の登録）の登録登録件数一件につき九万円（三）公認会計士法第十六条第一項（実務補習）の実務補習団体等の認定認定件数一件につき十五万円五十の二",
    "五十の二消費生活相談員に係る登録試験機関の登録消費者安全法（平成二十一年法律第五十号）第十条の三第一項（登録試験機関の登録）の登録（更新の登録を除く。）登録件数一件につき十五万円五十の三",
    "被害回復裁判手続に係る特定適格消費者団体の認定消費者の財産的被害等の集団的な回復のための民事の裁判手続の特例に関する法律（平成二十五年法律第九十六号）第七十一条第一項（特定適格消費者団体の認定）の認定（更新の認定を除く。）認定件数一件につき一万五千円五十一",
    "同法第十三条第一項（変更登録等）（同条第二項の規定により読み替えて適用する場合を含む。）の変更登録（同法第十条第一項第三号（電気通信事業の登録）の業務区域の増加に係るものに限る。）登録件数一件につき十五万円",
    "電気通信事業法第百十六条の二第一項（認定送信型対電気通信設備サイバー攻撃対処協会の認定）の認定送信型対電気通信設備サイバー攻撃対処協会の認定認定件数一件につき十五万円",
    "電気通信事業法第八十五条の二第一項（登録講習機関の登録）の登録講習機関の登録（更新の登録を除く。）登録件数一件につき九万円",
    "電気通信事業法第八十六条第一項（登録認定機関の登録）の登録認定機関の登録（更新の登録を除く。）登録件数一件につき九万円五十二",
    "特定電子メールの送信の適正化等に関する法律（平成十四年法律第二十六号）第十四条第一項（登録送信適正化機関の登録）の登録（更新の登録を除く。）登録件数一件につき九万円五十三",
    "電子署名及び認証業務に関する法律（平成十二年法律第百二号）第四条第一項（認定）の認定認証事業者の認定（更新の認定を除く。）認定件数一件につき九万円",
    "電子署名及び認証業務に関する法律第十五条第一項（認定）の認定外国認証事業者の認定（更新の認定を除く。）認定件数一件につき九万円五十三の二",
    "五十三の二認定電子委任状取扱事業者の認定電子委任状の普及の促進に関する法律第五条第一項（電子委任状取扱業務の認定）の認定電子委任状取扱事業者の認定（更新の認定を除く。）認定件数一件につき九万円五十四",
    "電波法（昭和二十五年法律第百三十一号）第四条（無線局の開設）の無線局の免許（再免許及び同法第四条の二第二項（次章に定める技術基準に相当する技術基準に適合している無線設備に係る特例）に規定する実験等無線局その他政令で定める無線局の免許を除く。）",
    "に規定する実験等無線局その他政令で定める無線局の免許を除く。）無線局の数一局につき三万円（電波法第五条第四項の放送をする無線局については、十五万円）",
    "電波法第二十七条の二十一第一項（登録）の無線局の登録（再登録その他政令で定める登録を除く。）無線局の数一局につき三万円（三）",
    "電波法第二十四条の二第一項（検査等事業者の登録）の無線設備等の検査又は点検に係る事業者の登録（更新の登録を除く。）登録件数一件につき九万円",
    "電波法第二十四条の十二第一項（外国点検事業者の登録）の外国における無線設備等の点検に係る事業者の登録登録件数一件につき九万円",
    "電波法第三十八条の二の二第一項（登録証明機関の登録）の登録証明機関の登録（更新の登録を除く。）登録件数一件につき九万円（六）",
    "電波法第七十一条の三の二第一項（登録周波数終了対策機関の登録）の登録（更新の登録を除く。）登録件数一件につき九万円五十五",
    "放送法（昭和二十五年法律第百三十二号）第九十三条第一項（認定）の認定基幹放送事業者の認定（更新の認定を除く。）認定件数一件につき九万円",
    "第二号の一般放送の種類の増加に係るもの又は同項第四号の業務区域の増加に係るもの（これらの登録を受けている業務区域の属する都道府県における業務区域の増加に係るものを除く。）に限る。）登録件数一件につき九万円",
    "放送法第百五十九条第一項（認定）の認定放送持株会社の認定認定件数一件につき十五万円五十六から五十八まで削除五十九一般信書便事業",
    "五十九一般信書便事業又は特定信書便事業の許可（一）民間事業者による信書の送達に関する法律（平成十四年法律第九十九号）第六条（事業の許可）の一般信書便事業の許可許可件数一件につき九万円",
    "一般信書便事業の許可許可件数一件につき九万円（二）民間事業者による信書の送達に関する法律第二十九条（事業の許可）の特定信書便事業の許可許可件数一件につき三万円"
  ]
}```

## 4. 期待 literal 増分

- W-AD 担当分: 新規 check **24 needles** なので **+24**。
- `docs/PROGRESS.md` の監査 literal 総数はメインセッションが再確認して加算してください
  （起点値は本メモでは書きません）。

## 5. 検証結果（すべて本セッションで実行済み）

- `lake build JapanTaxLaw.RegistryQualificationFeesJ3 JapanTaxLaw.RegistryQualificationFeesJ3Spec JapanTaxLaw.RegistryQualificationFeesJ3Tests`
  → **成功（5 jobs、warning なし）**。※自作 3 モジュールのみビルド（全体ビルド／CI／
  `run_python_gates.py` は実行していません）。
- `python scripts/ci/check_no_sorry.py` → `no forbidden placeholder proofs found in tracked Lean sources`。
  （新規 3 ファイルは未追跡のため走査対象外ですが、人力でも `sorry` / `admit` はありません。）
- `#print axioms`（一時ファイル `WADAxiomProbe.lean` を approved temp dir に作成、`lake env lean` で
  実行後 **削除済み**）:
  - 全 **76 定数**（実装 25 def + 25 positivity 定理 + spec 25 def + agree 1 def ＝ 76 の
    名前付き宣言。無名の `example` を除く）すべて `does not depend on any axioms`。
  - **`Classical.choice` も `sorryAx` も `propext` も一切なし**（出力 76 行を全文走査、
    いずれも 0 回）。
- 原文逐語検証（担当範囲原文 / pinned JSON を `re.sub(r"[\s\u3000]+", "", ...)` で正規化した
  文字列に対して Python の `.find()`）: **24/24 FOUND、MISS 0 件**（§6）。
  各 needle は両テキストで出現回数 **1**（一意）、長さ 60〜128 文字。

## 6. 逐語検証 FOUND / MISS 一覧（一字も変更せず）

担当範囲原文 `reg_qual_C.txt` を `re.sub(r"[\s\u3000]+", "", ...)` で正規化した文字列に
対して各 needle を `.find()` で検索（`art@`）。`json@` は pinned JSON `law_full_text` を
`transcription_audit.py` と同一ロジックで平坦化・正規化した文字列上の offset。

| # | 号 | needle 先頭 | 結果 | art@ | json@ | 出現回数(art/json) | len |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 1 | 五十(一) | 五十有限責任監査法人若しく… | FOUND | 0 | 155251 | 1/1 | 94 |
| 2 | 五十(二)(三) | 公認会計士法第三十四条の三… | FOUND | 97 | 155348 | 1/1 | 97 |
| 3 | 五十の二 | 五十の二消費生活相談員に… | FOUND | 190 | 155441 | 1/1 | 93 |
| 4 | 五十の三 | 被害回復裁判手続に係る特定… | FOUND | 283 | 155534 | 1/1 | 128 |
| 5 | 五十一(一) | 同法第十三条第一項（変更登… | FOUND | 756 | 156007 | 1/1 | 103 |
| 6 | 五十一(二) | 電気通信事業法第百十六条の… | FOUND | 862 | 156113 | 1/1 | 83 |
| 7 | 五十一(三) | 電気通信事業法第八十五条の… | FOUND | 948 | 156199 | 1/1 | 61 |
| 8 | 五十一(四) | 電気通信事業法第八十六条第… | FOUND | 1012 | 156263 | 1/1 | 62 |
| 9 | 五十二 | 特定電子メールの送信の適正… | FOUND | 1097 | 156348 | 1/1 | 85 |
| 10 | 五十三(一) | 電子署名及び認証業務に関す… | FOUND | 1213 | 156464 | 1/1 | 73 |
| 11 | 五十三(二) | 電子署名及び認証業務に関す… | FOUND | 1289 | 156540 | 1/1 | 68 |
| 12 | 五十三の二 | 五十三の二認定電子委任状取… | FOUND | 1352 | 156603 | 1/1 | 99 |
| 13 | 五十四(一) | 電波法（昭和二十五年法律第… | FOUND | 1542 | 156793 | 1/1 | 121 |
| 14 | 五十四(一)特例 | に規定する実験等無線局その… | FOUND | 1632 | 156883 | 1/1 | 74 |
| 15 | 五十四(二) | 電波法第二十七条の二十一第一項… | FOUND | 1709 | 156960 | 1/1 | 62 |
| 16 | 五十四(三) | 電波法第二十四条の二第一項… | FOUND | 1771 | 157022 | 1/1 | 69 |
| 17 | 五十四(四) | 電波法第二十四条の十二第一… | FOUND | 1843 | 157094 | 1/1 | 62 |
| 18 | 五十四(五) | 電波法第三十八条の二の二第… | FOUND | 1908 | 157159 | 1/1 | 62 |
| 19 | 五十四(六) | 電波法第七十一条の三の二第… | FOUND | 1970 | 157221 | 1/1 | 60 |
| 20 | 五十五(一) | 放送法（昭和二十五年法律第… | FOUND | 2071 | 157322 | 1/1 | 67 |
| 21 | 五十五(二) | 第二号の一般放送の種類の増… | FOUND | 2213 | 157464 | 1/1 | 102 |
| 22 | 五十五(三)＋削除 | 放送法第百五十九条第一項（… | FOUND | 2318 | 157569 | 1/1 | 63 |
| 23 | 五十九(一) | 五十九一般信書便事業又は特… | FOUND | 2371 | 157622 | 1/1 | 91 |
| 24 | 五十九(二) | 一般信書便事業の許可許可件… | FOUND | 2440 | 157691 | 1/1 | 79 |

- **FOUND 24 / MISS 0**。needle の長さは 60〜128 文字、24 本すべて相互に異なることを確認。
  アンカーの勝手な変更・正規化・文字変換はしていません（原文の `なつた` 等ではなく
  `となつた` 等の旧仮名遣いも保持）。各 needle は单位番号・条号・金額を含むため一意性が担保されています。

## 7. README / PROGRESS に足す 1 行文案

CROSS_LAW の scan/pin 件数や監査 literal 総数はメインセッションが計算するため、ここでは書きません。

- **README.md**（登録免許税モジュール一覧の末尾付近、例: `RegistrationQualificationFeesP8N*` 行の直後に追加）:
  ```text
  JapanTaxLaw/RegistryQualificationFeesJ3.lean / -Spec.lean / -Tests.lean  # 登録免許税法 別表第一（二）五十〜五十九（監査法人・公認会計士・登録試験機関・電気通信・電子署名・無線局・放送・信書便）の一件／一局あたり flat 手数料 25 件をモデル化・独立定式・退行テスト
  ```
- **docs/PROGRESS.md**（L4 着手済みモジュール一覧の末尾に追記）:
  ```text
  登録免許税法 別表第一（二）五十〜五十九（RegistryQualificationFeesJ3.lean：flat 手数料 25 件＝十五万円 7／九万円 14／三万円 3／一万五千円 1、割合型なし、五十一（注）のみなし規定・五十六〜五十八 の削除行は fee def を作らず caller-established、更新登録等の適用判定も caller-established、五十 以前・六十 以降 NOT YET COVERED）
  ```

## 8. インテグレーターへの明示事項

**インテグレーターは `JapanTaxLaw.lean` に以下の 3 つの import を追加すること。**

```lean
import JapanTaxLaw.RegistryQualificationFeesJ3
import JapanTaxLaw.RegistryQualificationFeesJ3Spec
import JapanTaxLaw.RegistryQualificationFeesJ3Tests
```

（W-AB / W-AC 他の 3 件ずつと併せてメインが行数を確認してください。
W-AD は `JapanTaxLaw.lean` を書き換えていません。）

## 9. 範囲・残ブロッカーの正直な申告（最終報告）

- **build**: 自作 3 モジュールのみ `lake build` 成功（5 jobs / warning なし）。全体ビルド・CI・
  `run_python_gates.py` は未実行です。
- **axiom**: 全 76 名前付き宣言が axiom-free、`Classical.choice` / `sorryAx` / `propext` なし
  （一時ファイルは削除済み）。
- **逐語**: FOUND 24 / MISS 0（担当範囲原文・pinned JSON の両方、出現回数 1、長さ 60〜128）。
- **def 数**: 実装 25 + spec 25 + agree 1 = **51 def**（＋ positivity 定理 25 本）。
- **STAGING**: 本ファイル `docs/STAGING_WAD.md` を作成済みです。
- これは **L4 のごく小さなスライス**です。**完成・網羅を主張しません**。
- 担当は別表第一（二）**五十〜五十九のみ**。五十 以前・六十 以降は NOT YET COVERED。
- 五十一の（注）のみなし（デーミング）規定、五十六〜五十八 の「削除」行は金額を定めないため
  fee def を作っていません。更新の登録／認定を除く等の適用判定はすべて caller-established とし、
  法的判断の自動化はしていません。Bool は式に入れていません。
- 本範囲に割合型（千分の△・割合）は存在しないため TaxRate / applyFloor はモデル化していません
  （10 倍過大バグの対象なし）。
- `agree*` は定数同士の `==` 一致確認であり、法的意味の等価証明ではありません。
- 転記監査は fidelity-only（原文 bytes との一致確認）であり、法的正しさを保証しません。
- **L7 候補 3,438 件は unreviewed のまま**です（本スライスでは一切レビューしていません）。
- 残ブロッカー: 転記監査 check の `checks()` への組み込み（§3、+24）、`JapanTaxLaw.lean` への
  import 追加（§8）、README / PROGRESS の 1 行追記（§7）、および全体ビルド・CI ゲートの
  実行は**すべてメインセッションの担当**です（W-AD は実行していません）。
