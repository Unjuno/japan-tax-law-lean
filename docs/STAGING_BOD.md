# STAGING — BOD（地方税法 art. 72の49の14「事業主控除」）受け渡しメモ

> 実装ワーカー BOD からメインセッション（統合担当）への受け渡し用。
> commit / push / merge / ブランチ切替は一切していません。
> 本タスクで書き換えたのは下記 4 ファイルのみです（他は読み取り専用）。

## 0. 対象ファイル

| ファイル | 状態 |
| --- | --- |
| `JapanTaxLaw/BusinessOwnerDeduction.lean` | 新規 |
| `JapanTaxLaw/BusinessOwnerDeductionSpec.lean` | 新規 |
| `JapanTaxLaw/BusinessOwnerDeductionTests.lean` | 新規 |
| `docs/STAGING_BOD.md` | 新規（本ファイル） |

pinned source:

- law id `325AC0000000226`（地方税法）
- revision `325AC0000000226_20261101_508AC0000000002`
- Amendment enforcement date: 2026-11-01
- 担当範囲原文: `C:\Users\junny\AppData\Local\Temp\opencode\C4_business.txt`（art. 72の49の14、UTF-8、約 186 文字）
- 照合先 JSON: `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`

名前空間は `JapanTaxLaw.BusinessOwnerDeduction`（他モジュールと衝突しない独立名前空間）。
`Money := Nat` は `JapanTaxLaw.TaxFinance` を import して利用。

### 月数・該当性の caller-established 明記

- **月数の丸めは caller-established**。第3項「前項の月数は、暦に従い計算し、一月に満たない
  端数を生じたときは、一月とする」の丸め（applyFloor 相当）は**呼出側が行い**、丸め済みの
  月数を本モデルへ渡す。本モデルは月数の算定自体を行わない。テストの `months = 0` は
  モデル上の境界確認のみで、呼出側が渡すべき値ではない（1 未満の端数は 1 に丸められる）。
- 「事業を行う個人であるか」の該当性および事業所得額そのものの算定も **caller-established**。
  Bool は金額式に入れていない。本モデルは控除額のみを扱う。

## 1. 追加した def / theorem 一覧

### 実装（`BusinessOwnerDeduction.lean`）— 3 def + 9 theorem

| 区分名 | 名前 | 内容 |
| --- | --- | --- |
| art. 72の49の14(1) | `businessOwnerDeductionFull` | 年額「二百九十万円」= `2_900_000 : Money` |
| art. 72の49の14(2) | `monthlyBusinessDeduction` | `businessOwnerDeductionFull * months / 12`（原文の乗算先行、Nat 除算で端数切り捨て） |
| art. 72の49の14(1)(2) | `businessOwnerDeduction` | `if months < 12 then monthlyBusinessDeduction months else businessOwnerDeductionFull` |

theorem 9 本（モデル性質のみ）:

- `businessOwnerDeductionFull_pos`（by decide）/ `businessOwnerDeductionFull_value`（by decide）
- `monthlyBusinessDeduction_mono`（月数について単調非減）
- `monthlyBusinessDeduction_le_full`（月数 ≤ 12 なら月割 ≤ 年額）
- `monthlyBusinessDeduction_one`（`1 → 241_666`、端数 8 を切り捨て）/ `monthlyBusinessDeduction_twelve`（`12 → 年額`）
- `businessOwnerDeduction_of_lt_twelve` / `businessOwnerDeduction_of_ge_twelve`（分岐の characterization）
- `businessOwnerDeduction_le_full`（控除額は常に年額以下）

kernel-decide の `example`: 実装 10 件・Spec 11 件（内 agree 1 件）・Tests 18 件の計 **39 件**
（これとは別に impl の theorem 4 件が `by decide`）。境界: 0、1、11、12、13、24 と端数
（1 / 2 / 5 / 7 / 11 か月は 12 で割り切れず切り捨てが発生）。

### 独立定式（`BusinessOwnerDeductionSpec.lean`）— 4 def

| 名前 | 内容 |
| --- | --- |
| `specFull` | `2_900_000`（impl 定数を参照しない裸の整数リテラル） |
| `specMonthly` | `months * 2_900_000 / 12`（impl と乗法順を入れ替えた独立式） |
| `specDeduction` | `if 12 ≤ months then specFull else specMonthly months`（impl の分岐条件を反転表現） |
| `agreeBusinessOwnerDeduction` | impl ≡ spec（年額・月割・控除額、10 点の有限グリッド、`by decide`） |

