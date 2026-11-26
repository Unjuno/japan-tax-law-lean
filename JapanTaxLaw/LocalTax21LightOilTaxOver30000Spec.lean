import JapanTaxLaw.LocalTax21LightOilTaxOver30000

/-
# LocalTax21LightOilTaxOver30000Spec — independent spec for 地方税法 Num 21(2)

Needle 「道府県知事は、前項の場合における軽油引取税額が三万円をこえるときは、当該特約業者、元売業者又は小売業者の申請により、三月以内の期間を限つて徴収の猶予をすることができる。」.
The implementation uses `threshold < yen`; the independent spec states
the 三万円をこえる STRICT lower bound on the light-oil tax amount as `30000 < yen`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「をこえる」 is STRICT: the threshold itself does NOT qualify; only a value strictly above it does.
-/
namespace JapanTaxLaw.LocalTax21LightOilTaxOver30000

open JapanTaxLaw.TaxFinance

def specInScope (yen : Nat) : Prop := 30000 < yen

theorem agree_scope (yen : Nat) : inScope yen ↔ specInScope yen := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax21LightOilTaxOver30000
