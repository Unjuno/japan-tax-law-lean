import JapanTaxLaw.CapitalOver100M

/-! # spec — 1億円超の独立定式 (law 332AC0000000026 / art.61の4)
「一億円」を 100 × 1,000,000 とし、「超える」を境界除外として再記述する。 -/

namespace JapanTaxLaw.CapitalOver100M

def specThresholdYen : Nat := 100 * 1_000_000

def specOver100M (capital : Nat) : Bool := capital > specThresholdYen

def agreeCapitalOver100M : Bool :=
  [0, 1, 99_999_999, 100_000_000, 100_000_001, 1_000_000_000].all fun c =>
    over100M c == specOver100M c

example : agreeCapitalOver100M = true := by decide

end JapanTaxLaw.CapitalOver100M
