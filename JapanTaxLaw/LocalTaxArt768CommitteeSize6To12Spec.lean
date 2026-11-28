import JapanTaxLaw.LocalTaxArt768CommitteeSize6To12

/-!
# LocalTaxArt768CommitteeSize6To12 spec — 6〜12 の独立定式

Sources (pinned): law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002.
Independent restatement: 帯域を「下限未満でなく、かつ、上限超えでない」否定形で
書く。実装識別子を再利用しない。有限領域の kernel-decided 検査であり普遍的な定理ではない。
-/

namespace JapanTaxLaw.LocalTaxArt768CommitteeSize6To12

def specLo : Nat := 6

def specHi : Nat := 12

def specInRange (n : Nat) : Bool :=
  (! (n < specLo)) && (! (specHi < n))

example : specInRange 6 = true := by decide
example : specInRange 13 = false := by decide

def agreeLocalTaxArt768CommitteeSize6To12 : Bool :=
  [0, 1, 5, 6, 7, 11, 12, 13].all (fun n =>
    inRange n == specInRange n)

example : agreeLocalTaxArt768CommitteeSize6To12 = true := by decide

end JapanTaxLaw.LocalTaxArt768CommitteeSize6To12
