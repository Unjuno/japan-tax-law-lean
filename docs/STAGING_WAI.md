# STAGING — W-AI（地方税法施行令 第九条の二十二［百分の九十九］／第三十五条の四の五［百分の七・七］）受け渡しメモ

> 実装担当 W-AI からメインセッション（統合担当）への受け渡し用。
> ブランチ操作・add/commit/push/merge は一切していません。
> 本タスクで書き換えたのは下記 4 ファイルのみです（他は読み取り専用）。

## 0. 対象ファイル

| ファイル | 状態 |
| --- | --- |
| `JapanTaxLaw/LocalTaxOrderRate77.lean` | 新規 |
| `JapanTaxLaw/LocalTaxOrderRate77Spec.lean` | 新規 |
| `JapanTaxLaw/LocalTaxOrderRate77Tests.lean` | 新規 |
| `docs/STAGING_WAI.md` | 新規（本ファイル） |

pinned source:

- law id `325CO0000000245`
- revision `325CO0000000245_20261101_508CO0000000083`
- 正規化済み原文: `C:\Users\junny\AppData\Local\Temp\opencode\local_order_L3.txt`（第九条の二十二、57 文字）
  および `...\local_order_L4.txt`（第三十五条の四の五、53 文字）
  （本メモの needles はすべてこのファイルから一字も変えず抽出）
- 照合先 JSON: `data/raw/325CO0000000245_20261101_508CO0000000083.law.json`
  （flatten テキストに対して raw / 正規化の両方で `.find()` FOUND を確認済み）

名前空間は `JapanTaxLaw.LocalTaxOrderRate77`（他モジュールと衝突しない独立名前空間）。
`Money := Nat` は `JapanTaxLaw.TaxFinance` を import して利用。

## 1. 追加した def / theorem 一覧

### 実装（`LocalTaxOrderRate77.lean`）— 4 def

| 条文 | 名前 | 内容 |
| --- | --- | --- |
| 9 の 22 | `art9_22Rate` | 原文「百分の九十九」= `⟨99, 100, by decide⟩`（99%） |
| 35 の 4 の 5 | `art35_4_5Rate` | 原文「百分の七・七」= `⟨77, 1000, by decide⟩`（7.7% = **77/1000**） |
| 9 の 22 | `art9_22Tax` | 税額 = 課税標準 × 99/100（`art9_22Rate.applyFloor`、切り捨て） |
| 35 の 4 の 5 | `art35_4_5Tax` | 税額 = 課税標準 × 77/1000（`art35_4_5Rate.applyFloor`、切り捨て） |

theorem 8 本（いずれもモデル性質のみ）:

- `art9_22Rate_numDen` / `art35_4_5Rate_numDen`（rfl）
- `art9_22Rate_den_pos` / `art35_4_5Rate_den_pos`（by decide）
- `art9_22Tax_eq` / `art35_4_5Tax_eq`（rfl）
- `art9_22Tax_mono` / `art35_4_5Tax_mono`（caller-established な課税標準について単調）

kernel-decide の `example` は実装 19 件・Spec 19 件（内 agree 4 件）・Tests 23 件の計 **61 件**。

⚠ **10 倍過大バグの防止**: 「百分の七・七」は 7.7% = 77/1000 であり、770/1000（77%）ではない。
十進「七・七」を 10 分の単位で保持すると 7×10+7 = 77、これを 100 で割って 77/1000 となる。
smoke で **base = 1000 → 77** を明示的に確認している（770 でないことの否定 example も併設）。

### 独立定式（`LocalTaxOrderRate77Spec.lean`）— 9 def（spec 5 + agree 4）

