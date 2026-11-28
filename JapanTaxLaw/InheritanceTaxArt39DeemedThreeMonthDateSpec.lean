import JapanTaxLaw.InheritanceTaxArt39DeemedThreeMonthDate

/-!
# InheritanceTaxArt39DeemedThreeMonthDate spec — 3か月みなしの独立定式

Sources (pinned): law 325AC0000000073, revision 325AC0000000073_20260401_506AC0000000008.
Independent restatement: みなし期間を「3回の1か月加算」として畳み込む
（実装の単一加算と別定式）。実装識別子を再利用しない。
有限領域の kernel-decided 検査であり普遍的な定理ではない。
-/

namespace JapanTaxLaw.InheritanceTaxArt39DeemedThreeMonthDate

def specStep : Nat := 1

def specTimes : Nat := 3

def specDeemed (startingMonth : Nat) : Nat :=
  (List.range specTimes).foldl (fun acc _ => acc + specStep) startingMonth

example : specDeemed 0 = 3 := by decide
example : specDeemed 12 = 15 := by decide

def agreeInheritanceTaxArt39DeemedThreeMonthDate : Bool :=
  [0, 1, 2, 3, 9, 12].all (fun m =>
    deemedMonth m == specDeemed m)

example : agreeInheritanceTaxArt39DeemedThreeMonthDate = true := by decide

end JapanTaxLaw.InheritanceTaxArt39DeemedThreeMonthDate
