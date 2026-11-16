# STAGING — W-D (登録免許税法 別表第一（二）第三十二号 八十三〜八十九 の flat fee) 受け渡しメモ

> 実装担当 W-D からメインセッション（統合担当）への受け渡し用。
> ブランチ操作・add/commit/push/merge は一切していません。
> 書き換えたのは下記 4 ファイルのみです（他は読み取り専用）。

## 0. 対象ファイル

| ファイル | 状態 |
| --- | --- |
| `JapanTaxLaw/RegistrationQualificationFeesP3D.lean` | 新規 |
| `JapanTaxLaw/RegistrationQualificationFeesP3DSpec.lean` | 新規 |
| `JapanTaxLaw/RegistrationQualificationFeesP3DTests.lean` | 新規 |
| `docs/STAGING_WD.md` | 新規（本ファイル） |

pinned source: `data/raw/342AC0000000035_20261101_508AC0000000021.law.json`
law id `342AC0000000035` / revision `342AC0000000035_20261101_508AC0000000021`
amendment enforcement date `2026-11-01`（RegistrationQualificationFees.lean / P2A / P2B と同一ピン）。
section 開始マーカー: `"三十二　人の資格の登録若しくは認定又は技能証明"`（`\u3000` は全角空白）。
pinned bytes から金額を日本語数字で読み取り Arabic に変換（九万円→90,000 / 十五万円→150,000 /
一万五千円→15,000 / 三万円→30,000、全件一致確認済み）。

## 1. 担当範囲のカテゴリ一覧（八十三〜八十九）

| 条号 | 区分／法律 | 件数 |
| --- | --- | --- |
| 八十三 | 労働安全衛生法（(一)〜(六)） | 6 |
| 八十四 | 作業環境測定（(一)(二)）＋ 八十四の二 中小事業主共済事業の認可 | 3 |
| 八十五 | 中央卸売市場の認定 ＋ 八十五の二 輸出植物等の登録検査機関 | 2 |
| 八十六 | 農産物検査（(一)〜(三)） | 3 |
| 八十七 | 日本農林規格（(一)〜(三)）＋ 八十七の二 登録生産者団体 ＋ 八十七の三（(一)(二)） | 6 |
| 八十八 | 普通肥料（(一)〜(四)） | 4 |
| 八十九 | 特定飼料等（(一)〜(三)） | 3 |
| **合計** | | **27** |

補足: タスク文の内訳では「八十五 … 3件」とありますが、pinned 原文の 八十五 群は
八十五（中央卸売市場）1 件と 八十五の二（輸出植物等）1 件の **2 件**です（第三の fee 行はなし）。
原文に存在する fee string をすべて数えた結果が **27 件**で、タスク指定の総数 27 件と一致します。
本範囲には割合（千分の△）やデーミング規定はなく、金額なしの行もありません（全 27 行が一件につきの固定額）。

## 2. 追加した def 一覧（名前 → 金額 → 条号／区分）

`namespace JapanTaxLaw`、`open JapanTaxLaw.TaxFinance`。各 def は `Money := <額>` の flat 定数
（課税標準は一件につき）。各 def に `<name>_pos : <name> > 0 := by decide` と
`example : <name> = <額> := by decide` を付与済み（27 本ずつ）。

