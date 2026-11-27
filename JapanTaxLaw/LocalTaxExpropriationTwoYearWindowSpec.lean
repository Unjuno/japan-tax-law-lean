import JapanTaxLaw.LocalTaxExpropriationTwoYearWindow

/-
# LocalTaxExpropriationTwoYearWindowSpec — independent spec for 地方税法 Num 602/1

Needle 「これらの者が公共事業を行う者に代わつて当該公共事業の用に供する不動産を取得する場合においてこれらの者に当該公共事業の用に供する不動産を譲渡した者又は当該譲渡に係る土地の上に建築されていた家屋について移転補償金を受けた者に対する当該譲渡し、又は移転補償金を受けた不動産（以下この号において「被買収不動産等」という。）に代わるものと市町村長が認める土地（当該被買収不動産等に対応するものとして政令で定める土地に限る。）の譲渡（当該不動産を譲渡し、又は当該家屋についての移転補償金に係る契約をした日から二年以内に行われる土地の譲渡に限る。）」.
The implementation uses `years <= 2`; this independent spec states the
statutory boundary from statutory literals only, with no implementation identifier.
The formula below is the sole statutory literal site; the bridge is universal and axiom-free.
「以上」/「以下」/「以内」 are INCLUSIVE; 「を超える」 is STRICT.
-/
namespace JapanTaxLaw.LocalTaxExpropriationTwoYearWindow

open JapanTaxLaw.TaxFinance

def specInScope (years : Nat) : Prop := years <= 2

theorem agree_scope (years : Nat) : inScope years ↔ specInScope years := by
  unfold inScope specInScope
  rfl
end JapanTaxLaw.LocalTaxExpropriationTwoYearWindow
