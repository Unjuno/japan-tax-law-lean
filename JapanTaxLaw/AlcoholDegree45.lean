import JapanTaxLaw.TaxFinance

/-!
# AlcoholDegree45 — 酒税法 art. 3（アルコール分 四十五度以下）

Sources (pinned):

  Law id: 328AC0000000006
  Revision: 328AC0000000006_20260525_506AC0000000052
  Raw snapshot: data/raw/328AC0000000006_20260525_506AC0000000052.law.json

Pinned 原文: 「次に掲げる酒類（これらに水を加えたものを含み、前号イからニまでに掲げるものに該当するものを除く。）でアルコール分が四十五度以下のものをいう。」

Scoped claim: only the アルコール分 四十五度以下 threshold; other conditions are caller-established.
-/

namespace JapanTaxLaw.AlcoholDegree45

def degreeCeiling : Nat := 45

def withinAlcohol45 (x : Nat) : Bool :=
  decide (x <= degreeCeiling)

theorem threshold_value : degreeCeiling = 45 := rfl

end JapanTaxLaw.AlcoholDegree45
