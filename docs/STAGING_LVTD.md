# STAGING — LVTD（地価税法 art. 18「基礎控除」）受け渡しメモ

> 実装ワーカー LVTD からメインセッション（統合担当）への受け渡し用。
> commit / push / merge / ブランチ切替は一切していません。
> 本タスクで書き換えたのは下記 4 ファイルのみです（他は読み取り専用）。

## 0. 対象ファイル

| ファイル | 状態 |
| --- | --- |
| `JapanTaxLaw/LandValueTaxBasicDeduction.lean` | 新規 |
| `JapanTaxLaw/LandValueTaxBasicDeductionSpec.lean` | 新規 |
| `JapanTaxLaw/LandValueTaxBasicDeductionTests.lean` | 新規 |
| `docs/STAGING_LVTD.md` | 新規（本ファイル） |

pinned source:

- law id `403AC0000000069`（地価税法）
- revision `403AC0000000069_20250601_504AC0000000068`
- Amendment enforcement date: 2025-06-01
- 担当範囲原文: `C:\Users\junny\AppData\Local\Temp\opencode\C8_LVT18.txt`
  （第十八条、UTF-8、本文 563 文字）
- 照合先 JSON: `data/raw/403AC0000000069_20250601_504AC0000000068.law.json`
  （`law_full_text` の ArticleTitle「第十八条」本文は 565 文字。原文ファイルとの差は
  JSON 側に全角空白 U+3000 が 2 箇所あるのみで、`re.sub(r"[\s　]+", "", …)`
  正規化後は一字も違わず一致）

名前空間は `JapanTaxLaw.LandValueTaxBasicDeduction`。`Money = Nat` および
`TaxRate` は `JapanTaxLaw.TaxFinance` を import して利用。

### 原文逐語から導いた数式（coordinator の説明は使わず、原文だけを根拠にした）

| 原文（一字どおり） | 読み取り | モデル |
| --- | --- | --- |
| 「次の各号に掲げる金額のいずれか多い金額」 | 一号と二号の大きい方 | `max` |
| 一号イ「十億円」 | 10 × 10^8 = 1_000_000_000 | `item1LargeCorpAmount` |
| 一号ロ「十五億円」 | 15 × 10^8 = 1_500_000_000 | `item1OtherAmount` |
| 「資本金の額…が一億円を超える」 | 区分判定の閾値 100_000_000（**超える**、算算には使わない） | `capitalThreshold`（記録のみ） |
| 二号「三万円」 | 3 × 10^4 = 30_000 | `unitPriceBase` |
| 二号イ「借地権等が設定されていない場合三万円」 | 割合を乗じない 30_000 | `noLeasehold` |
| 二号ロ「三万円に当該借地権等の価額が更地の価額のうちに占める割合を乗じて計算した金額」 | 30_000 × 借地権割合 | `leaseholdRight` + `ratio` |
| 二号ハ「三万円に当該底地の価額が更地の価額のうちに占める割合を乗じて計算した金額」 | 30_000 × 底地割合 | `underlyingLand` + `ratio` |
| 「前条の規定の適用がある場合には、当該金額に二分の一を乗じて計算した金額」 | 単価 × 1/2（面積を乗じる**前**に適用） | `prevHalf = ⟨1,2,…⟩` |
| 「当該土地等の面積を乗じて計算した金額の合計額」 | 区画ごと（単価 × 面積）の合計 | `parcelAmount` / `item2Amount` |
| 2項「前項の規定による控除は、基礎控除という」 | 名称規定（算術なし） | def なし |

捨てない注意点:

- 一号イは「十億円」、一号ロは「十五億円」。（十億＝10^9、十五億＝1.5×10^9）
  区分判定閾値の「一億円」と混同しない。
- 「二分の一」は単価（一平方メートル当たり金額）に掛けてから面積を掛ける。
  原文の括弧の位置が「一平方メートル当たりの金額（…二分の一…）に、…面積を乗じて」だから。
- 「いずれか多い金額」は max であり、加算や min ではない。

### caller-established と Bool の扱い

- 一号の区分（資本金超・相互会社該当性）、二号の場合区分（イ／ロ／ハ）、
  借地権割合・底地割合、面積、前条 art.17 の適用の有無は**すべて caller-established**。
- **Bool は金額式に入れていない**。前条適用は「適用なし `⟨1,1,…⟩`／あり `⟨1,2,…⟩`」
  として caller-established の `TaxRate` で受け取る（`prevNoAdjust` / `prevHalf`）。
- 割合・前条係数の乗算は repo 標準の `TaxRate.applyFloor`（切り捨て）。原文は丸めを
  明示しないため、これはモデル上の選択として明示している。

