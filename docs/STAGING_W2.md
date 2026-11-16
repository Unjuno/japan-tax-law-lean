# STAGING — W2 (消費税法 art. 28(4) 保税地域から引き取られる課税貨物の課税標準) 受け渡しメモ

> 実装担当 W2 からメインセッション（統合担当）への受け渡し用。
> ブランチ操作・add/commit/push/merge は一切していません。
> 書き換えたのは下記 4 ファイルのみです（他は読み取り専用）。

## 0. 対象ファイル

| ファイル | 状態 |
| --- | --- |
| `JapanTaxLaw/ConsumptionTaxImportBase.lean` | 新規 |
| `JapanTaxLaw/ConsumptionTaxImportBaseSpec.lean` | 新規 |
| `JapanTaxLaw/ConsumptionTaxImportBaseTests.lean` | 新規 |
| `docs/STAGING_W2.md` | 新規（本ファイル） |

pinned source: `data/raw/363AC0000000108_20261101_507AC0000000013.law.json`
law id `363AC0000000108` / revision `363AC0000000108_20261101_507AC0000000013`
raw snapshot sha256 `25DCCEBFFB6690902C117A4AB9C16E4D64DB087BBA6D184A10EA6AEB58AB4A82`
（ConsumptionTaxableBase.lean / ConsumptionTaxRate.lean と同一ピン。sha256 は本ファイルの bytes から再計算して一致確認済み）。

## 1. 追加した def・theorem 一覧

### 1.1 `ConsumptionTaxImportBase.lean`（namespace `JapanTaxLaw`）

- `structure ImportGoodsFacts` — フィールド:
  - `isBondedWithdrawal : Bool` — **適用判定ゲート。式には入れない**（doc-comment に明記）。
  - `customsValue : Money` — 関税定率法 art. 4〜4の9 に準じて算出した価格（caller-established）。
  - `otherConsumptionTax : Money` — 保税地域からの引取りに係る消費税以外の消費税等（国税通則法 2条3号）、附帯税相当額は caller が控除済み。
  - `customsDuty : Money` — 関税の額、附帯税相当額は caller が控除済み。
  - `deriving DecidableEq, Repr`
- `def importTaxableBase (f : ImportGoodsFacts) : Money := f.customsValue + f.otherConsumptionTax + f.customsDuty`
  - 純粋な Nat 足し算（左結合 `((a + b) + c)`）。**Nat.sub 不使用。条件付きゼロ（`if ... then ... else 0`）不使用**。

定理（4 件、すべて **axiom 0 件** — §4 参照）:

- `theorem importTaxableBase_eq (f)` — `rfl`
- `theorem importTaxableBase_mono_customsValue (f g) (h : f.customsValue ≤ g.customsValue) (hother) (hduty)` — `Nat.add_le_add_right` を 2 段
- `theorem importTaxableBase_mono_otherConsumptionTax (f g) (hcv) (h : f.otherConsumptionTax ≤ g.otherConsumptionTax) (hduty)` — `Nat.add_le_add_left` + `Nat.add_le_add_right`
- `theorem importTaxableBase_mono_customsDuty (f g) (hcv) (hother) (h : f.customsDuty ≤ g.customsDuty)` — `Nat.add_le_add_left`

kernel-decided smoke 例 4 件（10,000,000 + 200,000 + 300,000 = 10,500,000、ゲート false でも同値、.zero、小額）。

### 1.2 `ConsumptionTaxImportBaseSpec.lean`（新規、独立定式）

- `def specImportTaxableBase (f : ImportGoodsFacts) : Money` — 3 要素を `List.foldl (fun acc x => acc + x) 0` で合計する**独立定式**（impl の左結合 `a + b + c` と意図的に別形）。
- `def agreeImportTaxableBase : Bool` — 代表サンプル 7 件で `specImportTaxableBase f == importTaxableBase f`。
- `example : agreeImportTaxableBase = true := by decide` ほか kernel-decide 例 4 件。

### 1.3 `ConsumptionTaxImportBaseTests.lean`（新規）

`example := by decide` のスモークのみ（定理名の追加なし）。換算例、ゲート flag 非依存、各 1 項だけの増分、金額 0、小額。

### 1.4 doc-comment に明記した射程外（overclaim 防止）