| # | 条号／区分 | def 名 | 金額 | 原文 fee |
| --- | --- | --- | --- | --- |
| 1 | 八十三（一） 検査業者の登録 | `laborSafetyInspecBusinessRegFee` | 90,000 | 九万円 |
| 2 | 八十三（二） 登録教習機関の登録 | `laborSafetyTrainingInstRegFee` | 90,000 | 九万円 |
| 3 | 八十三（三） 登録設計審査等機関の登録 | `laborSafetyDesignReviewRegFee` | 90,000 | 九万円 |
| 4 | 八十三（四） 登録性能検査機関の登録 | `laborSafetyPerformanceInspecRegFee` | 90,000 | 九万円 |
| 5 | 八十三（五） 登録個別検定機関の登録 | `laborSafetyIndividualVerifyRegFee` | 90,000 | 九万円 |
| 6 | 八十三（六） 登録型式検定機関の登録 | `laborSafetyTypeVerifyRegFee` | 90,000 | 九万円 |
| 7 | 八十四（一） 作業環境測定機関の登録 | `workEnvMeasureOrgRegFee` | 90,000 | 九万円 |
| 8 | 八十四（二） 登録講習機関の登録 | `workEnvMeasureCourseInstRegFee` | 90,000 | 九万円 |
| 9 | 八十四の二 共済事業の認可 | `smallBizMutualAidApprovalFee` | 150,000 | 十五万円 |
| 10 | 八十五 中央卸売市場の認定 | `centralWholesaleMarketCertFee` | 15,000 | 一万五千円 |
| 11 | 八十五の二 輸出植物等の登録検査機関 | `exportPlantInspectOrgRegFee` | 90,000 | 九万円 |
| 12 | 八十六（一） 登録検査機関の登録 | `agriProduceInspectOrgRegFee` | 150,000 | 十五万円 |
| 13 | 八十六（二） 変更登録（区分の増加） | `agriProduceChangeRegFee` | 150,000 | 十五万円 |
| 14 | 八十六（三） 変更登録（種類・区域の増加） | `agriProduceTypeAreaChangeRegFee` | 30,000 | 三万円 |
| 15 | 八十七（一） 登録認証機関／登録外国認証機関 | `japaneseAgriStdCertOrgRegFee` | 90,000 | 九万円 |
| 16 | 八十七（二） 登録試験業者 | `japaneseAgriStdTestBizRegFee` | 90,000 | 九万円 |
| 17 | 八十七（三） 登録外国試験業者 | `japaneseAgriStdForeignTestBizRegFee` | 90,000 | 九万円 |
| 18 | 八十七の二 登録生産者団体 | `registeredProducerGroupRegFee` | 90,000 | 九万円 |
| 19 | 八十七の三（一） 登録発行機関 | `exportCertIssuerRegFee` | 90,000 | 九万円 |
| 20 | 八十七の三（二） 登録認定機関 | `exportFacilityCertOrgRegFee` | 90,000 | 九万円 |
| 21 | 八十八（一） 普通肥料の生産の登録 | `ordinaryFertilizerProductionRegFee` | 15,000 | 一万五千円 |
| 22 | 八十八（二） 普通肥料の輸入の登録 | `ordinaryFertilizerImportRegFee` | 15,000 | 一万五千円 |
| 23 | 八十八（三） 普通肥料の仮登録 | `ordinaryFertilizerTempRegFee` | 15,000 | 一万五千円 |
| 24 | 八十八（四） 外国生産肥料の登録／仮登録 | `foreignFertilizerRegFee` | 15,000 | 一万五千円 |
| 25 | 八十九（一） 特定飼料等製造業者の登録 | `specificFeedMakerRegFee` | 90,000 | 九万円 |
| 26 | 八十九（二） 外国特定飼料等製造業者の登録 | `foreignSpecificFeedMakerRegFee` | 90,000 | 九万円 |
| 27 | 八十九（三） 登録検定機関の登録 | `feedTestOrgRegFee` | 90,000 | 九万円 |

金額一致の内訳: 九万円=18 件（90,000）／ 十五万円=3 件（150,000）／ 一万五千円=5 件（15,000）／
三万円=1 件（30,000）＝ 合計 27 件。pinned 原文の fee フレーズ出現数と完全一致。

`RegistrationQualificationFeesP3DSpec.lean` は `spec` 接頭辞の独立定式 27 本 +
`agreeRegistrationQualificationFeesP3D : Bool`（実装 ≡ spec の `==` 一致）+
`example : agreeRegistrationQualificationFeesP3D = true := by decide`。
`RegistrationQualificationFeesP3DTests.lean` は `example := by decide` のスモーク 27 件のみ。

