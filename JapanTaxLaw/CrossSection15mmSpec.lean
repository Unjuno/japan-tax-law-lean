import JapanTaxLaw.CrossSection15mm

/-
# CrossSection15mmSpec — independent spec for 不当廉売関税政令 第一条（横断面寸法）

Pinned source:
  Law id: 504CO0000000372
  Revision: 504CO0000000372_20221208_000000000000000  (current-enforced)
  Raw snapshot: data/raw/504CO0000000372_20221208_000000000000000.law.json
  sha256: 8a24107aeb9a8ae677da410191e847ff53d533744e39ea187e9e8a7f3bc0041a
  Article: 第一条 (raw JSON Article attr.Num = "1")
  原文逐語: 「横断面の最大寸法が一・五ミリメートルを超えるもの」

INDEPENDENT FORMULATION. This module carries its OWN statutory constant
`specThreshold : Nat := 15` (一・五ミリメートル = 1.5 mm = 15 tenths) and
expresses 「超える」 with the SAME strict operator `decide (specThreshold < t)`.
Because both sides use strict `<` with identical constants, the ONLY bridge is
the universal, axiom-free theorem `agreeExceeds`, proved by pure `unfold ... ; rfl`.
No `by_cases`, no `omega`, no `Classical.choice` and no extra axiom is used in
the bridge. No implementation identifier (`dimensionTenths`,
`exceedsCrossSection`) appears in any independent `spec*` formula; the agreement
theorem is not an independent formula.

Variable contract: tenths = 横断面の最大寸法 (Nat, unit 1/10 mm); 超える = STRICT >,
so 15 tenths does not exceed and 16 tenths does.
Not modelled (same as the implementation): goods classes, origin country, import
period, duty rate, the zinc-coating process and all legal determination.
-/

namespace JapanTaxLaw.CrossSection15mm

/-- Spec-local threshold: 一・五ミリメートル = 1.5 mm = 15 tenths (Nat). Independent of the impl. -/
def specThreshold : Nat := 15

/-- Independent 「一・五ミリメートルを超える」: STRICT `specThreshold < t`. -/
def specExceeds (t : Nat) : Bool :=
  decide (specThreshold < t)

/-- Universal, kernel-checked correspondence for every Nat tenths value.
    Pure axiom-free bridge: unfolding both constants leaves definitionally
    identical terms, so `rfl` closes it. No by_cases / omega /
    Classical.choice / extra axiom. -/
theorem agreeExceeds (t : Nat) : exceedsCrossSection t = specExceeds t := by
  unfold exceedsCrossSection specExceeds dimensionTenths specThreshold
  rfl

-- Spec-local, kernel-decided spot-checks (independent of the implementation).
example : specExceeds 0 = false := by decide
example : specExceeds 14 = false := by decide
example : specExceeds 15 = false := by decide
example : specExceeds 16 = true := by decide
example : specExceeds 17 = true := by decide

end JapanTaxLaw.CrossSection15mm
