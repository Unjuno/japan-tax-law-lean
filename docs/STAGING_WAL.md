# STAGING — W-AL（地方税法施行令 第五十六条の五十＝事業所等が複数市町村にまたがる場合の課税標準の特例の bounded L4 モデル）受け渡しメモ

> 実装担当 W-AL からメインセッション（統合担当）への受け渡し用。
> ブランチ操作・add/commit/push/merge は一切していません。
> 書き換えたのは下記 4 ファイルのみです（他は読み取り専用）。

## 0. 対象ファイル

| ファイル | 状態 |
| --- | --- |
| `JapanTaxLaw/LocalTaxOfficeApportionment.lean` | 新規 |
| `JapanTaxLaw/LocalTaxOfficeApportionmentSpec.lean` | 新規 |
| `JapanTaxLaw/LocalTaxOfficeApportionmentTests.lean` | 新規 |
| `docs/STAGING_WAL.md` | 新規（本ファイル） |

pinned source: `data/raw/325CO0000000245_20261101_508CO0000000083.law.json`
law id `325CO0000000245` / revision `325CO0000000245_20261101_508CO0000000083`
amendment enforcement date `2026-11-01`。

### 原文ファイル名の申告（重要・一字照合）

タスク文面は担当範囲原文を `local_order_M2.txt`（第五十六条の五十、約336文字）と記載していましたが、
実ファイルを一字も誤らず読んだ結果、**`local_order_M2.txt` の中身は「第五十六条の八十」（LEN 437、
申告書の提出期限に関する条文）** でした。第五十六条の五十（LEN 336、課税標準の特例・按分算術）は
**`local_order_M3.txt`** にあり、条文番号・文字数・内容（事業所床面積割合による従業者給与総額の按分）が
タスク記載と完全に一致するため、**`local_order_M3.txt` を正規の原文として採用**しました。
（`local_order_M2.txt` は別ワーカーの担当と思われ、読み取りのみ行い書き換えていません。）

採用原文（336 文字、正規化済み・UTF-8、全角空白 U+3000 なし、ASCII スペースなし）は
`LocalTaxOfficeApportionment.lean` の doc-comment に一字も変えず転記済みです。

Namespace note: 新規モジュールは dedicated sub-namespace
`JapanTaxLaw.LocalTaxOfficeApportionment` を使用（`Money = Nat` は
`open JapanTaxLaw.TaxFinance` で参照）。他ワーカー（W-AK / W-AM 等）の名前空間と衝突しません。

## 1. 追加した def 一覧

`namespace JapanTaxLaw.LocalTaxOfficeApportionment`、`open JapanTaxLaw.TaxFinance`。
原文には明示的な按分計算（従業者給与総額 × 指定都市等所在部分の事業所床面積 /
全事業所床面積）があるため **MODELLED** です。丸めは Nat 除算による切り捨て、
分母零（全事業所床面積 = 0）は 0 を返すモデル規約です。

### 1a. 実装モジュール（`LocalTaxOfficeApportionment.lean`）— 4 def

| # | def 名 | 原文対応 | 算術 |
| --- | --- | --- | --- |
| 1 | `apportion` | 按分共通 | `base * numerator / denominator`（`n/0 = 0` で分母零安全） |
| 2 | `designatedCityAreaRatio` | 「指定都市等所在部分の事業所床面積の当該事業所等に係る事業所床面積に対する割合」 | 分子/分母ペア `(指定都市等所在部分床面積, 全事業所床面積)` |
| 3 | `designatedCityFloorArea` | 「当該事業所等に係る事業所床面積は、…指定都市等所在部分の事業所床面積に相当する面積とし」 | 同一値の読み替え（算術ではない、`a ↦ a`） |
| 4 | `apportionedEmployeeSalary` | 「当該従業者給与総額に…割合を乗じて得た額とする」 | `apportion 総給与額 指定都市等所在部分床面積 全事業所床面積` |

### 1b. 定理（10 本、すべて axiom-free または propext のみ）