doc-comment に明記した射程外（overclaim 防止）:

- 「更新の登録を除く。」「政令で定めるものに限り、更新の登録を除く。」「政令で定めるものに限る。」
  「第一種作業環境測定士が受ける登録を除く。」「検査の区分の増加に係る変更登録に限る。」
  「登録の区分の増加に係る変更登録で政令で定めるものに限る。」
  「農産物の種類又は区域の増加に係る変更登録で政令で定めるものに限る。」等の適用判定は
  **caller-established** とし、金額定数には反映していません。
- 八十二 以前・九十 以降は NOT YET COVERED。

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
    "八十三労働安全衛生法（昭和四十七年法律第五十七号）の規定による登録（一）労働安全衛生法第五十四条の三第一項（検査業者）の検査業者の登録登録件数一件につき九万円",
    "（二）労働安全衛生法第十四条（登録教習機関の登録）、第六十一条第一項（登録教習機関の登録）又は第七十五条第三項（登録教習機関の登録）の登録（更新の登録を除く。）登録件数一件につき九万円",
    "万円（三）労働安全衛生法第三十七条第三項（登録設計審査等機関の登録）の登録（更新の登録を除く。）登録件数一件につき九万円",
    "九万円（四）労働安全衛生法第四十一条第二項（登録性能検査機関の登録）の登録（更新の登録を除く。）登録件数一件につき九万円",
    "九万円（五）労働安全衛生法第四十四条第一項（登録個別検定機関の登録）の登録（更新の登録を除く。）登録件数一件につき九万円",
    "円（六）労働安全衛生法第四十四条の二第一項（登録型式検定機関の登録）の登録（更新の登録を除く。）登録件数一件につき九万円",
    "八十四作業環境測定機関の登録又は作業環境測定士に係る登録講習機関の登録（一）作業環境測定法第三十三条第一項（作業環境測定機関）の作業環境測定機関の登録（同法第二条第六号（定義）に規定する第一種作業環境測定士が受ける登録を除く。）登録件数一件につき九万円",
    "（二）作業環境測定法第五条（登録講習機関の登録）又は第四十四条第一項（登録講習機関の登録）の登録（更新の登録を除く。）登録件数一件につき九万円",
    "八十四の二中小事業主が行う事業に従事する者等の労働災害等に係る共済事業の認可中小事業主が行う事業に従事する者等の労働災害等に係る共済事業に関する法律（令和三年法律第八十号）第三条（認可）の厚生労働大臣がする共済事業の認可認可件数一件につき十五万円",
    "八十五中央卸売市場の認定卸売市場法（昭和四十六年法律第三十五号）第四条第一項（中央卸売市場の認定）の中央卸売市場の認定認定件数一件につき一万五千円",
    "植物防疫法（昭和二十五年法律第百五十一号）第二条第四項（登録検査機関の登録）の登録（更新の登録を除く。）又は同法第十条の六第一項（変更登録）の変更登録（同法第十条の四第二項第三号（登録の基準）の検査の区分の増加に係る変更登録に限る。）登録件数一件につき九万円",
    "八十六農産物検査に係る登録検査機関の登録（一）農産物検査法（昭和二十六年法律第百四十四号）第二条第五項（登録検査機関の登録）の登録（政令で定めるものに限り、更新の登録を除く。）登録件数一件につき十五万円",
    "（二）農産物検査法第十九条第一項（変更登録）の変更登録（同法第十七条第四項第四号（登録事項）の登録の区分の増加に係る変更登録で政令で定めるものに限る。）登録件数一件につき十五万円",
    "（三）農産物検査法第十九条第一項の変更登録（同法第十七条第四項第三号の農産物の種類又は同項第五号の区域の増加に係る変更登録で政令で定めるものに限る。）登録件数一件につき三万円",
    "（一）日本農林規格等に関する法律（昭和二十五年法律第百七十五号）第二条第三項（登録認証機関又は登録外国認証機関の登録）の登録（更新の登録を除く。）登録件数一件につき九万円",
    "（二）日本農林規格等に関する法律第四十二条（登録試験業者の登録）の登録試験業者の登録（更新の登録を除く。）登録件数一件につき九万円",
    "（三）日本農林規格等に関する法律第五十三条（登録外国試験業者の登録）の登録外国試験業者の登録（更新の登録を除く。）登録件数一件につき九万円",
    "八十七の二登録生産者団体の登録又は変更の登録特定農林水産物等の名称の保護に関する法律（平成二十六年法律第八十四号）第六条（特定農林水産物等の登録）の登録生産者団体の登録又は同法第十五条第一項（生産者団体を追加する変更の登録）の変更の登録登録件数一件につき九万円",
    "（一）農林水産物及び食品の輸出の促進に関する法律（令和元年法律第五十七号）第二条第四項（登録発行機関の登録）の登録発行機関に係る登録（更新の登録を除く。）登録件数一件につき九万円",
    "（二）農林水産物及び食品の輸出の促進に関する法律第二条第四項の登録認定機関に係る登録（更新の登録を除く。）登録件数一件につき九万円",
    "八十八普通肥料の生産又は輸入に係る登録（一）肥料の品質の確保等に関する法律（昭和二十五年法律第百二十七号）第四条第一項（登録を受ける義務）の規定により農林水産大臣がする普通肥料の生産の登録（更新の登録を除く。）登録件数一件につき一万五千円",
    "（二）肥料の品質の確保等に関する法律第四条第四項の規定による普通肥料の輸入の登録（更新の登録を除く。）登録件数一件につき一万五千円",
    "（三）肥料の品質の確保等に関する法律第五条（仮登録を受ける義務）の規定による普通肥料の生産又は輸入の仮登録（更新の仮登録を除く。）登録件数一件につき一万五千円",
    "（四）肥料の品質の確保等に関する法律第三十三条の二第一項（外国生産肥料の登録及び仮登録）の登録又は仮登録（更新の登録又は仮登録を除く。）登録件数一件につき一万五千円",
    "（一）飼料の安全性の確保及び品質の改善に関する法律（昭和二十八年法律第三十五号）第七条第一項（特定飼料等製造業者の登録）の特定飼料等製造業者の登録（更新の登録を除く。）登録件数一件につき九万円",
    "（二）飼料の安全性の確保及び品質の改善に関する法律第二十一条第一項（外国特定飼料等製造業者の登録等）の外国特定飼料等製造業者の登録（更新の登録を除く。）登録件数一件につき九万円",
    "（三）飼料の安全性の確保及び品質の改善に関する法律第二十七条第一項（登録検定機関の登録）の登録（更新の登録を除く。）登録件数一件につき九万円"
  ]
}
```

参考：現行スクリプト形式への変換例（name は任意、needles は上記 27 本をそのまま使用）:

```python
yield ("登録免許税法 別表第一（二）第三十二号 八十三〜八十九（労働安全衛生・作業環境測定・中央卸売市場・農産物検査・日本農林規格・普通肥料・特定飼料等）↔ RegistrationQualificationFeesP3D.lean",
       "342AC0000000035",
       "file", None,
       [ ...上記 needles 27 本を一字も変えずに列挙... ])