## 1. 追加した def / theorem 一覧

### 実装（`LandValueTaxBasicDeduction.lean`）— 11 def + 34 theorem

| 区分名 | 名前 | 内容 |
| --- | --- | --- |
| art.18 一号閾値 | `capitalThreshold` | 100_000_000（一億円。記録のみ、算算には未使用） |
| art.18 一号イ | `item1LargeCorpAmount` | 1_000_000_000（十億円） |
| art.18 一号ロ | `item1OtherAmount` | 1_500_000_000（十五億円） |
| art.18 二号 | `unitPriceBase` | 30_000（三万円） |
| 前条係数 | `prevNoAdjust` / `prevHalf` | `⟨1,1,…⟩` / `⟨1,2,…⟩`（二分の一） |
| art.18 一号区分 | `OwnerClass` | `largeCorp`（イ）/ `individualOrOther`（ロ） |
| art.18 一号 | `item1Amount` | 区分別に十億円／十五億円 |
| art.18 二号区分 | `LandClass` | `noLeasehold`（イ）/ `leaseholdRight`（ロ）/ `underlyingLand`（ハ） |
| art.18 二号単価 | `unitPricePerSqm` | 30_000 または 30_000×割合、さらに前条係数を適用 |
| 二号区画 | `Parcel` | `cls` / `ratio` / `prev` / `area`（すべて caller-established） |
| art.18 二号区画額 | `parcelAmount` | `unitPricePerSqm … * area` |
| art.18 二号合計 | `item2Amount` | 区画の `parcelAmount` の合計 |
| art.18(1) | `basicDeduction` | `max (item1Amount owner) (item2Amount parcels)` |

theorem 34 本はすべてモデル性質のみ（定数値・区分分岐・max の上下界・
単価の具体的値・単調性など）。kernel-decide の `example` は実装 13 件。

### 独立定式（`LandValueTaxBasicDeductionSpec.lean`）— 14 def

| 名前 | 内容 |
| --- | --- |
| `specItem1Large` / `specItem1Other` / `specUnitBase` | 1_000_000_000 / 1_500_000_000 / 30_000（impl 定数を参照しない裸リテラル） |
| `specItem1` | `if owner = 0 then … else …`（impl の `match` を別表現に） |
| `specUnitPrice` | 素の Nat で `specUnitBase * ratioNum / ratioDen` 等を書き下ろす（`applyFloor` を再利用しない） |
| `SpecParcel` / `specParcelAmount` / `specItem2` | 素の Nat の区画・区画額・合計額 |
| `specMax` | `if a ≤ b then b else a`（impl の `max` に依存しない） |
| `specBasicDeduction` | `specMax (specItem1 …) (specItem2 …)` |
| `specOwnerCode` / `specLandCode` / `toSpecParcel` | impl 入力 → spec コードへの変換（算術なしの plumbing） |
| `sampleParcels` | 有限グリッド用の区画 10 件 |
| `agreeLandValueTaxBasicDeduction` | impl ↔ spec の有限点一致（`by decide`、全称主張ではない） |

Spec の `example` は 22 件（内 agree 1 件）。

### 退行テスト（`LandValueTaxBasicDeductionTests.lean`）

`example : … := by decide` の kernel-decide smoke **38 件**。境界:

- 一号 > 二号: 土地等なし → 十億円／十五億円
- 二号 > 一号: 面積 40_000 → 1_200_000_000 > 十億円、面積 60_000 → 1_800_000_000 > 十五億円
- 二分の一適用: 単価 30_000 → 15_000、区画額 3_000_000 → 1_500_000
- 割合 0: 借地権／底地の単価・区画額が 0
- 面積 0: 区画額・二号合計が 0
- 同値点（33_333 m² → 十億円、33_334 m² → 1_000_020_000）、区画順序非依存、
  前条適用の有無をまたぐ大小関係

### doc-comment に明記した射程

- `agree*` は定数値の `==` 一致確認であり、法的意味の等価証明ではない。
- 転記監査は fidelity-only（原文 bytes との一致確認）であり法的正しさを保証しない。
- 完結・網羅を主張しない。

## 2. 転記監査に追加すべき check（JSON 断片）

`scripts/ci/transcription_audit.py` の `checks()` に追加する check の JSON 表現です
（`law_id` / `kind` / `title` / `needles` の 4 キー）。needle 文字列は原文の一字一句です。
**文字正規化・全角／半角変換・異体字変換を行わず、そのまま移してください。**
全 needle は全角空白 U+3000 を含みません。

