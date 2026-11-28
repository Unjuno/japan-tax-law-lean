import JapanTaxLaw.LocalTaxArt20_4_2RoundDown1000

/-!
# LocalTaxArt20_4_2RoundDown1000 spec — 千円切り捨ての独立定式

Sources (pinned): law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002.
Independent restatement: 1000 で割った商に 1000 を掛ける（実装の剰余減算と別定式）。
実装識別子を再利用しない。有限領域の kernel-decided 検査であり普遍的な定理ではない。
-/

namespace JapanTaxLaw.LocalTaxArt20_4_2RoundDown1000

def specUnit : Nat := 1000
def specFloor (amount : Nat) : Nat := (amount / specUnit) * specUnit

example : specFloor 999 = 0 := by decide
example : specFloor 1999 = 1000 := by decide

def agreeLocalTaxArt20_4_2RoundDown1000 : Bool :=
  [0, 1, 999, 1000, 1001, 1999, 2000, 12345].all (fun a =>
    roundDown a == specFloor a)

example : agreeLocalTaxArt20_4_2RoundDown1000 = true := by decide

end JapanTaxLaw.LocalTaxArt20_4_2RoundDown1000
