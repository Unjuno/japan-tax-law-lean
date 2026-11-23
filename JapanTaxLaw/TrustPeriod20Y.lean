import JapanTaxLaw.TaxFinance

/-!
# TrustPeriod20Y — 租税特別措置法施行令 art. 25_13（信託契約期間 二十年以上）

Sources (pinned):

  Law id: 332CO0000000043
  Revision: 332CO0000000043_20261101_507CO0000000127
  Raw snapshot: data/raw/332CO0000000043_20261101_507CO0000000127.law.json

Pinned 原文: 「信託契約期間を定めないこと又は二十年以上の信託契約期間が定められていること。」

Scoped claim: only the 信託契約期間 二十年以上 threshold; other conditions are caller-established.
-/

namespace JapanTaxLaw.TrustPeriod20Y

def trustFloor20Y : Nat := 20

def hasTrust20Y (x : Nat) : Bool :=
  decide (trustFloor20Y <= x)

theorem threshold_value : trustFloor20Y = 20 := rfl

end JapanTaxLaw.TrustPeriod20Y