```json
{
  "law_id": "403AC0000000069",
  "kind": "file",
  "title": null,
  "needles": [
    "（基礎控除）第十八条次の各号に掲げる金額のいずれか多い金額は、課税価格から控除する。一土地等を有する者のイ又はロに掲げる区分に応じそれぞれイ又はロに定める金額イ普通法人のうち",
    "課税時期における資本金の額又は出資金の額が一億円を超える法人（保険業法（平成七年法律第百五号）第二条第五項（定義）に規定する相互会社及び同条第十項に規定する外国相互会社で政令で定めるものを含む。）十億円ロ個人及びイに掲げる法人以外の法人十五億円",
    "一平方メートル当たりの金額（当該土地等につき前条の規定の適用がある場合には、当該金額に二分の一を乗じて計算した金額）に、当該土地等の面積を乗じて計算した金額の合計額",
    "イ借地権等が設定されていない場合三万円ロ借地権等が設定されている場合において、当該土地等が借地権等であるとき。三万円に当該借地権等の価額が更地の価額のうちに占める割合を乗じて計算した金額",
    "ハ借地権等が設定されている場合において、当該土地等が借地権等以外のもの（以下この号において「底地」という。）であるとき。三万円に当該底地の価額が更地の価額のうちに占める割合を乗じて計算した金額２前項の規定による控除は、基礎控除という。"
  ]
}
```

参考変換例:

```python
yield ("地価税法 art. 18（基礎控除）↔ LandValueTaxBasicDeduction.lean",
       "403AC0000000069",
       "file", None,
       [ ...上記 needles 5 本を一字も変えずに列挙... ])
```

## 3. 期待 literal 増分

- 新規 check **5 needles** なので **+5**。
- `docs/PROGRESS.md` の監査 literal 総数はメインセッションが再確認して加算してください
  （起点値は本メモでは書きません）。

## 4. 検証結果（すべて本セッションで実行済み）

- `lake build JapanTaxLaw.LandValueTaxBasicDeduction JapanTaxLaw.LandValueTaxBasicDeductionSpec JapanTaxLaw.LandValueTaxBasicDeductionTests`
  → **成功（5 jobs、warning なし）**。※全体ビルド／CI／`run_python_gates.py` は実行していません。
  自作 3 モジュールのみをビルドしました。
- `python scripts/ci/check_no_sorry.py` →
  `no forbidden placeholder proofs found in tracked Lean sources`（exit 0）。
  新規 3 ファイルは未追跡のため gate 対象外ですが、checker 自身の
  `strip_comments_and_strings` / `FORBIDDEN` で直接走査し **hits 0** を確認。
- `#print axioms`（一時ファイル `LVTD_AxiomProbe.lean` を approved temp dir に作成、
  `lake env lean` で exit 0 を確認後 **削除済み**）:
  - 名前付き宣言 **59 本**（impl def 11 + impl theorem 34 + spec def 14）を検査。
  - **axiom-free 53 本**、**`propext` のみ 6 本**（repo 許容範囲）、
    `Classical.choice` / `sorryAx` / `Quot.sound` は **0 本**。
  - `propext` のみ: `parcelAmount_area_zero`, `item2Amount_cons`,
    `basicDeduction_ge_item1`, `basicDeduction_ge_item2`, `basicDeduction_pos`,
    `basicDeduction_eq_item1_of_item2_le`。
- 原文逐語検証: **5/5 FOUND、MISS 0 件**（§5）。pinned JSON の Art.18 本文が
  原文ファイルと正規化後に一致することも確認済み。

## 5. 逐語検証 FOUND / MISS 一覧（一字も変更せず）

pinned JSON の `law_full_text` を再帰平坦化したテキストを haystack とし、
needle も同じ文字列で Python `.find()` / `.count()` を実行。
`norm@` は `re.sub(r"[\s　]+", "", …)` 正規化後（transcription_audit.py の
`contains()` と同一条件）の offset。`raw@` は未正規化テキスト上の offset。

| # | 原文箇所 | len | 全角空白 | raw@ / count | norm@ / count | Art.18 正規化テキスト | 結果 |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 1 | 本文 + 一号導入・イ冒頭 | 87 | なし | 7411 / 1 | 7401 / 1 | FOUND | **FOUND** |
| 2 | 一号 資本金基準・相互会社・十億円・十五億円 | 122 | なし | 7498 / 1 | 7488 / 1 | FOUND | **FOUND** |
| 3 | 二号柱書 単価・二分の一・面積 | 82 | なし | 7682 / 1 | 7672 / 1 | FOUND | **FOUND** |
| 4 | 二号イ・ロ（三万円・借地権割合） | 93 | なし | -1 / 0 | 7754 / 1 | FOUND | **FOUND** |
| 5 | 二号ハ・2項（底地割合・基礎控除という） | 117 | なし | -1 / 0 | 7847 / 1 | FOUND | **FOUND** |