- 関税定率法 art. 4〜4の9 の課税価格算定そのもの（caller が数値を渡す）。
- 附帯税相当額の算定・控除（caller が差し引き済みの数値を渡す。**Nat.sub しない**）。
- art. 29 の 7.8% / 6.24% を掛ける行為（税率は別モジュール `ConsumptionTaxRate`）。
- art. 28(5) の政令で定める細目。
- 転記監査は fidelity-only であり法的正しさではない。
- `isBondedWithdrawal` は適用判定ゲートとして doc-comment に明記するが式には入れない（法令は条件付きゼロではなく「金額」を定義しているため）。

## 2. 転記監査に追加すべき check（JSON 断片）

`scripts/ci/transcription_audit.py` の `checks()` に追加する check の完全な JSON 表現です
（`law_id` / `kind` / `title` / `needles` の 4 キー）。needle 文字列は一字も変えないこと。

```json
{
  "law_id": "363AC0000000108",
  "kind": "article",
  "title": "第二十八条",
  "needles": [
    "保税地域から引き取られる課税貨物に係る消費税の課税標準は、当該課税貨物につき",
    "関税定率法（明治四十三年法律第五十四号）第四条から第四条の九まで（課税価格の計算方法）の規定に準じて算出した価格",
    "消費税等（国税通則法第二条第三号（定義）に規定する消費税等をいう。）の額（附帯税の額に相当する額を除く。）",
    "関税の額（関税法第二条第一項第四号の二に規定する附帯税の額に相当する額を除く。）に相当する金額を加算した金額とする。"
  ]
}
```

> **重要（統合時の注意）**: needle は原文 pinned bytes の一字一句です。
> 文字正規化・全角／半角変換・異体字／簡体字変換を行わず、そのまま移してください。
> §5 の検証で実際に `.find()` したのは、まさに上記の 4 文字列です。

参考：現行スクリプト形式への変換例（name は任意）:

```python
yield ("消費税法 art. 28(4)（保税地域から引き取られる課税貨物の課税標準）↔ ConsumptionTaxImportBase.lean",
       "363AC0000000108",
       "article", "第二十八条",
       [
         "保税地域から引き取られる課税貨物に係る消費税の課税標準は、当該課税貨物につき",
         "関税定率法（明治四十三年法律第五十四号）第四条から第四条の九まで（課税価格の計算方法）の規定に準じて算出した価格",
         "消費税等（国税通則法第二条第三号（定義）に規定する消費税等をいう。）の額（附帯税の額に相当する額を除く。）",
         "関税の額（関税法第二条第一項第四号の二に規定する附帯税の額に相当する額を除く。）に相当する金額を加算した金額とする。",
       ])
```

## 3. 期待 literal 増分

- 新規 check 1 件 × needles **4 本** なので **+4**。
- `docs/PROGRESS.md` §7 の記載値は現在 **406 literal**（32 anchor チェック）。加算後は **410**。
  （起点 406 は文書記載値。実際の現在値はメインセッションで再確認してください。）

## 4. 検証結果（すべて本セッションで実行済み）

- `lake build JapanTaxLaw.ConsumptionTaxImportBase JapanTaxLaw.ConsumptionTaxImportBaseSpec JapanTaxLaw.ConsumptionTaxImportBaseTests`
  → **成功（5 jobs、warning なし）**。※他モジュール全体ビルドはしていません。
  - 1 回目は `importTaxableBase_mono_customsDuty` で結合方向の型不一致（期待 `c + a ≤ c + b` に対して `a + c ≤ b + c` を与えた）が出たため、
    `Nat.add_le_add_right` → `Nat.add_le_add_left` に修正して再ビルドし成功。
- `python scripts/ci/check_no_sorry.py` → `no forbidden placeholder proofs found in tracked Lean sources`。
  （新規 3 ファイルは未追跡のため本スクリプトの走査対象外ですが、人力でも `sorry` / `admit` はありません。）
- `#print axioms`（一時ファイル `W2AxiomProbe.lean` を approved temp dir に作成、`lake env lean` で実行後 **削除済み**）:
  - `JapanTaxLaw.importTaxableBase_eq` … **does not depend on any axioms**
  - `JapanTaxLaw.importTaxableBase_mono_customsValue` … **does not depend on any axioms**
  - `JapanTaxLaw.importTaxableBase_mono_otherConsumptionTax` … **does not depend on any axioms**
  - `JapanTaxLaw.importTaxableBase_mono_customsDuty` … **does not depend on any axioms**
  - **`Classical.choice` も `sorryAx` も `propext` も一切なし**。
    単調性補題は `Nat.add_le_add_left` / `Nat.add_le_add_right` のみに依存し、W1 の `Nat.le_max_*` のような `[propext]` 依存はありません（許容オプションの適用不要）。

