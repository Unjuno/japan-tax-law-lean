import JapanTaxLaw.LocalTax20_9_3RefundWithin5Years

/-
# LocalTax20_9_3RefundWithin5YearsSpec — independent spec for 地方税法 Num 20_9_3/1

Needle 「申告納付又は申告納入に係る地方税の申告書（以下この条において「申告書」という。）を提出した者は、当該申告書に記載した課税標準等若しくは税額等の計算が地方税に関する法令の規定に従つていなかつたこと又は当該計算に誤りがあつたことにより、次の各号のいずれかに該当する場合には、当該申告書に係る地方税の法定納期限から五年以内に限り、総務省令の定めるところにより、地方団体の長に対し、その申告に係る課税標準等又は税額等（当該課税標準等又は税額等に関し更正があつた場合には、当該更正後の課税標」.
The implementation uses `years ≤ threshold`; the independent spec states
the statutory INCLUSIVE ceiling as `years ≤ 5`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以下」/「以内」 is INCLUSIVE: the threshold itself qualifies and one more does not.
-/
namespace JapanTaxLaw.LocalTax20_9_3RefundWithin5Years

open JapanTaxLaw.TaxFinance

def specInScope (years : Nat) : Prop := years ≤ 5

theorem agree_scope (years : Nat) : inScope years ↔ specInScope years := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax20_9_3RefundWithin5Years
