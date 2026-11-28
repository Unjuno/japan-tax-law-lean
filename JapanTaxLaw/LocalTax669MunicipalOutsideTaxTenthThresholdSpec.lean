import JapanTaxLaw.LocalTax669MunicipalOutsideTaxTenthThreshold

/-
# LocalTax669MunicipalOutsideTaxTenthThresholdSpec — independent spec for 地方税法 Num 669/2

Needle 「市町村は、当該市町村の市町村法定外普通税の一の納税義務者（納税義務者となるべき者を含む。以下本項において同じ。）であつて当該納税義務者に対して課すべき当該市町村法定外普通税の課税標準の合計が当該市町村法定外普通税の課税標準の合計の十分の一を継続的に超えると見込まれる者として総務省令で定めるもの（以下本項において「特定納税義務者」という。）であるものがある場合において、当該市町村法定外普通税の新設又は変更をする旨の条例を制定しようとするときは、当該市町村の議会において、当該特定納税義務者の意見を聴くものとする。」.
The implementation uses `10 * share > total`; this independent spec states the
statutory boundary from statutory literals only, with no implementation identifier.
The formula below is the sole statutory literal site; the bridge is universal and axiom-free.
「以上」/「以下」/「以内」 are INCLUSIVE; 「を超える」 is STRICT.
-/
namespace JapanTaxLaw.LocalTax669MunicipalOutsideTaxTenthThreshold

open JapanTaxLaw.TaxFinance

def specInScope (share total : Nat) : Prop := 10 * share > total

theorem agree_scope (share total : Nat) : inScope share total ↔ specInScope share total := by
  unfold inScope specInScope
  rfl
end JapanTaxLaw.LocalTax669MunicipalOutsideTaxTenthThreshold