```

## 4. 期待 literal 増分

- W-D 担当分: 新規 check **27 needles** なので **+27**。
- `docs/PROGRESS.md` の監査 literal 総数はメインセッションが再確認して加算してください
  （起点値は本メモでは書きません）。

## 5. 検証結果（すべて本セッションで実行済み）

- `lake build JapanTaxLaw.RegistrationQualificationFeesP3D JapanTaxLaw.RegistrationQualificationFeesP3DSpec JapanTaxLaw.RegistrationQualificationFeesP3DTests`
  → **成功（5 jobs、warning なし）**。※自作 3 モジュールのみビルド（全体ビルド／CI／`run_python_gates.py` は実行していません）。
- `python scripts/ci/check_no_sorry.py` → `no forbidden placeholder proofs found in tracked Lean sources`。
  （新規 3 ファイルは未追跡のため走査対象外ですが、人力でも `sorry` / `admit` はありません。）
- `#print axioms`（一時ファイル `WDAxiomProbe.lean` を approved temp dir に作成、`lake env lean` で実行後 **削除済み**）:
  - 新規 positivity 定理 **27 本すべて** と `agreeRegistrationQualificationFeesP3D` の計 **28 件**が
    `does not depend on any axioms`。
  - **`Classical.choice` も `sorryAx` も `propext` も一切なし**。
