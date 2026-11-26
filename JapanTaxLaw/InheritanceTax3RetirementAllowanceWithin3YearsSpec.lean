import JapanTaxLaw.InheritanceTax3RetirementAllowanceWithin3Years

/-
# InheritanceTax3RetirementAllowanceWithin3YearsSpec — independent spec for 相続税法 第三条(1) 第二号

Needle 「被相続人の死亡により相続人その他の者が当該被相続人に支給されるべきであつた退職手当金、功労金その他これらに準ずる給与（政令で定める給付を含む。）で被相続人の死亡後三年以内に支給が確定したものの支給を受けた場合においては、当該給与の支給を受けた者について、当該給与」.
The implementation uses `years ≤ threshold`; the independent spec states the
same inclusive ceiling as `years ≤ 3`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以内」 is INCLUSIVE: 3 years is inside the window and 4 years is outside.
-/
namespace JapanTaxLaw.InheritanceTax3RetirementAllowanceWithin3Years

open JapanTaxLaw.TaxFinance

def specInScope (years : Nat) : Prop := years ≤ 3

theorem agree_scope (years : Nat) : inScope years ↔ specInScope years := by
  unfold inScope specInScope threshold
  rfl

end JapanTaxLaw.InheritanceTax3RetirementAllowanceWithin3Years