### 退行テスト（`BusinessOwnerDeductionTests.lean`）

`example : ... := by decide` の kernel-decide smoke 18 件。境界 0 / 1 / 11 / 12 / 13 / 24
と端数切り捨て（241_666 / 483_333 / 1_208_333 / 1_691_666 / 2_658_333）、
年額較（11 ≤ 12、12 = 13）を確認。

### doc-comment に明記した射程

- 月数（3項の丸めを含む）、事業を行う個人であるかの該当性、事業所得額はすべて
  **caller-established**。Bool は金額式に混入させていない。
- 2項の算式は原文「二百九十万円に…月数を乗じて得た額を十二で除して」に従い
  **乗算先行**（`full * months / 12`）。端数は Nat 除算で切り捨て。
  （法人税法 art. 67(6) の `prorated` は「十二で除し、これに月数を乗じて」という
  **除算先行**であり、文言が異なる。本モジュールは原文どおり乗算先行を採用した。）
- `agree*` は定数値の `==` 一致確認であり、法的意味の等価証明ではない。
- 転記監査は fidelity-only（原文 bytes との一致確認）であり法的正しさを保証しない。

## 2. 転記監査に追加すべき check（JSON 断片）

`scripts/ci/transcription_audit.py` の `checks()` に追加する check の JSON 表現です
（`law_id` / `kind` / `title` / `needles` の 4 キー）。needle 文字列は原文の一字一句です。
**文字正規化・全角／半角変換・異体字変換を行わず、そのまま移してください。**
全 needle は全角空白 U+3000 を含みません。

```json
{
  "law_id": "325AC0000000226",
  "kind": "file",
  "title": null,
  "needles": [
    "事業を行う個人については、当該個人の事業の所得の計算上二百九十万円を控除する。",
    "前項の場合において、事業を行つた期間が一年に満たないときは、同項に規定する控除額は、二百九十万円に当該年において事業を行つた月数を乗じて得た額を十二で除して算定した金額とする。",
    "前項の月数は、暦に従い計算し、一月に満たない端数を生じたときは、一月とする。"
  ]
}
```

参考変換例:

```python
yield ("地方税法 art. 72の49の14（事業主控除）↔ BusinessOwnerDeduction.lean",
       "325AC0000000226",
       "file", None,
       [ ...上記 needles 3 本を一字も変えずに列挙... ])
```

## 3. 期待 literal 増分

- 新規 check **3 needles** なので **+3**。
- `docs/PROGRESS.md` の監査 literal 総数はメインセッションが再確認して加算してください
  （起点値は本メモでは書きません）。

## 4. 検証結果（すべて本セッションで実行済み）

- `lake build JapanTaxLaw.BusinessOwnerDeduction JapanTaxLaw.BusinessOwnerDeductionSpec JapanTaxLaw.BusinessOwnerDeductionTests`
  → **成功（5 jobs、warning なし）**。※全体ビルド／CI／`run_python_gates.py` は実行していません。
- `python scripts/ci/check_no_sorry.py` →
  `no forbidden placeholder proofs found in tracked Lean sources`。
  （新規 3 ファイルは未追跡のため走査対象外ですが、人手でも `sorry` / `admit` はありません。）
- `#print axioms`（一時ファイル `BOD_AxiomProbe.lean` を approved temp dir に作成、
  `lake env lean` で実行後 **削除済み**）:
  - 新規宣言 **16 本**（def 7 + theorem 9）を検査。**`Classical.choice` も `sorryAx` も一切なし**。
  - 13 本は `does not depend on any axioms`。
  - 3 本（`monthlyBusinessDeduction_mono` / `monthlyBusinessDeduction_le_full` /
    `businessOwnerDeduction_le_full`）は core の `Nat.div_le_div_right` /
    `Nat.div_le_of_le_mul` 経由で `propext` に依存（repo 許容範囲、propext 可）。
- 原文逐語検証: **3/3 FOUND、MISS 0 件**（§5）。pinned JSON の flatten テキストが
  原文ファイルと一致することも raw / 正規化の両方で確認済み。

## 5. 逐語検証 FOUND / MISS 一覧（一字も変更せず）

