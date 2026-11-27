import JapanTaxLaw.LocalTaxOutsideTaxTenthThreshold

/-
# LocalTaxOutsideTaxTenthThresholdSpec — independent spec for 地方税法 Num 259/2

Needle 「道府県は、当該道府県の道府県法定外普通税の一の納税義務者（納税義務者となるべき者を含む。以下本項において同じ。）であつて当該納税義務者に対して課すべき当該道府県法定外普通税の課税標準の合計が当該道府県法定外普通税の課税標準の合計の十分の一を継続的に超えると見込まれる者として総務省令で定めるもの（以下本項において「特定納税義務者」という。）であるものがある場合において、当該道府県法定外普通税の新設又は変更をする旨の条例を制定しようとするときは、当該道府県の議会において、当該特定納税義務者の意見を聴くものとする。」.
The implementation uses `10 * taxpayerBase > totalBase`; this independent spec states the
statutory boundary from statutory literals only, with no implementation identifier.
The formula below is the sole statutory literal site; the bridge is universal and axiom-free.
「以上」/「以下」/「以内」 are INCLUSIVE; 「を超える」 is STRICT.
-/
namespace JapanTaxLaw.LocalTaxOutsideTaxTenthThreshold

open JapanTaxLaw.TaxFinance

def specInScope (taxpayerBase totalBase : Nat) : Prop := 10 * taxpayerBase > totalBase

theorem agree_scope (taxpayerBase totalBase : Nat) : inScope taxpayerBase totalBase ↔ specInScope taxpayerBase totalBase := by
  unfold inScope specInScope
  rfl
end JapanTaxLaw.LocalTaxOutsideTaxTenthThreshold
