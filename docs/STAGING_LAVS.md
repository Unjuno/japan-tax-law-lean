# STAGING — LAVS（地方税法 art. 72の20 付加価値割の課税標準）受け渡しメモ

> 実装担当 LAVS からメインセッション（統合担当）への受け渡し用。
> ブランチ操作・add/commit/push/merge は一切していません。
> 書き換えたのは下記 4 ファイルのみです（他は読み取り専用）。

## 0. 対象ファイル / pinned source

| ファイル | 状態 |
| --- | --- |
| `JapanTaxLaw/LocalAddedValueStandard.lean` | 新規 |
| `JapanTaxLaw/LocalAddedValueStandardSpec.lean` | 新規 |
| `JapanTaxLaw/LocalAddedValueStandardTests.lean` | 新規 |
| `docs/STAGING_LAVS.md` | 新規（本ファイル） |

pinned source: `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`
law id `325AC0000000226` / revision `325AC0000000226_20261101_508AC0000000002`
amendment enforcement date `2026-11-01`（他の地方税法モジュールと同一ピン、
revision status `CurrentEnforced`）。

担当範囲原文: `C:\Users\junny\AppData\Local\Temp\opencode\C3_addedvalue.txt`
（第七十二条の二十、UTF-8、469 文字。原文本文には全角空白 U+3000 なし）。
本モジュールの doc-comment に引用した 5 本の needle は、この原文から一字も変えず
抽出し、pinned JSON の `law_full_text` 平坦化テキストとも逐語一致を確認済みです。

Namespace: `JapanTaxLaw.LocalAddedValueStandard`（専用サブ名前空間。他ワーカー／
既存モジュールと衝突しません）。`open JapanTaxLaw.TaxFinance`（`Money = Nat`）。

## 1. 追加した宣言一覧

### 1.1 `LocalAddedValueStandard.lean`（namespace `JapanTaxLaw.LocalAddedValueStandard`）

def（3 本）:

- `salaryRatioExceeds70 (distribution salary : Money) : Bool` —
  第1項の適用判定「報酬給与額の占める割合が百分の七十を超える」。
  `decide (salary * 100 > 70 * distribution)`（交差掛け。除算を避けるため
  `distribution = 0` でも安全）。境界は「ちょうど 70% → false／70% 超 → true」
  （原文「超える」は厳密不等式）。
- `employmentStabilityDeduction (distribution salary : Money) : Money` —
  第2項の雇用安定控除額 = `salary - distribution * 70 / 100`
  （報酬給与額 − 収益配分額 × 百分の七十。`Nat` の飽和減算）。
- `addedValueStandard (addedValue deduction : Money) : Money` —
  第1項の課税標準 = `addedValue - deduction`
  （付加価値額〔前条の控除後〕− 雇用安定控除額。`Nat` の飽和減算）。

theorem（6 本、いずれもモデルの性質のみ）:

- `salaryRatioExceeds70_eq` — 判定式の `rfl`。
- `salaryRatioExceeds70_true_iff` — `= true ↔ salary * 100 > 70 * distribution`。
- `employmentStabilityDeduction_eq` — 控除式の `rfl`。
- `employmentStabilityDeduction_le_salary` — 控除額 ≤ 報酬給与額（飽和減算）。
- `addedValueStandard_eq` — 課税標準式の `rfl`。
- `addedValueStandard_le_addedValue` — 課税標準 ≤ 付加価値額（飽和減算）。

kernel-decide smoke（15 件）: 70% 境界（100/70→false、100/71→true、100/69→false、
1000/700→false、1000/701→true）、`distribution = 0`（0/0→false、0/1→true）、
雇用安定控除額（100/71→1、100/70→0、0/50→50、100/10→0 で飽和）、
課税標準（1000−70→930、50−100→0、0−1→0）、合成（1000 − 控除(100,71) → 999）。

### 1.2 `LocalAddedValueStandardSpec.lean`（独立整数定式）

def（6 本）:

- `specSalaryRatioExceeds70` = `decide (70 * distribution < salary * 100)`
  （impl の両辺を入れ替え `>` を `<` にした独立定式）。
- `specEmploymentStabilityDeduction` = `salary - distribution * 7 / 10`
  （百分の七十を十分の七に約分した独立定式）。
- `specAddedValueStandard` =
  `if deduction ≤ addedValue then addedValue - deduction else 0`
  （Nat の飽和減算を条件分岐で書き下した独立定式）。
- `agreeSalaryRatioExceeds70` / `agreeEmploymentStabilityDeduction` /
  `agreeAddedValueStandard` — 有限サンプル上の `==` 一致確認。

example（13 件）: 境界点・代表点・3 本の `agree... = true`（すべて `by decide`）。

### 1.3 `LocalAddedValueStandardTests.lean`（回帰スモーク）

