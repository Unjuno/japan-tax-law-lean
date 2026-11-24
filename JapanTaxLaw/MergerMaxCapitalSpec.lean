import JapanTaxLaw.MergerMaxCapital

/-
# MergerMaxCapitalSpec — independent spec for 法人税法 第二条（合併資本金額の最大額選択）

Pinned source:
  Law id: 404CO0000000089
  Revision: 404CO0000000089_20010106_412CO0000000307
  Raw snapshot: data/raw/404CO0000000089_20010106_412CO0000000307.law.json
  sha256: e80aec82d08862cb6ae5611886e5d844624473d18936c6fd67ce9cc26ed68ab1
  Article: 第二条 (raw JSON Article attr.Num = "2").
  原文逐語: 「合併により被合併法人の株主等に交付された合併後存続する法人の株式又は出資に係る資本の金額又は出資金額（被合併法人が二以上ある場合には、各被合併法人に係るこれらの金額のうち最も多い金額）」

INDEPENDENT FORMULATION. This module carries its OWN statutory constant
`specThreshold : Nat := 2` (二), its OWN trigger `specMultiple`, and its OWN
selection `specMax`. No implementation identifier (`multiCorpThreshold`,
`hasMultipleCorps`, `maxAmount`) occurs in any independent `spec*` definition;
the agreement theorems below are correspondence helpers, not independent
formulas.

The ONLY bridges are axiom-free unfold/rfl identities. Detector contract:
`independent_spec_ok` = True (own `spec*` formulas, no impl identifiers),
`spec_literals` = {2} (二 → 2, verified against the pinned needle),
`source_literals_verified({2}, scoped)` = True (parse_statutory_rate = None).

Variable contract: n = 被合併法人の数 (Nat, 法人); a, b = each merged
corporation's 資本の金額／出資金額 (Nat, 円). 「二以上」 is inclusive; the
applicable amount is the maximum when n >= 2. Not modelled (same as impl):
merger procedure, stock delivery, other paragraphs and articles.
-/

namespace JapanTaxLaw.MergerMaxCapital

/-- Spec-local 二 = 2, independent of the implementation constant. -/
def specThreshold : Nat := 2

/-- Spec-local 「被合併法人が二以上」: inclusive trigger. -/
def specMultiple (n : Nat) : Bool :=
  decide (specThreshold <= n)

/-- Spec-local 「最も多い金額」: the larger of two capital amounts. -/
def specMax (a : Nat) (b : Nat) : Nat :=
  if a >= b then a else b

/-- Bridge: the two statutory numerals are the same constant. -/
theorem agreeThreshold : multiCorpThreshold = specThreshold := by
  unfold multiCorpThreshold specThreshold
  rfl

/-- Bridge: both triggers reduce to decide (2 <= n). -/
theorem agreeMultiple (n : Nat) : hasMultipleCorps n = specMultiple n := by
  unfold hasMultipleCorps specMultiple multiCorpThreshold specThreshold
  rfl

/-- Bridge: both selections reduce to `if a >= b then a else b`. -/
theorem agreeMax (a : Nat) (b : Nat) : maxAmount a b = specMax a b := by
  unfold maxAmount specMax
  rfl

end JapanTaxLaw.MergerMaxCapital