## 5. 逐語検証 FOUND / MISS 一覧（一字も変更せず）

`MainProvision` 配下で `ArticleTitle == 第二十八条` の Article を 1 件特定し、
その本文テキストに対して各 needle を Python の `.find()` で検索（`law_info.law_id` /
`revision_info.law_revision_id` も一致確認）。

| # | needle（全文） | 結果 |
| --- | --- | --- |
| 1 | 保税地域から引き取られる課税貨物に係る消費税の課税標準は、当該課税貨物につき | **FOUND** (index 543) |
| 2 | 関税定率法（明治四十三年法律第五十四号）第四条から第四条の九まで（課税価格の計算方法）の規定に準じて算出した価格 | **FOUND** (index 581) |
| 3 | 消費税等（国税通則法第二条第三号（定義）に規定する消費税等をいう。）の額（附帯税の額に相当する額を除く。） | **FOUND** (index 664) |
| 4 | 関税の額（関税法第二条第一項第四号の二に規定する附帯税の額に相当する額を除く。）に相当する金額を加算した金額とする。 | **FOUND** (index 719) |

- law id `363AC0000000108` … **FOUND**
- revision `363AC0000000108_20261101_507AC0000000013` … **FOUND**
- Article 第二十八条 の一致件数 … **1**（想定どおり）
- **MISS は 1 件もなし。** アンカーの勝手な変更・正規化はしていません。

## 6. README / PROGRESS に足す 1 行文案

CROSS_LAW の scan/pin 件数はメインセッションが計算するため、ここでは書きません。

- **README.md**（モジュール一覧・`ConsumptionTaxRate` 3 行［272〜274 行目］の直後に追加）:
  ```text
  JapanTaxLaw/ConsumptionTaxImportBase.lean / -Spec.lean / -Tests.lean  # 消費税法 第28条4項（保税地域から引き取られる課税貨物の課税標準）L4 モデル・独立定式・退行テスト
  ```
- **docs/PROGRESS.md**（L4 着手済みモジュール一覧の末尾に追記）:
  ```text
  消費税法 art. 28(4)（保税地域から引き取られる課税貨物の課税標準）ConsumptionTaxImportBase.lean（関税定率法準拠価格＋消費税以外の消費税等＋関税の額を Nat 加算、附帯税控除済みは caller-established、1〜3項/5項は本スライス外）
  ```

## 7. インテグレーターへの明示事項

**インテグレーターは `JapanTaxLaw.lean` に以下の 3 つの import を追加すること。**

```lean
import JapanTaxLaw.ConsumptionTaxImportBase
import JapanTaxLaw.ConsumptionTaxImportBaseSpec
import JapanTaxLaw.ConsumptionTaxImportBaseTests
```

（W1 の `ConsumptionTaxableBase*` 3 件と併せて、計 6 行の追加になる見込みです。メインが統合してください。）

## 8. 範囲・残ブロッカーの正直な申告

- これは **L4 のごく小さなスライス**です。**完成・網羅を主張しません**。
- art. 28 の **1〜3 項は W1 スライス（`ConsumptionTaxableBase.lean`）**、**5 項（政令細目）は NOT YET COVERED**。
- 関税定率法 art. 4〜4の9 の価格算定、附帯税相当額の算定・控除、art. 29 の税率適用は本モジュールの射程外（caller-established / 別モジュール）。
- `isBondedWithdrawal` はゲートとして記録するだけで適用判定ロジックは実装していません。
- `agreeImportTaxableBase` は代表サンプル上の一致確認であり、全入力域での等価証明ではありません。
- 転記監査は fidelity-only（原文 bytes との一致確認）であり、法的正しさを保証しません。
- **L7 候補 3,438 件は unreviewed のまま**です（本スライスでは一切レビューしていません）。
- 残ブロッカー: 転記監査 check の `checks()` への組み込み（§2）、`JapanTaxLaw.lean` への import 追加（§7）、README / PROGRESS の 1 行追記（§6）、および全体ビルド・CI ゲートの実行は**すべてメインセッションの担当**です（W2 は実行していません）。
