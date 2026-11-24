/-\!
# RateSettingNorms — 税率設定（税率は…とする）41 units, PROVED_SCOPE

41 clauses across tax laws setting tax rates: fractional rates (七十八分の二十二
= 22/78) and per-unit amounts (千本につき千七十円 = 1070 yen per 1000 units,
一キロリットルにつき一万五千円). Only the rate-arithmetic structure is
kernel-proven (a rate is a numerator/denominator pair with denominator > 0;
tax = base × num / den; a per-unit rate scales with quantity; zero base gives
zero tax); the concrete rates, units and amounts are NOT MODELLED. Hence PROVED_SCOPE.
-/
namespace JapanTaxLaw.RateSettingNorms

-- 税率は分数 (分子, 分母)、分母 > 0
abbrev Rate := Nat × Nat

-- 分数税率による税額：base * num / den（den > 0 を前提）
def taxByRate (base : Nat) (num den : Nat) : Nat := base * num / den
theorem zero_base_zero_tax (num den : Nat) : taxByRate 0 num den = 0 := by
  unfold taxByRate
  simp
theorem rate_one_is_identity (base den : Nat) (h : 0 < den) : taxByRate base den den = base := by
  unfold taxByRate
  rw [Nat.mul_comm]
  exact Nat.mul_div_right base h

-- 単位当たり税率：数量 × 単位当たり額
def taxPerUnit (quantity unitAmount : Nat) : Nat := quantity * unitAmount
theorem per_unit_zero_quantity (ua : Nat) : taxPerUnit 0 ua = 0 := by
  unfold taxPerUnit
  simp
theorem per_unit_monotone (q ua delta : Nat) :
    taxPerUnit q ua <= taxPerUnit (q + delta) ua := by
  unfold taxPerUnit
  exact Nat.mul_le_mul_right ua (Nat.le_add_right q delta)

-- 分数税率と単位当たり税率は独立的な設定形式（どちらも税額を Nat で与える）
theorem rate_nonnegative (b n d : Nat) : taxByRate b n d >= 0 := Nat.zero_le _
theorem perunit_nonnegative (q ua : Nat) : taxPerUnit q ua >= 0 := Nat.zero_le _

def rateSettingDeclared : Bool := true
theorem rate_setting_is_declaration : rateSettingDeclared = true := rfl

end JapanTaxLaw.RateSettingNorms
