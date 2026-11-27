import JapanTaxLaw.LeaseholdLandShare

/-!
# LeaseholdLandShare spec — independent restatement of the art.18 land share
Sources (pinned): law 403AC0000000069, revision 403AC0000000069_20250601_504AC0000000068, art. 18(1).
Normative id: NORM|37eab91bc7fd7bf723a2a42832bba7a8e61717b8deeaa709164fe08e767bc8c6
Independent restatement: the ratio multiplication is decomposed into whole
and remainder quotients of the base value; the implementation uses a single
guarded multiplication/division. Kernel agreement is decided, never assumed.
-/

namespace JapanTaxLaw.LeaseholdLandShare

def specShareAmount (baseLandValue : Nat) (wholeLandValue : Nat) : Nat :=
  if wholeLandValue = 0 then 0 else
    let whole := baseLandValue / wholeLandValue
    let rest := baseLandValue % wholeLandValue
    30000 * whole + 30000 * rest / wholeLandValue

example : specShareAmount 100 100 = 30000 := by decide
example : specShareAmount 50 100 = 15000 := by decide

def agreeLeaseholdLandShare : Bool :=
  [(0,0), (1,0), (0,100), (100,100), (50,100), (1,3),
   (29999,30000), (30000,30000), (30001,30000)].all fun x =>
    shareAmount x.1 x.2 == specShareAmount x.1 x.2

example : agreeLeaseholdLandShare = true := by decide

end JapanTaxLaw.LeaseholdLandShare
