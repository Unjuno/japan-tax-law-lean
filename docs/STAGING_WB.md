# STAGING — W-B (登録免許税法 別表第一（二）第三十二号 六十九〜七十五) 受け渡しメモ

> 実装担当 W-B からメインセッション（統合担当）への受け渡し用。
> ブランチ操作・add/commit/push/merge は一切していません。
> 書き換えたのは下記 4 ファイルのみです（他は読み取り専用）。

## 0. 対象ファイル

| ファイル | 状態 |
| --- | --- |
| `JapanTaxLaw/RegistrationQualificationFeesP2B.lean` | 新規 |
| `JapanTaxLaw/RegistrationQualificationFeesP2BSpec.lean` | 新規 |
| `JapanTaxLaw/RegistrationQualificationFeesP2BTests.lean` | 新規 |
| `docs/STAGING_WB.md` | 新規（本ファイル） |

pinned source: `data/raw/342AC0000000035_20261101_508AC0000000021.law.json`
law id `342AC0000000035` / revision `342AC0000000035_20261101_508AC0000000021`
section 開始マーカー: `"三十二　人の資格の登録若しくは認定又は技能証明"`（`\u3000` は全角空白）。
（RegistrationQualificationFees.lean / RegistrationTax.lean と同一ピン。）

## 1. def 一覧（名前 → 金額）

### 1.1 `RegistrationQualificationFeesP2B.lean`（namespace `JapanTaxLaw`、`Money := Nat`）

| def | 条号 | 金額 |
| --- | --- | --- |
| `riCertificationBodyRegFee` | 六十九（一）第十二条の二第一項（登録認証機関の登録） | 90,000 |
| `riInspectionBodyRegFee` | 六十九（二）第十二条の八第一項（登録検査機関の登録） | 90,000 |
| `riPeriodicConfirmRegFee` | 六十九（三）第十二条の十（登録定期確認機関の登録） | 90,000 |
| `riTransportMethodRegFee` | 六十九（四）第十八条第二項（登録運搬方法確認機関の登録） | 90,000 |
| `riTransportGoodsRegFee` | 六十九（五）第十八条第二項の登録運搬物確認機関 | 90,000 |
| `riBurialConfirmRegFee` | 六十九（六）第十九条の二第二項（登録埋設確認機関の登録） | 90,000 |
| `riConcentrationRegFee` | 六十九（七）第三十三条の三第一項（登録濃度確認機関の登録） | 90,000 |
| `riTestBodyRegFee` | 六十九（八）第三十五条第二項（登録試験機関の登録） | 90,000 |
| `riQualCourseRegFee` | 六十九（九）第三十五条第二項の登録資格講習機関 | 90,000 |
| `riRadWorkerCourseRegFee` | 六十九（十）第三十六条の二第一項（登録放射線取扱主任者定期講習機関の登録） | 90,000 |
| `researchFacilityPromoterRegFee` | 六十九の二 第八条第一項（登録施設利用促進機関の登録） | 90,000 |
| `schoolDisasterMutualAidApprovalFee` | 六十九の三 ＰＴＡ・青少年教育団体共済法第三条（認可） | 150,000 |
| `waterworksApprovalFee` | 七十（一）水道法第六条第一項／第十条第一項（水道事業の認可・変更の認可） | 90,000 |
| `waterSupplyApprovalFee` | 七十（二）水道法第二十六条／第三十条第一項（水道用水供給事業の認可） | 90,000 |
| `waterQualityLabRegFee` | 七十（三）水道法第二十条第三項（登録水質検査機関の登録） | 90,000 |
| `simpleWaterLabRegFee` | 七十（四）水道法第三十四条の二第二項（登録簡易専用水道検査機関の登録） | 90,000 |
| `foodProductLabRegFee` | 七十一 食品衛生法第四条第九項（登録検査機関の登録） | 150,000 |
| `specialUseLabelLabRegFee` | 七十三 健康増進法第四十三条第三項（登録試験機関の登録） | 150,000 |
| `bloodCollectionPermitFee` | 七十四 安全な血液製剤の安定供給の確保等に関する法律第十三条第一項 | 150,000 |
| `organBrokeragePermitFee` | 七十五 臓器の移植に関する法律第十二条第一項 | 90,000 |

