import JapanTaxLaw.LocalTax72_95EvadedAmountOver10MStrict

/-
# LocalTax72_95EvadedAmountOver10MStrictSpec — independent spec for 地方税法 Num 72_95/3

Needle 「第一項第一号の免れた税額若しくは同項第二号の還付を受けた金額又は前項の犯罪に係る還付を受けようとした金額が千万円を超える場合には、情状により、当該各項の罰金の額は、当該各項の規定にかかわらず、千万円を超える額でその免れた税額若しくは還付を受けた金額又は還付を受けようとした金額に相当する額以下の額とすることができる。」.
The implementation uses `10_000_000 < yen`; this independent spec states the
statutory STRICT boundary as `10_000_000 < yen`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「を超える」/「超え」 are STRICT: the threshold itself does NOT qualify.
-/
namespace JapanTaxLaw.LocalTax72_95EvadedAmountOver10MStrict

open JapanTaxLaw.TaxFinance

def specInScope (yen : Nat) : Prop := 10_000_000 < yen

theorem agree_scope (yen : Nat) : inScope yen ↔ specInScope yen := by
  unfold inScope specInScope
  rfl
end JapanTaxLaw.LocalTax72_95EvadedAmountOver10MStrict
