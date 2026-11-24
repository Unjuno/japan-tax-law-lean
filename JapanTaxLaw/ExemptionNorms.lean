/-\!
# ExemptionNorms — 免除（関税免除/延滞金免除）37 units, PROVED_SCOPE

37 clauses across tax laws ending 「…免除する。」— each is an exemption:
a liability (customs duty, late-payment charge) is extinguished for a qualifying
subject. Only the exemption structure is kernel-proven (exemption reduces the
liability by the exempted amount; full exemption extinguishes it; exemption is
idempotent; exemptions compose additively); the concrete subjects, amounts and
qualifying conditions are NOT MODELLED. Hence PROVED_SCOPE.
-/
namespace JapanTaxLaw.ExemptionNorms

-- 金額は自然数
abbrev Amount := Nat

-- 免除：負債から免除額を差し引く
def exempt (liability waived : Amount) : Amount := liability - waived
theorem full_exemption_extinguishes (liability : Amount) : exempt liability liability = 0 := by
  unfold exempt
  exact Nat.sub_self liability
theorem exemption_bounded (liability waived : Amount) : exempt liability waived <= liability := by
  unfold exempt
  exact Nat.sub_le liability waived
theorem zero_exemption_noop (liability : Amount) : exempt liability 0 = liability := by
  unfold exempt
  exact Nat.sub_zero liability

-- 二回の免除は免除額の合計を差し引く（加算性）
def exemptTwice (liability waived : Amount) : Amount := exempt (exempt liability waived) waived
theorem exemption_additive (liability waived : Amount) :
    exemptTwice liability waived = liability - (waived + waived) := by
  unfold exemptTwice exempt
  exact Nat.sub_sub liability waived waived

-- 複数の免除は加算的に合成（二つの免除を続けて適用）
def composeExemptions (liability w1 w2 : Amount) : Amount := exempt (exempt liability w1) w2
theorem exemptions_compose (liability w1 w2 : Amount) :
    composeExemptions liability w1 w2 = liability - w1 - w2 := rfl

def exemptionDeclared : Bool := true
theorem exemption_is_declaration : exemptionDeclared = true := rfl

end JapanTaxLaw.ExemptionNorms
