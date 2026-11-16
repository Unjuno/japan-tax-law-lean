# STAGING — W-A (登録免許税法 別表第一（二）第三十二号 五十九〜六十八 の flat fee) 受け渡しメモ

> 実装担当 W-A からメインセッション（統合担当）への受け渡し用。
> ブランチ操作・add/commit/push/merge は一切していません。
> 書き換えたのは下記 4 ファイルのみです（他は読み取り専用）。

## 0. 対象ファイル

| ファイル | 状態 |
| --- | --- |
| `JapanTaxLaw/RegistrationQualificationFeesP2A.lean` | 新規 |
| `JapanTaxLaw/RegistrationQualificationFeesP2ASpec.lean` | 新規 |
| `JapanTaxLaw/RegistrationQualificationFeesP2ATests.lean` | 新規 |
| `docs/STAGING_WA.md` | 新規（本ファイル） |

pinned source: `data/raw/342AC0000000035_20261101_508AC0000000021.law.json`
law id `342AC0000000035` / revision `342AC0000000035_20261101_508AC0000000021`
amendment enforcement date `2026-11-01`（RegistrationQualificationFees.lean / P2B と同一ピン）。
section 開始マーカー: `"三十二　人の資格の登録若しくは認定又は技能証明"`（`\u3000` は全角空白）。
pinned bytes から金額を日本語数字で読み取り Arabic に変換（九万円→90,000 等、全件一致確認済み）。

## 1. 追加した def 一覧（名前 → 金額）

`namespace JapanTaxLaw`、`open JapanTaxLaw.TaxFinance`。各 def は `Money := <額>` の flat 定数
（課税標準は一件につき。六十五（三）ハ のみ一箇所につき）。各 def に
`<name>_pos : <name> > 0 := by decide` と `example : <name> = <額> := by decide` を付与済み。

| # | 原文 | def 名 | 金額 |
| --- | --- | --- | --- |
| 1 | 五十九（一）一般信書便事業の許可 | `generalMailBusinessPermitFee` | 90,000 |
| 2 | 五十九（二）特定信書便事業の許可 | `specifiedMailBusinessPermitFee` | 30,000 |
| 3 | 六十 消防の設備等に係る登録検定機関の登録 | `fireEquipmentInspectionRegFee` | 150,000 |
| 4 | 六十一 債権管理回収業の許可 | `debtCollectionBusinessPermitFee` | 150,000 |
| 5 | 六十二 会社の電子公告に係る調査機関の登録 | `companyElectronicNoticeRegFee` | 90,000 |
| 6 | 六十三 技能実習監理団体の許可／事業区分変更の許可 | `foreignTraineeMonitorPermitFee` | 15,000 |
| 7 | 六十四 通関業の許可 | `customsBrokeragePermitFee` | 90,000 |
| 8 | 六十五（一）酒類の製造免許 | `liquorManufactureLicenseFee` | 150,000 |
| 9 | 六十五（二）イ 酒母の製造免許 | `sakeSeedMashLicenseFee` | 90,000 |
| 10 | 六十五（二）ロ もろみの製造免許 | `moromiProductionLicenseFee` | 120,000 |
| 11 | 六十五（三）イ 酒類販売業（小売のみ条件） | `liquorRetailOnlyLicenseFee` | 30,000 |
| 12 | 六十五（三）ロ 酒類販売業／代理業／媒介業 | `liquorRetailLicenseFee` | 90,000 |
| 13 | 六十五（三）ハ 小売条件の解除（**1 箇所あたり**） | `liquorRetailConditionRemovalFeePerPlace` | 60,000 |
| 14 | 六十六（一）製造たばこの特定販売業の登録 | `tobaccoSpecificRetailRegFee` | 150,000 |
| 15 | 六十六（二）製造たばこの卸売販売業の登録 | `tobaccoWholesaleRegFee` | 90,000 |
| 16 | 六十六（三）製造たばこの小売販売業の許可 | `tobaccoRetailPermitFee` | 15,000 |
| 17 | 六十六（四）製造たばこの出張販売の小売販売許可 | `tobaccoMobileSalesPermitFee` | 3,000 |
| 18 | 六十七（一）塩製造業の登録 | `saltManufacturerRegFee` | 150,000 |
| 19 | 六十七（二）塩特定販売業の登録 | `saltSpecifiedSellerRegFee` | 150,000 |
| 20 | 六十七（三）塩卸売業の登録 | `saltWholesalerRegFee` | 90,000 |
| 21 | 六十八 著作権等管理事業者の登録 | `copyrightManagementBusinessRegFee` | 90,000 |

