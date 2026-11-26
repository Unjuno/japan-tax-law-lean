import JapanTaxLaw.TaxFinance

/-
# LocalTax389TwoMunicipalitiesMovable — pinned clause 「総務省令で定める船舶、車両その他の移動性償却資産又は可動性償却資産で二以上の市町村にわたつて使用されるもののうち総務大臣が指定するもの」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002, article 389.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json. Normative unit: NORM|747032ecdd3d339cdd6c1faa2ecd7b59bc19351a77f853ed9a9e42e8c3936b50.
原文逐語: 「総務省令で定める船舶、車両その他の移動性償却資産又は可動性償却資産で二以上の市町村にわたつて使用されるもののうち総務大臣が指定するもの」
Scope: ONLY the inclusive 二以上 threshold of this clause. The notification,
approval, apportionment and all other procedures are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax389TwoMunicipalitiesMovable

open JapanTaxLaw.TaxFinance

/-- 二 — 以上（inclusive） threshold (二以上の市町村にわたる移動性償却資産). -/
def threshold : Nat := 2

/-- Statutory trigger 「総務省令で定める船舶、車両その他の移動性償却資産又は可動性償却資産で二以上の市町村にわたつて使用されるもののうち総務大臣が指定するもの」. -/
def inScope (amount : Nat) : Prop := amount ≥ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (amount : Nat) : Bool := decide (amount ≥ 2)

end JapanTaxLaw.LocalTax389TwoMunicipalitiesMovable
