import JapanTaxLaw.GrantErrorRounding1000

/-!
# GrantErrorRounding1000 spec — independent restatement of the art. 8 ¥1000 truncation
Sources (pinned): law 331M50000002007, revision 331M50000002007_20230401_505M60000008036, art. 8(3).
Normative id: NORM|05a5899479614efa11da83a033d254670bff34951e00ba08a11b856cbbc5630c
Independent restatement: the rounded amount is the largest multiple of 1000
not exceeding the input, written with integer division; the implementation
uses the remainder and subtraction. Kernel-decided agreement is checked.
-/

namespace JapanTaxLaw.GrantErrorRounding1000

def specRoundedError (amount : Nat) : Nat :=
  (amount / 1000) * 1000

example : specRoundedError 1001 = 1000 := by decide
example : specRoundedError 999 = 0 := by decide

def agreeGrantErrorRounding1000 : Bool :=
  [0, 1, 999, 1000, 1001, 1999, 2500, 100000].all fun n =>
    roundedError n == specRoundedError n

example : agreeGrantErrorRounding1000 = true := by decide

end JapanTaxLaw.GrantErrorRounding1000
