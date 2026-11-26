import JapanTaxLaw.TaxFinance

/-!
# PermilleAmounts — 6 の 小数千分率 相当額規定

Pinned 租税特別措置法 provisions state amounts such as 千分の八・五に相当する
金額 (8.5‰). The implementation computes the exact integer fraction with
Nat floor. The surrounding amount computation is caller-established and NOT
MODELLED. Not legal advice.
-/

namespace JapanTaxLaw.PermilleAmounts

def per85 (a : Nat) : Nat := a * 85 / 10_000      -- 千分の八・五
def per136 (a : Nat) : Nat := a * 136 / 10_000    -- 千分の十三・六
def per122 (a : Nat) : Nat := a * 122 / 10_000    -- 千分の十二・二
def per42 (a : Nat) : Nat := a * 42 / 10_000      -- 千分の四・二
def per252 (a : Nat) : Nat := a * 252 / 100_000   -- 千分の二・五二
def per104 (a : Nat) : Nat := a * 104 / 10_000    -- 千分の十・四

example : per85 10_000 = 85 := by decide
example : per136 10_000 = 136 := by decide
example : per252 100_000 = 252 := by decide

end JapanTaxLaw.PermilleAmounts