`example := by decide` のみ（20 件。新規定理名なし）。
ちょうど 70%／70% 超／70% 未満の境界、収益配分額零、
控除すべき額 > 報酬給与額（飽和）、控除額 > 付加価値額（飽和）、
第1項・第2項の合成を確認。

**合計: def 9 本、theorem 6 本（名前付き宣言 15 本）、`by decide` の example 48 本。**

## 2. 転記監査に追加すべき check（JSON 断片）

`scripts/ci/transcription_audit.py` の `checks()` に追加する check の JSON 表現です
（`law_id` / `kind` / `title` / `needles` の 4 キー）。needle 文字列は一字も変えないこと。
**文字正規化・全角／半角変換・異体字変換を行わず、そのまま移してください。**
各 needle は原文・pinned JSON 正規化テキスト（空白・全角空白除去）上の連続部分そのもので、
両テキストで出現回数 **1**（一意）。全角空白 U+3000 は含まれません。

```json
{
  "law_id": "325AC0000000226",
  "kind": "file",
  "title": null,
  "needles": [
    "当該事業年度の収益配分額のうちに当該事業年度の報酬給与額の占める割合が百分の七十を超える法人の付加価値割の課税標準の算定については、",
    "当該事業年度の付加価値額（前条の規定により控除すべき金額があるときは、これを控除した後の金額とする。）から雇用安定控除額を控除するものとする。",
    "前項の雇用安定控除額は、当該事業年度の報酬給与額から当該事業年度の収益配分額に百分の七十の割合を乗じて得た金額を控除した金額とする。",
    "前二項の当該事業年度の収益配分額又は報酬給与額は、特定内国法人にあつては当該特定内国法人の事業の収益配分額又は報酬給与額の総額からこの法律の施行地外の事業に帰属する収益配分額又は報酬給与額を、それぞれ控除して得た額とする。",
    "この場合において、当該特定内国法人について前条後段の規定の適用があるときは、政令で定めるところにより計算した金額をもつて、当該特定内国法人のこの法律の施行地外の事業に帰属する収益配分額又は報酬給与額とみなす。"
  ]
}
```

現行 `transcription_audit.py` は `yield (name, law_id, kind, title, [needles])` 形式なので、
統合時は上記 5 本をそのタプルへ移してください（needle 文字列は一字も変えないこと）。

## 3. 検証結果（すべて本セッションで実行済み）

- `lake build JapanTaxLaw.LocalAddedValueStandard JapanTaxLaw.LocalAddedValueStandardSpec JapanTaxLaw.LocalAddedValueStandardTests`
  → **成功（5 jobs、warning なし）**。※自作 3 モジュールのみビルド（全体ビルド／CI／
  `run_python_gates.py` は実行していません）。
- `python scripts/ci/check_no_sorry.py` →
  `no forbidden placeholder proofs found in tracked Lean sources`。
  （新規 3 ファイルは未追跡のため走査対象外ですが、同一語彙で個別走査し、
  `sorry` / `admit` が **0 件**であることを別途確認済み。）
- `#print axioms`（一時ファイル `LAVS_AxiomProbe.lean` を approved temp dir に作成、
  `lake env lean` で実行後 **削除済み**）:
  - 走査した名前付き宣言 **15 本**（impl def 3 + theorem 6 + Spec def 6）。
  - **14 本が `does not depend on any axioms`**、
    `salaryRatioExceeds70_true_iff` のみ **`propext` のみ**（`simp` 由来。許可扱い）。
  - **`Classical.choice` も `sorryAx` も一切なし**。
- 原文逐語検証（needle を `re.sub(r"[\s\u3000]+", "", ...)` 正規化テキストに対して
  Python `.find()` / `.count()`）:
  - 担当範囲原文 `C3_addedvalue.txt`（469 文字、正規化後も 469 文字）:
    **5/5 FOUND、MISS 0 件**、各出現回数 1。
  - pinned JSON `law_full_text` の平坦化・正規化テキスト:
    **5/5 FOUND、MISS 0 件**、各出現回数 1。
  - 参考: 原文本文（正規化後 469 文字）は pinned JSON 正規化文字列の
    offset 239396 からそのまま一致（469 文字すべて逐語一致）。
    条文 `第七十二条の二十` は `MainProvision` 配下に **1 件**のみ。
  - law id `325AC0000000226` / revision `325AC0000000226_20261101_508AC0000000002` 一致確認済み。
  - 一時検証スクリプト・出力・axiom probe はすべて削除済み。

## 4. 逐語 FOUND / MISS 一覧（一字も変更せず）

| # | 区分 | len | 原文@/count | JSON@/count | 結果 |
| --- | --- | --- | --- | --- | --- |
| 1 | 1項 70%超の判定 | 66 | 49/1 | 239445/1 | FOUND |
| 2 | 1項 前条控除後・雇用安定控除額 | 71 | 115/1 | 239511/1 | FOUND |
| 3 | 2項 雇用安定控除額 | 66 | 187/1 | 239583/1 | FOUND |
| 4 | 3項 国外事業分の控除 | 111 | 254/1 | 239650/1 | FOUND |
| 5 | 3項 政令みなし額 | 104 | 365/1 | 239761/1 | FOUND |