補足（doc-comment に明記済み）:

- **六十二** は `会社法第九百四十一条（調査機関の登録）` を参照。**法律番号なし**。原文の文言を一字も変えていません。
- **六十五（注）**「…（三）イに規定する条件の全部又は一部の解除は、新たな当該免許とみなす。」は
  デーミング規定で金額なし。doc-comment に記載するが fee def は作っていません。
- **六十五（三）ハ** は件数ではなく「販売場の数一箇所につき ¥60,000」。`...FeePerPlace` 定数を渡す形とし、
  doc-comment に「販売場の数 × 本額（箇所数は caller-established）」と明記。Nat 掛け算はモジュール内で行っていません。
- 六十五（一）の政令で定める製造免許を除く点、六十五（三）・六十六（三）（四）の期限付き免許／許可を除く点、
  各「更新の登録を除く。」は適用判定ゲートで、金額定数には反映せず caller-established としました。

`RegistrationQualificationFeesP2ASpec.lean` は `spec` 接頭辞の独立定式 21 本 + `agreeRegistrationQualificationFeesP2A : Bool`
（実装 ≡ spec の `==` 一致）+ `example : agreeRegistrationQualificationFeesP2A = true := by decide`。
`RegistrationQualificationFeesP2ATests.lean` は `example := by decide` のスモーク 21 件のみ。

## 2. 転記監査に追加すべき check（JSON 断片）

`scripts/ci/transcription_audit.py` の `checks()` に追加する check の JSON 表現です
（`law_id` / `kind` / `title` / `needles` の 4 キー）。needle 文字列は pinned bytes の一字一句です。
**文字正規化・全角／半角変換・異体字変換を行わず、そのまま移してください。**

```json
{
  "law_id": "342AC0000000035",
  "kind": "file",
  "title": null,
  "needles": [
    "一般信書便事業の許可許可件数一件につき九万円",
    "特定信書便事業の許可許可件数一件につき三万円",
    "第二十一条の三第一項（登録検定機関の登録）の登録（更新の登録を除く。）登録件数一件につき十五万円",
    "の債権管理回収業の許可許可件数一件につき十五万円",
    "会社法第九百四十一条（調査機関の登録）の登録（更新の登録を除く。）登録件数一件につき九万円",
    "一般監理事業への事業の区分の変更に係るものに限る。）許可件数一件につき一万五千円",
    "の通関業の許可許可件数一件につき九万円",
    "その他政令で定める製造免許を除く。）免許件数一件につき十五万円",
    "酒母の製造免許免許件数一件につき九万円",
    "もろみの製造免許免許件数一件につき十二万円",
    "小売に限る旨の条件の付されたもの免許件数一件につき三万円",
    "酒類の販売業又は販売の代理業若しくは媒介業の免許（イ又はハに該当する販売業の免許を除く。）免許件数一件につき九万円",
    "イに掲げる免許に付された小売に限る旨の条件の解除販売場の数一箇所につき六万円",
    "製造たばこの特定販売業の登録登録件数一件につき十五万円",
    "製造たばこの卸売販売業の登録登録件数一件につき九万円",
    "製造たばこの小売販売業の許可（同法第二十四条第一項（許可の条件等）の規定による期限が付された許可を除く。）許可件数一件につき一万五千円",
    "製造たばこの小売販売の許可（同条第二項において準用する同法第二十四条第一項の規定による期限が付された許可を除く。）許可件数一件につき三千円",
    "塩製造業者の登録登録件数一件につき十五万円",
    "塩特定販売業者の登録登録件数一件につき十五万円",
    "塩卸売業者の登録登録件数一件につき九万円",
    "著作権等管理事業者の登録登録件数一件につき九万円"
  ]
}
```

> **41 件のうち担当分すべて**: 新規 check の needles 全体は W-A 21 本（本断片）＋ W-B 20 本
> （`RegistrationQualificationFeesP2B.lean` 六十九〜七十五、担当 W-B）＝ **41 本**の予定です。
> 本断片はそのうち **W-A 担当の 21 本すべて**です。残り 20 本は W-B の STAGING／成果物を統合してください。

参考：現行スクリプト形式への変換例（name は任意、needles は上記 21 本をそのまま使用）:

