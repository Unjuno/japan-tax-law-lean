import JapanTaxLaw.LocalTaxDeferralSmallAmountException1MB

/-!
# LocalTaxDeferralSmallAmountException1MB spec — 100万円以下判定の独立定式
Sources (pinned): law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002,
art. 72の39の2. Independent restatement: tax <= 1000000（境界値を含む）。
-/

namespace JapanTaxLaw.LocalTaxDeferralSmallAmountException1MB

def specSmallAmountCeiling : Nat := 1000000

def specIsSmallAmount (tax : Nat) : Bool :=
  tax <= 1000000

example : specIsSmallAmount 1000000 = true := by decide
example : specIsSmallAmount 1000001 = false := by decide

def agreeLocalTaxDeferralSmallAmountException1MB : Bool :=
  [0, 1, 999999, 1000000, 1000001, 2000000].all fun t =>
    isSmallAmount t == specIsSmallAmount t

example : agreeLocalTaxDeferralSmallAmountException1MB = true := by decide

end JapanTaxLaw.LocalTaxDeferralSmallAmountException1MB