- **FOUND 5 / MISS 0**。needle の勝手な変更・正規化・文字変換はしていません。
- 4・5 の `raw@` が -1 なのは、pinned JSON の Art.18 本文に「…であるとき。**　**三万円…」
  の全角空白 U+3000 が 2 箇所（offset 408 / 507）存在するためです。needle 側に
  U+3000 は含めず、指示どおり**正規化テキスト**に対して検証し、いずれも
  count 1 で FOUND です。MISS が出ていた場合は作業を止めて報告する手順でしたが、
  該当なしです。
- 全 needle は 82〜122 文字の範囲内（87 / 122 / 82 / 93 / 117）。

## 6. README / PROGRESS に足す 1 行文案

CROSS_LAW の scan/pin 件数や監査 literal 総数はメインセッションが計算するため、ここでは書きません。

- **README.md**（モジュール一覧の該当付近に追加）:
  ```text
  JapanTaxLaw/LandValueTaxBasicDeduction.lean / -Spec.lean / -Tests.lean  # 地価税法 art.18（基礎控除）の L4 計算スライス。基礎控除 = max(一号: 十億円/十五億円, 二号: Σ(一平方メートル単価 × 面積))。単価 = 三万円 / 三万円×借地権割合 / 三万円×底地割合、前条適用なら二分の一。区分・割合・面積・前条適用は caller-established（Bool は金額式に入れず TaxRate で受け取る）
  ```
- **docs/PROGRESS.md**（L4 着手済みモジュール一覧の末尾に追記）:
  ```text
  地価税法 art.18（LandValueTaxBasicDeduction.lean：基礎控除。控除額 = max(一号 十億円/十五億円, 二号 Σ(単価×面積))、単価 = 三万円 or 三万円×借地権/底地割合、前条適用なら 1/2。区分・割合・面積・前条該当性は caller-established、Bool は金額式に入れず caller-established の TaxRate で受け取る。相互会社該当性・art.17 適用判定・借地権価額算定は NOT MODELLED）
  ```

## 7. インテグレーターへの明示事項

**インテグレーターは `JapanTaxLaw.lean` に以下の 3 つの import を追加すること。**

```lean
import JapanTaxLaw.LandValueTaxBasicDeduction
import JapanTaxLaw.LandValueTaxBasicDeductionSpec
import JapanTaxLaw.LandValueTaxBasicDeductionTests
```

（LVTD は `JapanTaxLaw.lean` を書き換えていません。メインが統合してください。）

## 8. NOT MODELLED の理由（明示）

- **保険業法の相互会社該当性**: 一号イの括弧内「第二条第五項（定義）に規定する相互会社及び
  同条第十項に規定する外国相互会社で政令で定めるものを含む。」は外部法令・政令に
  依存する該当性判定であり、原文に算術がない。人間の法的判断に委ね、
  caller-established の `OwnerClass` として受け取る。
- **前条（art. 17）の適用判定**: 原文は「当該土地等につき前条の規定の適用がある場合には」
  と条件を述べるだけで、適用要件の算術を本条に含まない。Bool を金額式に入れず、
  caller-established の `TaxRate`（`⟨1,2,…⟩`）として受け取る。
- **借地権・底地の価額算定（＝割合の算定）**: 「当該借地権等の価額が更地の価額のうちに
  占める割合」「当該底地の価額が更地の価額のうちに占める割合」は、それぞれの価額の
  評価手続であり art. 23 以下の評価問題。原文に割合の算出式がなく、
  caller-established の `TaxRate` として受け取る。
- その他: 課税価格からの控除の適用（art. 22 側）、端数処理・申告・経過措置・附則は
  本スライスの対象外。2 項は名称規定のため def を置かない。

## 9. 範囲・残ブロッカーの正直な申告

- これは **L4 のごく小さなスライス**です。**完成・網羅を主張しません**。
- `agree*` は有限グリッド上の一致確認であり普遍定理ではありません。
- 転記監査は fidelity-only（原文 bytes との一致確認）であり法的正しさを保証しません。
- **L7 候補 3,438 件は LEGAL_REVIEW_PENDING（unreviewed）のまま**です（本スライスでは
  一切レビューしていません）。`docs/L7_CANDIDATES_UNREVIEWED.csv` /
  `docs/RECURSIVE_DISCOVERY.md` は変更していません。
- 残ブロッカー: 転記監査 check の `checks()` への組み込み（§2、+5）、
  `JapanTaxLaw.lean` への import 追加（§7）、README / PROGRESS の 1 行追記（§6）、
  および全体ビルド・CI ゲートの実行は**すべてメインセッションの担当**です
  （LVTD は実行していません）。