`apportion_eq` / `apportion_zero_denominator` / `apportion_zero_numerator` /
`apportion_one_to_one` / `designatedCityFloorArea_eq` / `apportionedEmployeeSalary_eq` /
`apportionedEmployeeSalary_zero_totalArea` / `apportionedEmployeeSalary_zero_designatedCityArea` /
`apportionedEmployeeSalary_full` / `apportionedEmployeeSalary_mono`。

各 def に positivity／well-definedness に相当する定理と `by decide` smoke を付与済み
（単調性 `apportionedEmployeeSalary_mono` は `propext` 依存、許容範囲）。

### 1c. Spec モジュール（`LocalTaxOfficeApportionmentSpec.lean`）— 8 def

独立整数定式 4 本 + `agree*` 4 本:

- `specApportion`: `(numerator * base) / denominator`（被乗数を入れ替えた独立定式）
- `specDesignatedCityAreaRatio`: `(designatedCityArea, totalArea)`
- `specDesignatedCityFloorArea`: `designatedCityArea`
- `specApportionedEmployeeSalary`: `(designatedCityArea * totalSalary) / totalArea`
- `agreeApportion` / `agreeDesignatedCityAreaRatio` / `agreeDesignatedCityFloorArea` /
  `agreeApportionedEmployeeSalary`（いずれも有限サンプル上の `==` 一致を `by decide` で確認、
  分母零・端数切り捨て・按分 1:1 を含む法的等価証明ではない）

### 1d. Tests モジュール（`LocalTaxOfficeApportionmentTests.lean`）

新規定理名なしの `example := by decide` のみ（21 件）。境界: 分母零、分子零、
按分 1:1、端数切り捨て（1/3・2/3・7/9）、按分 0。

### NOT MODELLED（caller-established / 非モデル化）

- 事業所床面積・指定都市等所在部分の事業所床面積・従業者給与総額の認定。
- 指定都市等の区域判定、事業所等の該当性判定（Bool は算定式に入れない）。
- 「法第七百一条の四十第一項及び第二項の規定の適用については…」という**読み替えて適用する手続指定
  そのもの**および法側の課税標準の算定構造。本モジュールがモデル化するのは明示された按分算術と
  面積の同一値読み替えのみ。
- 部分面積が全面積を超えるケースの法的扱い（入力の妥当性は caller が担保）。
- 転記監査は fidelity-only であり法的正しさを保証しない。

名前付き宣言の合計: 実装 4 def + 10 定理 = 14 本、Spec 8 def = 8 本（**合計 22 本**）。
Tests は名前付き宣言なし（`example` 21 件のみ）。

## 2. 転記監査に追加すべき check（JSON 断片）

`scripts/ci/transcription_audit.py` の `checks()` に追加する check の JSON 表現です
（`law_id` / `kind` / `title` / `needles` の 4 キー）。needle 文字列は一字も変えないこと。
**文字正規化・全角／半角変換・異体字変換を行わず、そのまま移してください。**
各 needle は正規化テキスト（空白・全角空白除去）上の連続部分そのもので、
担当範囲原文・pinned JSON の両方で出現回数 1 です（§3 検証済み）。

```json
{
  "law_id": "325CO0000000245",
  "kind": "file",
  "title": null,
  "needles": [
    "（事業所等が指定都市等とその他の市町村とにわたつて所在する場合等における課税標準の特例）第五十六条の五十事業所等が一の指定都市等の区域とその他の市町村の区域とにわたつて所在する場合における当該事業所等において行",
    "事業所等において行われる事業に対して当該指定都市等が課する事業所税に係る法第七百一条の四十第一項及び第二項の規定の適用については、当該事業所等に係る事業所床面積は、当該事業所等のうち当該指定都市等の区域内に所",
    "定都市等の区域内に所在する部分に係る事業所床面積（以下この条において「指定都市等所在部分の事業所床面積」という。）に相当する面積とし、当該事業所等に係る従業者給与総額は、当該従業者給与総額に当該指定都市等所在部",
    "在部分の事業所床面積」という。）に相当する面積とし、当該事業所等に係る従業者給与総額は、当該従業者給与総額に当該指定都市等所在部分の事業所床面積の当該事業所等に係る事業所床面積に対する割合を乗じて得た額とする。"
  ]
}
```