- count: **20 defs / 20 positivity theorems / 20 impl smoke examples**。
- **七十二 は原文で「削除」につき金額なし。fee def も needle も作っていません。**

### 1.2 `RegistrationQualificationFeesP2BSpec.lean`
- 上記 20 def に対応する `spec*` 独立定式 20 本（金額は同一）。
- `agreeRegistrationQualificationFeesP2B : Bool` — impl と spec の全 20 項目を `==` 比較。
  `example : agreeRegistrationQualificationFeesP2B = true := by decide`。

### 1.3 `RegistrationQualificationFeesP2BTests.lean`
- `example := by decide` のスモーク 20 本のみ（定理名の追加なし）。

### 1.4 doc-comment に明記した射程外（overclaim 防止）
- 「更新の登録を除く。」「政令で定めるものに限る。」「給水区域の拡張／給水対象の増加に係る変更の認可」
  等の適用判定は **caller-established** とし、金額定数には反映していません。
- 七十二 は「削除」で金額なし、七十六 以降は NOT YET COVERED。
- 転記監査は fidelity-only（原文 bytes との一致確認）であり法的正しさを保証しません。

## 2. 転記監査に追加すべき check（JSON 断片）

`scripts/ci/transcription_audit.py` の `checks()` に追加する check の完全な JSON 表現です
（`law_id` / `kind` / `title` / `needles` の 4 キー）。needle 文字列は一字も変えないこと。

```json
{
  "law_id": "342AC0000000035",
  "kind": "file",
  "title": null,
  "needles": [
    "第十二条の二第一項（登録認証機関の登録）の登録（更新の登録を除く。）登録件数一件につき九万円",
    "第十二条の八第一項（登録検査機関の登録）の登録（更新の登録を除く。）登録件数一件につき九万円",
    "第十二条の十（登録定期確認機関の登録）の登録（更新の登録を除く。）登録件数一件につき九万円",
    "第十八条第二項（登録運搬方法確認機関の登録）の登録運搬方法確認機関に係る登録（更新の登録を除く。）登録件数一件につき九万円",
    "第十八条第二項の登録運搬物確認機関に係る登録（更新の登録を除く。）登録件数一件につき九万円",
    "第十九条の二第二項（登録埋設確認機関の登録）の登録（更新の登録を除く。）登録件数一件につき九万円",
    "第三十三条の三第一項（登録濃度確認機関の登録）の登録（更新の登録を除く。）登録件数一件につき九万円",
    "第三十五条第二項（登録試験機関の登録）の登録試験機関に係る登録（更新の登録を除く。）登録件数一件につき九万円",
    "第三十五条第二項の登録資格講習機関に係る登録（更新の登録を除く。）登録件数一件につき九万円",
    "第三十六条の二第一項（登録放射線取扱主任者定期講習機関の登録）（同法第三十八条の三（登録特定放射性同位元素防護管理者定期講習機関の登録）において準用する場合を含む。）の登録（更新の登録を除く。）登録件数一件につき九万円",
    "特定先端大型研究施設の共用の促進に関する法律（平成六年法律第七十八号）第八条第一項（登録施設利用促進機関の登録）の登録（更新の登録を除く。）登録件数一件につき九万円",
    "ＰＴＡ・青少年教育団体共済法（平成二十二年法律第四十二号）第三条（認可）の文部科学大臣がする共済事業の認可認可件数一件につき十五万円",
    "水道法（昭和三十二年法律第百七十七号）第六条第一項（事業の認可及び経営主体）の水道事業の認可（政令で定めるものに限る。）",
    "水道法第二十六条（事業の認可）の水道用水供給事業の認可",
    "水道法第二十条第三項（登録水質検査機関の登録）の登録（更新の登録を除く。）登録件数一件につき九万円",
    "水道法第三十四条の二第二項（登録簡易専用水道検査機関の登録）の登録（更新の登録を除く。）登録件数一件につき九万円",
    "食品衛生法（昭和二十二年法律第二百三十三号）第四条第九項（登録検査機関の登録）の登録（更新の登録を除く。）登録件数一件につき十五万円",
    "健康増進法（平成十四年法律第百三号）第四十三条第三項（登録試験機関の登録）の登録（更新の登録を除く。）登録件数一件につき十五万円",
    "安全な血液製剤の安定供給の確保等に関する法律（昭和三十一年法律第百六十号）第十三条第一項（業として行う採血の許可）の規定による業として行う採血の許可許可件数一件につき十五万円",
    "臓器の移植に関する法律（平成九年法律第百四号）第十二条第一項（業として行う臓器のあつせんの許可）の規定による業として行う臓器のあつせんの許可許可件数一件につき九万円"
  ]
}
```