- 原文逐語検証（pinned JSON を正規化テキストに対して `.find()`）: **27/27 FOUND、MISS 0 件**（§6）。
  law id `342AC0000000035` … FOUND / revision `342AC0000000035_20261101_508AC0000000021` … FOUND /
  開始マーカー … FOUND。

## 6. 逐語検証 FOUND / MISS 一覧（一字も変更せず）

pinned JSON の `law_full_text` を `transcription_audit.py` の `text()` と同一ロジックで平坦化し、
`_norm` と同じ `re.sub(r"[\s\u3000]+", "", ...)` で正規化した文字列に対して
各 needle を Python の `.find()` で検索（needle 側も同正規化）。
`art@` は切り出しテキスト正規化上の offset、`json@` は pinned JSON 平坦化・正規化上の offset。
各 needle の出現回数は両方とも **1**（一意）。

| # | def | 結果 | art@ | json@ | 出現回数 |
| --- | --- | --- | --- | --- | --- |
| 1 | laborSafetyInspecBusinessRegFee | FOUND | 0 | 164867 | 1 |
| 2 | laborSafetyTrainingInstRegFee | FOUND | 79 | 164946 | 1 |
| 3 | laborSafetyDesignReviewRegFee | FOUND | 169 | 165036 | 1 |
| 4 | laborSafetyPerformanceInspecRegFee | FOUND | 226 | 165093 | 1 |
| 5 | laborSafetyIndividualVerifyRegFee | FOUND | 283 | 165150 | 1 |
| 6 | laborSafetyTypeVerifyRegFee | FOUND | 342 | 165209 | 1 |
| 7 | workEnvMeasureOrgRegFee | FOUND | 402 | 165269 | 1 |
| 8 | workEnvMeasureCourseInstRegFee | FOUND | 528 | 165395 | 1 |
| 9 | smallBizMutualAidApprovalFee | FOUND | 599 | 165466 | 1 |
| 10 | centralWholesaleMarketCertFee | FOUND | 722 | 165589 | 1 |
| 11 | exportPlantInspectOrgRegFee | FOUND | 820 | 165687 | 1 |
| 12 | agriProduceInspectOrgRegFee | FOUND | 949 | 165816 | 1 |
| 13 | agriProduceChangeRegFee | FOUND | 1050 | 165917 | 1 |
| 14 | agriProduceTypeAreaChangeRegFee | FOUND | 1139 | 166006 | 1 |
| 15 | japaneseAgriStdCertOrgRegFee | FOUND | 1306 | 166173 | 1 |
| 16 | japaneseAgriStdTestBizRegFee | FOUND | 1391 | 166258 | 1 |
| 17 | japaneseAgriStdForeignTestBizRegFee | FOUND | 1456 | 166323 | 1 |
| 18 | registeredProducerGroupRegFee | FOUND | 1525 | 166392 | 1 |
| 19 | exportCertIssuerRegFee | FOUND | 1706 | 166573 | 1 |
| 20 | exportFacilityCertOrgRegFee | FOUND | 1795 | 166662 | 1 |
| 21 | ordinaryFertilizerProductionRegFee | FOUND | 1860 | 166727 | 1 |
| 22 | ordinaryFertilizerImportRegFee | FOUND | 1979 | 166846 | 1 |
| 23 | ordinaryFertilizerTempRegFee | FOUND | 2044 | 166911 | 1 |
| 24 | foreignFertilizerRegFee | FOUND | 2123 | 166990 | 1 |
| 25 | specificFeedMakerRegFee | FOUND | 2262 | 167129 | 1 |
| 26 | foreignSpecificFeedMakerRegFee | FOUND | 2358 | 167225 | 1 |
| 27 | feedTestOrgRegFee | FOUND | 2446 | 167313 | 1 |