```python
yield ("登録免許税法 別表第一（二）第三十二号 五十九〜六十八 ↔ RegistrationQualificationFeesP2A.lean",
       "342AC0000000035",
       "file", None,
       [ ...上記 needles 21 本を一字も変えずに列挙... ])
```

## 3. 期待 literal 増分

- W-A 担当分: 新規 check **21 needles** なので **+21**。
- バッチ全体では W-B の +20 と合わせ **+41**。
- `docs/PROGRESS.md` の監査 literal 総数はメインセッションが再確認して加算してください
  （起点値は本メモでは書きません）。

## 4. 検証結果（すべて本セッションで実行済み）

- `lake build JapanTaxLaw.RegistrationQualificationFeesP2A JapanTaxLaw.RegistrationQualificationFeesP2ASpec JapanTaxLaw.RegistrationQualificationFeesP2ATests`
  → **成功（5 jobs、warning なし）**。※全体ビルド／CI／`run_python_gates.py` は実行していません。
- `python scripts/ci/check_no_sorry.py` → `no forbidden placeholder proofs found in tracked Lean sources`。
  （新規 3 ファイルは未追跡のため走査対象外ですが、人力でも `sorry` / `admit` はありません。）
- `#print axioms`（一時ファイル `WA_AxiomProbe.lean` を approved temp dir に作成、`lake env lean` で実行後 **削除済み**）:
  - 新規 positivity 定理 **21 本すべて** `does not depend on any axioms`。
  - **`Classical.choice` も `sorryAx` も `propext` も一切なし**。
- 原文逐語検証（pinned JSON を正規化テキストに対して `.find()`）: **21/21 FOUND、MISS 0 件**（§5）。
  law id `342AC0000000035` … FOUND / revision `342AC0000000035_20261101_508AC0000000021` … FOUND /
  amendment enforcement date `2026-11-01` … FOUND / 開始マーカー … FOUND（offset 142594）。

## 5. 逐語検証 FOUND / MISS 一覧（一字も変更せず）

`MainProvision` 配下の該当表について、full flatten テキストを `re.sub(r"[\s　]+", "", ...)` で正規化し、
各 needle も同様に正規化して Python `.find()` で検索（transcription_audit.py の `contains()` と同一条件）。
`norm@` は正規化文字列上の offset、`raw@` は未正規化テキスト上の offset です。

| # | needle（全文） | 結果 | norm@ | raw@ |
| --- | --- | --- | --- | --- |
| 1 | 一般信書便事業の許可許可件数一件につき九万円 | **FOUND** | 157691 | 159296 |
| 2 | 特定信書便事業の許可許可件数一件につき三万円 | **FOUND** | 157748 | 159354 |
| 3 | 第二十一条の三第一項（登録検定機関の登録）の登録（更新の登録を除く。）登録件数一件につき十五万円 | **FOUND** | 157831 | 159438 |
| 4 | の債権管理回収業の許可許可件数一件につき十五万円 | **FOUND** | 157937 | 159545 |
| 5 | 会社法第九百四十一条（調査機関の登録）の登録（更新の登録を除く。）登録件数一件につき九万円 | **FOUND** | 157981 | 159590 |
| 6 | 一般監理事業への事業の区分の変更に係るものに限る。）許可件数一件につき一万五千円 | **FOUND** | 158190 | 159800 |
| 7 | の通関業の許可許可件数一件につき九万円 | **FOUND** | 158273 | 159884 |
| 8 | その他政令で定める製造免許を除く。）免許件数一件につき十五万円 | **FOUND** | 158460 | 160073 |
| 9 | 酒母の製造免許免許件数一件につき九万円 | **FOUND** | 158529 | 160146 |
| 10 | もろみの製造免許免許件数一件につき十二万円 | **FOUND** | 158549 | 160167 |
| 11 | 小売に限る旨の条件の付されたもの免許件数一件につき三万円 | **FOUND** | 158676 | 160298 |
| 12 | 酒類の販売業又は販売の代理業若しくは媒介業の免許（イ又はハに該当する販売業の免許を除く。）免許件数一件につき九万円 | **FOUND** | 158705 | 160328 |
| 13 | イに掲げる免許に付された小売に限る旨の条件の解除販売場の数一箇所につき六万円 | **FOUND** | 158763 | 160387 |
| 14 | 製造たばこの特定販売業の登録登録件数一件につき十五万円 | **FOUND** | 158874 | 160500 |
| 15 | 製造たばこの卸売販売業の登録登録件数一件につき九万円 | **FOUND** | 158936 | 160563 |
| 16 | 製造たばこの小売販売業の許可（同法第二十四条第一項（許可の条件等）の規定による期限が付された許可を除く。）許可件数一件につき一万五千円 | **FOUND** | 159001 | 160629 |
| 17 | 製造たばこの小売販売の許可（同条第二項において準用する同法第二十四条第一項の規定による期限が付された許可を除く。）許可件数一件につき三千円 | **FOUND** | 159097 | 160726 |
| 18 | 塩製造業者の登録登録件数一件につき十五万円 | **FOUND** | 159228 | 160859 |
| 19 | 塩特定販売業者の登録登録件数一件につき十五万円 | **FOUND** | 159275 | 160907 |
| 20 | 塩卸売業者の登録登録件数一件につき九万円 | **FOUND** | 159322 | 160955 |
| 21 | 著作権等管理事業者の登録登録件数一件につき九万円 | **FOUND** | 159394 | 161028 |

