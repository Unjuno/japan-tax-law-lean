import JapanTaxLaw.CustomsTariffArt8ExtensionSixMonths

/-!
# CustomsTariffArt8ExtensionSixMonths spec — 六月以内の独立定式

Sources (pinned): law 143AC0000000054, revision 143AC0000000054_20260601_508AC0000000005.
Independent restatement: 「六月を超えない」を否定形 `!(specLimit < months)`
として書く。実装識別子を再利用しない。有限領域の kernel-decided 検査であり
普遍的な定理ではない。
-/

namespace JapanTaxLaw.CustomsTariffArt8ExtensionSixMonths

def specMaxMonths : Nat := 6

def specWithinLimit (months : Nat) : Bool :=
  ! (specMaxMonths < months)

example : specWithinLimit 6 = true := by decide
example : specWithinLimit 7 = false := by decide

def agreeCustomsTariffArt8ExtensionSixMonths : Bool :=
  [0, 1, 5, 6, 7, 12].all (fun m =>
    extensionAllowed m == specWithinLimit m)

example : agreeCustomsTariffArt8ExtensionSixMonths = true := by decide

end JapanTaxLaw.CustomsTariffArt8ExtensionSixMonths
