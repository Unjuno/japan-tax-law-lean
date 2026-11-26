import JapanTaxLaw.TaxFinance

/-
# InheritanceTax68PenaltyTo10Years — pinned clause 「偽りその他不正の行為により相続税又は贈与税を免れた者は、十年以下の拘禁刑若しくは千万円以下の罰金に処し、又はこれを併科する。」

Pinned: law 325AC0000000073, revision 325AC0000000073_20260401_506AC0000000008, article 68.
Raw: data/raw/325AC0000000073_20260401_506AC0000000008.law.json (SHA-256 c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7). Normative unit: NORM|9c96df33df6ab42700ee58457b625d2737323864193a9237a2f616c5c9543fe6.
原文逐語: 「偽りその他不正の行為により相続税又は贈与税を免れた者は、十年以下の拘禁刑若しくは千万円以下の罰金に処し、又はこれを併科する。」
Scope: ONLY the threshold of this clause. Other amounts, classifications,
procedures and articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.InheritanceTax68PenaltyTo10Years

open JapanTaxLaw.TaxFinance

/-- Statutory threshold — 以下 / を超えることができない (inclusive ceiling). -/
def threshold : Nat := 10

/-- 「偽りその他不正の行為により相続税又は贈与税を免れた者は、十年以下の拘禁刑若しくは千万円以下の罰金に処し、又はこれを併科する。」. -/
def inScope (amount : Nat) : Prop := amount ≤ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (amount : Nat) : Bool := decide (amount ≤ 10)

end JapanTaxLaw.InheritanceTax68PenaltyTo10Years