- **FOUND 27 / MISS 0**。needle の長さはすべて **60〜130 文字**、27 本すべて相互に異なることを確認。
  アンカーの勝手な変更・正規化・文字変換はしていません。
- 金額の日本語数字との対応も全件一致（九万円=90,000 / 十五万円=150,000 / 一万五千円=15,000 /
  三万円=30,000）。pinned 原文の fee フレーズ出現数 18+3+5+1=27 と一致。

## 7. README / PROGRESS に足す 1 行文案

CROSS_LAW の scan/pin 件数や監査 literal 総数はメインセッションが計算するため、ここでは書きません。

- **README.md**（モジュール一覧・`RegistrationQualificationFeesP2B*` 行の直後に追加）:
  ```text
  JapanTaxLaw/RegistrationQualificationFeesP3D.lean / -Spec.lean / -Tests.lean  # 登録免許税法 別表第一（二）第三十二号 八十三〜八十九（労働安全衛生・作業環境測定・中小事業主共済・中央卸売市場・輸出植物検査・農産物検査・日本農林規格・普通肥料・特定飼料等）の flat fee L4 モデル・独立定式・退行テスト
  ```
- **docs/PROGRESS.md**（L4 着手済みモジュール一覧の末尾に追記）:
  ```text
  登録免許税法 別表第一（二）第三十二号 八十三〜八十九（RegistrationQualificationFeesP3D.lean：27 件の flat fee 額を Money 定数化、八十二 以前・九十 以降 NOT YET COVERED）
  ```

## 8. インテグレーターへの明示事項

**インテグレーターは `JapanTaxLaw.lean` に以下の 3 つの import を追加すること。**

```lean
import JapanTaxLaw.RegistrationQualificationFeesP3D
import JapanTaxLaw.RegistrationQualificationFeesP3DSpec
import JapanTaxLaw.RegistrationQualificationFeesP3DTests
```

（W-A / W-B の `RegistrationQualificationFeesP2A*`, `P2B*` 各 3 件と併せて計 9 行の追加になる見込みです。
メインが統合してください。W-D は `JapanTaxLaw.lean` を書き換えていません。）

## 9. 範囲・残ブロッカーの正直な申告

- これは **L4 のごく小さなスライス**です。**完成・網羅を主張しません**。
- 担当は 別表第一（二）第三十二号 **八十三〜八十九 のみ**。**八十二 以前・九十 以降は NOT YET COVERED**。
- 登録・認定・認可の要件・適用、「更新の登録を除く」「政令で定めるものに限る」等の該当性は
  すべて caller-established とし、法的判断の自動化はしていません。
- 本範囲には割合やデーミング規定はなく、金額なしの行はありません（全 27 行を fee def 化）。
- `agreeRegistrationQualificationFeesP3D` は定数同士の `==` 一致確認であり、法的意味の等価証明ではありません。
- 転記監査は fidelity-only（原文 bytes との一致確認）であり、法的正しさを保証しません。
- **L7 候補 3,438 件は unreviewed のまま**です（本スライスでは一切レビューしていません）。
- 残ブロッカー: 転記監査 check の `checks()` への組み込み（§3、+27）、`JapanTaxLaw.lean` への
  import 追加（§8）、README / PROGRESS の 1 行追記（§7）、および全体ビルド・CI ゲートの
  実行は**すべてメインセッションの担当**です（W-D は実行していません）。
