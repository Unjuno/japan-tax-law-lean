import JapanTaxLaw.TobaccoRatePerThousand

/-
# TobaccoRatePerThousandSpec — independent integer restatement of 千本につき六千八百二円

Pinned source: law 359AC0000000072, revision 359AC0000000072_20260525_506AC0000000052.
Independent restatement: 6802 円 per 1000 本,
たばこ税額 = たばこの本数 × 6802 ÷ 1000 (Nat floor division).
This module owns its own `specRate`, `specUnit`, `specTax`; no implementation
identifier (ratePerThousand / unitCount / taxFor) occurs in any independent
formula. The only bridges are the kernel-checked `agreeRate`, `agreeUnit`,
`agreeTax` below, each a pure `unfold ... ; rfl`.
-/

namespace JapanTaxLaw.TobaccoRatePerThousand

/-- Independent 六千八百二 rate = 6802. -/
def specRate : Nat := 6802

/-- Independent 千 unit count = 1000. -/
def specUnit : Nat := 1000

/-- Independent tax formula: cigarettes * 6802 / 1000 (Nat floor division). -/
def specTax (cigarettes : Nat) : Nat :=
  cigarettes * specRate / specUnit

/-- Bridge: statutory rate equals independent rate. -/
theorem agreeRate : ratePerThousand = specRate := by unfold ratePerThousand specRate; rfl

/-- Bridge: statutory unit count equals independent unit count. -/
theorem agreeUnit : unitCount = specUnit := by unfold unitCount specUnit; rfl

/-- Bridge: the two formulas agree for every count (all constants occur in the body). -/
theorem agreeTax (cigarettes : Nat) : taxFor cigarettes = specTax cigarettes := by
  unfold taxFor specTax ratePerThousand specRate unitCount specUnit
  rfl

end JapanTaxLaw.TobaccoRatePerThousand
