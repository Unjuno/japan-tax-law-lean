import JapanTaxLaw.LocalTax72_110RefundTripleOver1MStrict

/-
# LocalTax72_110RefundTripleOver1MStrictSpec — independent spec for 地方税法 Num 72_110/2

Needle 「前項の還付を受けた金額の三倍が百万円を超える場合には、情状により、同項の罰金の額は、同項の規定にかかわらず、百万円を超え当該相当額の三倍以下の額とすることができる。」.
The implementation uses `1_000_000 < yen`; this independent spec states the
statutory STRICT boundary as `1_000_000 < yen`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「を超える」/「超え」 are STRICT: the threshold itself does NOT qualify.
-/
namespace JapanTaxLaw.LocalTax72_110RefundTripleOver1MStrict

open JapanTaxLaw.TaxFinance

def specInScope (yen : Nat) : Prop := 1_000_000 < yen

theorem agree_scope (yen : Nat) : inScope yen ↔ specInScope yen := by
  unfold inScope specInScope
  rfl
end JapanTaxLaw.LocalTax72_110RefundTripleOver1MStrict
