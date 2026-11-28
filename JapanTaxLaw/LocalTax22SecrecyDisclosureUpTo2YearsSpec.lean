import JapanTaxLaw.LocalTax22SecrecyDisclosureUpTo2Years

/-
# LocalTax22SecrecyDisclosureUpTo2YearsSpec — independent spec for 地方税法 Num 22/1

Needle 「地方税に関する調査（不服申立てに係る事件の審理のための調査及び地方税の犯則事件の調査を含む。）若しくは租税条約等の実施に伴う所得税法、法人税法及び地方税法の特例等に関する法律（昭和四十四年法律第四十六号）の規定に基づいて行う情報の提供のための調査に関する事務又は地方税の徴収に関する事務に従事している者又は従事していた者は、これらの事務に関して知り得た秘密を漏らし、又は窃用した場合においては、二年以下の拘禁刑又は百万円以下の罰金に処する。」.
The implementation uses `years <= 2`; this independent spec states the
statutory INCLUSIVE boundary as `years <= 2`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以上」/「以下」/「以内」 are INCLUSIVE: the threshold itself qualifies.
-/
namespace JapanTaxLaw.LocalTax22SecrecyDisclosureUpTo2Years

open JapanTaxLaw.TaxFinance

def specInScope (years : Nat) : Prop := years <= 2

theorem agree_scope (years : Nat) : inScope years ↔ specInScope years := by
  unfold inScope specInScope
  rfl
end JapanTaxLaw.LocalTax22SecrecyDisclosureUpTo2Years