| 名前 | 内容 |
| --- | --- |
| `specArt9Rate` | (99, 100)（独立整数定式） |
| `specPercent77Tenths` | 7×10+7 = 77（十進「七・七」を 10 分単位で保持） |
| `specArt35Rate` | (77, 1000)。`(770, 1000)` ではないことを明示的に否定 |
| `specArt9Tax` | `99 * base / 100`（impl と乗法順を入れ替えた独立式） |
| `specArt35Tax` | `77 * base / 1000`（impl と乗法順を入れ替えた独立式） |
| `agreeArt9Rate` | 実装 ≡ spec（numDen、`by decide`） |
| `agreeArt35Rate` | 実装 ≡ spec（numDen、`by decide`） |
| `agreeArt9Tax` | 実装 ≡ spec（税額、9 点、`by decide`） |
| `agreeArt35Tax` | 実装 ≡ spec（税額、9 点、`by decide`） |

### 退行テスト（`LocalTaxOrderRate77Tests.lean`）

`example : ... := by decide` の kernel-decide smoke 23 件。境界: 0、1、1000、端数
（99/100 側: 100 / 101 / 999 / 10,000、77/1000 側: 12 / 13 / 999 / 2000 / 10,000）。
特に `art35_4_5Tax 1000 = 77` および `≠ 770` を検証し、10 倍過大バグを検出できるようにしている。

### doc-comment に明記した射程

- 課税標準、法第七十一条の六十七第一項・法第七十二条の七十六の適用該当性は**すべて caller-established**。
  法的判断は自動化していない。**Bool は算定式に入れていない**。
- 端数処理は `TaxRate.applyFloor`（切り捨て）に委ねる。原文に丸め細目の明記はなく、
  他モジュールと同じ慣例を採用したことを明示済み。
- `agree*` は定数同士の `==` 一致確認であり、法的意味の等価証明ではない。
  転記監査は fidelity-only（原文 bytes との一致確認）であり法的正しさを保証しない。

## 2. 転記監査に追加すべき check（JSON 断片）

`scripts/ci/transcription_audit.py` の `checks()` に追加する check の JSON 表現です
（`law_id` / `kind` / `title` / `needles` の 4 キー）。needle 文字列は原文の一字一句です。
**文字正規化・全角／半角変換・異体字変換を行わず、そのまま移してください。**
全 needle は全文（57 / 53 文字）で、**全角空白 U+3000 を含みません**。

```json
{
  "law_id": "325CO0000000245",
  "kind": "file",
  "title": null,
  "needles": [
    "（法第七十一条の六十七第一項の率）第九条の二十二法第七十一条の六十七第一項の政令で定める率は、百分の九十九とする。",
    "（法第七十二条の七十六の率）第三十五条の四の五法第七十二条の七十六の政令で定める率は、百分の七・七とする。"
  ]
}
```

参考変換例:

```python
yield ("地方税法施行令 9の22（百分の九十九）・35の4の5（百分の七・七）↔ LocalTaxOrderRate77.lean",
       "325CO0000000245",
       "file", None,
       [ ...上記 needles 2 本を一字も変えずに列挙... ])
```

## 3. 期待 literal 増分

- 新規 check **2 needles** なので **+2**。
- `docs/PROGRESS.md` の監査 literal 総数はメインセッションが再確認して加算してください
  （起点値は本メモでは書きません）。

## 4. 検証結果（すべて本セッションで実行済み）

- `lake build JapanTaxLaw.LocalTaxOrderRate77 JapanTaxLaw.LocalTaxOrderRate77Spec JapanTaxLaw.LocalTaxOrderRate77Tests`
  → **成功（5 jobs、warning なし）**。※全体ビルド／CI／`run_python_gates.py` は実行していません。
- `python scripts/ci/check_no_sorry.py` →
  `no forbidden placeholder proofs found in tracked Lean sources`。
  （新規 3 ファイルは未追跡のため走査対象外ですが、人力でも `sorry` / `admit` はありません。）
- `#print axioms`（一時ファイル `WAI_AxiomProbe.lean` を approved temp dir に作成、
  `lake env lean` で実行後 **削除済み**）:
  - 新规定数 **12 本**（theorem 8 + agree def 4）を検査。**`Classical.choice` も `sorryAx` も一切なし**。
  - 10 本は `does not depend on any axioms`。
  - 2 本（`art9_22Tax_mono` / `art35_4_5Tax_mono`）は `propext` に依存
    （repo 通常パターン、許容範囲）。
