import JapanTaxLaw.RankedAmountCountTen

/-
# RankedAmountCountTenSpec — independent spec for 高額適用額 第六条

Pinned source:
  Law id: 422M60000040022
  Revision: 422M60000040022_20260731_508M60000040041
  Raw snapshot: data/raw/422M60000040022_20260731_508M60000040041.law.json
  sha256: 950d67e96e5219efae8f4540695ec98dc7caf97c460fa0812ffe118d90cb4472
  Statutory article: 第六条 (art. 6; raw JSON Article attr.Num = "6").
  原文逐語: 「この場合において、同号に規定する高額適用額は、その順位を付した適用額が十以上となるまでの適用額に順位を付した場合の第一順位から当該十以上となる順位までに該当する各適用額（第一順位の適用額が十以上となるときは、当該第一順位の適用額）とする。」

INDEPENDENT FORMULATION. This module owns its own statutory constant
`specCutoff : Nat := 10` (十 = 10) and its own formula `specReaches`.
No implementation identifier (rankCutoff / reachesCutoff) occurs in any
independent definition. The only links to the implementation are the
universal kernel-checked bridges agreeCutoff / agreeReaches, each a pure
`unfold ... ; rfl`. Out of scope, as in the impl: the ranking procedure,
amount computation, 同号 definition and all other provisions.
-/

namespace JapanTaxLaw.RankedAmountCountTen

/-- Independent 十 = 10. -/
def specCutoff : Nat := 10

/-- Independent 十以上判定: n >= 10, INCLUSIVE at 10. -/
def specReaches (n : Nat) : Bool :=
  decide (specCutoff <= n)

/-- Bridge: the two cutoff constants coincide (pure unfold / rfl). -/
theorem agreeCutoff : rankCutoff = specCutoff := by
  unfold rankCutoff specCutoff
  rfl

/-- Bridge: both 十以上 predicates coincide for every Nat input. -/
theorem agreeReaches (n : Nat) : reachesCutoff n = specReaches n := by
  unfold reachesCutoff specReaches rankCutoff specCutoff
  rfl

-- Spec-local, kernel-decided spot checks (scaffolding, not the statutory formula).
example : specCutoff = 10 := by decide
example : specReaches 0 = false := by decide
example : specReaches 9 = false := by decide
example : specReaches 10 = true := by decide
example : specReaches 11 = true := by decide
example : specReaches 20 = true := by decide

end JapanTaxLaw.RankedAmountCountTen
