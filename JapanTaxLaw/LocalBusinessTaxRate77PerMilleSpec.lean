import JapanTaxLaw.LocalBusinessTaxRate77PerMille

/-!
# LocalBusinessTaxRate77PerMille spec — 77/1000 の独立定式
Sources (pinned): law 325CO0000000245, revision 325CO0000000245_20261101_508CO0000000083,
art. 35の4の7. Independent restatement: base×77/1000（百分の七・七）。
-/

namespace JapanTaxLaw.LocalBusinessTaxRate77PerMille

def specRateAmount (base : Nat) : Nat :=
  base * 77 / 1000

example : specRateAmount 1000 = 77 := by decide

def agreeLocalBusinessTaxRate77PerMille : Bool :=
  [0, 1, 76, 77, 78, 999, 1000, 1001, 9999, 10000, 123457].all fun b =>
    rateAmount b == specRateAmount b

example : agreeLocalBusinessTaxRate77PerMille = true := by decide

end JapanTaxLaw.LocalBusinessTaxRate77PerMille
