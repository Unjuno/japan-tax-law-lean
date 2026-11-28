import JapanTaxLaw.LocalTax314_7DonationUsageAtLeast60PercentMunicipal

/-
# LocalTax314_7DonationUsageAtLeast60PercentMunicipalSpec — independent spec for 地方税法 Num 314_7/2

Needle 「都道府県等が指定対象期間において受領する第一号寄附金の額の合計額から当該指定対象期間における第一号寄附金の募集に要する費用の額として総務大臣が定めるところにより算定した額を控除して得た額（ロにおいて「寄附金活用可能額」という。）が、当該指定対象期間において受領する第一号寄附金の額の合計額の百分の六十に相当する金額以上であること。」.
The implementation uses `percent >= 60`; this independent spec states the
statutory boundary from statutory literals only, with no implementation identifier.
The formula below is the sole statutory literal site; the bridge is universal and axiom-free.
「以上」/「以下」/「以内」 are INCLUSIVE; 「を超える」 is STRICT.
-/
namespace JapanTaxLaw.LocalTax314_7DonationUsageAtLeast60PercentMunicipal

open JapanTaxLaw.TaxFinance

def specInScope (percent : Nat) : Prop := percent >= 60

theorem agree_scope (percent : Nat) : inScope percent ↔ specInScope percent := by
  unfold inScope specInScope
  rfl
end JapanTaxLaw.LocalTax314_7DonationUsageAtLeast60PercentMunicipal
