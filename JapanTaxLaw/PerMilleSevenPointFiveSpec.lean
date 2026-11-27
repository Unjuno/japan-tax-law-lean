import JapanTaxLaw.PerMilleSevenPointFive

/-! # PerMilleSevenPointFive spec — 千分の七・五の独立定式 (law 332CO0000000043 / art.11)
「7.5/1000」を整数比 75/10000 として再記述し、切り捨て符合要求で照合する。 -/

namespace JapanTaxLaw.PerMilleSevenPointFive

def specNumerator : Nat := 75
def specDenominator : Nat := 10_000

def specAgrees (base : Nat) : Bool :=
  specDenominator * substituted base <= specNumerator * base &&
  specNumerator * base < specDenominator * (substituted base + 1)

example : specAgrees 10_000 = true := by decide
example : specAgrees 100_000 = true := by decide

def agreePerMilleSevenPointFive : Bool :=
  [0, 1, 99, 100, 10_000, 100_001].all specAgrees

example : agreePerMilleSevenPointFive = true := by decide

end JapanTaxLaw.PerMilleSevenPointFive