- 原文逐語検証: **2/2 FOUND、MISS 0 件**（§5）。pinned JSON の flatten テキストが
  L3/L4 ファイルと一致することも raw / 正規化の両方で確認済み。

## 5. 逐語検証 FOUND / MISS 一覧（一字も変更せず）

pinned JSON の flatten テキストをそのまま haystack とし、needle も同じ文字列で Python
`.find()` を実行。`norm@` は `re.sub(r"[\s　]+", "", ...)` 正規化后的 offset
（transcription_audit.py の `contains()` と同一条件）、`raw@` は未正規化テキスト上の offset。

| # | 条文 | len | 全角空白 | raw@ | norm@ | 結果 |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | 9 の 22（百分の九十九） | 57 | なし | 118968 | 118933 | **FOUND** |
| 2 | 35 の 4 の 5（百分の七・七） | 53 | なし | 180588 | 180552 | **FOUND** |

- **FOUND 2 / MISS 0**。needle の勝手な変更・正規化・文字変換はしていません。
- MISS が出ていた場合はここで作業を止めて報告する手順でしたが、該当なしです。

## 6. README / PROGRESS に足す 1 行文案

CROSS_LAW の scan/pin 件数や監査 literal 総数はメインセッションが計算するため、ここでは書きません。

- **README.md**（モジュール一覧の該当付近に追加）:
  ```text
  JapanTaxLaw/LocalTaxOrderRate77.lean / -Spec.lean / -Tests.lean  # 地方税法施行令 第9条の22（百分の九十九 = 99/100）・第35条の4の5（百分の七・七 = 7.7% = 77/1000、10倍過大の770/1000ではない）の L4 計算スライス・独立整数定式・退行テスト。課税標準・該当性は caller-established、丸めは切り捨て
  ```
- **docs/PROGRESS.md**（L4 着手済みモジュール一覧の末尾に追記）:
  ```text
  地方税法施行令 第9条の22（LocalTaxOrderRate77.lean：税額 = 課税標準 × 99/100）・第35条の4の5（同モジュール：税額 = 課税標準 × 77/1000、百分の七・七 = 7.7% を 77/1000 と整数化、base=1000 → 77 を smoke 確認。課税標準・該当性は caller-established、丸めは TaxRate.applyFloor 切り捨て）
  ```

## 7. インテグレーターへの明示事項

**インテグレーターは `JapanTaxLaw.lean` に以下の 3 つの import を追加すること。**

```lean
import JapanTaxLaw.LocalTaxOrderRate77
import JapanTaxLaw.LocalTaxOrderRate77Spec
import JapanTaxLaw.LocalTaxOrderRate77Tests
```

（W-AI は `JapanTaxLaw.lean` を書き換えていません。メインが統合してください。）

## 8. 範囲・残ブロッカーの正直な申告

- これは **L4 のごく小さなスライス**です。**完成・網羅を主張しません**。
- 対象は 2 条文が定める税率（99/100 と 77/1000）と、それを課税標準に乗じる算術のみです。
  各税率が実際に適用される税目・課税標準の算定・適用判定は NOT YET COVERED（すべて caller-established）。
- 端数処理は原文に明記がないため `TaxRate.applyFloor`（切り捨て）を採用した（per-law business data）。
- `agree*` は定数同士の `==` 一致確認であり、法的意味の等価証明ではありません。
- 転記監査は fidelity-only（原文 bytes との一致確認）であり、法的正しさを保証しません。
- **L7 候補 3,438 件は unreviewed のまま**です（本スライスでは一切レビューしていません）。
- 残ブロッカー: 転記監査 check の `checks()` への組み込み（§2、+2）、`JapanTaxLaw.lean` への
  import 追加（§7）、README / PROGRESS の 1 行追記（§6）、および全体ビルド・CI ゲートの
  実行は**すべてメインセッションの担当**です（W-AI は実行していません）。
