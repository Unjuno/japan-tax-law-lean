import JapanTaxLaw.PreparedRiceCerealMaterial

/-! # PreparedRiceCerealMaterial spec — 独立定式 (law 407M50000200018 / art.1)

五要素を独立の補助関数に分けて再記述する。実装の識別子は使わない。 -/

namespace JapanTaxLaw.PreparedRiceCerealMaterial

def allFive (a b c d e : Bool) : Bool :=
  if a then (if b then (if c then (if d then e else false) else false) else false) else false

def specQualifies (granular : Bool) (heatCooked : Bool) (seasoned : Bool)
                  (driedFlaked : Bool) (forCereal : Bool) : Bool :=
  allFive granular heatCooked seasoned driedFlaked forCereal

def specCount (a b c d e : Bool) : Nat :=
  (if e then 1 else 0) + (if d then 1 else 0) + (if c then 1 else 0) +
  (if b then 1 else 0) + (if a then 1 else 0)

def specMaskCount (mask : Nat) : Nat :=
  mask % 2 + (mask / 2) % 2 + (mask / 4) % 2 + (mask / 8) % 2 + (mask / 16) % 2

def specRequired : Nat := 5

example : specQualifies true true true true true = true := by decide
example : specMaskCount 31 = 5 := by decide

theorem spec_agrees (granular : Bool) (heatCooked : Bool) (seasoned : Bool)
                    (driedFlaked : Bool) (forCereal : Bool) :
    qualifies granular heatCooked seasoned driedFlaked forCereal =
      specQualifies granular heatCooked seasoned driedFlaked forCereal := by
  unfold qualifies specQualifies allFive
  cases granular <;> cases heatCooked <;> cases seasoned <;> cases driedFlaked <;> cases forCereal <;> rfl

theorem count_agrees (granular : Bool) (heatCooked : Bool) (seasoned : Bool)
                     (driedFlaked : Bool) (forCereal : Bool) :
    satisfiedCount granular heatCooked seasoned driedFlaked forCereal =
      specCount granular heatCooked seasoned driedFlaked forCereal := by
  unfold satisfiedCount specCount
  cases granular <;> cases heatCooked <;> cases seasoned <;> cases driedFlaked <;> cases forCereal <;> rfl

end JapanTaxLaw.PreparedRiceCerealMaterial
