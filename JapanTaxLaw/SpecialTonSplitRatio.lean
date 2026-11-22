import JapanTaxLaw.TaxFinance

/-
# SpecialTonSplitRatio — 特別とん税法 第五条（特別とん税ととん税の按分）の L4 モデル

Sources (pinned):
  Law id: 332AC0000000038
  Revision: 332AC0000000038_20250601_504AC0000000068
  Amendment enforcement date: 2025-06-01
  Raw snapshot: data/raw/332AC0000000038_20250601_504AC0000000068.law.json
  sha256: 5bfed8c6c85b2803e3987df079cb731532df32b2f2bce061afd1ab2e255c9669
  Statutory article: 第五条 (raw JSON Article attr.Num = "5"; structure hit 1)
  (revision CurrentEnforced per data/INVENTORY.json; law_type=Act; 特別とん税法)

原文逐語（pinned, 一字一句改変なし; doc-comment only）:
  art. 5
    「特別とん税及びとん税の納付があつたときは、その納付に係る金額の三十六分の二十に相当する税額の特別とん税及び三十六分の十六に相当する税額のとん税の納付があつたものとする。」

Modelled (ONLY the explicit split-ratio structure):
  納付に係る金額 amount を 2 つの税額に按分する:
    - 特別とん税の税額 = 三十六分の二十 = amount * 20 / 36
    - とん税の税額     = 三十六分の十六 = amount * 16 / 36
  二十 + 十六 = 三十六 (20 + 16 = 36): 2 つの分子は共通分母 36 の分割
  (partition of unity)。

Variable contract:
  `amount : Nat`            = 納付に係る金額 (単位 円, whole yen).
  `specialShare amount`     = 三十六分の二十に相当する税額の特別とん税 (円, Nat).
  `tonShare amount`         = 三十六分の十六に相当する税額のとん税 (円, Nat).
  割算は Nat の厳密整数除算 (exact integer division)。

BY-DESIGN scoping assumption:
  本モデルは amount が 36 で割り切れる場合 (36 | amount) にのみ完全性を主張する。
  三十六分の二十・三十六分の十六はいずれも整数になるため、割り切れる金額では
    specialShare amount + tonShare amount = amount
  が成立する (exact partition)。36 で割り切れない金額では Nat の切り捨てにより
  端数が生じ、この等式は一般には成り立たない。当該端数処理は原文が明示しないため
  NOT MODELLED; 入力が 36 の倍数であることは caller-established (BY-DESIGN)。

Scope & honest boundaries:
  按分比率の明示的な数値構造 (36 / 20 / 16) のみをモデル化する。納付の事実認定、
  納付金額の算定、申告・納付手続、他の条文（第一条〜第四条等）は NOT MODELLED。
  転記監査は fidelity-only であり法的正しさを保証しない。

Pinned evidence in doc-comments only; all theorems claim model properties only.
All arithmetic is total Nat. No `sorry`, `admit`, `axiom`, `Classical.choice`, `omega`.
-/

namespace JapanTaxLaw.SpecialTonSplitRatio

/-- 三十六 — the common denominator of the split. -/
def splitDenominator : Nat := 36

/-- 二十 — the 特別とん税 numerator. -/
def specialNum : Nat := 20

/-- 十六 — the とん税 numerator. -/
def tonNum : Nat := 16

/-- 二十 + 十六 = 三十六 (partition of unity). -/
def splitComplete : Bool := decide (specialNum + tonNum == splitDenominator)

/-- 三十六分の二十に相当する税額の特別とん税。 -/
def specialShare (amount : Nat) : Nat := amount * specialNum / splitDenominator

/-- 三十六分の十六に相当する税額のとん税。 -/
def tonShare (amount : Nat) : Nat := amount * tonNum / splitDenominator

-- ==== verified constants (by rfl) ====

theorem splitDenominator_value : splitDenominator = 36 := rfl
theorem specialNum_value : specialNum = 20 := rfl
theorem tonNum_value : tonNum = 16 := rfl

-- ==== kernel-decided facts ====

theorem splitComplete_true : splitComplete = true := by decide

theorem specialShare360 : specialShare 360 = 200 := by decide
theorem tonShare360 : tonShare 360 = 160 := by decide
theorem sharesSum360 : specialShare 360 + tonShare 360 = 360 := by decide

theorem specialShare36 : specialShare 36 = 20 := by decide
theorem tonShare36 : tonShare 36 = 16 := by decide

end JapanTaxLaw.SpecialTonSplitRatio
