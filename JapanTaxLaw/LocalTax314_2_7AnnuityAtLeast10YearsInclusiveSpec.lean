import JapanTaxLaw.LocalTax314_2_7AnnuityAtLeast10YearsInclusive

/-
# LocalTax314_2_7AnnuityAtLeast10YearsInclusiveSpec — independent spec for 地方税法 Num 314_2/7

Needle 「当該契約に基づくイに定める個人に対する年金の支払は、当該年金の受取人の年齢が六十歳に達した日以後の日で当該契約で定める日以後十年以上の期間又は当該受取人が生存している期間にわたつて定期に行うものであることその他の政令で定める要件」.
The implementation uses `10 <= years`; this independent spec states the
statutory INCLUSIVE boundary as `10 <= years`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以上」/「以下」/「以内」 are INCLUSIVE: the threshold itself qualifies.
-/
namespace JapanTaxLaw.LocalTax314_2_7AnnuityAtLeast10YearsInclusive

open JapanTaxLaw.TaxFinance

def specInScope (years : Nat) : Prop := 10 <= years

theorem agree_scope (years : Nat) : inScope years ↔ specInScope years := by
  unfold inScope specInScope
  rfl
end JapanTaxLaw.LocalTax314_2_7AnnuityAtLeast10YearsInclusive