> **重要（統合時の注意）**: needle は原文 pinned bytes の一字一句です。
> 文字正規化・全角／半角変換・異体字変換を行わず、そのまま移してください。
> §5 の検証で実際に `.find()` したのは、まさに上記 20 文字列です（`_norm` は
> 空白・全角空白を除去するだけなので、needle 中の文字は一切変換していません）。

参考：現行スクリプト形式への変換例（name は任意）:

```python
yield ("登録免許税法 別表第一（二）第三十二号 六十九〜七十五（放射性同位元素等・水道・食品検査等）↔ RegistrationQualificationFeesP2B.lean",
       "342AC0000000035",
       "file", None,
       [
         "第十二条の二第一項（登録認証機関の登録）の登録（更新の登録を除く。）登録件数一件につき九万円",
         "第十二条の八第一項（登録検査機関の登録）の登録（更新の登録を除く。）登録件数一件につき九万円",
         "第十二条の十（登録定期確認機関の登録）の登録（更新の登録を除く。）登録件数一件につき九万円",
         "第十八条第二項（登録運搬方法確認機関の登録）の登録運搬方法確認機関に係る登録（更新の登録を除く。）登録件数一件につき九万円",
         "第十八条第二項の登録運搬物確認機関に係る登録（更新の登録を除く。）登録件数一件につき九万円",
         "第十九条の二第二項（登録埋設確認機関の登録）の登録（更新の登録を除く。）登録件数一件につき九万円",
         "第三十三条の三第一項（登録濃度確認機関の登録）の登録（更新の登録を除く。）登録件数一件につき九万円",
         "第三十五条第二項（登録試験機関の登録）の登録試験機関に係る登録（更新の登録を除く。）登録件数一件につき九万円",
         "第三十五条第二項の登録資格講習機関に係る登録（更新の登録を除く。）登録件数一件につき九万円",
         "第三十六条の二第一項（登録放射線取扱主任者定期講習機関の登録）（同法第三十八条の三（登録特定放射性同位元素防護管理者定期講習機関の登録）において準用する場合を含む。）の登録（更新の登録を除く。）登録件数一件につき九万円",
         "特定先端大型研究施設の共用の促進に関する法律（平成六年法律第七十八号）第八条第一項（登録施設利用促進機関の登録）の登録（更新の登録を除く。）登録件数一件につき九万円",
         "ＰＴＡ・青少年教育団体共済法（平成二十二年法律第四十二号）第三条（認可）の文部科学大臣がする共済事業の認可認可件数一件につき十五万円",
         "水道法（昭和三十二年法律第百七十七号）第六条第一項（事業の認可及び経営主体）の水道事業の認可（政令で定めるものに限る。）",
         "水道法第二十六条（事業の認可）の水道用水供給事業の認可",
         "水道法第二十条第三項（登録水質検査機関の登録）の登録（更新の登録を除く。）登録件数一件につき九万円",
         "水道法第三十四条の二第二項（登録簡易専用水道検査機関の登録）の登録（更新の登録を除く。）登録件数一件につき九万円",
         "食品衛生法（昭和二十二年法律第二百三十三号）第四条第九項（登録検査機関の登録）の登録（更新の登録を除く。）登録件数一件につき十五万円",
         "健康増進法（平成十四年法律第百三号）第四十三条第三項（登録試験機関の登録）の登録（更新の登録を除く。）登録件数一件につき十五万円",
         "安全な血液製剤の安定供給の確保等に関する法律（昭和三十一年法律第百六十号）第十三条第一項（業として行う採血の許可）の規定による業として行う採血の許可許可件数一件につき十五万円",
         "臓器の移植に関する法律（平成九年法律第百四号）第十二条第一項（業として行う臓器のあつせんの許可）の規定による業として行う臓器のあつせんの許可許可件数一件につき九万円",
       ])
```