参考：現行スクリプト形式への変換例（name は任意、needles は上記 4 本を一字も変えずに列挙）:

```python
yield ("地方税法施行令 第五十六条の五十（事業所等の課税標準の特例）↔ LocalTaxOfficeApportionment.lean",
       "325CO0000000245",
       "file", None,
       [ ...上記 needles 4 本を一字も変えずに列挙... ])
```

## 3. 検証結果（すべて本セッションで実行済み）

- `lake build JapanTaxLaw.LocalTaxOfficeApportionment JapanTaxLaw.LocalTaxOfficeApportionmentSpec JapanTaxLaw.LocalTaxOfficeApportionmentTests`
  → **成功（5 jobs、warning なし）**。※自作 3 モジュールのみビルド（全体ビルド／CI／
  `run_python_gates.py` は実行していません）。
- `python scripts/ci/check_no_sorry.py` →
  `no forbidden placeholder proofs found in tracked Lean sources`。
  （新規 3 ファイルは未追跡のため走査対象外ですが、人力でも `sorry` / `admit` はありません。）
- `#print axioms`（一時ファイル `WALP_AxiomProbe.lean` を approved temp dir に作成、
  `lake env lean` で実行後 **削除済み**）:
  - 走査 14 件（実装 10 定理 + Spec の `agree*` 4 本）。
  - `Classical.choice` / `sorryAx` は **0 件**。
  - 7 件は `does not depend on any axioms`（完全 axiom-free）。
  - 7 件（`apportion_zero_denominator` / `apportion_zero_numerator` / `apportion_one_to_one` /
    `apportionedEmployeeSalary_zero_totalArea` / `apportionedEmployeeSalary_zero_designatedCityArea` /
    `apportionedEmployeeSalary_full` / `apportionedEmployeeSalary_mono`、いずれも `simp` / Nat 補題由来）が
    `propext` に依存。**`propext` は許容**のため問題なし。
- 原文逐語検証（needle を正規化テキストに対して Python `.find()`、出現回数も確認、
  `transcription_audit.py` の `_norm` / `contains` と同一条件）:
  - 担当範囲原文 `local_order_M3.txt`（正規化後 336 文字）:
    **4/4 FOUND、MISS 0 件**、各出現回数 1。
  - pinned JSON `law_full_text`（正規化後 1,219,606 文字、原文全体が
    offset 415534 に 1 回だけ出現）:
    **4/4 FOUND、MISS 0 件**、各出現回数 1。

### 逐語 FOUND / MISS 一覧（一字も変更せず）

| # | 区分 | len | 結果(原文) | src@ | count | 結果(JSON) | json@ | count |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| N1 | 見出し〜事業所等の所在 | 105 | FOUND | 0 | 1 | FOUND | 415534 | 1 |
| N2 | 事業所税・法適用・床面積 | 104 | FOUND | 96 | 1 | FOUND | 415630 | 1 |
| N3 | 部分面積の定義・給与総額 | 105 | FOUND | 190 | 1 | FOUND | 415724 | 1 |
| N4 | 割合を乗じた額（按分結論） | 105 | FOUND | 231 | 1 | FOUND | 415765 | 1 |

**FOUND 4 / MISS 0**（両テキストで出現回数 1、一意）。needle の長さは 104〜105 文字
（指定の 60〜130 の範囲内）。needle は担当範囲原文 `local_order_M3.txt` の正規化文字列から
オフセット指定で一字も変えず抽出し、その後 pinned JSON に対して `.find()` しました。
全角空白 U+3000 は一切含みません。アンカーの勝手な変更・正規化・文字変換はしていません。

## 4. README / PROGRESS に足す 1 行文案

CROSS_LAW の scan/pin 件数や監査 literal 総数はメインセッションが計算するため、ここでは書きません。

