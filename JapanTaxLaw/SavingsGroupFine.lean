import JapanTaxLaw.TaxFinance

/-!
# SavingsGroupFine — 納税貯蓄組合法 art. 14（過料）

Sources (pinned):

  Law id: 326AC1000000145
  Revision: 326AC1000000145_20211122_503AC0000000046
  Raw snapshot: data/raw/326AC1000000145_20211122_503AC0000000046.law.json

Pinned 原文: 「次の各号のいずれかに該当する者は、十万円以下の過料に処する。」

Scoped claim: only the statutory upper bound of the administrative fine and
the min-clamping of an assessed amount are modelled. Which persons fall under
the three items of art. 14 is caller-established and NOT modelled here.
-/

namespace JapanTaxLaw.SavingsGroupFine

def administrativeFineCap : Nat := 100_000

def fineAmount (assessed : Nat) : Nat :=
  min assessed administrativeFineCap

def withinFineCap (assessed : Nat) : Bool :=
  decide (assessed <= administrativeFineCap)

theorem cap_value : administrativeFineCap = 100_000 := rfl

theorem fineAmount_le_cap (a : Nat) : fineAmount a <= administrativeFineCap := by
  unfold fineAmount
  exact Nat.min_le_right a administrativeFineCap

theorem fineAmount_eq_self_of_within (h : a <= administrativeFineCap) :
    fineAmount a = a := by
  unfold fineAmount
  exact Nat.min_eq_left h

end JapanTaxLaw.SavingsGroupFine