## 3. 期待 literal 増分

- 新規 check 1 件 × needles **20 本** なので **+20**。
- `docs/PROGRESS.md` §7 の記載値は現時点で **416 literal / 32 anchor チェック**。
  本 check を加算すると **436 literal / 33 anchor チェック** となる見込み。
  （起点 416 は文書記載値。W-A の P2A や他スライスが先に加算される可能性があるため、
  実際の現在値はメインセッションで再確認してください。）

## 4. 検証結果（すべて本セッションで実行済み）

- `lake build JapanTaxLaw.RegistrationQualificationFeesP2B JapanTaxLaw.RegistrationQualificationFeesP2BSpec JapanTaxLaw.RegistrationQualificationFeesP2BTests`
  → **成功（5 jobs、warning なし）**。※自作 3 モジュールのみビルド（全体ビルドはしていません）。
- `python scripts/ci/check_no_sorry.py` → `no forbidden placeholder proofs found in tracked Lean sources`。
  （新規 3 ファイルは未追跡のため本スクリプトの走査対象外ですが、人力でも `sorry` / `admit` はありません。）
- `#print axioms`（一時ファイル `WBAxiomProbe.lean` を approved temp dir に作成、
  `lake env lean` で実行後 **削除済み**）:
  - 20 本の `*_pos` 定理と `agreeRegistrationQualificationFeesP2B` の **全 21 件が
    "does not depend on any axioms"**。
  - **`Classical.choice` も `sorryAx` も `propext` も一切なし**。
- 原文逐語検証: 下記 §5 のとおり **20/20 FOUND、MISS 0 件**。各 needle の正規化テキスト中
  出現回数はすべて **1**（一意）。全件、非正規化の原文（`full`）にもそのまま存在します。

## 5. 逐語検証 FOUND / MISS 一覧（一字も変更せず）

pinned JSON の `law_full_text` を `transcription_audit.py` の `text()` と同一ロジックで平坦化し、
`_norm` と同じ `re.sub(r"[\s\u3000]+", "", ...)` で正規化した文字列に対して
各 needle を Python の `.find()` で検索（needle 側も同正規化）。
`law id 342AC0000000035` および source_file 名の revision も一致確認済み。

| # | def | 結果 | offset(norm) | 出現回数(norm) | raw.find |
| --- | --- | --- | --- | --- | --- |
| 1 | riCertificationBodyRegFee | FOUND | 159631 | 1 | 161267 |
| 2 | riInspectionBodyRegFee | FOUND | 159697 | 1 | 161334 |
| 3 | riPeriodicConfirmRegFee | FOUND | 159763 | 1 | 161401 |
| 4 | riTransportMethodRegFee | FOUND | 159828 | 1 | 161467 |
| 5 | riTransportGoodsRegFee | FOUND | 159909 | 1 | 161549 |
| 6 | riBurialConfirmRegFee | FOUND | 159974 | 1 | 161615 |
| 7 | riConcentrationRegFee | FOUND | 160042 | 1 | 161684 |
| 8 | riTestBodyRegFee | FOUND | 160111 | 1 | 161754 |
| 9 | riQualCourseRegFee | FOUND | 160185 | 1 | 161829 |
| 10 | riRadWorkerCourseRegFee | FOUND | 160250 | 1 | 161895 |
| 11 | researchFacilityPromoterRegFee | FOUND | 160390 | 1 | 162036 |
| 12 | schoolDisasterMutualAidApprovalFee | FOUND | 160495 | 1 | 162142 |
| 13 | waterworksApprovalFee | FOUND | 160642 | 1 | 162291 |
| 14 | waterSupplyApprovalFee | FOUND | 160813 | 1 | 162463 |
| 15 | waterQualityLabRegFee | FOUND | 160908 | 1 | 162559 |
| 16 | simpleWaterLabRegFee | FOUND | 160960 | 1 | 162612 |
| 17 | foodProductLabRegFee | FOUND | 161039 | 1 | 162692 |
| 18 | specialUseLabelLabRegFee | FOUND | 161140 | 1 | 162795 |
| 19 | bloodCollectionPermitFee | FOUND | 161218 | 1 | 162874 |
| 20 | organBrokeragePermitFee | FOUND | 161324 | 1 | 162981 |

