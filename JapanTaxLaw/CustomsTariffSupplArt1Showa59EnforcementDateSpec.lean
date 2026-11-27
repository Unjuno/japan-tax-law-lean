import JapanTaxLaw.CustomsTariffSupplArt1Showa59EnforcementDate

/-!
# CustomsTariffSupplArt1Showa59EnforcementDateSpec — 施行日の独立仕様
Sources (pinned): law 143AC0000000054, revision 143AC0000000054_20260601_508AC0000000005.
独立仕様は実装の inForce / dateKey / enforcementKey を参照せず、
辞書頁順の日付比較を直接定義する。
-/

namespace JapanTaxLaw.CustomsTariffSupplArt1Showa59EnforcementDate

def specDate : Nat × Nat × Nat := (1984, 4, 1)

def specInForce (d : Nat × Nat × Nat) : Bool :=
  decide (d.1 > 1984) || (d.1 == 1984 && decide (d.2.1 > 4)) ||
  (d.1 == 1984 && d.2.1 == 4 && decide (d.2.2 >= 1))

example : specInForce (1984, 4, 1) = true := by decide
example : specInForce (1984, 3, 31) = false := by decide

def agreeCustomsTariffSupplArt1Showa59EnforcementDate : Bool :=
  [(1900,1,1),(1983,12,31),(1984,3,31),(1984,4,1),(1984,4,2),(2000,1,1)].all fun d =>
    inForce d == specInForce d

example : agreeCustomsTariffSupplArt1Showa59EnforcementDate = true := by decide

end JapanTaxLaw.CustomsTariffSupplArt1Showa59EnforcementDate
