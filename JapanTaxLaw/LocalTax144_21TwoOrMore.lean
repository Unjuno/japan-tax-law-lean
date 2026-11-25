import JapanTaxLaw.TaxFinance

/-
# LocalTax144_21TwoOrMore — pinned clause 「二人以上の者が代表者を定めて免税軽油使用者証の交付を受けることができる。」

Pinned: law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002, article 144_21.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json. Normative unit: NORM|a16e2a0ce65728a2f05d6e56349d0f114a8c9302f8e40d696b9c5d2e665bd5c1.
原文逐語: 「この場合において、免税軽油使用者のうち当該道府県知事の承認を受けた者にあつては、二人以上の者が代表者を定めて免税軽油使用者証の交付を受けることができる。」
Scope: ONLY the threshold/tier interval of this clause. Rates, other tiers,
the underlying computation and other articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax144_21TwoOrMore

open JapanTaxLaw.TaxFinance

/-- 二人 — 以上（inclusive） threshold (two or more persons). -/
def threshold : Nat := 2

/-- 「二人以上の者が代表者を定めて免税軽油使用者証の交付を受けることができる。」. -/
def inScope (amount : Nat) : Prop := amount ≥ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (amount : Nat) : Bool := decide (amount ≥ 2)

end JapanTaxLaw.LocalTax144_21TwoOrMore