- section 開始マーカー `"三十二　人の資格の登録若しくは認定又は技能証明"` … **FOUND**（raw offset 142594）。
- law id `342AC0000000035` … **FOUND**
- revision `342AC0000000035_20261101_508AC0000000021`（source_file / source_url 名）… **FOUND**
- **FOUND 20 件 / MISS 0 件。** アンカーの勝手な変更・正規化はしていません。
- 七十二「削除」には金額规定がないため needle を作っていません（上記 20 本は担当分すべて）。

## 6. README / PROGRESS に足す 1 行文案

CROSS_LAW の scan/pin 件数はメインセッションが計算するため、ここでは書きません。

- **README.md**（モジュール一覧・`RegistrationQualificationFees` 3 行の直後に追加）:
  ```text
  JapanTaxLaw/RegistrationQualificationFeesP2B.lean / -Spec.lean / -Tests.lean  # 登録免許税法 別表第一（二）第三十二号 六十九〜七十五（放射性同位元素等・水道・食品検査等）flat fee L4 モデル・独立定式・退行テスト
  ```
- **docs/PROGRESS.md**（L4 着手済みモジュール一覧の末尾に追記）:
  ```text
  登録免許税法 別表第一（二）第三十二号 六十九〜七十五 RegistrationQualificationFeesP2B.lean（放射性同位元素等 10 件・研究施設利用促進機関・共済事業認可・水道 4 件・食品検査機関等の flat fee、七十二 は削除で金額なし、七十六 以降 NOT YET COVERED）
  ```

## 7. インテグレーターへの明示事項

**インテグレーターは `JapanTaxLaw.lean` に以下の 3 つの import を追加すること。**

```lean
import JapanTaxLaw.RegistrationQualificationFeesP2B
import JapanTaxLaw.RegistrationQualificationFeesP2BSpec
import JapanTaxLaw.RegistrationQualificationFeesP2BTests
```

（W-A の `RegistrationQualificationFeesP2A*` 3 件と併せて計 6 行の追加になる見込みです。
メインが統合してください。W-B は `JapanTaxLaw.lean` を書き換えていません。）

## 8. 範囲・残ブロッカーの正直な申告

- これは **L4 のごく小さなスライス**です。**完成・網羅を主張しません**。
- 担当は 別表第一（二）第三十二号 **六十九〜七十五** のみ。
  **七十二 は「削除」で金額なし**、**七十六 以降は NOT YET COVERED**。
- 「政令で定めるものに限る」「更新の登録を除く。」等の適用判定は caller-established であり、
  法的判断の自動化はしていません。
- 転記監査は fidelity-only（原文 bytes との一致確認）であり、法的正しさを保証しません。
- **L7 候補 3,438 件は unreviewed のまま**です（本スライスでは一切レビューしていません）。
- 残ブロッカー: 転記監査 check の `checks()` への組み込み（§2）、`JapanTaxLaw.lean` への
  import 追加（§7）、README / PROGRESS の 1 行追記（§6）、および全体ビルド・CI ゲートの
  実行は**すべてメインセッションの担当**です（W-B は実行していません）。