- **FOUND 21 / MISS 0**。アンカーの勝手な変更・正規化・文字変換はしていません。
- 金額の日本語数字との対応も全件一致（九万円=90,000 / 三万円=30,000 / 十五万円=150,000 /
  一万五千円=15,000 / 十二万円=120,000 / 六万円=60,000 / 三千円=3,000）。

## 6. README / PROGRESS に足す 1 行文案

CROSS_LAW の scan/pin 件数や監査 literal 総数はメインセッションが計算するため、ここでは書きません。

- **README.md**（モジュール一覧・`RegistrationQualificationFeesTests.lean` 行［362〜364 行目］の直後に追加）:
  ```text
  JapanTaxLaw/RegistrationQualificationFeesP2A.lean / -Spec.lean / -Tests.lean  # 登録免許税法 別表第一（二）第三十二号 五十九〜六十八（信書便・登録検定機関・債権管理回収・電子公告調査・技能実習監理団体・通関・酒類免許・たばこ・塩・著作権等管理事業者）の flat fee L4 モデル・独立定式・退行テスト
  ```
- **docs/PROGRESS.md**（L4 着手済みモジュール一覧の末尾に追記）:
  ```text
  登録免許税法 別表第一（二）第三十二号 五十九〜六十八（RegistrationQualificationFeesP2A.lean：各 flat fee 額を Money 定数化、六十五（三）ハ は販売場 1 箇所あたり ¥60,000 の PerPlace 定数、六十五（注）デーミング規定は金額なし・fee def なし）
  ```

## 7. インテグレーターへの明示事項

**インテグレーターは `JapanTaxLaw.lean` に以下の 3 つの import を追加すること。**

```lean
import JapanTaxLaw.RegistrationQualificationFeesP2A
import JapanTaxLaw.RegistrationQualificationFeesP2ASpec
import JapanTaxLaw.RegistrationQualificationFeesP2ATests
```

（W-B の `RegistrationQualificationFeesP2B*` 3 件と併せて、計 6 行の追加になる見込みです。メインが統合してください。）

## 8. 範囲・残ブロッカーの正直な申告

- これは **L4 のごく小さなスライス**です。**完成・網羅を主張しません**。
- 対象は 別表第一（二）第三十二号 の **五十九〜六十八 のみ**。**五十八 以前・六十九 以降（W-B スライス）は NOT YET COVERED**。
- 登録・免許・許可・認可の要件・適用・更新の有無、政令で定めるものの該当性、六十五（三）ハ の箇所数、
  期限付き免許／許可の該当性はすべて caller-established とし、法的判断の自動化はしていません。
- 六十五（注）のデーミング規定（条件解除は新たな免許とみなす）は金額がないため fee def を作っていません。
- `agreeRegistrationQualificationFeesP2A` は定数同士の `==` 一致確認であり、法的意味の等価証明ではありません。
- 転記監査は fidelity-only（原文 bytes との一致確認）であり、法的正しさを保証しません。
- **L7 候補 3,438 件は unreviewed のまま**です（本スライスでは一切レビューしていません）。
- 残ブロッカー: 転記監査 check の `checks()` への組み込み（§2、+21、W-B の +20 と合わせ +41）、
  `JapanTaxLaw.lean` への import 追加（§7）、README / PROGRESS の 1 行追記（§6）、および全体ビルド・CI ゲートの
  実行は**すべてメインセッションの担当**です（W-A は実行していません）。
