import JapanTaxLaw.SpecialTonSplitRatio

/-
# SpecialTonSplitRatioSpec — 特別とん税法 第五条 の独立定式

Sources (pinned; identical to SpecialTonSplitRatio.lean):
  Law id: 332AC0000000038
  Revision: 332AC0000000038_20250601_504AC0000000068
  Raw snapshot: data/raw/332AC0000000038_20250601_504AC0000000068.law.json
  sha256: 5bfed8c6c85b2803e3987df079cb731532df32b2f2bce061afd1ab2e255c9669
  Statutory article: 第五条 (raw JSON Article attr.Num = "5")
  原文逐語: 「特別とん税及びとん税の納付があつたときは、その納付に係る金額の三十六分の二十に相当する税額の特別とん税及び三十六分の十六に相当する税額のとん税の納付があつたものとする。」

INDEPENDENT FORMULATION. This module owns its own statutory constants
`specDenom := 36`, `specSpecialNum := 20`, `specTonNum := 16` and its own
formulas `specSpecialShare` / `specTonShare`, written from the two fractions
三十六分の二十 and 三十六分の十六 independently of the implementation.
No implementation identifier (splitDenominator / specialNum / tonNum /
splitComplete / specialShare / tonShare) occurs in any independent definition.

The bridges below are kernel-checked pure `unfold ... ; rfl` equalities between
the two formulations; they introduce no axioms. Agreement is a finite
structural check of the same deterministic arithmetic, not a legal equivalence
proof. Scope boundaries identical to the implementation: only the explicit
36 / 20 / 16 split is modelled; the divisible-by-36 completeness assumption is
BY-DESIGN and caller-established. 端数処理, 事実認定, 他条文 are NOT MODELLED.
-/

namespace JapanTaxLaw.SpecialTonSplitRatio

/-- Independent 三十六 — the common denominator. -/
def specDenom : Nat := 36

/-- Independent 二十 — the 特別とん税 numerator. -/
def specSpecialNum : Nat := 20

/-- Independent 十六 — the とん税 numerator. -/
def specTonNum : Nat := 16

/-- Independent partition-of-unity sanity check. -/
def specSplitComplete : Bool := decide (specSpecialNum + specTonNum == specDenom)

/-- Independent 三十六分の二十. -/
def specSpecialShare (amount : Nat) : Nat := amount * specSpecialNum / specDenom

/-- Independent 三十六分の十六. -/
def specTonShare (amount : Nat) : Nat := amount * specTonNum / specDenom

-- Spec-local, kernel-decided spot checks (scaffolding, not the statutory formula).
example : specSplitComplete = true := by decide
example : specSpecialShare 36 = 20 := by decide
example : specTonShare 36 = 16 := by decide

-- ==== kernel-checked bridges: pure unfold / rfl ====

theorem agreeDenom : splitDenominator = specDenom := by unfold splitDenominator specDenom; rfl

theorem agreeSpecialNum : specialNum = specSpecialNum := by unfold specialNum specSpecialNum; rfl

theorem agreeTonNum : tonNum = specTonNum := by unfold tonNum specTonNum; rfl

theorem agreeSpecialShare (amount : Nat) : specialShare amount = specSpecialShare amount := by
  unfold specialShare specSpecialShare splitDenominator specDenom specialNum specSpecialNum
  rfl

theorem agreeTonShare (amount : Nat) : tonShare amount = specTonShare amount := by
  unfold tonShare specTonShare splitDenominator specDenom tonNum specTonNum
  rfl

end JapanTaxLaw.SpecialTonSplitRatio
