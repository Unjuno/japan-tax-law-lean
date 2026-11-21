import JapanTaxLaw.NickelContentThreshold

/-
# NickelContentThresholdSpec — independent spec for 508CO0000000254 第一条

Pinned source:
  Law id: 508CO0000000254
  Revision: 508CO0000000254_20260808_000000000000000
  Raw snapshot: data/raw/508CO0000000254_20260808_000000000000000.law.json
  sha256: aed868d547988eef85a4fe851b8e46bb92ea4b237502c20e76a702a1232e72b0
  Article: 第一条 (raw JSON Article attr.Num = "1")
  原文逐語: 「バイメタル（張合せ加工を行ったもので、ニッケルの含有量が全重量の十パーセントを超えるものに限る。）」

INDEPENDENT FORMULATION. This module rests its OWN statutory constant
`specPct : Nat := 10` (十パーセント = 10% = 10/100, independently restated from
第一条) and expresses the strict 「超える」 test as
`decide (total > 0 && specPct * nickel > total)`. The denominator 100 of the
derivation 100 * n > 10 * t ⇔ 10 * n > t is documented in prose, not introduced
as a second spec literal. No implementation identifier appears in any `spec*`
formula.

The ONLY bridge is the universal, axiom-free theorem `agreeExceeds`: after
unfolding the three definitions the two bodies are syntactically identical, so
plain `rfl` closes it. No `by_cases`, no `omega`, no `Classical.choice` is used
in the bridge (the pattern of TaxAccountantFineCap300kSpec / PenaltyCap50kSpec).

Variable contract: nickel = ニッケルの重量 (Nat, same unit as total);
total = 全重量 (Nat); 十パーセント = 10/100; 超える = STRICT `>`; total=0 guard false.
Not modelled (same as the implementation): 張合せ加工, the rest of the bimetal
definition, the provisional duty rate, covered goods, other articles.
-/

namespace JapanTaxLaw.NickelContentThreshold

/-- Spec-local 十パーセント: 10 percent (10/100). Independent of the impl. -/
def specPct : Nat := 10

/-- Independent 「ニッケルの含有量が全重量の十パーセントを超える」 (STRICT >). -/
def specExceeds (nickel total : Nat) : Bool :=
  decide (total > 0 && specPct * nickel > total)

/-- Universal, kernel-checked correspondence for every Nat input.
    Pure `rfl` bridge after unfolding: no by_cases/omega/Classical.choice. -/
theorem agreeExceeds (nickel total : Nat) :
    exceedsNickelThreshold nickel total = specExceeds nickel total := by
  unfold exceedsNickelThreshold specExceeds specPct
  rfl

-- Spec-local, kernel-decided spot-checks (independent of the implementation).
example : specExceeds 11 100 = true := by decide
example : specExceeds 10 100 = false := by decide
example : specExceeds 9 100 = false := by decide
example : specExceeds 1 10 = false := by decide
example : specExceeds 2 10 = true := by decide
example : specExceeds 0 0 = false := by decide

end JapanTaxLaw.NickelContentThreshold
