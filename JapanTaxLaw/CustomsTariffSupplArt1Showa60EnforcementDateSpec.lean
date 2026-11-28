import JapanTaxLaw.CustomsTariffSupplArt1Showa60EnforcementDate

/-!
# CustomsTariffSupplArt1Showa60EnforcementDateSpec — 施行日の独立仕様
Sources (pinned): law 143AC0000000054, revision 143AC0000000054_20260601_508AC0000000005.
独立仕様は実装の inForce / dateKey / enforcementKey を参照せず、
原文の元号年（昭和60年）による辞書頁順の日付比較を直接定義する。
-/

namespace JapanTaxLaw.CustomsTariffSupplArt1Showa60EnforcementDate

def specDate : Nat × Nat × Nat := (60, 4, 1)

def specInForce : Nat × Nat × Nat → Bool
  | (y, m, d) => decide (y > 60) || (y == 60 && decide (m > 4)) ||
                 (y == 60 && m == 4 && decide (d >= 1))

example : specInForce (60, 4, 1) = true := by decide
example : specInForce (60, 3, 31) = false := by decide

def agreeCustomsTariffSupplArt1Showa60EnforcementDate : Bool :=
  [(44,1,1),(59,12,31),(60,3,31),(60,4,1),(60,4,2),(61,1,1)].all fun x =>
    match x with
    | (y, m, d) => inForce (showaToSeireki y, m, d) == specInForce (y, m, d)

example : agreeCustomsTariffSupplArt1Showa60EnforcementDate = true := by decide

end JapanTaxLaw.CustomsTariffSupplArt1Showa60EnforcementDate