**FOUND 5 / MISS 0**（両テキストで出現回数 1、一意）。
旧仮名遣い `あつては` / `もつて` や `控除すべき金額があるときは` 等も保持し、
アンカーの勝手な変更・正規化・文字変換はしていません。

## 5. README / PROGRESS に足す 1 行文案

- **README.md**（モジュール一覧の末尾付近に追加）:
  ```text
  JapanTaxLaw/LocalAddedValueStandard.lean / -Spec.lean / -Tests.lean  # 地方税法 art. 72の20（報酬給与額が収益配分額の70%超の法人の付加価値割課税標準＝付加価値額−雇用安定控除額）L4 モデル・独立定式・退行テスト
  ```
- **docs/PROGRESS.md**（L4 着手済みモジュール一覧の末尾に追記）:
  ```text
  地方税法 art. 72の20（LocalAddedValueStandard.lean：70%超判定を salary*100>70*distribution の交差掛けで、雇用安定控除額を salary-distribution*70/100、課税標準を addedValue-deduction の飽和減算でモデル化。前条控除額・付加価値額・報酬給与額・収益配分額・該当性は caller-established、3項の政令みなし額は NOT MODELLED）
  ```

## 6. インテグレーターへの明示事項

**インテグレーターは `JapanTaxLaw.lean` に以下の 3 つの import を追加すること。**

```lean
import JapanTaxLaw.LocalAddedValueStandard
import JapanTaxLaw.LocalAddedValueStandardSpec
import JapanTaxLaw.LocalAddedValueStandardTests
```

（他ワーカーの 3 件ずつと併せてメインが行数を確認してください。
LAVS は `JapanTaxLaw.lean` を書き換えていません。他ワーカーのファイルには触れていません。）

## 7. NOT MODELLED の理由（3項・政令みなし額）

第3項後段は「前条後段の規定の適用があるときは、**政令で定めるところにより計算した金額**
をもつて、…施行地外の事業に帰属する収益配分額又は報酬給与額とみなす」と規定しますが、
その**具体的な計算方法は当該条文（pinned 原文）に存在せず、政令に委譲**されています。
したがって pinned source から一字も誤らず転記できる金額算式がなく、
本スライドでは **NOT MODELLED** としました（推測による式の追加はしていません）。
併せて、特定内国法人の国外事業に帰属する収益配分額・報酬給与額の額、
および前条後段の規定の適用の有無は **caller-established** とし、Bool を金額式には
入れていません。3項前段の「総額から施行地外の事業分を控除して得た額」についても、
その額の認定は caller-established で、本モデルは控除後の値を入力として受け取ります。

## 8. 範囲・残ブロッカーの正直な申告（最終報告）

- **build**: 自作 3 モジュールのみ `lake build` 成功（5 jobs / warning なし）。
  全体ビルド・CI・`run_python_gates.py` は未実行です。
- **axiom**: 走査 15 本（impl def 3 + theorem 6 + Spec def 6）、
  `Classical.choice` / `sorryAx` なし。14 本 axiom-free、
  1 本（`salaryRatioExceeds70_true_iff`）は `propext` のみ。一時ファイルは削除済み。
- **逐語**: FOUND 5 / MISS 0（担当範囲原文・pinned JSON の両方、出現回数 1）。
- **def 数**: def 9（impl 3 + Spec 6）+ theorem 6 = **名前付き宣言 15**
  （＋ `by decide` の example 48 件。Tests は新規定理名なし）。
- **STAGING**: 本ファイル `docs/STAGING_LAVS.md` を作成済みです。
- これは **L4 のごく小さなスライド**です。**完成・網羅を主張しません**。
- 担当は地方税法 **art. 72の20 のみ**。前条（art. 72の19）の控除額・付加価値額の
  算定手続、事業年度の確定、他の条文、政令・省令の詳細は **NOT YET COVERED**。
- 70% 超判定・雇用安定控除額・課税標準の各金額は「超える」境界・飽和減算を含む
  算術モデルであり、法的な該当性判断・認定は行っていません。
- `agree*` は有限サンプル上の `==` 一致確認であり、全入力域での等価証明ではありません。
- 転記監査は fidelity-only（原文 bytes との一致確認）であり、法的正しさを保証しません。
- **L7 候補 3,438 件は LEGAL_REVIEW_PENDING / unreviewed のまま**です
  （本スライドでは一切レビューしていません）。
- 残ブロッカー: 転記監査 check の `checks()` への組み込み（§2、+5 needles）、
  `JapanTaxLaw.lean` への import 追加（§6）、README / PROGRESS の 1 行追記（§5）、
  および全体ビルド・CI ゲートの実行は**すべてメインセッションの担当**です
  （LAVS は実行していません）。
