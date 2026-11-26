import JapanTaxLaw.InheritanceTax68PenaltyTo10Years

/- Independent spec for 「偽りその他不正の行為により相続税又は贈与税を免れた者は、十年以下の拘禁刑若しくは千万円以下の罰金に処し、又はこれを併科する。」: statutory literals only, no impl
identifier. Universal axiom-free bridge; boundaries live in Tests. -/
namespace JapanTaxLaw.InheritanceTax68PenaltyTo10Years

open JapanTaxLaw.TaxFinance

def specInScope (amount : Nat) : Prop := amount ≤ 10

theorem agree_scope (amount : Nat) : inScope amount ↔ specInScope amount := by
  unfold inScope specInScope threshold
  rfl

end JapanTaxLaw.InheritanceTax68PenaltyTo10Years
