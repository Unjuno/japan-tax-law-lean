import JapanTaxLaw.LocalTax768CommitteeAtLeast6Members

/-
# LocalTax768CommitteeAtLeast6MembersSpec — independent spec for 地方税法 Num 768/3

Needle 「委員の定数は、六人以上十二人以内において定款で定める。」.
The implementation uses `members >= 6`; this independent spec states the
statutory INCLUSIVE boundary as `members >= 6`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以上」/「以下」/「以内」 are INCLUSIVE: the threshold itself qualifies.
-/
namespace JapanTaxLaw.LocalTax768CommitteeAtLeast6Members

open JapanTaxLaw.TaxFinance

def specInScope (members : Nat) : Prop := members >= 6

theorem agree_scope (members : Nat) : inScope members ↔ specInScope members := by
  unfold inScope specInScope
  rfl
end JapanTaxLaw.LocalTax768CommitteeAtLeast6Members
