import JapanTaxLaw.DonationTaxCredit

/-!
# DonationTaxCredit spec — 寄附金税額控除の独立定式
Sources (pinned): law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002.
Independent restatement: min/max を使った別定式。
-/

namespace JapanTaxLaw.DonationTaxCredit

def specCredit (d : Nat) (inc : Nat) (city : Bool) : Nat :=
  let capped := min d (inc * 30 / 100)
  let e := if 2000 < capped then capped - 2000 else 0
  if city then e / 50 else e / 25

example : specCredit 10000 100000 false = 320 := by decide
example : specCredit 10000 100000 true = 160 := by decide

def agreeDonationTaxCredit : Bool :=
  [(0,100000,false),(2000,100000,false),(10000,100000,false),(10000,100000,true),
   (100000,100000,false),(50000,200000,false)].all fun t => credit t.1 t.2.1 t.2.2 == specCredit t.1 t.2.1 t.2.2

example : agreeDonationTaxCredit = true := by decide

end JapanTaxLaw.DonationTaxCredit