pinned JSON の flatten テキストをそのまま haystack とし、needle も同じ文字列で Python
`.find()` を実行。`norm@` は `re.sub(r"[\s　]+", "", ...)` 正規化後の offset
（transcription_audit.py の `contains()` と同一条件）、`raw@` は未正規化テキスト上の offset。

| # | 原文箇所 | len | 全角空白 | src@ / src count | raw@ / raw count | norm@ / norm count | 結果 |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 1 | 1項 本文 | 39 | なし | 19 / 1 | 319061 / 1 | 318808 / 1 | **FOUND** |
| 2 | 2項 月割 | 88 | なし | 59 / 1 | 319101 / 1 | 318848 / 1 | **FOUND** |
| 3 | 3項 月数丸め | 38 | なし | 148 / 1 | 319190 / 1 | 318937 / 1 | **FOUND** |

- **FOUND 3 / MISS 0**。needle の勝手な変更・正規化・文字変換はしていません。
- MISS が出ていた場合はここで作業を止めて報告する手順でしたが、該当なしです。
- 全 needle は 38〜88 文字の範囲内（39 / 88 / 38）。

## 6. README / PROGRESS に足す 1 行文案

CROSS_LAW の scan/pin 件数や監査 literal 総数はメインセッションが計算するため、ここでは書きません。

- **README.md**（モジュール一覧の該当付近に追加）:
  ```text
  JapanTaxLaw/BusinessOwnerDeduction.lean / -Spec.lean / -Tests.lean  # 地方税法 art.72の49の14（事業主控除）の L4 計算スライス。年額 2_900_000、月割 = 2_900_000 × 月数 ÷ 12（端数切り捨て）。月数 < 12 なら月割、それ以外は年額。月数丸め（1月未満を1月とする）・該当性・事業所得額は caller-established
  ```
- **docs/PROGRESS.md**（L4 着手済みモジュール一覧の末尾に追記）:
  ```text
  地方税法 art.72の49の14（BusinessOwnerDeduction.lean：事業主控除。控除額 = if 月数 < 12 then 2_900_000 × 月数 ÷ 12（切り捨て）else 2_900_000。月数丸めは caller-established（3項「1月未満の端数は1月」を呼出側で applyFloor）、該当性・事業所得額も caller-established、Bool は金額式に入れない）
  ```

## 7. インテグレーターへの明示事項

**インテグレーターは `JapanTaxLaw.lean` に以下の 3 つの import を追加すること。**

```lean
import JapanTaxLaw.BusinessOwnerDeduction
import JapanTaxLaw.BusinessOwnerDeductionSpec
import JapanTaxLaw.BusinessOwnerDeductionTests
```

（BOD は `JapanTaxLaw.lean` を書き換えていません。メインが統合してください。）

## 8. 範囲・残ブロッカーの正直な申告

- これは **L4 のごく小さなスライス**です。**完成・網羅を主張しません**。
- 対象は art. 72の49の14 のうち、事業主控除の**控除額算定**（年額 290 万円、1 年未満の
  月割、端数切り捨て）のみです。
- **NOT MODELLED（明示）**: 月数の暦に従う算定と 1 月未満の端数丸め（3項、caller-established）、
  「事業を行う個人」の該当性判定、事業所得額自体の算定、事業所得の計算への控除の適用、
  他の所得控除との調整・適用順序、確定申告、端数処理（通則法 art. 118 / 119）、
  経過措置・附則は一切モデル化していません。
- 原文 2項は「乗じて得た額を十二で除して」という乗算先行の算式であり、本モデルはそれを
  直読した（除算先行の法人税法 art. 67(6) `prorated` とは文言が異なる）ことを記録します。
- `agree*` は定数値の `==` 一致確認であり、法的意味の等価証明ではありません。
- 転記監査は fidelity-only（原文 bytes との一致確認）であり、法的正しさを保証しません。
- **L7 候補 3,438 件は LEGAL_REVIEW_PENDING（unreviewed）のまま**です（本スライスでは一切レビューしていません）。
- 残ブロッカー: 転記監査 check の `checks()` への組み込み（§2、+3）、`JapanTaxLaw.lean` への
  import 追加（§7）、README / PROGRESS の 1 行追記（§6）、および全体ビルド・CI ゲートの
  実行は**すべてメインセッションの担当**です（BOD は実行していません）。
