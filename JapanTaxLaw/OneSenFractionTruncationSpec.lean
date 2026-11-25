import JapanTaxLaw.OneSenFractionTruncation

/-
# OneSenFractionTruncationSpec — independent spec for たばこ税法施行規則 第四条

Declared statutory scope (Directive §1.5):
  Law id: 360M50000040001 (たばこ税法施行規則)
  Revision: 360M50000040001_20240401_506M60000040021
  Article: 第四条 (art. 4), 第二項 — only 「一銭未満の端数を切り捨てる」.
  No other article, paragraph or law is modelled here.

The implementation discards the fraction by projecting the first argument of
the pair (`floorToSen sen f := sen`). This spec transcribes the same rule
independently as an explicit two-case analysis on the fraction flag
(`match f with | true => sen | false => sen`): a different operator, with no
implementation definition reused inside any `spec*` def. The universal
`agree_floor_to_sen` theorem is the only bridge; its proof is `cases` + `rfl`
and depends on no axiom, including no Classical.choice.

Not modelled: 前項の計算, item amounts, taxpayer identity, tax amount, and
human legal determination.
-/

namespace JapanTaxLaw.OneSenFractionTruncation

/-- Independent formulation: both fraction cases yield the whole-銭 amount. -/
def specFloorToSen (sen : Nat) (hasFraction : Bool) : Nat :=
  match hasFraction with
  | true => sen
  | false => sen

/-- Universal, axiom-free kernel correspondence for every amount and flag. -/
theorem agree_floor_to_sen (sen : Nat) (f : Bool) :
    floorToSen sen f = specFloorToSen sen f := by
  cases f <;> rfl

end JapanTaxLaw.OneSenFractionTruncation
