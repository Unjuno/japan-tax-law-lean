import JapanTaxLaw.TwoOrMorePortMunicipalities

/-
# TwoOrMorePortMunicipalitiesSpec — independent spec for 特別とん譲与税法施行規則 第二条

Declared statutory scope (Directive §1.5):
  Law id: 332M50000002021 (特別とん譲与税法施行規則)
  Revision: 332M50000002021_20010106_412M50000008044
  Article: 第二条 第一項 見出し — only the condition 「二以上の開港所在市町村」.
  No other article, paragraph or law is modelled here.

The implementation expresses 「二以上」 with a non-strict lower bound
`minimumPorts <= ports`. This spec transcribes the same phrase independently
as the negation of the strict complement, `¬ ports < specMinimumPorts`; it
carries its own statutory value and reuses NO implementation definition in any
`spec*` def. The universal `agree_at_least_two` theorem is the only bridge and
is checked for every Nat, not a finite sample.

Not modelled: 譲与の基準, the identity of municipalities/customs districts,
other articles, and human legal determination.
-/

namespace JapanTaxLaw.TwoOrMorePortMunicipalities

/-- Spec-local statutory value: 二 = 2. Independent of the implementation. -/
def specMinimumPorts : Nat := 2

/-- Independent formulation: 二以上 as the negated strict complement. -/
def specAtLeastTwo (ports : Nat) : Bool :=
  decide (¬ ports < specMinimumPorts)

/-- Universal, axiom-free kernel correspondence for every count. -/
theorem agree_at_least_two (ports : Nat) :
    atLeastTwo ports = specAtLeastTwo ports := by
  unfold atLeastTwo minimumPorts specAtLeastTwo specMinimumPorts
  by_cases h : ports < 2
  · have hle : ¬ 2 <= ports := by omega
    simp [h, hle]
  · have hle : 2 <= ports := by omega
    simp [h, hle]

end JapanTaxLaw.TwoOrMorePortMunicipalities