- **README.md**（モジュール一覧・`LocalTaxOrderRate*` 行の付近に追加）:
  ```text
  JapanTaxLaw/LocalTaxOfficeApportionment.lean       # 地方税法施行令 第五十六条の五十（複数市町村にまたがる事業所等の課税標準の特例：従業者給与総額 × 指定都市等所在部分床面積 / 全床面積、分母0は0・切り捨て、面積・給与額・該当性は caller-established）L4 モデル
  JapanTaxLaw/LocalTaxOfficeApportionmentSpec.lean   # 同上 独立整数定式
  JapanTaxLaw/LocalTaxOfficeApportionmentTests.lean  # 同上 退行テスト
  ```
- **docs/PROGRESS.md**（L4 着手済みモジュール一覧の末尾に追記）:
  ```text
  地方税法施行令 第五十六条の五十（事業所等が指定都市等と他の市町村にまたがる場合の課税標準の特例、従業者給与総額を指定都市等所在部分の事業所床面積割合で按分、分母0は0・切り捨て — LocalTaxOfficeApportionment.lean）
  ```

## 5. インテグレーターへの明示事項

**インテグレーターは `JapanTaxLaw.lean` に以下の 3 つの import を追加すること。**

```lean
import JapanTaxLaw.LocalTaxOfficeApportionment
import JapanTaxLaw.LocalTaxOfficeApportionmentSpec
import JapanTaxLaw.LocalTaxOfficeApportionmentTests
```

（W-AK / W-AM を含む他ワーカーの 3 件ずつと併せてメインが行数を確認してください。
W-AL は `JapanTaxLaw.lean` を書き換えていません。他ワーカーのファイルには触れていません。）

## 6. 範囲・残ブロッカーの正直な申告（最終報告）

- **build**: 自作 3 モジュールのみ `lake build` 成功（5 jobs / warning なし）。全体ビルド・CI・
  `run_python_gates.py` は未実行です。
- **axiom**: 走査 14 件、`Classical.choice` / `sorryAx` なし。7 件が `propext` 依存
  （許容範囲）、7 件は完全 axiom-free。一時ファイルは削除済み。
- **逐語**: FOUND 4 / MISS 0（担当範囲原文・pinned JSON の両方、出現回数 1、長さ 104〜105）。
- **def 数**: 実装 4 def + 10 定理 = 14 本、Spec 8 def = 8 本（合計 22 本の名前付き宣言）。
  Tests は新規定理名なしの `example := by decide` 21 件のみ。
- **STAGING**: 本ファイル `docs/STAGING_WAL.md` を作成済みです。
- これは地方税法施行令 第五十六条の五十の**明示された按分算術のみに限る小さなスライス**です。
  **完成・網羅を主張しません**。
- 原文ファイル名はタスク記載の `local_order_M2.txt` ではなく実ファイル
  `local_order_M3.txt`（第五十六条の五十、336 文字）を採用しました（§0 参照）。
  `local_order_M2.txt` は第五十六条の八十で別条文です。
- 事業所床面積・指定都市等所在部分の事業所床面積・従業者給与総額の認定、区域判定・該当性、
  法第七百一条の四十への「読み替えて適用する」手続指定そのものは
  **NOT MODELLED / caller-established** です（§1 NOT MODELLED 参照）。
- 丸めは Nat 除算による切り捨てをモデル規約として明示したもので、解釈を保証しません。
- `agree*` は有限点の `==` 一致確認であり、法的意味の等価証明ではありません。
- 転記監査は fidelity-only（原文 bytes との一致確認）であり、法的正しさを保証しません。
- **L7 候補 3,438 件は unreviewed のまま**です（本スライスでは一切レビューしていません）。
- 残ブロッカー: 転記監査 check の `checks()` への組み込み（§2、+4 needles）、
  `JapanTaxLaw.lean` への import 追加（§5）、README / PROGRESS の 1 行追記（§4）、
  および全体ビルド・CI ゲートの実行は**すべてメインセッションの担当**です
  （W-AL は実行していません）。
